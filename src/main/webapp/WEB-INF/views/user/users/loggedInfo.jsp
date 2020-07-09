<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 정보 출력</h3>
	
			<table>
				<tr>
					<td>EMAIL</td>
					<td>
						${sessionUser.email}
					 </td>
				</tr>
				<tr>
					<td>NICKNAME</td>
					<td>
						${sessionUser.nickName}
					</td>
				</tr>
				<tr>
					<td>INTRODUCE</td>
					<td>
						${sessionUser.introduce}
					</td>
				</tr>
			</table>
		
		<hr>
		
		<a href="/portal">메인 페이지 이동</a>	<br>
		
		
</body>
</html>