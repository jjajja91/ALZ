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
		<h3>회원가입</h3>

		<form action="create" method="post">
			<table>
				<!-- 
			<tr>
               <td>ID</td>
               <td>
                  <input name="id" placeholder="Id" maxlength="10" autocomplete="off">
                </td>
            </tr> 
            -->
			<tr>
				<td>EMAIL</td>
				<td><input name="email" type="text" placeholder="6~12자리 이내의 영어와 숫자" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>NICKNAME</td>
				<td><input name="nickname" placeholder="6~12자리 이내의 한글"
					maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="password" type="password" placeholder="6~12자리 이내의 숫자" maxlength="10" autocomplete="off">
				</td>
			</tr>
			<!--             
			<tr>
               <td>PW확인</td>
               <td>
                  <input name="memberPwChk" type="password" placeholder="Pw확인" maxlength="10" autocomplete="off">
               </td>
            </tr> 
            -->
			<!-- 
			<tr>
               <td>INTRODUCE</td>
               <td>
                  <input name="introduce" type="text" placeholder="Introduce" maxlength="10" autocomplete="off">
               </td>
            </tr> 
            -->

			<tr>
				<td align="center">
					<input type="submit" value="Join"> 
					<input type="reset" value="Cancel">
				</td>
			</tr>
			</table>
		</form>
		
		<hr>
		
		<a href="/">메인 페이지 이동</a>
</body>
</html>