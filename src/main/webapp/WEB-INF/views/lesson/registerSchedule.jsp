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
	
	<form role="form" action="/lesson/registerDetail" method="get">
		<input type="text" name="lessonId" value='<c:out value="${param.lessonId }"/>'>
		<input type="text" name="originalId" value='<c:out value="${param.originalId }"/>'>
	
		<h5><strong>수업 날짜와 시간을 입력해주세요.</strong></h5>
		<br><br><br>
		<label>스케줄 선택</label>
		<br>클래스 시작일과 종료일을 입력해주세요.<br>
		<input type="date" id="openAt" name="openAt" value='<c:out value="${schedule.openAt }"/>'> ~ 
		<input type="date" id="closeAt" name="closeAt" value='<c:out value="${schedule.closeAt }"/>'>
				
		<br><br><br>
		<strong>세부 날짜와 시간을 입력해주세요.</strong>
		<br>
		<div>
			<br>
			<c:forEach items='${schedule.timeTable}' var='timeList' varStatus="loop">
				<div id="timesetDiv">
					<label for="lessonDate">날짜 </label>
					<input type="date" class="lessonDate" name="lessonDate" value='<c:out value="${timeList.lessonDate }"/>'>

					<label for="startAt">수업 시작시간 </label>
					<input type="time" class="startAt" name="startAt" value='<c:out value="${timeList.startAt }"/>'>
					<label for="endAt">수업 종료시간 </label>
					<input type="time" class="endAt" name="endAt" value='<c:out value="${timeList.endAt }"/>'>
					
					<c:if test="${loop.index != 0}" >
						<input type="button" class="deleteLesson" name="deleteLesson" value="delete">
					</c:if>
				</div>
				<br>
			</c:forEach>
			
			<c:if test="${empty schedule}" >
				<div id="timesetDiv">
					<label for="lessonDate">날짜 </label>
					<input type="date" class="lessonDate" name="lessonDate" >
	
					<label for="startAt">수업 시작시간 </label>
					<input type="time" class="startAt" name="startAt" >
					<label for="endAt">수업 종료시간 </label>
					<input type="time" class="endAt" name="endAt" >
				</div>
			</c:if>
		</div>
		
		<input type="button" id="addLesson" name="addLesson" value="+add"/>
		<br><br><br>
		
		<button type="submit">다음 ＞</button>
	</form>
</div>
<script>

	var formObj;
	var timesetDiv;
	var $addBtn;
	var $openAt;
	var $closeAt;
	var $startAt;
	var $endAt;
	var $lessonDate;
	var $lessonId;
	var $originalId;
	
	$(document).ready(function(){
		formObj = $("form[role='form']");
		$addBtn = $("input[name=addLesson]");
		$lessonId = $("input[name=lessonId]");
		$originalId = $("input[name=originalId]");
		
	});
	
	// 다음 클릭시 지우고 저장
	$("button[type=submit]").click(function(e){

		$openAt = $("#openAt");
		$closeAt = $("#closeAt");
		$lessonDate = $(".lessonDate");
		$startAt = $(".startAt");
		$endAt = $(".endAt");
		
		let timeTable = [];
		for(let i=0; i<$startAt.length; i++) {
			let timeTablevalues = {
					timeTableId: $lessonId.val(),
					lessonDate: $lessonDate[i].value,
					startAt: $startAt[i].value,
					endAt: $endAt[i].value
			};
			timeTable.push(timeTablevalues);
		}
		
		let timeList = {};
		timeList["lessonId"] = $lessonId.val();
		timeList["openAt"] = $openAt.val();
		timeList["closeAt"] = $closeAt.val();
		timeList["timeTable"] = timeTable;
		
		$.ajax({
				type : 'POST',
				url : '/lessons/schedule',
				data : JSON.stringify(timeList),
				contentType : "application/json; charset=utf-8",
				success:function(data){
	                console.log("SUCESS: ", data);
	                self.location = "/lesson/registerDetail?lessonId="+$lessonId.val()+"&originalId="+$originalId.val();
	            }
		});
		
	});
		
	// 추가 버튼 클릭시 한칸씩 생기는 이벤트
	$(document).on("click","input[name='addLesson']",function(e){
		
		e.preventDefault();

		timesetDiv =document.getElementById("timesetDiv");
		
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
	});
	
	$(document).on("click","input[name='deleteLesson']",function(e){
		e.target.parentNode.remove();
	});
	

    
</script>
</body>
</html>