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

		<form id='form' action="/board/update" method="post">

			<input type='hidden' name='pageNum'
				value='<c:out value="${cri.pageNum }"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
			<input type='hidden' name='keyword'
				value='<c:out value="${cri.keyword }"/>'> <input
				type='hidden' name='type' value='<c:out value="${cri.type }"/>'>

			<input type='hidden' name='id' value='<c:out value="${board.id }"/>'>

			<div class="form-group">
				<label>제 목</label> <input class="form-control" name='title'
					value='<c:out value="${board.title }"/>'>
			</div>
			<div class="form-group">
				<textarea id="summernote" class="form-control" rows="10" name='content'><c:out value="${board.content }" />
				</textarea>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-defualt">
						<div class="panel-heading">Files</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							<div class='uploadResult'>
								<ul>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button type="submit" data-oper='update' class="btn btn-default">수정</button>
			<button type="submit" data-oper='delete' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-info">목록</button>

		</form>
	</div>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
    
		
		var formObj = $("#form");

		$('button[type=submit]').on("click", function(e) {
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'delete') {
				formObj.attr("action", "/board/delete");
			} else if(operation === 'list') {
				//move to list
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
		});
		
  		(function() {
		var boardId = '<c:out value="${board.id}"/>';
		$.getJSON("/boards/getFileList",{boardId : boardId}, function(arr){
			var str = "";
			$(arr).each(function(i, file){
				if(obj.file){
					var fileCallPath = encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
					str += "<li data-path='"+file.uploadPath+"'";
					str += " data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"' data-type='"+file.image+"'><div>";
					str += "<span> " + file.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/file/display?fileName="+fileCallPath+"'>";
					str += "</div></li>";
				} else {
					var fileCallPath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
													
					str += "<li data-path='"+file.uploadPath+"'";
					str += " data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"' data-type='"+file.image+"'><div>";
					str += "<span> " + file.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'>";
					str += "</div></li>";									
				}
			});
			$(".uploadResult ul").html(str);
		});
		})();
	});
</script>

</body>
</html>