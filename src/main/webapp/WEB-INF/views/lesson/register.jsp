<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 강사소개 등록</h1>
</div>

<div class="container">
	
	<form role="form" action="/lesson/registerTeacher" method="post">
		<h5><strong>본인을 소개하고<br>활동중인 SNS 채널을 알려주세요</strong></h5>
		<div class="lessonTeacherDiv">
			<br>
			<label>닉네임</label> 
			<input class="form-control" name='nickname'>
			<input type="hidden" name="userId" value='<sec:authentication property="principal.id"/>'>
			<small>최대 15자</small>
			
			<br><br><br>
			<label>활동적인 SNS 채널</label><br>
			<select class="form-control" name="snsType" id="snsType">
			  <option value="Instagram">Instagram</option>
			  <option value="Youtube">Youtube</option>
			  <option value="Facebook">Facebook</option>
			</select>
			
			<br>
			<input type="text" class="form-control" placeholder="채널 아이디를 입력해주세요 (@제외)" name="snsId">
			<br>
			<input type="text" class="form-control" placeholder="URL주소를 입력해주세요." name="snsUrl">
			
			<br><br>
			<label>강사 소개</label><br>
			<textarea class="form-control" placeholder="강사님이 어떤 분인지 소개해주세요" name="profile"></textarea>
		</div>
		
		<br><br><br>
		<button type="submit">다음 ＞</button>
	</form>
		
</div>

<script>
	/* $("button[type=submit]").on("click", function(e){

		e.preventDefault();
		
		var snsList = [];
	
	}); */
</script>
</body>
</html>