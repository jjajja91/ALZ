<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
   <h1 class="page-header">클래스 목록</h1>
</div>

<div class="container">     
	
	<div class="lessonSortDiv">
		<select name="sort" id="lessonListSort">
		    <option value="newest">최신순</option>
		    <option value="rate">평점순</option>
		</select>
	</div>
	
	<div class="lessonRowDiv">
		<c:forEach items="${list}" var="lessons">
			<div class="lessonInfoDiv">
				<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
				<p><small>[<c:out value="${lessons.lessonType}" />] <c:out value="${lessons.categoryName}" /></small></p>
				<a class='read' href='<c:out value="${lessons.id }"/>'><strong><c:out value="${lessons.title}" /></strong></a>
				<p>★★★☆☆</p>
				<p>100,000원</p>
			</div>
		</c:forEach>
	</div>
	
	<%-- <table class="classTable">
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
	</table> --%>
	<select name="type"></select>
	<input type="text" name="keyword">
	<button id="searchBtn">검색</button>
	
</div>
</body>
</html>