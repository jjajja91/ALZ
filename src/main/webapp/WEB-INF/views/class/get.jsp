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
	<div class="classes-group">
		<label>클래스이름</label> <input class="classes-control" name='name'
			value='<c:out value="${classes.name}"/>' readonly="readonly">
	</div>
	<div class="classes-group">
		<label>클래스설명</label>
		<textarea class="classes-control" rows="3" name='description'
			readonly="readonly"><c:out value="${classes.description}" /></textarea>
	</div>
	<div class="classes-group">
		<label>클래스날짜</label> <input class="classes-control" name='openAt'
			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${classes.openAt}"/>'
			readonly="readonly"> <input class="classes-control"
			name='closeAt'
			value='<fmt:formatDate pattern="yyyy/MM/dd" value="${classes.closeAt}"/>'
			readonly="readonly">
	</div>
	<div class="classes-group">
		<label>클래스시간</label> <input class="classes-control" name='startAt'
			value='<c:out value="${classes.startAt }"/>' readonly="readonly">
		<input class="classes-control" name='endAt'
			value='<c:out value="${classes.endAt }"/>' readonly="readonly">
	</div>
	<div class="classes-group">
		<label>학생수</label> <input class="classes-control" name='studentCnt'
			value='<c:out value="${classes.studentCnt}"/>' readonly="readonly">
	</div>
	<div class="classes-group">
		<label>좋아요수</label> <input class="classes-control" name='likeCnt'
			value='<c:out value="${classes.likeCnt}"/>' readonly="readonly">
	</div>
	<div class="classes-group">
		<label>찜수</label> <input class="classes-control" name='reservCnt'
			value='<c:out value="${classes.reservCnt}"/>' readonly="readonly">
	</div>
	<div class="classes-group">
		<label>평점</label> <input class="classes-control" name='rate'
			value='<c:out value="${classes.rate}"/>' readonly="readonly">
	</div>

	<button data-oper='modify'>수정</button>
	<button data-oper='list'>목록</button>


</body>
</html>