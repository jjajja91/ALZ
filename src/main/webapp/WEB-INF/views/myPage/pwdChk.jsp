<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${param.verify eq 'no'}">
		<input type="hidden" name="verify"
			value='<c:out value="${param.verify}"/>'>
		<p>일치하지 않는 정보입니다. 비밀번호를 다시 입력해 주세요</p>
	</c:if>
	<form role="form" action="/myPage/modifyAcc" method="post">
	<p>소중한 개인정보 보호를 위해 비밀 번호를 입력하여 주세요</p>
		<label for="password">비밀번호</label> <input type="password"
			name="password" autocomplete="off" placeholder="password"> <input
			type="hidden" name="id"
			value='<sec:authentication property="principal.id"/>'>
		<button type=submit>확인</button>

	</form>


</body>
</html>