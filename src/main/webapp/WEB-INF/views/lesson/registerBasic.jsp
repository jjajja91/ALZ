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
	
	<form role="form" action="/lesson/registerBasic" method="post">
		<input type="hidden" name="userId" value='<sec:authentication property="principal.id"/>'>
		<input type="hidden" name="id" id="id" value='<c:out value="${lesson.id }"/>'>
		<input type="hidden" name="teacherId" value='<c:out value="${param.teacherId }"/>'>
		<input type="hidden" name="state" id="state" />
		
		<c:if test="${!empty lessons}" >
		<strong>개설했던 클래스들 </strong>
		   <select name="lessonList" id="lessonList" class="lessonList">
		      <option>클래스를 선택해주세요</option>
		      
		      <c:forEach var="lessonList" items="${lessons}">
		         <option value="${lessonList.id}">${lessonList.title}</option>
		      </c:forEach>
		   </select>
		</c:if>
		
		<div class="lessonBasic">
			<br><br>
			<h5><strong>어떤 클래스인지 알려주세요</strong></h5>가르쳐보고 싶은게 있으신가요? 카테고리를 설정해봐요.
			<div class="lessonCategoryDiv">
				<label>카테고리 </label>
				<c:if test="${!empty mainCategory}" >
				   <select name="main" id="mainCategoryList" class="mainCategoryList">
				      <option>클래스 대분류를 선택해주세요</option>
				      
				      <c:forEach var="mainCategoryList" items="${mainCategory}">
				         <option value="${mainCategoryList.main}">${mainCategoryList.name}</option>
				      </c:forEach>
				   </select>
				</c:if> 
				
				<c:if test="${!empty subCategory}" >
				   <select name="sub" id="subCategoryList" class="subCategoryList">
				      <option>클래스 하위분류를 선택해주세요</option>
				      
				      <c:forEach var="subCategoryList" items="${subCategory}">
				         <option value="${subCategoryList.sub}">${subCategoryList.name}</option>
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
				<input type="radio" class="lessonType" name="lessonType" id="lessonTypeOneday" value="1">
				<label for="lessonTypeOneday">원데이</label>
				<input type="radio" class="lessonType" name="lessonType" id="lessonTypeRegular" value="2">
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
	var lessonBasicDiv;

	// 카테고리를 담기위한 변수
	var mainCategory = [];
	var subCategory = [];
	var lessonLevel = [];
	
	var $mainCategory = $("#mainCategoryList");
	var $subCategory = $("#subCategoryList");
	var $inputTitle = $("#title");
	var $lessonLevel = $("#lessonLevel");
	var $lessonType = $(".lessonType");
	var $minStudent = $("input[name=minStudent]");
	var $maxStudent = $("input[name=maxStudent]");
	var $inputState = $("#state");
	var $inputLessonId = $("#id");
	
	
	$(document).ready(function(){
		
		formObj = $("form[role='form']");
		lessonBasicDiv = $(".lessonBasic");

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
			let selectedCategory = $("select[name=sub]").val();
			$("input[name=categoryId]").val(selectedCategory);

			formObj.submit();
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
		
		if(response==null || response.length==0) {
			return;
		}
		
		$inputTitle.val(response.title);
		let mainCategoryOptions = $mainCategory.children();
		for(let i=0; i<mainCategoryOptions.length; i++) {
			let mainCategoryOption = mainCategoryOptions[i];
			if(mainCategoryOption.value==response.main) {
				mainCategoryOption.setAttribute("selected","selected");
			}
		}
		let subCategoryOptions = $subCategory.children();
		for(let i=0; i<subCategoryOptions.length; i++) {
			let subCategoryOption = subCategoryOptions[i];
			if(subCategoryOption.value==response.sub) {
				subCategoryOption.setAttribute("selected","selected");
			}
		}
		let lessonLevelOptions = $lessonLevel.children();
		for(let i=0; i<lessonLevelOptions.length; i++) {
			let lessonLevelOption = lessonLevelOptions[i];
			if(lessonLevelOption.text==response.lessonLevel) {
				lessonLevelOption.setAttribute("selected","selected");
			}
		}
		
		let responseLessonType = response.lessonType;
		responseLessonType = responseLessonType=='원데이' ? 1 : 2;
		for(let i=0; i<$lessonType.length; i++) {
			let lessonType = $lessonType[i];
			if(lessonType.value==responseLessonType) {
				lessonType.setAttribute("checked","checked");
			}
		}
		$minStudent.val(response.minStudent);
		$maxStudent.val(response.maxStudent);
		$inputState.val(response.state);
		$inputLessonId.val(response.id);
		
	} // autoComplete end
	
	
</script>
</body>
</html>