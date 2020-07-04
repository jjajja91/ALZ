<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<br> 상품명 :<%=request.getParameter("merchandiseName")%><br>
		상품 가격 :<%=request.getParameter("merchandisePrice")%>
	</div>
	<br>
	<div>

		<form name="orderSheet" method="post" action="/order/order">
			<strong>연락처 정보</strong><br> 
			<label>이름</label> <input type="text" name="orderName"><br> 
			<label>휴대폰</label> <input type="text" name="orderPhone"><br> <br>
			<strong>결제 금액</strong><br>
			<label>상품 금액</label> <%=request.getParameter("merchandisePrice")%><br>
			<label>할인 금액</label> <br>
			<label>결제 금액</label> <%=request.getParameter("merchandisePrice")%><br> <br>
			<strong>결제 수단</strong><br>
			<button type="button">카드 결제</button><br>
			<button type="button">무통장 입금</button><br>
			<button type="submit">다 음</button>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>