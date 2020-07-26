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
											<form name="orderform" method="post" action="/order/orderForm">

												<input type="hidden" id="id" name="id"
													value='<c:out value="${merchandise.id }"/>'> <input
													type="hidden" id="name" name="name"
													value='<c:out value="${merchandise.name }"/>'> <input
													type="hidden" id="originPrice" name="originPrice"
													value='<c:out value="${merchandise.originPrice }"/>'>

												<button type="submit" class="buy">구매하기</button>

											</form>
											<button class="cart" onClick="add_cart('${merchandise.id}')">장바구니
												담기</button>
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
	function add_cart(id) {

		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "/merchandise/cartInsert",
			data : {
				id : id
			},
			success : function(result) {
				if (result == "true") {
					if (confirm("장바구니에 추가하였습니다. 장바구니로 이동하시겠습니까?"))
						location.href = "/merchandise/cart";
					else
						return false;
				} else {
					alert("이미 카트에 등록된 상품입니다.");
				}

			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다." + data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	};
</script>
</html>