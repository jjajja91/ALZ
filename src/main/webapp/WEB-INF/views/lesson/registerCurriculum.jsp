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
	

		<input type="hidden" name="originalId" value='<c:out value="${param.originalId }"/>' readonly>
	
		<h5><strong>커리큘럼</strong></h5>클래스를 신청하신 분들이 배우고 있는 커리큘럼입니다. 주제와 그에 따른 소주제를 작성해 주세요.
		<br>
		<br>
		<br>
		<br>대주제를 입력해주세요.
		<br>
		<br>
		<div class="parentDiv">
		<c:if test="${empty newCurriculum}" >
			<c:forEach items='${originCurriculum}' var='list' varStatus="subjectLoop">
				<ul>
					<li class="subjectLi">
					<br>
						<label for="subject">주제</label>
						<input type="text" class="subject" name="subject" value='<c:out value="${list.subject }"/>'> 
						 
						<c:if test="${subjectLoop.index != 0}" >
							<input type="button" class="deleteSubject" name="delete" value="-delete">
						</c:if>
						
						<input type="button" name="addDetail" value="add Detail" />
						
						<c:forEach items='${list.detailList}' var='detail' varStatus="detailLoop">
							<ul>
								<li class="detailLi">
									<label for="detail">소주제</label>
									<input type="text" class="detail" name="detail" value='<c:out value="${detail.detail }"/>'>
									
									<c:if test="${subjectLoop.index>0 || detailLoop.index>0}" >	
										<input type="button" class="deleteDetail" name="delete" value="-delete">
									</c:if>
								</li>
							</ul>
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		</c:if>
		
		<c:if test="${!empty newCurriculum}" >
			<c:forEach items='${newCurriculum}' var='list' varStatus="subjectLoop">
				<ul>
					<li class="subjectLi">
						<label for="subject">주제</label>
						<input type="text" class="subject" name="subject" value='<c:out value="${list.subject }"/>'> 
						
						<c:if test="${subjectLoop.index != 0}" >
							<input type="button" class="deleteSubject" name="delete" value="-delete">
						</c:if>
						
						<input type="button" name="addDetail" value="add Detail" />
						
						<c:forEach items='${list.detailList}' var='detail' varStatus="detailLoop">
							<ul>
								<li class="detailLi">
									<label for="detail">소주제</label>
									<input type="text" class="detail" name="detail" value='<c:out value="${detail.detail }"/>'>
									
									<c:if test="${subjectLoop.index>0 || detailLoop.index>0}" >	
										<input type="button" class="deleteDetail" name="delete" value="-delete">
									</c:if>
								</li>
							</ul>
						</c:forEach>
					</li>
				</ul>
			</c:forEach>
		</c:if>
		
		<c:if test="${empty newCurriculum}" >
			<c:if test="${empty originCurriculum}" >
				<ul>
					<li class="subjectLi">
						<label for="subject">주제</label>
						<input type="text" class="subject" name="subject" > 
						
						<input type="button" name="addDetail" value="add Detail" />
					
						<ul>
							<li class="detailLi">
								<label for="detail">소주제</label>
								<input type="text" class="detail" name="detail">
							</li>
						</ul>
					</li>
				</ul>
			</c:if>
		</c:if>
		</div>
		<input type="button" name="addSubject" value="+Add Subject"/>
		<br><br><br>
	<form role="form" id="submitForm" action="/lesson/registerSubmit" method="post">
		<input type="hidden" name="lessonId" value='<c:out value="${param.lessonId }"/>' readonly>
		<button type="button" name="prev">＜ 이전</button>
		<button type="button" name="save">저장</button>
		<button type="submit" name="submit">제출</button>
	</form>
