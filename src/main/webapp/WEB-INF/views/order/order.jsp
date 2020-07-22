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

		<!-- 구매 할 상품의 정보를 불러 온다. -->
		상품명 : ${merchandise.name }<br> 상품 가격 :${merchandise.originPrice }

	</div>
	<br>
	<div>

		<form name="orderinfo" method="post" action="/order/order">
		
		<input type="hidden" name='id' value='${merchandise.id}'>
		<input type="hidden" name='name' value='${merchandise.name}'>
		<input type="hidden" name='description' value='${merchandise.description}'>
		<input type="hidden" name='originPrice' value='${merchandise.originPrice}'>
		<input type="hidden" name='salePrice' value='${merchandise.salePrice}'>
		<input type="hidden" name='discountRate' value='${merchandise.discountRate}'>
		<input type="hidden" name='discountDeadline' value='${merchandise.discountDeadline}'>
		<input type="hidden" name='order' value='${merchandise.name}'>
		
		
			<strong>연락처 정보</strong><br> 
			이름  <input type="text" name="orderName"><br> 
			휴대폰 <input type="text" name="orderPhone"><br> <br> 
			<strong>결제 금액</strong><br>
			상품 금액 ${merchandise.name } <br> 
			할인 금액 <br> 
			결제 금액 ${merchandise.originPrice } <br> <br> 
			<strong>결제 수단</strong><br>
			<button type="button">카드 결제</button> <br>
			<button type="button">무통장 입금</button> <br>
			<button type="submit">다 음</button>

		</form>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>