<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test = "${param.verify eq 'no'}">
<input type="hidden" name="verify" value='<c:out value="${param.verify}"/>'>
<p>탈퇴에 실패했습니다. 비밀번호를 다시 입력해 주세요</p>
</c:if>
<form role="form" action="/myPage/deleteAcc" method="post">
<label for="password">비밀번호</label>
<input type="password" name="password" autocomplete="off" placeholder="password">
<label for="description">탈퇴사유</label>
<input type="text" id="description" name="description">
<button type=submit>탈퇴하기</button>

</form>


</body>
</html>