<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table class="classTable">
		<tr>
			<th>클래스이름</th>
			<th>클래스설명</th>
			<th>클래스날짜</th>
			<th>클래스시간</th>
			<th>학생수</th>
			<th>좋아요수</th>
			<th>찜수</th>
			<th>평점</th>
		<tr>
			<c:forEach items="${list}" var="classes">
				<tr>
					<td><a href="get?id=${classes.id}"><c:out value="${classes.name}" /></a></td>
					<td><c:out value="${classes.description}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${classes.openAt}" />~<fmt:formatDate pattern="yyyy/MM/dd"
							value="${classes.closeAt}" /></td>
					<td><c:out value="${classes.startAt}" />~<c:out
							value="${classes.endAt}" /></td>
					<td><c:out value="${classes.studentCnt}" /></td>
					<td><c:out value="${classes.likeCnt}" /></td>
					<td><c:out value="${classes.reservCnt}" /></td>
					<td><c:out value="${classes.rate}" /></td>
				</tr>
			</c:forEach>
	</table>
	<select name="type"></select>
	<input type="text" name="keyword">
	<button id="searchBtn">검색</button>
	

</body>
</html>