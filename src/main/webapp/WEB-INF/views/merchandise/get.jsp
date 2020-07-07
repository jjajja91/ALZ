<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body>

	<h2>상품 상세</h2>
	<table border="1">
		<tr>
			<td>상품이미지</td>
			<td>
				<table border="1" style="height: 200px; width: 250px;">
					<tr align="center">
						<td>상품명</td>
						<td><c:out value="${merchandise.name }" /></td>
					</tr>
					<tr align="center">
						<td>상품 소개</td>
						<td><c:out value="${merchandise.description }" /></td>
					</tr>
					<tr align="center">
						<td>가격</td>
						<td><c:out value="${merchandise.originPrice }" /></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<form name="orderform" method="post" action="/order/order">
							
								<input type="hidden" id="id" name="id" value='<c:out value="${merchandise.id }"/>'> 
								<input type="hidden" id="name" name="name" value='<c:out value="${merchandise.name }"/>'> 
								<input type="hidden" id="originPrice" name="originPrice" value='<c:out value="${merchandise.originPrice }"/>'> 
								<input type="submit" value="구매하기">
							</form>
						</td>
					</tr>
				</table>
</body>
</html>