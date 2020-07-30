<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 스케줄 등록</h1>
</div>

<div class="container">
	
	<form role="form" action="/class/registerCurriculum" method="post">
		<h5><strong>어떤 클래스인지 알려주세요</strong></h5><h6>가르쳐보고 싶은게 있으신가요? 카테고리를 설정해봐요.</h6>
		<div class="lessonCategoryDiv">
			<label>카테고리</label>
			<select class="mainCategory" name="mainCategory" id="mainCategory">
			  <option value="">전체</option>
			</select>
			<select class="subCategory" name="subCategory" id="subCategory">
		        <option value="">전체</option>
		    </select>
		</div>
		
		<br><br><br>
		<h5><strong>클래스의 컨셉이 잘 드러난<br>제목과 이미지를 보여주세요</strong></h5><h6>감성적이면서도 클래스를 잘 표현하는 제목과 이미지를 등록해 주세요.<br>예를 들어, 가죽공예, 어반 스케치, 다이어리꾸미기 이런식으로요.</h6>
		<div class="lessonMainImgDiv">
			<div class="lessonMainImgLeftDiv">
				<a>사진등록</a>
			</div>
			<div class="lessonMainImgRightDiv">
				<label>클래스 제목</label> <input class="form-control" name='title'>
				<small>최대 30자</small>
			</div>
		</div>
		
		<div>
			<label>난이도</label>
			<select class="lessonLesson" name="lessonLesson" id="lessonLesson">
			  <option value="1">누구나</option>
			  <option value="2">입급</option>
			  <option value="3">초급</option>
			  <option value="4">중급</option>
			  <option value="5">전문</option>
			</select>
			
			<br><br>
			<label>클래스 과정</label><br>
			<input type="radio" id="lessonTypeOneday" name="lessonType" value="1">
			<label for="lessonTypeOneday">원데이</label>
			<input type="radio" id="lessonTypeRegular" name="lessonType" value="2">
			<label for="lessonTypeRegular">정규</label>
			
			<br><br>
			<label>클래스 과정</label><br>
			<small>- 최소인원 미달 시 수업 2일전 자동 취소/환불 됩니다.<br>- 최소인원은 1명으로 권장합니다..</small>
			<br>
			<input type="text" placeholder="최소인원"> ~ <input type="text" placeholder="최대인원">
			
		</div>
		
		<br><br><br>
		<button type="submit">다음 ＞</button>
	</form>
		
		<div class="form-group">
			<label>개강날짜</label> <input type="date" class="form-control" id="open">
			<input type="hidden" class="form-control" name='openAt'> <label>종강날짜</label>
			<input type="date" class="form-control" id="close"> <input type="hidden"
				class="form-control" name='closeAt'>

		</div>
		<div class="form-group">
			<label>시작시간</label> <input type="time" class="form-control"
				name='startAt'> <label>종료시간</label> <input type="time"
				class="form-control" name='endAt'>
		</div>
		<div class="form-group">
			<label>카테고리번호</label> <input class="form-control" name='categoryId'>
		</div>
		<div class="form-group">
			<label>선생님번호</label> <input class="form-control" name='teacherId'>
		</div>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
</div>
<script>
	$("button[type=submit]").click(function(e){
		var dates = $("input[type=date]");
		var openAt = dates[0].value.replace(/-/gi,"/");
		var closeAt = dates[1].value.replace(/-/gi,"/");
		var hiddens = $("input:hidden");
		hiddens[0].value = openAt;
		hiddens[1].value = closeAt;
	});
</script>
</body>
</html>