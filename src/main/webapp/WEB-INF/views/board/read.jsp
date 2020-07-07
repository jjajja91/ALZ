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
			<input name='writerId' value='<c:out value="${board.writerId }"/>'
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
		</div>

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

</div>
<script src="/resources/js/summernote-ko-KR.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script type="text/javascript">


	$(document).ready(function() {
	

		(function() {
			var boardId = '<c:out value="${board.id}"/>';

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
				
	});
</script>
</body>
</html>