<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
   <h1 class="page-header">클래스 기본정보 등록</h1>
</div>

<div class="container">
   
   <form role="form" action="/lesson/registerDetail" method="post">
      <input type="hidden" name="userId" value='<sec:authentication property="principal.id"/>'>
      <input type="hidden" name="id" value='<c:out value="${lesson.id }"/>'>
      
      <c:if test="${!empty lessons}" >
      <strong>개설했던 클래스들 </strong>
         <select name="lessonList" id="lessonList" class="lessonList">
            <option>클래스를 선택해주세요</option>
            
            <c:forEach var="lessonList" items="${lessons}">
               <option value="${lessonList.id}">${lessonList.title}</option>
            </c:forEach>
         </select>
      </c:if>
      
      <div class="lessonDetail">
         <br><br>
         <h5><strong>어떤 클래스인지 알려주세요</strong></h5>가르쳐보고 싶은게 있으신가요? 카테고리를 설정해봐요.
         <div class="lessonCategoryDiv">
            <label>카테고리 </label>
            <c:if test="${!empty mainCategory}" >
               <select name="main" id="mainCategoryList" class="mainCategoryList">
                  <option>클래스 대분류를 선택해주세요</option>
                  
                  <c:forEach var="mainCategoryList" items="${mainCategory}">
                     <option value="${mainCategoryList.id}">${mainCategoryList.name}</option>
                  </c:forEach>
               </select>
            </c:if> 
            
            <c:if test="${!empty subCategory}" >
               <select name="sub" id="subCategoryList" class="subCategoryList">
                  <option>클래스 하위분류를 선택해주세요</option>
                  
                  <c:forEach var="subCategoryList" items="${subCategory}">
                     <option value="${subCategoryList.id}">${subCategoryList.name}</option>
                  </c:forEach>
               </select>
             <input type="hidden" name="categoryId" > 
            </c:if> 
         </div>
         
         <br><br><br>
         <h5><strong>클래스의 컨셉이 잘 드러난<br>제목과 이미지를 보여주세요</strong></h5>감성적이면서도 클래스를 잘 표현하는 제목과 이미지를 등록해 주세요.<br>예를 들어, 가죽공예, 어반 스케치, 다이어리꾸미기 이런식으로요.
         <div class="lessonMainImgDiv">
            <div class="lessonMainImgLeftDiv">
               <a>사진등록</a>
            </div>
            <div class="lessonMainImgRightDiv">
               <label>클래스 제목</label> <input class="form-control" name='title' id="title">
               <small>최대 30자</small>
            </div>
         </div>
         
         <div>
            <label>난이도</label>
            <select class="lessonLevel" name="lessonLevel" id="lessonLevel">
              <option value="1">누구나</option>
              <option value="2">입급</option>
              <option value="3">초급</option>
              <option value="4">중급</option>
              <option value="5">전문</option>
            </select>
            
            <br><br><br>
            <label>클래스 과정</label><br>
            <input type="radio" id="lessonType" name="lessonType" value="1">
            <label for="lessonTypeOneday">원데이</label>
            <input type="radio" id="lessonType" name="lessonType" value="2">
            <label for="lessonTypeRegular">정규</label>
            
            <br><br><br>
            <label>클래스 과정</label><br>
            <small>- 최소인원 미달 시 수업 2일전 자동 취소/환불 됩니다.<br>- 최소인원은 1명으로 권장합니다..</small>
            <br>
            <input type="text" placeholder="최소인원" name="minStudent"> ~ 
            <input type="text" placeholder="최대인원" name="maxStudent">
            
            <br><br><br>
            <label>스케줄 선택</label>
            <br>클래스 시작일과 종료일을 입력해주세요.
            <br>
            <input type="date" id="openAt" name="openAt"> ~ 
            <input type="date" id="closeAt" name="closeAt">
            <input type="hidden" name='openAt'>
            <input type="hidden" name='closeAt'>
         </div>
      
      <br><br><br>
      <button type="submit" name="prev">＜ 이전</button>
      <button type="submit" name="next">다음 ＞</button>
      <br><br><br>
      </div>
   </form>
      
</div>

