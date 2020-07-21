<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
</head>
<body>
	<form role="form" action="/class/register" method="post">
		<div class="form-group">
			<label>클래스이름</label> <input class="form-control" name='name'>
		</div>
		<div class="form-group">
			<label>클래스설명</label>
			<textarea class="form-control" rows="3" name='description'></textarea>
		</div>
		<div class="form-group">
			<label>개강날짜</label> <input type="date" class="form-control" id="open">
			<input type="hidden" class="form-control" name='openAt'> <label>종강날짜</label>
			<input type="date" class="form-control" id="close"> <input type="hidden"
				class="form-control" name='closeAt'>

		</div>
		<div class="form-group">
			<label>시작시간</label> <input type="time" class="form-control"
				name='startAt'> <label>종료시간</label> <input type="time"
				class="form-control" name='endAt'>
		</div>
		<div class="form-group">
			<label>카테고리번호</label> <input class="form-control" name='categoryId'>
		</div>
		<div class="form-group">
			<label>선생님번호</label> <input class="form-control" name='teacherId'>
		</div>
		<button type="submit">등록</button>
		<button type="reset">취소</button>
	</form>
	<script>
		$("button[type=submit]").click(function(e){
			var dates = $("input[type=date]");
			var openAt = dates[0].value.replace(/-/gi,"/");
			var closeAt = dates[1].value.replace(/-/gi,"/");
			var hiddens = $("input:hidden");
			hiddens[0].value = openAt;
			hiddens[1].value = closeAt;
		});
	</script>
</body>
</html>