<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
	<h1 class="page-header">Board</h1>
</div>

<div class="container">
	<div class="panel-body">

		<div class="form-group">
			<input class="form-control" name='title'
				value='<c:out value="${board.title }"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<input name='nickname' value='<c:out value="${board.nickname }"/>'
				readonly="readonly">
		</div>
		<div class="form-group">
			<input name='writtenAt'
				value='<fmt:formatDate  value="${board.writtenAt }"/>'
				readonly="readonly"> <label>조회</label> <input name='viewCnt'
				value='<c:out value="${board.viewCnt }"/>' readonly="readonly">
		</div>
		<hr>
		<div class="form-group">
			<textarea class="form-control" id='content' rows="10" name='content'
				readonly="readonly"><c:out value="${board.content }" />
			</textarea>
		</div>

		<div class="form-group">
			<a class='likeCnt' href='<c:out value="${board.likeCnt }"/>'>♡
				좋아요 <c:out value="${board.likeCnt }" />
			</a> <a class='commentCnt' href='<c:out value="${board.commentCnt }"/>'>댓글
				<c:out value="${board.commentCnt }" />
			</a>
		</div>
		
		<%-- <div>

		<div class="bigPictureWrapper">
			<div class="bigPicture"></div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-defualt">
					<div class="panel-heading">Files</div>
					<div class="panel-body">
						<div class='uploadResult'>
							<ul>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div> --%>

		<!-- 댓글  -->
		<%-- div>
			<table border="1" width="1200px" id="reply_area">
			    <tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
				    <td colspan="4"></td>
				</tr>
				<!-- 댓글이 들어갈 공간 -->
				<c:forEach var="replyList" items="${replyList}" varStatus="status">
					<!-- 댓글의 depth 표시 -->
					<tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>">
						<td width="820px">
						    <c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
						</td>
						<td width="100px">
						    ${replyList.reply_writer}
						</td>
						<td width="100px">
						    <input type="password" id="reply_password_${replyList.reply_id}" style="width:100px;" maxlength="10" placeholder="패스워드"/>
						</td>
						<td align="center">
						    <c:if test="${replyList.depth != '1'}">
						    <!-- 첫 댓글에만 댓글이 추가 대댓글 불가 -->
								<button name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">댓글</button>
							</c:if>
							<button name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">수정</button>
							<button name="reply_del" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">삭제</button>
					    </td>
					</tr>
				</c:forEach>
			</table>
			
		</div> --%>
	<button data-oper='write' class="btn btn-info"
			onclick="location.href='/board/write?id=<c:out value="${board.id}"/>&pid=<c:out value="${board.parentId}"/>&border=<c:out value="${board.BOrder}"/>'">답글쓰기</button> 
		
		<button data-oper='update' class="btn btn-default"
			onclick="location.href='/board/update?id=<c:out value="${board.id}"/>'">수정</button>
		<button data-oper='list' class="btn btn-info"
			onclick="location.href='/board/list'">목록</button>

		<form id='operForm' action="/board/modify" method="get">
			<input type='hidden' id='id' name='id'
				value='<c:out value="${board.id }"/>'> <input type='hidden'
				name='pageNum' value='<c:out value="${cri.pageNum }"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
			<input type='hidden' name='keyword'
				value='<c:out value="${cri.keyword }"/>'> <input
				type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		</form>
	</div>

    <!-- 댓글  -->
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글
			</div>
			
			<div class="panel-body">
				<ul class="chat"> 
					<li>
						<strong class="primary-font">user00</strong>
						<small class="pull-right text-muted">2020-07-03</small>
						<p>Good job!</p>
					</li>
				</ul>
				
				<!-- 댓글입력 -->
				<div>
					<textarea class="commentText" id="commentContent" name='comment' placeholder='댓글을 남겨보세요'></textarea>
					<button id="registerCommentBtn">등록</button>
				</div>
			</div>
		
		</div>
	</div>
	
</div>

