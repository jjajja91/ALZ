 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
</head>
<body>

	<h3>로그인</h3>

	<form action="login" method="post">
		<table>
			<tr>
				<td>EMAIL</td>
				<td>
	        		<input type="text" name="email" autocomplete="off" placeholder="example@example.com">
	        	</td>
			</tr>

			<!-- <tr>
				<td>NICKNAME</td>
				<td>
					<input type="text" name="nickname" autocomplete="off" placeholder="6~12자리 이내의 한글">
				</td>
			</tr> -->

			<tr>
				<td>PW</td>
				<td>
		            <input type="password" name="password" autocomplete="off" placeholder="password" onkeypress="if (event.keyCode==13) login()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
		            <button type="submit">Log In</button>
					<!-- <a href="/callFindInfo">아이디/비번 찾기</a> -->
					<a href="/callFindId">아이디 찾기</a>
					<a href="/callFindpw">비번 찾기</a>
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
		
	<a href="/">메인 페이지 이동</a>
</body>
</html>