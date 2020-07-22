<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 상세보기</h1>
</div>

<div class="class-container">

	<div class="class-main">
		<div class="classDetailImgDiv">
			<img class="classDetailImg" src="../../../resources/img/javaclass.jpg">
		</div>
		<div class="class-detail">
			<div class="class-detail-nav">
				<a>클래스소개</a>
				<a>커리큘럼</a>
				<a>강사소개</a>
				<a>후기</a>
				<a>환불정책</a>
			</div>
			<c:out value="${lesson.detail}"></c:out>
		</div>
	</div>

	
	<div class="class-info">
		<div class="classes-group">
			<label>클래스설명</label>
			<textarea class="classes-control" rows="3" name='description'
				readonly="readonly"><c:out value="${lesson.title}" /></textarea>
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
			<input class="classes-control" name='studentCnt' value='<c:out value="${lesson.maxStudent}"/>' readonly="readonly">
		</div>
		
		<div class="classes-group">
			<label>좋아요수</label>
			
		</div>
		
		<div class="classes-group">
			<label>찜수</label>
			
		</div>
		
		<div class="classes-group">
			<label>평점</label>
			
		</div>
	</div>

</div>
</body>
</html>