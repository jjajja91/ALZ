
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/common.css" /> --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
#kakaoLogin {
	cursor: pointer;
}
</style>
</head>
<body>

	<h3>로그인</h3>

	<form action="/login" method="post">
		<table>
			<tr>
				<td>EMAIL</td>
				<td><input type="text" name="username" autocomplete="off"
					placeholder="example@example.com"></td>
			</tr>

			<tr>
				<td>PW</td>
				<td><input type="password" name="password" autocomplete="off"
					placeholder="password" onkeypress="if (event.keyCode==13) login()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">Log In</button> 
					<a href="/find_id_form">아이디 찾기</a>
					<a href="/find_password_form">비밀번호 찾기</a><br>
					
					<a id="kakaoLogin">
						<img src="resources/img/카카오로그인.png">
					</a>
					<a id="naverLogin">
					<img src="resources/img/네이버로그인.PNG"></a>
					<a id="googleLogin" href="/">구글</a>
				</td>
			</tr>
		</table>
	</form>

	<hr>

	<a href="/">메인 페이지 이동</a>
	<script>
	
		$(document).ready(function(){
			
			let $kakaoLogin = $("#kakaoLogin");
			let $naverLogin = $("#naverLogin");
			let $googleLogin = $("#googleLogin");
			
			// 카카오 로그인 이벤트
			$kakaoLogin.click(function(e){
				e.preventDefault();
				$.ajax({
					url : "/kakao/request",
					method : "get",
					dataType : "json",
					headers : {
						"Accept" : "application/json", 
						"Content-Type" : "application/json"
					}, 
					success : function( JSONData ) {
						self.location = JSONData.url;
					}
				});
			});
			
			$naverLogin.click(function(e){
				e.preventDefault();
				$.ajax({
					url : "/naver/request",
					method : "get",
					dataType : "json",
					headers : {
						"Accept" : "application/json", 
						"Content-Type" : "application/json"
					}, 
					success : function( JSONData ) {
						self.location = JSONData.url;
					}
				});
			});
			
			$googleLogin.click(function(e){
				e.preventDefault();
				console.log("클릭");
				$.ajax({
					url : "/google/request",
					method : "get",
					dataType : "json",
					headers : {
						"Accept" : "application/json", 
						"Content-Type" : "application/json"
					}, 
					success : function( JSONData ) {
						console.log(JSONData);
						self.location = JSONData.url;
					},
					fail : function(error) {
						console.log(error);
					}
				});
			});
			
		});	
	
	</script>
</body>
</html>