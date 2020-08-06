<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록 페이지</title>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function() {
	$("#adminHomeBtn").click(function() {
		location.href = '/admin/index';
	})
})
</script>
</head>
<body>
	<h2>회원등록폼</h2>
	<form name="form1" method="post" action="${path}/admin/insert.do">
		<table border="1" width="400px">
			<tr>
				<td>이메일</td>
				<td><input name="email"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input name="nickname"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="phoneNumber"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
					<button type="button" id=adminHomeBtn class="form-control btn btn-primary">관리자 홈으로</button><br><br>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>