<script type="text/javascript" src="/resources/js/comment.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
	

		var boardId = '<c:out value="${board.id}"/>';
		(function() {

			$.getJSON("/boards/getFileList", {
				boardId : boardId
			}, function(arr) {
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, file){
					
					//image type
					if(file.fileType){
						var fileCallPath = encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
						
						str += "<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"'";
						str += "data-type='"+file.fileType+"'><div>";
						str += "<img src='/file/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";
					} else {
						str += "<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"'";
						str += "data-type='"+file.fileType+"'><div>";
						str += "<img src='/resources/img/attach.png'>";
						str += "</div></li>";
					}
				});
				$(".uploadResult ul").html(str);
			});
		})();
		

		var $content = $('#content');
		
		$content.summernote('code', $content.val());
		$("div[class*=toolbar]").css("display", "none");
		$("div[class*=note-editable]").attr("contenteditable", "false");

		$(".uploadResult").on("click", "li", function(e){
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			} else {
				self.location = "/file/download?fileName="+path;
			}
		});
		
		function showImage(fileCallPath){
			alert(fileCallPath);
			$(".bigPictureWrapper").css("display","flex").show();
			$(".bigPicture")
			.html("<img src='/file/display?fileName="+fileCallPath+"'>")
			.animate({width:'100%', height:'100%'}, 1000);	
		}
		
		var operForm = $("#operForm");

		// 버튼 클릭할때 operForm 전송
		$("button[data-oper='update']").on("click", function(e) {
			operForm.attr("action", "/board/update").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#id").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});

		// 댓글 리스트
		showComment();
		
		var commentUL = $(".chat");
		
		// 댓글 리스트
		function showComment(id) {
			if(id==null) {
				id = boardId;
			}
			commentService.getList({boardId:id}, function(list) {
				
				var str="";
				
				if(list==null || list.length==0) {
					commentUL.html("");
					return;
				}

				for(var i=0, len=list.length||0; i<len; i++) {
					str += "<li class='left clearfix' data-boardId='" + list[i].boardId + "'>";
					str += "	<div><div class='header'><strong class='primary-font'>["+list[i].id+"] "+list[i].nickname+"</strong>";
					str += "		<small class='pull-right text-muted'>" + moment(list[i].writtenAt).format('YYYY-MM-DD')+"</small></div>";
					str += "		<p>"+list[i].content+"</p></div></li>";
					str += " <li class='reChat'> "; 
					for(var j=0; j<list[i].depth; j++) {
						str += "<ul><li> ";
					}
						str += "		<div class='commentDiv'>";
					if(list[i].deleted=="Y") {
						str += " 			<p style='margin:auto'>삭제된 댓글입니다.</p>";
					} else {
						str += "			<strong class='primary-font'> 작성자 : "+list[i].nickname+"</strong>";
						str += "			<div class='commentDropdown'>";
						str += "				<button class='commentDropBtn' data-toggle='dropdown'>:</button>";
						str += "				<ul class='dropdown-menu'>";
						str += "					<li><a class='commentEditBtn'>수정</a></li>";
						str += "					<li><a class='commentDeleteBtn'>삭제</a></li>";
						str += "				</ul>";
						str += "			</div>";
						str += "			<p style='margin:auto'>"+list[i].content+"</p>";
						str += "			<small>" + moment(list[i].writtenAt).format('YYYY-MM-DD hh:mm')+"</small>";
						str += "			<a role='button' class='coCommentBtn'>답글쓰기</a>";
						str += "			<input type='hidden' class='commentId' id='commentId"+i+"' value='"+list[i].id+"'/>";
						str += "			<input type='hidden' class='commentDepth' id='commentDepth"+i+"' value='"+list[i].depth+"'/>";
						str += "			<input type='hidden' class='commentCnt' id='commentCnt"+i+"' value='"+list[i].commentCnt+"'/>";
					}
						str += "		</div>";
					for(var j=0; j<list[i].depth; j++) {
						str += "	</li></ul>";
					}
					str += " </li>";
					str += "<hr> ";
					

				}
				
				commentUL.html(str);
			});
			
		}
		
		// 댓글  드랍다운 수정 클릭시 수정창 보여주기
		$(document).on("click","a[class='commentEditBtn']", function(e){

			e.preventDefault();
			// 숨겨둔 댓글 내용 보여줌
			commentUL.find('p').css("display", "block");
			
			var commentId = $(this).parent().parent().parent().parent().find(".commentId").val();
			var commentP = $(this).parent().parent().parent().parent().find("p");
			var where= $(this).parent().parent().parent().parent().find("strong");
			
			// 수정할 댓글 내용 숨김
			commentP.css("display", "none");
			
			// 수정창, 답댓글 입력창 지우기
			$(".commentEditDiv").remove();
			$(".replyDiv").remove();

			var commentEditDiv = document.createElement("div");
			commentEditDiv.setAttribute("class", "commentEditDiv");
			 
			var textAreaEdit = document.createElement("textarea");
			textAreaEdit.setAttribute("class", "textAreaEdit");
			textAreaEdit.setAttribute("id", "textAreaEdit");
			textAreaEdit.innerText = commentP.html();
			 
			var reCommentEditBtn = document.createElement("button");
			reCommentEditBtn.setAttribute("class", "reCommentEditBtn");
			reCommentEditBtn.innerHTML="수정완료";

			commentEditDiv.appendChild(textAreaEdit);
			commentEditDiv.appendChild(reCommentEditBtn);
			 
			where.after(commentEditDiv);
			
			
		});
		
		// 수정 완료 이벤트
		$(document).on("click","button[class='reCommentEditBtn']", function(e){ 

			//showComment();

			var commentId = $(this).parent().parent().find(".commentId").val();
			
			var editVal = {
					id : commentId,
					content :  $('#textAreaEdit').val()
			}
			
			editComment(editVal)
				.then(function(response) {
					showComment();
				});
			
		});

		// 댓글 수정
		function editComment(editVal) {

			return $.ajax({
				type : 'PUT',
				url : '/comments/' + editVal.id,
				data : JSON.stringify(editVal),
				contentType : "application/json; charset=utf-8"
			}); 
			
		}
		
		// 댓글 삭제 버튼 이벤트
		$(document).on("click","a[class='commentDeleteBtn']", function(e){

			var commentId = $(this).parent().parent().parent().parent().find(".commentId").val();

			deleteComment(commentId)
			.then(function(response) {
				showComment();
			});
			
		});
		
		// 댓글 삭제(진짜 삭제 x 작성자 0으로 바꿔줌)
		function deleteComment(commentId) {

			return $.ajax({
				type : 'DELETE',
				url : '/comments/' + commentId,
				data : JSON.stringify(commentId),
				contentType : "application/json; charset=utf-8"
			}); 
			
		}
		
		// 답글쓰기 버튼 이벤트
		$(document).on("click","a[class='coCommentBtn']", function(e){
			
			$(".replyDiv").remove();
			$(".commentEditDiv").remove();
			
			var replyDiv = document.createElement("div");
			replyDiv.setAttribute("class", "replyDiv");
			 
			var textArea = document.createElement("textarea");
			textArea.setAttribute("class", "replyTextarea");
			textArea.setAttribute("id", "replyTextarea");
			textArea.setAttribute("placeholder", "댓글을 입력해주세요");
			 
			var reCommentRegBtn = document.createElement("button");
			reCommentRegBtn.setAttribute("class", "reCommentRegBtn");
			reCommentRegBtn.innerHTML="답변 등록";

			replyDiv.appendChild(textArea);
			replyDiv.appendChild(reCommentRegBtn);
			 
			e.target.after(replyDiv);
		});
		
		// 답변 등록 버튼 이벤트
		$(document).on("click","button[class='reCommentRegBtn']", function(e){
			
			var commentId = $(this).parent().parent().find(".commentId").val();
			var commentDepth = $(this).parent().parent().find(".commentDepth").val();
			var commentCnt = $(this).parent().parent().find(".commentCnt").val();
			
			var reCommentValue = { 
					id : commentId,
					content :  $('#replyTextarea').val(),
					commentCnt : commentCnt,
					boardId : boardId,
					nickname : "2", // 임시아이디
					depth : commentDepth,
			}

			// 대댓글추가
			addReComment(reCommentValue)
				.then(function(response) {
					// 댓글 리스트 새로고침
					showComment();
				})
				.catch(function(error) {
					console.log("error="+error);
				});
			 
		})
		
		// 대댓글 추가
		function addReComment(comment) {

			return $.ajax({
				type : 'POST',
				url : '/comments/reComment',
				data : JSON.stringify(comment),
				contentType : "application/json; charset=utf-8"
			}); 
		}
		
		// 댓글 등록버튼 이벤트
		$("#registerCommentBtn").on("click", function(e) {
			
			var commentValue = {
					content : $('#commentContent').val(),
					boardId : boardId,
					nickname : "2" // 임시아이디
			};
			
			// 댓글추가
			addComment(commentValue)
				.then(function(response) {
					// 댓글 리스트 새로고침
					showComment();
					$('#commentContent').val("");
				})
				.catch(function(error) {
					console.log("error="+error);
				});
			
		})
		
		// 댓글 추가
		function addComment(comment) {
			
			return $.ajax({
				type : 'POST',
				url : '/comments',
				data : JSON.stringify(comment),
				contentType : "application/json; charset=utf-8"
			});
		}
		
		
		
	});
</script>
</body>
</html>