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
		<table>
			<tr>
		
		</table>

		<!-- 구매 할 상품의 정보를 불러 온다. -->
		상품명 : ${merchandise.name }<br> 상품 가격 :${merchandise.originPrice }

	</div>
	<br>
	<br>
	<br>
	<br>
	<div id="main_list">
					<h1>주문상품</h1>
					<table>
						<thead>
							<tr id="firstrow">
								<td class="main_list_head_col1" colspan="2">
									상품정보
								</td>
								<td class="main_list_head_col2">
									판매가
								</td>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0"/> 
							<!-- 가격 총합 -->
							<c:set var="finalTotalPrice" value="0"/>
							<!-- 받을 예정인 포인트 총합 -->
							<c:set var="finalTotalPoint" value="0"/>
							<c:forEach items="${buylist}" var="list"> 
							<tr>
								<td class="main_list_col1" >
									이미지
								</td>
								<td class="main_list_col2">
									
									${list.title}
									제목						
								</td>
								<td class="main_list_col3">
									<!-- 각 제품의 할인된가격 총합 -->
									<c:set var="discountPrice" value="0"/>
									<!-- 할인된가격 * 수량 -->
									<c:set var="discountPriceStock" value="0"/>
									<!-- 받을 포인트 -->
									<c:set var="point" value="0"/>
									
									<c:set var="discountPrice" value="${list.discountPrice} "/>
									<c:set var="discountPriceStock" value="${list.discountPrice * list.cartStock }"/>
									
									<c:set var="point" value="${list.bookPoint*list.cartStock}"/>
									 
									<strong><fmt:formatNumber value="${list.discountPrice}" pattern="#,###"/></strong>원 <span> | </span> 수량 ${list.cartStock}개
									<div>${list.discountPrice * list.cartStock}</div> 
									<div>[ ${list.discountRate} %↓ + ${list.bookPoint}원<span>P</span>]</div>			
									<c:set var="finalTotalPrice" value="${finalTotalPrice + discountPriceStock}"/>
							
									<c:set var="finalTotalPoint" value="${finalTotalPoint + point}"/>				
								</td>
							</tr>
								<input type="hidden" name="oDetail[${i }].productId" value="${list.productId }">
								<input type="hidden" name="oDetail[${i }].amount" value="${list.cartStock }">
								<input type="hidden" name="cartId" value="${list.cartId }">
							<c:set var="i" value="${i+1}"/> 
							</c:forEach>
						</tbody>
					
					</table>
				</div>
	<br>
	<div>

		<form name="orderinfo" method="post" action="/order/order">
		
			<strong>연락처 정보</strong><br> 
			이름  <input type="text" name="orderName" value="${userInfo.nickname}"><br> 
			휴대폰 <input type="text" name="orderPhone" value="${userInfo.phoneNumber}"><br> <br> 
			<strong>결제 금액</strong><br>
			상품 금액 ${merchandise.name} <br> 
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