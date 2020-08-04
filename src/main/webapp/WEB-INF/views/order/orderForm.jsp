<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER</title>
</head>
<body>
	<div>

		<h2>ORDER</h2>
		<br>

	</div>
	<br>
	<br>
	
	<form name="orderinfo" method="post" action="/order/payForKakao">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<td colspan="2">상품정보</td>
				<td>판매가</td>
			</tr>
			<c:set var="i" value="0" />
			<!-- 가격 총합 -->
			<c:set var="finalTotalPrice" value="0" />
			<c:forEach items="${buyList}" var="list">
				<tr>
					<td class="main_list_col1">이미지</td>
					<td class="main_list_col2">${list.name}</td>
					<td class="main_list_col3">
					<fmt:formatNumber value="${list.originPrice}" pattern="#,###"/></td>
				</tr>

				<input type="hidden" id="cartId" name="cartId" value="${list.id }">
				<c:set var="i" value="${i+1}" />
				<c:set var="finalTotalPrice"
					value="${finalTotalPrice + list.originPrice}" />
					<input type="hidden" id="merchandiseName" name="merchandiseName" value="${list.name}">
			</c:forEach>

		</table>
		<br>
		<div>

			<div>
				<strong>연락처 정보</strong><br> 이름 <input type="text" name="name"
					id="name" value="${userInfo.nickname}"><br> 휴대폰 <input
					type="text" name="phone" id="phone" value="${userInfo.phoneNumber}"><br>
				할인 금액 <br> 결제 금액 <fmt:formatNumber value="${finalTotalPrice}" pattern="#,###"/> <br> <br>
			</div>

			<div>
				<strong>결제 수단</strong><br>

				<div>
					<label><input type="radio" name="method" id="method"
						value="신용카드">카드 결제</label><br> <label><input
						type="radio" name="method" id="method" value="카카오 페이">카카오
						페이</label>
				</div>
				<button id="buyBtn" type="submit">다 음</button>

			</div>

			<input type="hidden" id="merchandise" name="merchandise" value="${merchandise.id}">
			<input type="hidden" name="state" id="state" value="결제완료"> 
			<input type="hidden" name="totalPrice" id="totalPrice" value="${finalTotalPrice}"> 
		</div>
	</form>

</body>
<script type="text/javascript">
	$(document).ready(function() {

		var phoneNumber = $("#phone").val();
		var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;

		$("#buyBtn").click(function() {
			if (!(checkConfirm())) {
				return false;
			} else {
			/* payForKakao(); */
			}
		});

		// 결제방법, 폰번호 체크
		function checkConfirm() {
			if ($('input[name="method"]:radio:checked').length < 1) {
				alert("결제 방법을 선택하세요.");
				event.preventDefault();
				return false;
			} else {
				return true;
			}
			/* 	if (!phoneNumberRegex.test(phoneNumber)) {
					alert("연락처를 다시 확인해주세요.");
					$("#phone").val("");
					$("#phone").focus();
					event.preventDefault();
					return false;
				} */
		}
		
		
	});
</script>
</html>