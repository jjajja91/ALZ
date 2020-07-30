 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/common.css" /> --%>
</head>
<body>

	<h3>로그인</h3>

	<form action="/login" method="post">
		<table>
			<tr>
				<td>EMAIL</td>
				<td>
	        		<input type="text" name="username" autocomplete="off" placeholder="example@example.com">
	        	</td>
			</tr>

			<tr>
				<td>PW</td>
				<td>
		            <input type="password" name="password" autocomplete="off" placeholder="password" onkeypress="if (event.keyCode==13) login()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
		            <button type="submit">Log In</button>
		            <a href="/find_id_form">아디찾기</a>
				</td>
			</tr>
		</table>
	</form>
	
	<hr>
		
	<a href="/">메인 페이지 이동</a>
</body>
</html>