</div>
<script>

	var formObj;
	var $subjectLi;
	var $detailLi;
	var $addSubjectBtn;
	var $addDetailBtn;
	var $subject;
	var $detail;
	var $lessonId;
	
	$(document).ready(function(){
		$addSubjectBtn = $("input[name=addSubject]");
		$addDetailBtn = $("input[name=addDetail]");
		$lessonId = $("input[name=lessonId]");
		
	});
	
	// 쓰기 아직 완성안됨
	$("button[type=button]").click(function(e) {

		e.preventDefault();
		formObj = $("form[role='form']");

		var location = $(this).attr("name");
		var curriculumList = [];

		// 커리큘럼 목록 배열
		$('.subjectLi').each(function() { 
			var curriculumObj = {
					lessonId : $lessonId.val(),
					subject : $(this).find('input[name=subject]').val(),
			    	detailList : []
			}
			
			$(this).find('.detailLi input[name=detail]').each(function(){
				//$(this).val()
			    var detailObj = {
						lessonId : $lessonId.val(),
			    		detail: $(this).val()
			    }
			    curriculumObj.detailList.push(detailObj)
			})
			curriculumList.push(curriculumObj);
		});
		
		insertCurriculum(curriculumList, location)
			.then(function(response) {
				if (response==='prev') {
		    		self.location = "/lesson/registerDetail?lessonId="+$lessonId.val();
		    	} else if(response==='submit') {
		    		
		    	}
			})
		
	});
	
	function insertCurriculum(curriculumList, location) {
		
		return $.ajax({
					type : 'POST',
					url : '/lessons/curriculum/'+location,
					contentType : "application/json; charset=utf-8",
			        data: JSON.stringify(curriculumList)
			});
	}
		
	// 주제 추가 버튼 눌렀을때 이벤트
	$(document).on("click","input[name='addSubject']",function(e){
		
		e.preventDefault();

		var parentDiv = $(".parentDiv");
		let parentUl = document.createElement("ul");
		
		var subjectLi = document.createElement("li");
		subjectLi.setAttribute("class", "subjectLi");
					
		var subjectLable = document.createElement("lable");
		subjectLable.setAttribute("for", "subject");
		subjectLable.innerText = "주제";
		
		var subjectInput = document.createElement("input");
		subjectInput.setAttribute("type", "text");
		subjectInput.setAttribute("class", "subject");
		subjectInput.setAttribute("name", "subject");

		var deleteBtn = document.createElement("input");
		deleteBtn.setAttribute("type", "button");
		deleteBtn.setAttribute("class", "deleteSubject");
		deleteBtn.setAttribute("name", "delete");
		deleteBtn.setAttribute("value", "delete Subject");
		
		var addDetailBtn = document.createElement("input");
		addDetailBtn.setAttribute("type", "button");
		addDetailBtn.setAttribute("name", "addDetail");
		addDetailBtn.setAttribute("value", "add Detail");

		subjectLi.appendChild(subjectLable);
		subjectLi.appendChild(subjectInput);
		subjectLi.appendChild(deleteBtn);
		subjectLi.appendChild(addDetailBtn);
		parentUl.appendChild(subjectLi);
		parentDiv[0].appendChild(parentUl);
	});
	
	// 소주제 추가 버튼 눌렀을때 이벤트
	$(document).on("click","input[name='addDetail']",function(e){
		
		e.preventDefault();

		var parent = e.target.parentNode;
		
		let parentUl = document.createElement("ul");
		
		var detailLi = document.createElement("li");
		detailLi.setAttribute("class", "detailLi");
					
		var detailLable = document.createElement("lable");
		detailLable.setAttribute("for", "detail");
		detailLable.innerText = "소주제";
		
		var detailInput = document.createElement("input");
		detailInput.setAttribute("type", "text");
		detailInput.setAttribute("class", "detail");
		detailInput.setAttribute("name", "detail");

		var deleteBtn = document.createElement("input");
		deleteBtn.setAttribute("type", "button");
		deleteBtn.setAttribute("class", "deleteDetail");
		deleteBtn.setAttribute("name", "delete");
		deleteBtn.setAttribute("value", "delete Detail");

		detailLi.appendChild(detailLable);
		detailLi.appendChild(detailInput);
		detailLi.appendChild(deleteBtn);
		parentUl.appendChild(detailLi);
		parent.appendChild(parentUl);
	});
	
	// 삭제버튼 이벤트
	$(document).on("click","input[name='delete']",function(e){
		
		if(e.target.className=="deleteSubject") {
			e.target.parentNode.parentNode.remove();
		} else {
			e.target.parentNode.remove();
		}
	});
	
	function goBack() {
		window.history.back();
	}

    
</script>
</body>
</html>