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

		<form role="form" action="/board/update" method="post">

			<input type='hidden' name='pageNum'
				value='<c:out value="${cri.pageNum }"/>'> <input
				type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
			<input type='hidden' name='keyword'
				value='<c:out value="${cri.keyword }"/>'> <input
				type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
			<input type='hidden' name='typeId' id='typeId' value='<c:out value="${board.typeId }"/>'>

			<input type='hidden' id='id' name='id' value='<c:out value="${board.id }"/>'>

			<div class="form-group">
				<label>제 목</label> <input class="form-control" id='title' name='title'
					value='<c:out value="${board.title }"/>'>
			</div>
			<div class="form-group">
				<textarea id="summernote" class="form-control content" rows="10" name='content'><c:out value="${board.content }" />
				</textarea>
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

			<button type="submit" data-oper='update' class="btn btn-default">수정</button>
			<button type="submit" data-oper='delete' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-info">목록</button>

		</form>
		<input type="hidden" name="nickname" id="nickname" value="${sessionUser.nickname}"/>
	</div>

</div>

<script type="text/javascript">
	$(document).ready(function() {
		var $summernote = $('#summernote');
  		var $id = $("#id");
  		var $title = $("#title");
  		var $content = $(".content");
  		var $nickname = $("#nickname");
  		var $typeId = $("#typeId");
		var inputData = {
				title: $title,
				content: $content
			};
		
		$summernote.summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
			height : 320,
			
			callbacks : {
				onImageUpload: function(files, editor, welEditable) {
			            sendFile(files);
			          }
			}
		});
		
		function sendFile(files){
    		var formData = new FormData();
    		   for(var i=0; i<files.length; i++){
                   if(!checkExtension(files[i].name, files[i].size)){
                      return false;
                   }
                   formData.append("uploadFile", files[i]);
                }
            $.ajax({
               url: '/file/uploadAjaxAction',
               processData: false,
               contentType: false,
               data: formData,
               type: 'POST',
               dataType: 'json',
               success: function(result){
                  console.log(result);
                  showUploadResult(result);
               }
            });
    	}
		
		makeFileBtn();
		
		function makeFileBtn() {
			$("button[data-original-title=Picture]").remove();
			$("button[data-original-title=Video]").remove();
			$("button[data-original-title^=Link]").remove();
			$("div[class$=note-insert]").remove();
			var str = ""
			str += "<div class='note-btn-group btn-group note-file form-group uploadDiv'>";
			str += "<input type='file' name='uploadFile' multiple='multiple'>";
			str += "</div>";
			$("div[class*=toolbar]").append(str);
		}
    
  		function boardDeleteApi(data) {
    		  return $.ajax({
    		    url: "/boards/"+$id.val(),
    		    type: "Delete",
    		    data: JSON.stringify(data),
    		    contentType: "application/json",
    		  });
    		}
  		
  		function boardUpdateApi(data) {
  		  return $.ajax({
  		    url: "/boards/"+$id.val(),
  		    type: "PUT",
  		    data: JSON.stringify(data),
  		    contentType: "application/json",
  		  });
  		}
		
		var formObj = $("form[role='form']");

		$('button[type=submit]').on("click", function(e) {
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
	
			if(operation === 'delete') {			
				boardDeleteApi(data) 
				.then(function(response){
				   self.location = "/board/list?typeId="+$typeId.val();
				})					
			} else if(operation === 'list') {
				//move to list
				formObj.attr("action", "/board/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				var typeIdTag = $("input[name='typeId']").clone();
				
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
				formObj.append(typeIdTag);
				
				formObj.submit();
				
			} else if(operation === 'update'){
				$('.summernote').each(function(){
				      var summernote = $(this);
				      $('form').on('submit',function(){
				          if (summernote.summernote('isEmpty')) {
				               summernote.val('');
				          }else if(summernote.val()=='<p><br></p>'){
				               summernote.val('');
				          }
				     });
				 });
				
				console.log("submit clicked");
		
				var str = "";
				
				var blockImgArr = $(".card-block").find("img");
				var targetLi = $(".uploadResult ul li").clone();

				$(".uploadResult ul li").remove();
				
				var targetUl = $(".uploadResult ul");
				
				for(var i = 0; i < blockImgArr.length; i++){
					var blockImg = $(blockImgArr[i]);
					var blockImgSrc = blockImg.attr("src");
					for(var j = 0; j < targetLi.length; j++){
						var $targetLi = $(targetLi[j])
						var targetUuid = $targetLi.data("uuid");
						if(blockImgSrc.indexOf(targetUuid)!=-1){
							targetUl.append($targetLi);
						}
					}
				}
				
				var fileList = [];
				
				$(targetUl).find("li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					
					var file = {
							fileName: jobj.data("filename"),
							uuid: jobj.data("uuid"),
							uploadPath: jobj.data("path"),
							fileType: jobj.data("type")
					};
					
					fileList[i] = file;
/* 					
					str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='fileList["+i+"].fileType' value='"+jobj.data("type")+"'>"; */
				});
			
				
		  		var data = {
						title: $title.val(),
						content: $content.val(),
						id : $id.val(),
						typeId : $typeId.val(),
						nickname : $nickname.val(),
						fileList: fileList
				};
				console.log(data);
				boardUpdateApi(data)
				.then(function(response){
					console.log(response);
					self.location = "/board/list?typeId="+$typeId.val();
				})
				.catch (function(error){
					var errorMessage = error.responseJSON.defaultMessage;
					console.log(error.responseJSON);
					alert(errorMessage);
					var errorFocus = error.responseJSON.field;
					inputData[errorFocus].focus();
				});
			}
		});
		
  		(function() {
		var boardId = '<c:out value="${board.id}"/>';
		$.getJSON("/boards/getFileList",{boardId : boardId}, function(arr){
			var str = "";
			$(arr).each(function(i, file){
				if(file.fileType){
					var fileCallPath = encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
					str += "<li data-path='"+file.uploadPath+"'";
					str += " data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"' data-type='"+file.fileType+"'><div>";
					str += "<span> " + file.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/file/display?fileName="+fileCallPath+"'>";
					str += "</div></li>";
				} else {
					var fileCallPath = encodeURIComponent(file.uploadPath+"/"+file.uuid+"_"+file.fileName);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
													
					str += "<li data-path='"+file.uploadPath+"'";
					str += " data-uuid='"+file.uuid+"' data-filename='"+file.fileName+"' data-type='"+file.fileType+"'><div>";
					str += "<span> " + file.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/attach.png'>";
					str += "</div></li>";									
				}
			});
			$(".uploadResult ul").html(str);
		});
		})();
  		
  		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  		var maxSize = 5242880;
  		
  		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  		var maxSize = 5242880;
  		
  		function checkExtension(fileName, fileSize) {
  			if(fileSize >= maxSize){
  				alert("파일 사이즈 초과");
  				return false;
  			}
  			
  			if(regex.test(fileName)){
  				alert("해당 종류의 파일은 업로드할 수 없습니다.");
  				return false;
  			}
  			return true;
  		}
  		
  		function showUploadResult(uploadResultArr) {
  			if(!uploadResultArr||uploadResultArr.length==0){return;}
  			var uploadUL = $(".uploadResult ul");
  			var str = "";
  			var imgstr = "";
  			
  			$(uploadResultArr).each(function(i, obj){
  				console.log(obj);
  				if(obj.image){
  					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
  					var imagePath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
  					str += "<li data-path='"+obj.uploadPath+"'";
  					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
  					str += "<span> " + obj.fileName+"</span>";
  					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  		  			imgstr += "<pr><img src='/file/display?fileName="+imagePath+"'></pr>";
  					str += "<img src='/file/display?fileName="+fileCallPath+"'>";
  					str += "</div></li>";
  				} else {
  					var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
  					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
  					
  					str += "<li data-path='"+obj.uploadPath+"'";
  					str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
  					str += "<span> " + obj.fileName+"</span>";
  					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
  					str += "<img src='/resources/img/attach.png'>";
  					str += "</div></li>";
  					
  				}
  			});
  			uploadUL.append(str);
  			$(".card-block").append(imgstr);
  			$summernote.summernote("insertParagraph");
  			
  		}
  		
  		$("input[type='file']").change(function(e){
  			var formData = new FormData();
  			var inputFile = $("input[name='uploadFile']");
  			var files = inputFile[0].files;
  			
  			for(var i=0; i<files.length; i++){
  				
  				if(!checkExtension(files[i].name, files[i].size)){
  					return false;
  				}
  				formData.append("uploadFile", files[i]);
  			}
  			
  			$.ajax({
  				url: '/file/uploadAjaxAction',
  				processData: false,
  				contentType: false,
  				data: formData,
  				type: 'POST',
  				dataType: 'json',
  				success: function(result){
  					console.log(result);
  					showUploadResult(result);
  				}
  			});
  		});
  		
  		$(".uploadResult").on("click", "button", function(e){
  			console.log("delete file");
  			if(confirm("Remove this file? ")){
  				var targetLi=$(this).closest("li");
  				var targetImgSrc = targetLi.find("img").attr("src").replace("s_","");
  				var blockImgArr = $(".card-block").find("img");
  				
  				for(var i = 0; i<blockImgArr.length; i++){
  					var blockImg = $(blockImgArr[i]);
  					var blockImgSrc = blockImg.attr("src");
  					if(blockImgSrc===targetImgSrc){
  						blockImg.remove();
  					}
  				}
  				targetLi.remove();
  				$summernote.summernote("insertParagraph");
  			}
  		});
  		
	});
</script>

</body>
</html>