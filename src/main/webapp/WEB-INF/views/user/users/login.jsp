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
	        		<input type="text" name="email" autocomplete="off" placeholder="email">
	        	</td>
			</tr>
			<tr>
				<td>NICKNAME</td>
				<td>
					<input type="text" name="nickname" value="${sessionUser.nickname}">
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
		            <input type="password" name="password" autocomplete="off" placeholder="Password" onkeypress="if (event.keyCode==13) login()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
		            <button type="submit">Log In</button>
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
		
	<a href="/">메인 페이지 이동</a>
</body>
</html>