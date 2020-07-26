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
		<h3>수정 정보 출력</h3>
		<form action="updateById" method="post">
			<table>
				<tr>
					<td>EMAIL</td>
					<td>
 						<input type="text" name="email" value="${sessionUser.email}" readonly="readonly">
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
						<input type="password" name="password" value="${sessionUser.password}">
					</td>
				</tr>
				<tr>
					<td>PHONENUMBER</td>
					<td>
						<input type="text" name="phoneNumber" value="${sessionUser.phoneNumber}">
					</td>
				</tr>
				<%-- <tr>
					<td>PW확인</td>
					<td>
						<input type="text" name="memberPwChk" value="${sessionMember.memberPwChk}">
					</td>
				</tr> --%>
				<tr>
					<td colspan="2">
						<input type="submit" value="Modify">
					</td>
				</tr>
			</table>
		</form>
		
		<hr>
		
		<a href="/">메인 페이지 이동</a>	<br>
		
</body>
</html>