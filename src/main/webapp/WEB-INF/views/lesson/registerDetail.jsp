<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%-- <%@include file="../includes/header.jsp"%> --%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<style>
.container {
	margin-top: 70px;
	margin-left: 10%;
	min-height: 100%;
	position: relative;
}

.lessonHeaderDiv {
	width:100%;
	height:30px;    
	border-bottom: solid 1px;
	padding-right:20px;
}

.lessonHeaderLeft {
	padding-left: 2%;
}
.lessonHeaderRight {
    position: absolute;
    right: 20;
}
.pageTitle {
    font-size: 30px;
    font-weight: 600;
    padding-right:10px;
    color: #335492;
    
}

.lessonText {
	color: #585858;
	font-weight: bold;
	font-size: 16px;
    margin-bottom: 20px;
}

.lessonForm {
	font-size: 14px;
	color: #585858;
    line-height: 30px;
    margin-top: 20px;
}

.lessonForm button {
    position: absolute;
    right: 55%;
    background: #335492;
    color: white;
    height: 35px;
    width: 70px;
    border-radius: 3px;
    border: none;
    font-weight: bold;
}

.lessonForm button[name="prev"] {
    right: 57%;
}
.lessonForm button[name="next"] {
    right: 51%;
}

.form-control {
	width:80%;
	height: 30px;
	padding: 5px;
    margin: 5px;
}

#nickname {
	width: 30%;
}

.teacherTextarea {
	height: 200px;
}

.titleDiv {
	border-bottom: solid;
    border-color: #335492;
    padding-bottom: 15px;
    width: 85%;
}

.lessonList {
	width: 70%;
}

.mainCategoryList, .subCategoryList{
	width:220px;
}
.lessonMainImgDiv {
	display: flex;
    margin-bottom: 30px;
}
.lessonMainImgLeftDiv {
    display: table-cell;
    border: solid #335492;
    border-style: dashed;
    border-radius: 5px;
    text-align: center;
    height: 200px;
    vertical-align: middle;
}
.lessonMainImgRightDiv {
    width: 50%;
    padding: 15px;
}

.lessonTitleInput {
	width:100%;
}
.studentAmount {
	width:10%;
}

.dateInput, .lessonDate {
	width: 130px;
}

.startAt, .endAt {
	width: 100px;
}

input[type="button"] {
    position: absolute;
    background: #335492;
    color: white;
    height: 30px;
    width: 80px;
    border-radius: 3px;
    border: none;
    margin-top: 5px;
}
</style>
<body>
	<div class="lessonHeaderDiv">
		<span class="lessonHeaderLeft">클래스 등록 > 4. 세부설명 등록</span>
		<span class="lessonHeaderRight"><a href="/">HOME</a></span>
	</div>
	<div class="container">
		<div class="titleDiv">
			<span class="pageTitle">세부설명</span>
		</div>
		<form class="lessonForm" role="form" action="/lesson/registerDetail" method="post">
			<input type="hidden" name="lessonId" value='<c:out value="${param.lessonId }"/>' readonly>
			<input type="hidden" name="originalId" value='<c:out value="${param.originalId }"/>' readonly>
			<input type="hidden" name="id" id="id" value='<c:out value="${detail.id }"/>' readonly>
			<input type="hidden" name="location" id="location" readonly/>
		
			<div class="lessonText">클래스를 통해 어떤 것을 배울 수 있는지<br> 상상해볼 수 있도록 클래스 소개를 채워주세요.</div>
			
			<textarea class="form-control" id="detail" placeholder="클래스를 통해 알려주실 것과 완성할 수 있는 것들을 설명해 주세요." name="detail"><c:out value="${detail.detail }" /></textarea>
			
			<br> <br> <br>
			<button type="submit" name="prev">＜ 이전</button>
			<button type="submit" name="next">다음 ＞</button>
			<br> <br>
		</form>
	</div>
<script>
	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
	});
	
	// 다음 클릭시 지우고 저장
	$("button[type=submit]").click(function(e){

		var $lessonId = $("input[name=lessonId]");
		var $originalId = $("input[name=originalId]");
		var $inputlocation = $("#location");
		
		var name = $(this).attr("name");
		
		if (name === 'prev') {
			
			$inputlocation.val("prev");
			formObj.submit();
			
		} else {
			
			$inputlocation.val("next");
			formObj.submit();
		}
		
	});
    
</script>
</body>
</html>