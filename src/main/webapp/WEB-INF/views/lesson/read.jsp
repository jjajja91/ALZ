<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 상세보기</h1>
</div>

<div class="container">

	<div class="classes-group">
		<label>클래스이름</label>
		<input class="classes-control" name='name' value='<c:out value="${lesson.title}"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>클래스설명</label>
		<textarea class="classes-control" rows="3" name='description'
			readonly="readonly"><c:out value="${lesson.description}" /></textarea>
	</div>
	
	<div class="classes-group">
		<label>클래스날짜</label> 
		<input class="classes-control" name='openAt'
			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${lesson.openAt}"/>' readonly="readonly">
		<input class="classes-control" name='closeAt'
			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${lesson.closeAt}"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>클래스시간</label>
		<input class="classes-control" name='startAt' value='<c:out value="${lesson.startAt }"/>' readonly="readonly">
		<input class="classes-control" name='endAt' value='<c:out value="${lesson.endAt }"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>학생수</label>
		<input class="classes-control" name='studentCnt' value='<c:out value="${lesson.studentCnt}"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>좋아요수</label>
		<input class="classes-control" name='likeCnt' value='<c:out value="${lesson.likeCnt}"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>찜수</label>
		<input class="classes-control" name='reservCnt' value='<c:out value="${lesson.reservCnt}"/>' readonly="readonly">
	</div>
	
	<div class="classes-group">
		<label>평점</label>
		<input class="classes-control" name='rate' value='<c:out value="${lesson.rate}"/>' readonly="readonly">
	</div>

	<button data-oper='modify'>수정</button>
	<button data-oper='list'>목록</button>

</div>
</body>
</html>