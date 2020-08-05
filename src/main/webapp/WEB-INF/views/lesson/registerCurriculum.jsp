<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 커리큘럼 등록</h1>
</div>

<div class="container">
	
	<form role="form" action="/lesson/registerCurriculum" method="post">
		<input type="text" name="lessonId" value='<c:out value="${param.lessonId }"/>'>
		<input type="text" name="originalId" value='<c:out value="${param.originalId }"/>'>
	
		<h5><strong>커리큘럼</strong></h5>클래스를 신청하신 분들이 배우고 있는 커리큘럼입니다. 주제와 그에 따른 소주제를 작성해 주세요.
		<br><br><br>
		<br>대주제를 입력해주세요.
		<br>
		<div>
			<br>
			<c:if test="${empty newCurriculum}" >
				<c:forEach items='${originCurriculum}' var='list' varStatus="subjectLoop">
					<div id="subjectDiv">
						<label for="subject">주제</label>
						<input type="text" class="subject" name="subject" value='<c:out value="${list.subject }"/>'> 
						
						<c:if test="${subjectLoop.index != 0}" >
							<input type="button" class="deleteSubject" name="delete" value="-delete">
						</c:if>
					</div>
					
					<c:forEach items='${list.detailList}' var='detail' varStatus="detailLoop">
						<div id="detailDiv">
							<label for="detail">소주제</label>
							<input type="text" class="detail" name="detail" value='<c:out value="${detail.detail }"/>'>
							<input type="hidden" class="detailOrder" name="detailOrder" value='<c:out value="${detailLoop.index+1 }"/>'>
							
							<c:if test="${detailLoop.index != 0}" >
								<input type="button" class="deleteDetail" name="delete" value="-delete">
							</c:if>
						</div>
					</c:forEach>
					<br>
				</c:forEach>
			</c:if>
			
			<c:if test="${!empty newCurriculum}" >
				<c:forEach items='${newCurriculum}' var='list' varStatus="subjectLoop">
					<div id="subjectDiv">
						<label for="subject">주제</label>
						<input type="text" class="subject" name="subject" value='<c:out value="${list.subject }"/>'> 
						
						<c:if test="${subjectLoop.index != 0}" >
							<input type="button" class="deleteSubject" name="delete" value="-delete">
						</c:if>
					</div>
					
					<c:forEach items='${list.detailList}' var='detail' varStatus="detailLoop">
						<div id="detailDiv">
							<label for="detail">소주제</label>
							<input type="text" class="detail" name="detail" value='<c:out value="${detail.detail }"/>'>
							<input type="hidden" class="detailOrder" name="detailOrder" value='<c:out value="${detailLoop.index+1 }"/>'>
							
							<c:if test="${detailLoop.index != 0}" >
								<input type="button" class="deleteDetail" name="delete" value="-delete">
							</c:if>
						</div>
					</c:forEach>
					<br>
				</c:forEach>
			</c:if>
			
			<c:if test="${!empty newCurriculum}" >
				<div id="subjectDiv">
					<label for="subject">주제</label>
					<input type="text" class="subject" name="subject" > 
				</div>
				
				<div id="detailDiv">
					<label for="detail">소주제</label>
					<input type="text" class="detail" name="detail">
				</div>
			</c:if>
		</div>
		
		<input type="button" id="addSubject" name="addSubject" value="+Add Subject"/>
		<input type="button" id="addDetail" name="addDetail" value="+Add Detail"/>
		<br><br><br>
		<button type="submit">다음 ＞</button>
	</form>
</div>
<script>

	var formObj;
	var subjectDiv;
	var detailDiv;
	var $addSubjectBtn;
	var $addDetailBtn;
	var $subject;
	var $detail;
	
	$(document).ready(function(){
		formObj = $("form[role='form']");
		$addSubjectBtn = $("input[name=addSubject]");
		$addDetailBtn = $("input[name=addDetail]");
		$lessonId = $("input[name=lessonId]");
		
	});
	
	// 쓰기 아직 완성안됨
	$("button[type=submit]").click(function(e) {
		
		$subject = $(".subject");
		$detail = $(".detail");
		
		// 소주제 담을 배열
		let detail = [];
		for(let i=0; i<$detail.length; i++) {
			let detailList = {
					detailOrder : i+1,
					detail: $detail[i].value
			};
			detail.push(detailList);
		}
		
		// 대주제 담을 배열
		let subjectList = {};
		for(let i=0; i<$subject.length; i++) {
			subjectList["id"] = $lessonId.val();
			
		}
		subjectList["detailList"] = detail;
		
		$.ajax({
				type : 'POST',
				url : '/lessons/schedule',
				data : timeList,
				contentType : "application/json; charset=utf-8",
				success:function(data){
	                console.log("SUCESS: ", data);
	                formObj.submit();
	            }
		});
		
	});
		
	// 주제 추가 버튼 눌렀을때 이벤트
	$(document).on("click","input[name='addSubject']",function(e){
		
		e.preventDefault();

		subjectDiv =document.getElementById("subjectDiv");
		
		var i =0;
		var clone = subjectDiv.cloneNode(true); // "deep" clone
		clone.id = "duplicater" + ++i;
		  
		clone.getElementsByTagName("input").subject.value = "";
		  
		var deleteBtn = document.createElement("input");
		deleteBtn.setAttribute("type", "button");
		deleteBtn.setAttribute("name", "delete");
		deleteBtn.setAttribute("value", "delete");
		  
		clone.appendChild(deleteBtn);
		subjectDiv.parentNode.appendChild(clone);
		/* timesetDiv.appendChild(timesetDiv); */
	});
	
	// 소주제 추가 버튼 눌렀을때 이벤트
	$(document).on("click","input[name='addDetail']",function(e){
		
		e.preventDefault();

		detailDiv =document.getElementById("detailDiv");
		
		var i =0;
		var clone = detailDiv.cloneNode(true); // "deep" clone
		clone.id = "duplicater" + ++i;
		  
		clone.getElementsByTagName("input").detail.value = "";
		  
		var deleteBtn = document.createElement("input");
		deleteBtn.setAttribute("type", "button");
		deleteBtn.setAttribute("name", "delete");
		deleteBtn.setAttribute("value", "delete");
		  
		clone.appendChild(deleteBtn);
		detailDiv.parentNode.appendChild(clone);
	});
	
	$(document).on("click","input[name='delete']",function(e){
		
		e.target.parentNode.remove();
	});
	

    
</script>
</body>
</html>