<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp"%>

<div class="container">
   <h1 class="page-header">Board</h1>
</div>

<div class="container">     

	<!-- 검색 -->
	<div>
		<div>
			<select id='type' name='type'>
				<option value="" <c:out value="${pageMaker.cri.type == null? 'selected':'' }"/>>--</option>
				<option value="T" <c:out value="${pageMaker.cri.type == 'T'? 'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type == 'C'? 'selected':'' }"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type == 'W'? 'selected':'' }"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type == 'TC'? 'selected':'' }"/>>제목 or 내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type == 'TW'? ' selected':'' }"/>>제목 or 작성자</option>
				<option value="TWC" <c:out value="${pageMaker.cri.type == 'TWC'? 'selected':'' }"/>>제목 or 내용 or 작성자</option>
			</select>
			<input type='text' id='keyword' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>' />
			<input type='hidden' id='pageNum' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>' />
			<input type='hidden' id='amount' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>' />
			<input type='hidden' id='typeId' name='typeId' value='<c:out value="${pageMaker.cri.typeId }"/>' />
			<button class='writeBtn' id='searchBtn' >Search</button>
			<button class='writeBtn' id='writeBtn' type="button">글쓰기</button>
		</div>
	</div>
	
	<!-- 글목록 -->
	<table class="table table-striped" id="table" >
		<thead id="table-header">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
				<tr>
					<td><c:out value="${board.id }" /></td>
					<td>
						<a class='read' href='<c:out value="${board.id }"/>'><c:out value="${board.title }" /></a>
					</td>
					<td><c:out value="${board.nickname }" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writtenAt }"/></td>
					<td><c:out value="${board.viewCnt }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	 
	<!-- paging -->
	<div class="page-footer">
		<ul class="pagination pull-right">
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">Previous</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cri.pageNum == num? 'active':'' }"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
	
		<form id='actionForm' action="/board/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>' />
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
			<input type='hidden' name='typeId' value='<c:out value="${pageMaker.cri.typeId}"/>' />
		</form>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		var $pageNum = $("#pageNum");
		var $amount = $("#amount");
		var $type = $("#type");
		var $keyword = $("#keyword");
		var $typeId = $("#typeId");
		
		var $table = $("#table");
		
		var totalCnt;
		var data;
		
		// register button
		$("#writeBtn").on("click", function() {
			self.location = "/board/write?typeId="+$typeId.val();
		});
		
		var actionForm = $("#actionForm");
		
		// 첫 페이지 paging
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			
			data = {
					pageNum : $pageNum.val(),
					amount : $amount.val(),
					type : $type.val(),
					keyword : $keyword.val(),
					typeId : $typeId.val()
				};
			
			var targetPageNum = $(this).attr("href");
			data.pageNum = targetPageNum;
			
			// 글 목록 출력
			getList(data, pageNum);
			//actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//actionForm.submit();
		});
		
		// 읽기 이벤트 추가
		$(".read").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='id' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/read");
			actionForm.submit();
		});
		
		// 검색버튼 이벤트
		$("#searchBtn").on("click", function(e) {
			e.preventDefault();
			
			 data = {
					pageNum : $pageNum.val(),
					amount : $amount.val(),
					type : $type.val(),
					keyword : $keyword.val(),
					typeId : $typeId.val()
				};
			
			// 검색버튼 누르면 항상 첫 페이지
			if(data.pageNum > '1') data.pageNum='1';
			
			// 총 글 갯수
			getTotal(data)
				.then(function(response){
					totalCnt = response;
					
					// 페이지 번호 출력
					showPage(totalCnt);
				});
			// 글목록
			getList(data);
		});
		
		// 총 글 갯수
		function getTotal(data) {
			
			var url;
			
			// 검색어가 없을때 
			if(data.keyword=="") {
				url = "/boards/typeId/" + data.typeId + "/type/" + data.type;
			// 있을때
			} else {
				url = "/boards/typeId/" + data.typeId + "/type/" + data.type + "/keyword/" + data.keyword;
			} 
			
			return $.ajax({
				type : "GET",
				url : url
			});
		}
		
		var pageFooter = $(".page-footer");
		
		// 페이지 번호 출력
		function showPage(totalCnt) {
			
			pageFooter.empty();
			
			var endNum = Math.ceil(data.pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= totalCnt) {
				endNum = Math.ceil(totalCnt/10.0);
			}
			
			if(endNum * 10 < totalCnt) {
				next = true;
			}

			var str = "<ul class='pagination pull-right'>";
			
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Privious</a></li>";
			}
			
			for(var i=startNum; i<=endNum; i++) {
				var active = data.pageNum ==i? "active":"";
				str += "<li class='page-item"+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			
			if(next) {
				str += "<li class='page-item'><a class='page-link' href='"+(endNum +1)+"'>Next</a></li>";
			}
			
			str += "</ul></div>";
			
			pageFooter.html(str);
		}
		
		// 페이지 번호 클릭 이벤트
		pageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			data.pageNum = targetPageNum;
			
			// 글 목록 출력
			getList(data, pageNum);
		});
		
		// 글목록
		function getList(data) {
			// 글 검색 결과
			boardSearch(data)
				.then(function(response) {
					// 글 검색결과 출력
					return printBoardList(response);
				})
				.then(function(response) {
					// 읽기 이벤트 추가
					$(".read").on("click", function(e) {
						e.preventDefault();
						actionForm.append("<input type='hidden' name='id' value='"+$(this).attr("href")+"'>");
						actionForm.attr("action", "/board/read");
						actionForm.submit();
					});
					
				})
				.catch(function(error) {
					console.log(error);
				});
		}
		
		// 글 검색 결과
		function boardSearch(data) {
			return $.ajax({
				type : "GET",
				url : "/boards/" +data.typeId + "/" + data.pageNum + "/" + data.amount+ "/" + data.type + "/" + data.keyword + ".json",
				contentType : "application/json; charset=utf-8"
			});
		}
		
		
		// 글목록 출력
		function printBoardList(boards, page) {
			if(page == -1) {
				pageNum = Math.ceil(totalCnt/10.0);
				printBoardList(boards, pageNum);
				return;
			}
			
			var $tableHeader = $table.find("#table-header").clone();
			$table.empty();
			$table.append($tableHeader);
			
			var frag = document.createDocumentFragment();
			for(var i=0; i<boards.length; i++) {
				var board= boards[i];
				
				var tr = document.createElement("tr");
				var id = document.createElement("td");
				id.textContent = board.id;
				tr.appendChild(id);
				
				var title = document.createElement("td");
				var titleA = document.createElement("a");
				titleA.setAttribute("class", "read");
				titleA.setAttribute("href", board.id);
				titleA.textContent = board.title;
				
				title.appendChild(titleA);
				tr.appendChild(title);
				var nickname = document.createElement("td");
				nickname.textContent = board.nickname;
				tr.appendChild(nickname);
				
				var writtenAt = document.createElement("td");
				writtenAt.textContent = moment(board.writtenAt).format('YYYY-MM-DD'); 
				tr.appendChild(writtenAt);
				
				var viewCnt = document.createElement("td");
				viewCnt.textContent = board.viewCnt;
				tr.appendChild(viewCnt);
				
				frag.appendChild(tr);
			}
			
			$table.append($(frag));
		}
		
	});
</script>
</body>
</html>