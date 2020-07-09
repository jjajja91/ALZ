<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Board Write</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
.uploadResult {
   width: 100%;
   background-color: gray;
}

.uploadResult ul {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li {
   list-style: none;
   padding: 10px;
   align-content: center;
   text-align: center;
}

.uploadResult ul li img {
   width: 100px;
}

.uploadResult ul li span {
   color: white;
}

.bigPictureWrapper {
   position: absolute;
   display: none;
   justify-content: center;
   align-items: center;
   top: 0%;
   width: 100%;
   height: 100%;
   background-color: gray;
   z-index: 100;
   background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}

.bigpicture img {
   width: 600px
}
.note-dropzone {
  opacity: 0 !important;
}
.note-editor note-frame card .note-dropzone { opacity: 0 !important; }

</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>

<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>

   <div class="container">
      <h2>Board Write</h2>

      <form role="form" action="/board/write" method="post">
         <div class="form-group">
            <label for="title">title:</label> 
            <input class="form-control" rows="1" name="title"></input>
                <label for="content">content:</label>
                 <textarea id="summernote" name="content"></textarea>
            <label>Writer:</label>
             <input class="form-control" rows="1" name="writerId"></input> 
               <label>boardType:</label> 
               <input class="form-control" rows="1" name="typeId"></input>
      	<input type='hidden' name='parentId' value='<c:out value="${param.pid}"/>'>
      	  	<input type='hidden' name='bOrder' value='<c:out value="${param.border}"/>'>
      	  	  	<input type='hidden' name='id' value='<c:out value="${param.id}"/>'>
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
               
            <button type="submit" class="btn btn-default">Submit</button>
            <button type="reset" class="btn btn-default">Reset</button>
         </div>
      </form>
   </div>

      

<script>


$(document).ready(function(e){
	

   /*  var $summernote = $('#summernote'); */
   
		$('#summernote').summernote({
				placeholder : 'content',
				minHeight : 370,
				maxHeight : null,
				disableDragAndDrop: true,
				shortcuts: false,
				focus : true,
				lang : 'ko-KR'
				
				
		});
		$("div[class=note-editor note-frame card]").attr("disableDragAndDrop", "true");
	
		
		$("div[class=note-editable card-block]").attr("disableDragAndDrop", "true");
		
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
  
   var formObj = $("form[role='form']");
   
   $("button[type='submit']").on("click", function(e){
      e.preventDefault();
      console.log("submit clicked");
      
      var str = "";
      
      $(".uploadResult ul li").each(function(i, obj){
         var jobj = $(obj);
         console.dir(jobj);
         
         str += "<input type='hidden' name='fileList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
         str += "<input type='hidden' name='fileList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
         str += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
         str += "<input type='hidden' name='fileList["+i+"].fileType' value='"+jobj.data("type")+"'>";
      });
      formObj.append(str).submit();
   });
   
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
   
   $(".uploadResult").on("click", "button", function(e){
      console.log("delete file");
      
      var targetFile = $(this).data("file");
      var type = $(this).data("type");
      var targetLi = $(this).closest("li");
      
      $.ajax({
         url: '/file/deleteFile',
         data: {fileName: targetFile, type:type},
         dataType: 'text',
         type: 'POST',
         success: function(result){
            alert(result);
            targetLi.remove();
         }
      });
   });
   
});

</script>

</body>
</html>