<script>

   var formObj;
   var lessonDetailDiv;

   // 카테고리를 담기위한 변수
   var mainCategory = [];
   var subCategory = [];
   var lessonLevel = [];
   
   var $inputTitle = $("#title");
   
   $(document).ready(function(){
      
      formObj = $("form[role='form']");
      lessonDetailDiv = $(".lessonDetail");

   });
   
   $("button[type=submit]").click(function(e){
      
      var operation = $(this).data("oper");
      
      if(operation === 'prev') { 
         //console.log("prev");
         //formObj.attr("action", "/lesson/registerTeacher").attr("method", "get");
         //formObj.submit();
      } else {
         console.log("next");
         /* var dates = $("input[type=date]");
         var openAt = dates[0].value.replace(/-/gi,"/");
         var closeAt = dates[1].value.replace(/-/gi,"/");
         var hiddens = $("input:hidden");
         hiddens[0].value = openAt;
         hiddens[1].value = closeAt; */
      }
      
   });
   
   // 개설했던 클래스 선택
   $('#lessonList').change(function(e){ 
       var value = $(this).val();
       
       // 선택한 클래스 자동완성
       selectLesson(value)
          .then(function(response) {
             // 새로고침...
             autoComplete(response);
             
          });
   });
   
   // 선택한 클래스 자동완성
   function selectLesson(id) {
      return $.getJSON("/lessons/" + id + ".json");
   }
   
   // 메인 카테고리 불러오기
   function getMainCategory() {
      return $.getJSON("/lessons/mainCategory.json");
   }
   
   // 서브 카테고리 불러오기
   function getSubCategory() {
      return $.getJSON("/lessons/subCategory.json");
   }
   
   // 난이도 불러오기
   function getLessonLevel() {
      return $.getJSON("/lessons/lessonLevel.json");
   }

   
   // 메인 카테고리 불러오기
   getMainCategory()
      .then(function(main) {
         mainCategory = main;
      });
      
   // 서브 카테고리 불러오기
   getSubCategory()
      .then(function(sub) {
         subCategory = sub;
      });
   
   // 난이도 불러오기
   getLessonLevel()
      .then(function(level) {
         lessonLevel = level;
      });
   
   // 새로고침
   function autoComplete(response) {
      
      let str="";
      let selected = "selected='selected'";
      
      if(response==null || response.length==0) {
         return;
      }
      
      $inputTitle.val(response.title);
      
      
      /* str += "<br><br>";
      str += "<h5><strong>어떤 클래스인지 알려주세요</strong></h5>가르쳐보고 싶은게 있으신가요? 카테고리를 설정해봐요.";
      str += "<div class='lessonCategoryDiv'>";
      str += "   <label>카테고리</label>";
      
      str += "   <select class='mainCategory' name='mainCategory' id='mainCategory'>";
      for(var i=0; i<mainCategory.length; i++) {
         str += "   <option value='"+mainCategory[i].main+"' ";
         if(mainCategory[i].main==response.main) {
            str += selected;
         }
         str += " >"+mainCategory[i].name+"</option>"; 
      }
      str += "   </select>";
      
      str += "   <select class='subCategory' name='subCategory' id='subCategory'>";
      for(var i=0; i<subCategory.length; i++) {
         str += "   <option value='"+subCategory[i].sub+"' ";
         if(subCategory[i].sub==response.sub) {
            str += selected;
         }
         str += " >"+subCategory[i].name+"</option>"; 
      }
      str += "   </select>";
      
      str += "    <input type='hidden' name='categoryId'>";
      str += "</div>";
      
      str += "<br><br><br>";
      str += "<h5><strong>클래스의 컨셉이 잘 드러난<br>제목과 이미지를 보여주세요</strong></h5>감성적이면서도 클래스를 잘 표현하는 제목과 이미지를 등록해 주세요.<br>예를 들어, 가죽공예, 어반 스케치, 다이어리꾸미기 이런식으로요.";
      str += "<div class='lessonMainImgDiv'>";
      str += "   <div class='lessonMainImgLeftDiv'>";
      str += "      <a>사진등록</a>";
      str += "   </div>";
      str += "   <div class='lessonMainImgRightDiv'>";
      str += "      <label>클래스 제목</label> <input class='form-control' name='title' value='"+response.title+"'>";
      str += "      <small>최대 30자</small>";
      str += "   </div>";
      str += "</div>";
      
      str += "<div>";
      str += "   <label>난이도</label>";
      str += "   <select class='lessonLevelId' name='lessonLevel' id='lessonLevel'>";
      for(var i=0; i<lessonLevel.length; i++) {
         str += "   <option value='"+lessonLevel[i].id+"'";
         if(lessonLevel[i].id==response.lessonLevelId) {
            str += selected;
         }
         str += " >"+lessonLevel[i].name+"</option>"; 
      }
      str += "   </select>";
      
      str += "   <br><br><br>";
      str += "   <label>클래스 과정</label><br>";
      
      str += "   <input type='radio' id='lessonType' name='lessonType' value='원데이' "; 
      if(response.lessonType=='원데이')  {
         str += "checked"; 
      }
      str   += ">";
      str += "   <label for='lessonTypeOneday'>원데이</label>";
      str += "   <input type='radio' id='lessonType' name='lessonType' value='정규' "; 
      if(response.lessonType=='정규')  {
         str += "checked"; 
      }
      str   += ">";
      str += "   <label for='lessonTypeRegular'>정규</label>";
         
      str += "   <br><br><br>";
      str += "   <label>클래스 인원</label><br>";
      str += "   <small>- 최소인원 미달 시 수업 2일전 자동 취소/환불 됩니다.<br>- 최소인원은 1명으로 권장합니다..</small>";
      str += "   <br>";
      str += "   <input type='text' placeholder='최소인원' name='minStudent' value='"+response.minStudent+"'> ~ ";
      str += "   <input type='text' placeholder='최대인원' name='maxStudent' value='"+response.maxStudent+"'>";
         
      str += "   <br><br><br>";
      str += "   <label>스케줄 선택</label>";
      str += "   <br>클래스 시작일과 종료일을 입력해주세요.";
      str += "   <br>";
      str += "   <input type='date' id='openAt' name='openAt'> ~ ";
      str += "   <input type='date' id='closeAt' name='closeAt'>";
      str += "   <input type='hidden' name='openAt'>";
      str += "   <input type='hidden' name='closeAt'>";
      str += "</div>";
      
      str += "<br><br><br>";
      str += "<button type='submit' class='prev'>＜ 이전</button>";
      str += "<button type='submit' name='next'>다음 ＞</button>";
      str += "<br><br><br>";
      
      lessonDetailDiv.html(str); */
      
   } // autoComplete end
   
   // 클래스 선택후 이전 버튼 이벤트
   $(document).on("click","button[class='prev']", function(e){

      
   });
   
   // 클래스 선택후 다음 버튼 이벤트
   $(document).on("click","button[class='next']", function(e){
      
      formObj.submit();
   });
   
</script>
</body>
</html>