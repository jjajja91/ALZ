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
			<div>장바구니가 비어있습니다.</div>
		</c:when>
		<c:otherwise>
		${sessionUser.nickname}님의 장바구니
				<table border="1">
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck">
					</th>
					<th>상품명</th>
					<th>금액</th>
					<th></th>
				</tr>
				<c:set var="i" value="0" />
				<c:set var="totalPrice" value="0" />
				<c:set var="merchandiseAmount" value="0" />
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td><input type="checkbox" id="chkBox${i}" name="chkBox"
							class="chkBox" data-cartId="${row.id }"> <input
							type="hidden" id="id${i}" name="id" value="${row.id }"></td>
						<td>${row.name }</td>
						<td>${row.originPrice }</td>
						<td><a class="delete"
							href="/merchandise/delete?id=${row.id }">X</a></td>
					</tr>

					<input type="hidden" id="totalPrice${i}"
						value="${row.originPrice }">
					<input type="hidden" id="merchandiseAmount${i}"
						value="${row.amount}">

					<c:set var="i" value="${i+1}"></c:set>
					<c:set var="totalPrice" value="${totalPrice + row.originPrice}" />
					<c:set var="merchandiseAmount"
						value="${merchandiseAmount + row.amount}" />



				</c:forEach>

			</table>




			<input type="hidden" name="count" value="${row.merchandiseId}">
		</c:otherwise>
	</c:choose>


	<button class="deleteBtn">선택 삭제</button>
	<button class="listBtn">상품 목록</button>

	<form id="buy_form" method="post">
		<table width=80% class="list_view" style="background: #cacaff">
			<thead>
				<tr align=center class="fixed">
					<td>상품금액(<span id="merchandiseAmount"></span>개)
					</td>
					<td></td>
					<td>총 할인 금액</td>
					<td></td>
					<td>최종 결제금액</td>
				</tr>
			</thead>
			<tbody>
				<tr cellpadding=40 align=center>
					<td>
						<h1>
							<span id="totalPrice"></span>
						</h1>
						<h3>원</h3>
					</td>
					<td><img width="25" alt="" src="/resources/img/minus.jpg"></td>
					<td>
						<p id="p_totalSalesPrice">${totalDiscountedPrice}원</p> <input
						id="h_totalSalesPrice" type="hidden" value="${totalSalesPrice}" />
					</td>
					<td><img width="25" alt="" src="/resources/img/equal.jpg"></td>
					<td>
						<p id="p_final_totalPrice">
							<fmt:formatNumber
								value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}"
								type="number" var="total_price" />
							${total_price}원
						</p> <input id="h_final_totalPrice" type="hidden"
						value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<div id="nav_main_1_result_btn">
		<a href="javascript:buy_btn();"><strong>주문하기</strong></a>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".listBtn").click(function() {
			location.href = "/merchandise/list";
		});

		// 개별 삭제 버튼
		$(".delete").click(function(e) {
			if (confirm("삭제하시겠습니까?")) {
				location.href = "/merchandise/delete?id=${row.id }";
			} else {
				e.preventDefault();
			}
		});

		// 체크박스 전체 체크 하기
		$("#allCheck").click(function() {
			var check = $('#allCheck').prop("checked");
			if (check) {
				$(".chkBox").prop("checked", true);
			} else {
				$(".chkBox").prop("checked", false);
			}
		});

		// 개별 체크 해제 시 전체 체크 해제
		$(".chkBox").click(function() {
			$("#allCheck").prop("checked", false);
		});

		// 체크 된 리스트 삭제 버튼
		$(".deleteBtn").click(function() {
			var confirm_val = confirm("삭제하시겠습니까?");

			// 확인 클릭 시 삭제
			if (confirm_val) {
				var checkArr = new Array();
				$("input[class='chkBox']:checked").each(function() {
					checkArr.push($(this).attr("data-cartId"));
				});//종료 input선택자
				$.ajax({
					url : "/merchandise/delete",
					type : "post",
					data : {
						chkbox : checkArr
					},
					success : function(result) {
						if (result == 1) {
							location.href = "/merchandise/cart";
						} else {
							alert(result);
							alert("삭제 실패")
						}
					}
				});

			}//종료 if
		});//종료 click

	});
</script>
</html>