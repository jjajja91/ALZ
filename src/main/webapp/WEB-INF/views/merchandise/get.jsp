<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 페이지</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table border="1">
						<tr>
							<td>상품이미지1234</td>
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

												<input type="hidden" id="id" name="id"
													value='<c:out value="${merchandise.id }"/>'> <input
													type="hidden" id="name" name="name"
													value='<c:out value="${merchandise.name }"/>'> <input
													type="hidden" id="originPrice" name="originPrice"
													value='<c:out value="${merchandise.originPrice }"/>'>

												<button type="submit" class="cart">장바구니 담기</button>
												<button type="submit" class="buy">구매하기</button>

											</form>
										</td>
									</tr>

								</table>
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('.cart').on("click", function(e) {

			e.preventDefault();

			formObj.attr("action", "/merchandise/cartInsert");

			formObj.submit();

		});

	})
</script>
</html>