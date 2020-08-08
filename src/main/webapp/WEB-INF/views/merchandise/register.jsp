<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Merchandise Register</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 등록</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div>
						<select name="lessonList" class="lessonList">
							<option>클래스를 선택해주세요</option>
							<c:forEach var="lesson" items="${lessonList}">
							<option value="${lesson.id}">${lesson.title}</option>
							</c:forEach>
						</select>
					</div>

					<form role="form" action="/merchandise/register" method="post">
						<div class="form-group">
							<label>상품 유형</label> <label><input type="radio"
								name="codeType" value="클래스" checked="checked"> 클래스</label> <label><input
								type="radio" name="codeType" value="준비물"> 준비물</label>
						</div>

						<div class="form-group">
							<label>상품명</label> <input class="form-control" name='name' readonly>
						</div>

						<div class="form-group">
							<label>상품 설명</label>
							<textarea class="form-control" rows="3" name='description'></textarea>
						</div>

						<div class="form-group">
							<label>마감일</label> <input type="datetime-local" name='closedAt' />
						</div>

						<div class="form-group">
							<label>상품 금액</label> <input class="form-control"
								name='originPrice'>
						</div>

						<div class="form-group">
							<label>할인 후 금액</label> <input class="form-control" name='salePrice'>
						</div>

						<div class="form-group">
							<label>할인률</label> <input class="form-control"
								name='discountRate'>
						</div>

						<div class="form-group">
							<label>할인 마감일</label> <input type="datetime-local" name='discountDeadline' />
						</div>

						<div class="form-group">
							<label>진열 상태</label> <label><input type="radio"
								name="displayState" value="1" checked="checked"> 진열</label> <label><input
								type="radio" name="displayState" value="0"> 미진열</label>
						</div>

						<div class="form-group">
							<input class="form-control" type='hidden' name='refId' readonly>
							<input class="form-control" name='userId' type='hidden' value="<sec:authentication property="principal.id"/>" readonly>
						</div>

						<button type="submit" class="btn btn-info">등록</button>
						<button type="reset" class="btn btn-danger">취소</button>
					</form>

				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->



	<script>


$(document).ready(function(e){
		var $name = $("input[name=name]");
		var $codeType = $("input[name=codeType]");
		var $description = $("textarea[name=description]");
		var $closedAt = $("input[name=closedAt]");
		var $originPrice = $("input[name=originPrice]");
		var $displayState = $("input[name=displayState]");
		var $discountRate = $("input[name=discountRate]");
		var $discountDeadline = $("input[name=discountDeadline]");
		var $salePrice = $("input[name=salePrice]");
		var inputData = {
			name: $name,
			codeType: $codeType,
			description: $description,
			closedAt: $closedAt,
			originPrice: $originPrice,
			displayState: $displayState,
			discountRate: $discountRate,
			salePrice: $salePrice,
			discountDeadline: $discountDeadline
		};
		var $refId = $("input[name=refId]");
		var $userId = $("input[name=userId]");

		var formObj = $("form[role='form']");
		
		$discountRate.change(function(e){
			var originPrice = $originPrice.val();
			var discountRate = $discountRate.val();
			var salePrice = Math.round((originPrice-originPrice*discountRate/100)/100)*100;
			$salePrice.val(salePrice);
			
		});
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		var data = {
				name: $name.val(),
				codeType: $codeType.val(),
				description: $description.val(),
				closedAt: $closedAt.val(),
				originPrice: $originPrice.val(),
				salePrice: $salePrice.val(),
				displayState: $displayState.val(),
				refId: $refId.val(),
				userId: $userId.val(),	
				discountRate: $discountRate.val(),
				discountDeadline: $discountDeadline.val()
		};
		console.log(data);
		merchandiseRegister(data)
		.then(function(response){
			console.log(response);
			self.location = "/merchandise/list";
		})
		.catch (function(error){
			var errorMessage = error.responseJSON.defaultMessage;
			console.log(error.responseJSON);
			alert(errorMessage);
			var errorFocus = error.responseJSON.field;
			inputData[errorFocus].focus();
		});

	});

	function merchandiseRegister(data) {
		
		  return $.ajax({
		    url: "/merchandises",
		    type: "POST",
		    data: JSON.stringify(data),
		    contentType: "application/json; charset=utf-8"
		  });
	}
	
	$('.lessonList').change(function(e) {
		console.log("변경");
		var value = $(this).val();
		var nameText = $(":selected") .text();
		$refId.val(value);
		$name.val(nameText);
	});

});

	</script>
 
</body>
</html>