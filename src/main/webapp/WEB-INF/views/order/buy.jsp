<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER RESULT</title>
</head>
<body>
	<sec:authentication var="principal" property="principal" />
	<H1>주문 완료</H1>
	<div>
		<strong>주문이 완료되었습니다. 이용해 주셔서 감사합니다.</strong>
		<p>주문 내역은 [마이페이지 > 주문 내역]에서 다시 확인할 수 있습니다.
	</div>

	<div class="orderConfirm">
		<div class="mdInfo">
			<strong>주문번호 : ${orderId}</strong>
			<table border="1">
				<tr>
					<td colspan="3">상품정보</td>
				</tr>
				<c:set var="finalTotalPrice" value="0" />
				<c:forEach items="${orderList}" var="list">
					<tr>
						<td >이미지</td>
						<td>${list.name }<br>
						<fmt:formatNumber value="${list.originPrice}" pattern="#,###"/>원</td>
						<td>결제 완료</td>
					</tr>
					<c:set var="finalTotalPrice"
						value="${finalTotalPrice + list.originPrice}" />
				</c:forEach>
			</table>
		</div>
		<br>

		<div class="orderer">
			<strong> 주문자 정보</strong>
			<table border="1">
				<tr>
					<td>이름</td>
					<td>${userInfo.nickname}</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>${userInfo.phoneNumber}</td>
				</tr>
			</table>
		</div>
		<br>

		<div class="payInfo">
			<strong> 결제 정보</strong>
			<table border="1">
				<tr>
					<td>결제 방법</td>
					<td>카카오 페이</td>
				</tr>
				<tr>
					<td>결제 금액</td>
					<td><fmt:formatNumber value="${finalTotalPrice}" pattern="#,###"/></td>
				</tr>
			</table>
		</div>
		<br> <a class='orderList' href='/'> 주문내역 확인</a> <a class='main'
			href='/'> 메인으로 가기</a>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>