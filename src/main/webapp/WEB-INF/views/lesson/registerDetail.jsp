<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 세부설명 등록</h1>
</div>

<div class="container">
	
	<form role="form" action="/lesson/registerDetail" method="post">
		<input type="hidden" name="lessonId" value='<c:out value="${param.lessonId }"/>' readonly>
		<input type="hidden" name="originalId" value='<c:out value="${param.originalId }"/>' readonly>
		<input type="hidden" name="id" id="id" value='<c:out value="${detail.id }"/>' readonly>
		<input type="hidden" name="location" id="location" readonly/>
	
		<h5><strong>클래스 소개 작성하기</strong></h5>클래스를 통해 어떤 것을 배울 수 있는지 상상해볼 수 있도록 클래스 소개를 채워주세요.
		<br><br><br>
		<textarea class="form-control" id="detail" placeholder="클래스를 통해 알려주실 것과 완성할 수 있는 것들을 설명해 주세요." name="detail"><c:out value="${detail.detail }" /></textarea>
		
		<button type="submit" name="prev">＜ 이전</button>
		<button type="submit" name="next">다음 ＞</button>
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