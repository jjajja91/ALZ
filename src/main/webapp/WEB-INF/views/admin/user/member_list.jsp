<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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
	<h2>회원 목록</h2>
	<%-- <input type="button" value="회원등록" onclick="location.href='${path}/admin/write'"> --%>
	<button type="button" id=adminHomeBtn class="form-control btn btn-primary">관리자 홈으로</button><br><br>
	<table border="1" width="1000px">
		<tr>
			<th>이메일</th>
			<th>닉네임</th>
			<th>권한</th>
			<th>전화번호</th>
			<th>회원 상태</th>
			<th>상태 시작일시</th>
			<th>상태 종료일시</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>${row.email}</td>
			<!-- 회원정보 상세조회를 위해 a태그 추가 -->
			<td><a href="${path}/admin/view?email=${row.email}">${row.nickname}</a></td>
			<td>${row.role}</td>
			<td>${row.phoneNumber}</td>
			<td>${row.state}</td>
			<td>${row.startAt}</td>
			<td>${row.endAt}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>