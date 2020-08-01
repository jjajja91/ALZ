<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 스케줄 등록</h1>
</div>

<div class="container">
	
	<form role="form" action="/class/registerCurriculum" method="post">
	<input type="text" name="lessonId" value='<c:out value="${param.lessonId }"/>'>
	
		<h5><strong>수업 날짜와 시간을 입력해주세요.</strong></h5>
		<br><br><br>
		<label>스케줄 선택</label>
		<br>클래스 시작일과 종료일을 입력해주세요.
		<br>
		<input type="date" id="openAt" name="openAt"> ~ 
		<input type="date" id="closeAt" name="closeAt">
		
		<br><br><br>
		<strong>세부 날짜와 시간을 입력해주세요.</strong>
		<br>
		<div>
			<div id="timesetDiv">
				<label for="lessonDate"> 날짜 </label>
				<input type="date" class="lessonDate" name="lessonDate">
				
				<label for="startAt"> 수업 시작시간 </label>
				<input type="time" class="startAt" name="startAt">
				<label for="endAt"> 수업 종료시간 </label>
				<input type="time" class="endAt" name="endAt">
			</div>
		</div>
				<input type="button" id="addLesson" name="addLesson" value="+add"/>
		<br><br><br>
		
		<button type="submit">다음 ＞</button>
	</form>	
		
</div>
<script>

	var timesetDiv;
	var $addBtn;
	var $startAt;
	var $endAt;
	var $lessonDate;
	var $lessonId;
	
	$(document).ready(function(){
		timesetDiv =document.getElementById("timesetDiv");
		$addBtn = $("input[name=addLesson]");
		$lessonId = $("input[name=lessonId]");
		
	});
	
	$("button[type=submit]").click(function(e){
		/* var dates = $("input[type=date]");
		var openAt = dates[0].value.replace(/-/gi,"/");
		var closeAt = dates[1].value.replace(/-/gi,"/");
		var hiddens = $("input:hidden");
		hiddens[0].value = openAt;
		hiddens[1].value = closeAt; */
		e.preventDefault();
		$lessonDate = $(".lessonDate");
		$startAt = $(".startAt");
		$endAt = $(".endAt");
		
		let timeTable = [];
		for(let i=0; i<$startAt.length; i++) {
			let timeTablevalues = {
					id : $lessonId.val(),
					lessonDate: $lessonDate[i].value,
					startAt: $startAt[i].value,
					endAt: $endAt[i].value
			};
			
			timeTable.push(timeTablevalues);
		}
		
		$ajax = {
				type : 'POST',
				url : '/lessons/schedule',
				data : JSON.stringify(timeTable),
				contentType : "application/json; charset=utf-8"
		}
	});
	
	$(document).on("click","input[name='addLesson']",function(e){
		
		e.preventDefault();
		
		  var i =0;
		  var clone = timesetDiv.cloneNode(true); // "deep" clone
		  clone.id = "duplicater" + ++i;
		  
		  clone.getElementsByTagName("input").lessonDate.value = "";
		  clone.getElementsByTagName("input").startAt.value = "";
		  clone.getElementsByTagName("input").endAt.value = "";
		  
		  var deleteBtn = document.createElement("input");
		  deleteBtn.setAttribute("type", "button");
		  deleteBtn.setAttribute("name", "deleteLesson");
		  deleteBtn.setAttribute("value", "delete");
		  
		  clone.appendChild(deleteBtn);
		  timesetDiv.parentNode.appendChild(clone);
		/* timesetDiv.appendChild(timesetDiv); */
	})
	
	$(document).on("click","input[name='deleteLesson']",function(e){
		
		e.target.parentNode.remove();
	})
	

    
</script>
</body>
</html>