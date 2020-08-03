<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지</title>
</head>
<body>

<!-- 비밀번호 찾기 페이지 -->
<!-- 에러메시지를 전달받는 함수 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
	$(function() {
		var responseMessage = "<c:out value="${message}" />";
		if (responseMessage != "") {
			alert(responseMessage)
		}
	})
</script>
	<div style="width: 50rem; border-radius: 20px;">
		<!-- id와 이메일을 입력하면 컨트롤러로 맵핑 -->
		<form action="/find_password_email" method="post">
			<div>
				<br> <br> <br> 
				<span style="color: green; font-weight: bold;">비밀번호 찾기</span><br><br> 
				
				<span style="color: black; font-weight: bold;">닉네임</span><br><br> 
				<input type="text" name="nickname" placeholder="닉네임을 입력하세요." class="form-control"><br><br> 
				
				<span style="color: black; font-weight: bold;">이메일</span><br><br> 
				<input type="text" name="email" placeholder="이메일을 입력하세요." class="form-control"><br><br>
				
				<button type="submit" name="submit" class="form-control btn btn-primary">확인</button><br><br>
				<span style="color: red; font-weight: bold;">입력하신 이메일로 인증번호가 발송됩니다. 받으신 인증번호를 입력해주세요.</span>
			</div>
		</form>
	</div>
</body>
</html>
