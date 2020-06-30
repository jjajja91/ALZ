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
				<button class='btn btn-default' id='searchBtn' >Search</button>
			
		</div>
	</div>
	
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
					<td><c:out value="${board.writerId }" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.writtenAt }"/></td>
					<td><c:out value="${board.viewCnt }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<!-- paging -->
	<div class="pull-right">
		<ul class="pagination">
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
		
		<form id='actionForm' action="/board/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>' />
			<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
		</form>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		// register button
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
		
		// paging
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		
		});
		
		// 읽기 이벤트 추가
		$(".read").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='id' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/read");
			actionForm.submit();
		})
		
		// 검색이벤트
		var $pageNum = $("#pageNum");
		var $amount = $("#amount");
		var $type = $("#type");
		var $keyword = $("#keyword");
		
		var $table = $("#table");
		var $searchBtn = $("#searchBtn");
		
		$searchBtn.on("click", function(e) {

			e.preventDefault();
			
			var data = {
					pageNum : $pageNum.val(),
					amount : $amount.val(),
					type : $type.val(),
					keyword : $keyword.val()
				};
			boardSearch(data)
				.then(function(response) {
					console.log(response);
					return printBoardList(response);
				})
				.catch(function(error) {
					console.log(error);
				});
		});
		
		function boardSearch(data) {
			return $.ajax({
				url : "/boards",
				type : "GET",
				data : JSON.stringify(data),
				contentType : "application/json"
			});
		}
		
		function printBoardList(boards) {
			var $tableHeader = $table.find("#table-header").clone();
			
			$table.empty();
			$table.append($tableHeader);
			
			var frag = document.createDocumentFragment();
			
			for(var i=0; i<boards.length; i++) {
				var board= boars[i];
				var tr = document.createElement("tr");

				var id = document.createElement("td");
				id.textContent = board.id;
				tr.appendChild(id);
				
				var title = document.createElement("td");
				title.textContent = board.title;
				tr.appendChild(title);
				
				var content = document.createElement("td");
				content.textContent = board.content;
				tr.appendChild(content);
				
				var writerId = document.createElement("td");
				writerId.textContent = board.writerId;
				tr.appendChild(writerId);
				
				var writtenAt = document.createElement("td");
				writtenAt.textContent = board.writtenAt;
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