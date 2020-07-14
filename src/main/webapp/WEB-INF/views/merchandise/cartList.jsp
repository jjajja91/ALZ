<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h2>장바구니</h2>
	<c:choose>
		<c:when test="${map.count == 0}">
			장바구니가 비어있습니다.
		</c:when>
		<c:otherwise>
		${sessionUser.nickname}님의 장바구니
			<form name="cartForm" id="cartForm" action="/cart/update"
				method="post">
				<table border="1">
					<tr>
						<th>상품명</th>
						<th>금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="row" items="${map.list}" >
						<tr>
							<td>${row.name }</td>
							<td>${row.originPrice }</td>
							<td><a href="/merchandise/delete?cartNum=${row.cartId }">삭제</a></td>
							<td><input type="hidden" name="count" value="${row.merchandiseId}"></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">장바구니 금액 합계 : ${map.sumMoney}<br>
							 전체 주문금액 : ${map.allSum}
						</td>
					</tr>
				</table>

			</form>
		</c:otherwise>
	</c:choose>
	<button id=btnList>상품 목록</button>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnList").click(function() {
			location.href = "/merchandise/list";
		});
	});
</script>
</html>