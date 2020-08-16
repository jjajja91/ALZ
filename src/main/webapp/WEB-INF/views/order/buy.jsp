<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
.container {
	margin-top: 200px;
	margin-left: 600px;
	min-height: 100%;
	position: relative;
}

.table-container {
	top: 90px;
	left: 20%;
}

.content-table {
	border-collapse: collapse;
	font-size: 0.8em;
	min-width: 400px;
	width: 700px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
	background-color: #335492;
	color: #ffffff;
	text-align: left;
}

.content-table th {
	padding: 13px 15px;
	font-weight: bold;
	font-size: 18px;
}

.content-table td {
	padding: 8px 15px;
	font-size: 15px;
}

.content-table thead tr {
	font-weight: bold;
}

.content-table td a {
	text-decoration: none;
	color: #335492;
}

.content-table tbody tr {
	border-bottom: 1px solid #dddddd;
	font-weight: bold;
}

.content-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
	border-bottom: 2px solid #335492;
}

.content-table tbody tr.active-row {
	font-weight: bold;
	color: #335492;
}
div.title {
	margin-left: 300px;
	margin-bottom: 20px;
	font-size: 30px;
	font-weight: bold;
}
.footer {
	width: 100%;
	position: absolute;
	bottom: 0;
	background: #5eaeff;
	text-align: center;
	color: white;
	background: #335492;
	color: #fff;
	padding: 30px 0;
}
</style>
<body>
	<div class="container">
		<sec:authentication var="principal" property="principal" />
		<div class="title">주문 완료</div>
		<div>
			<strong>주문이 완료되었습니다. 이용해 주셔서 감사합니다.</strong>
			<p>주문 내역은 [마이페이지 > 주문 내역]에서 다시 확인할 수 있습니다.
		</div>

		<!-- alz_order_detail에서 가져옴 -->
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
							<td>이미지</td>
							<td>${list.name }<br> <fmt:formatNumber
									value="${list.salePrice}" pattern="#,###" /> 원
							</td>
							<td>결제 완료</td>
						</tr>
						<c:set var="finalTotalPrice"
							value="${finalTotalPrice + list.salePrice}" />
					</c:forEach>
				</table>
			</div>
			<br>

			<div class="orderer">
				<strong> 주문자 정보</strong>
				<table border="1">
					<tr>
						<td>이름</td>
						<td>${orderer.name}</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${orderer.phone}</td>
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
						<td><fmt:formatNumber value="${finalTotalPrice}"
								pattern="#,###" /> 원</td>
					</tr>
				</table>
			</div>
			<br> <a class='orderList' href='/'> 주문내역 확인</a> <a class='main'
				href='/'> 메인으로 가기</a>
		</div>
	</div>
	<footer class="footer">
		<div>
			<p class="copy">Copyright, ⓒ ALZ. All rights reserved.</p>
		</div>
	</footer>
</body>
<script type="text/javascript">
	
</script>
</html>