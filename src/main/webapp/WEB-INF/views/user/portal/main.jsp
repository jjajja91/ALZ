<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
</head>
<body>

		<h3>Portal 페이지 입니다.</h3>
		
		<hr>
		
		<a href="/callJoin">회원가입 이동</a> &nbsp;&nbsp;
		<c:if test="${empty sessionUser}">
			<a href="/callLogin">로그인 이동</a>
		</c:if>
		<br>
		
		<c:if test="${!empty sessionUser}">
			<a href="/callModify">MODIFY</a> &nbsp;&nbsp; 
			<a href="/logout">LOGOUT</a> &nbsp;&nbsp;
			<a href="/deleteById">REMOVE</a> &nbsp;&nbsp; 
		</c:if>
</body>
</html>