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
	text-align: center;
}

.content-table th {
	padding: 13px 15px;
	font-weight: bold;
	font-size: 18px;
	text-align: center;
}

.content-table td {
	padding: 8px 15px;
	font-size: 15px;
	text-align: center;
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

.content-table td .result {
	font-size: 24px;
}

div.title {
	margin-left: 300px;
	margin-bottom: 20px;
	font-size: 30px;
	font-weight: bold;
}

.orderBtn {
	font-size: 18px;
	margin-top: 30px;
	margin-left: 300px;
	background-color: #335492;
	border-radius: 5px 5px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
	color: #ffffff;
	border: 1px solid #dddddd;
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
	<sec:authentication var="principal" property="principal" />
	<div class="container">
		<div class="title">장바구니</div>
		<c:choose>
			<c:when test="${map.count == 0}">
				<div style="margin-left: 270px;">장바구니가 비어있습니다.</div>
			</c:when>
			<c:otherwise>
				<div class="table-container">
					<table class="content-table">
						<tr>
							<th><input type="checkbox" name="allCheck" id="allCheck">
							</th>
							<th>상품명</th>
							<th>금액</th>
							<th></th>
						</tr>
						<!-- i 초기화 -->
						<c:set var="i" value="0" />
						<!-- totalPrice 초기화 -->
						<c:set var="totalPrice" value="0" />
						<!-- salePrice 초기화 -->
						<c:set var="salePrice" value="0" />

						<!-- 카트 리스트 출력 -->
						<c:forEach var="row" items="${map.list}">
							<tr>
								<td><input type="checkbox" id="chkBox${i}" name="chkBox"
									class="chkBox" data-cartId="${row.id }"> <input
									type="hidden" id="id${i}" name="id" value="${row.id }"></td>
								<td>${row.name }</td>
								<td><fmt:formatNumber value="${row.salePrice }"
										pattern="#,###" /> 원<br> <del
										style="font-weight: normal;">
										<fmt:formatNumber value="${row.originPrice }" pattern="#,###" />
										원
									</del></td>
								<td><a class="delete"
									href="/merchandise/delete?id=${row.id }"
									style="font-weight: bold; font-size: 1.3rem;">X</a></td>
							</tr>

							<input type="hidden" id="totalPrice${i}"
								value="${row.originPrice }">
							<input type="hidden" id="salePrice${i}"
								value="${row.originPrice - row.salePrice }">

							<c:set var="i" value="${i+1}"></c:set>
							<c:set var="totalPrice" value="${totalPrice + row.salePrice}" />
							<c:set var="salePrice"
								value="${salePrice + row.originPrice - row.salePrice}" />

						</c:forEach>
					</table>
				</div>
			</c:otherwise>
		</c:choose>

		<br>
		<button class="deleteBtn">선택 삭제</button>
		<!-- <button class="listBtn">상품 목록</button> -->
		<br> <br>

		<form id="order_form" method="post">
			<div id="result_info_hidden"></div>
			<div class="table-container">
				<table class="content-table">
					<thead class="result">
						<!-- 상품리스트 부분 -->
						<tr align=center class="fixed">
							<th>상품금액</th>
							<th></th>
							<th>총 할인 금액</th>
							<th></th>
							<th>최종 결제금액</th>
						</tr>
					</thead>
					<tbody class="result">
						<!-- 장바구니 금액 출력 부분 -->
						<tr style="background-color: #f3f3f3;" align=center>
							<td class="result" id="result_info_price"><span
								class="result" id="totalPrice"></span> 원</td>
							<td class="result"><img width="25" alt=""
								src="/resources/img/minus.jpg"></td>
							<td class="result"><span class="result" id="final_saleTotal"></span>
								원</td>
							<td class="result"><img width="25" alt=""
								src="/resources/img/equal.jpg"></td>
							<td class="result" id="result_info_total"><span
								class="result" id="final_total"></span> 원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

		<br>
		<div id="order">
			<button class="orderBtn">주문하기</button>
		</div>
	</div>

	<footer class="footer">
		<div>
			<p class="copy">Copyright, ⓒ ALZ. All rights reserved.</p>
		</div>
	</footer>
</body>
<script type="text/javascript">
	var link = document.location.href; //현재 페이지 url 

	// 체크 항목 출력 함수
	function checked() {
		//체크박수 갯수
		var totalCount = $('.chkBox').length;
		//가격총합
		var totalPrice = 0;
		//세일총합
		var salePrice = 0;
		//총가격(제품)
		var total = 0;
		//cartlist번호 값을 가진 input생성
		var str = "";
		for (var i = 0; i < totalCount; i++) {
			if ($("#chkBox" + i).is(":checked")) {
				var id = $('#id' + i).val();
				// 체크 될 때마다
				totalPrice = parseInt(totalPrice)
						+ parseInt($("#totalPrice" + i).val());
				salePrice = parseInt(salePrice)
						+ parseInt($("#salePrice" + i).val());
				str += "<input type='hidden' id='cartId' name='cartId' value='"+id+"'>";
			}
		}

		$("#totalPrice").html(totalPrice.toLocaleString());
		saleTotal = salePrice;
		$("#final_saleTotal").html(saleTotal.toLocaleString());
		total = totalPrice - saleTotal;
		$("#final_total").html(total.toLocaleString());
		$("#result_info_hidden").html(str);
	}

	if (link.match('cart')) { // url이 cart이면
		$("input[type=checkbox]").each(function() { //모든 체크박스 체크
			$(this).attr('checked', true);
		});

		// 체크된 항목 출력
		$("input[type=checkbox]").change(checked());
	}

	$(document)
			.ready(
					function() {
						$(".listBtn").click(function() {
							location.href = "/merchandise/list";
						});

						// 개별 삭제 버튼
						$(".delete")
								.click(
										function(e) {
											if (confirm("삭제하시겠습니까?")) {
												location.href = "/merchandise/delete?id=${row.id }";
											} else {
												e.preventDefault();
											}
										});

						$("input[type=checkbox]")
								.change(
										function() {
											//체크박수 갯수
											var totalCount = $('.chkBox').length;
											//가격총합
											var totalPrice = 0;
											//세일총합
											var salePrice = 0;
											//총가격(제품)
											var total = 0;
											//cartlist번호 값을 가진 input생성
											var str = "";
											for (var i = 0; i < totalCount; i++) {
												if ($("#chkBox" + i).is(
														":checked")) {
													var id = $('#id' + i).val();
													// 체크 될 때마다
													totalPrice = parseInt(totalPrice)
															+ parseInt($(
																	"#totalPrice"
																			+ i)
																	.val());
													salePrice = parseInt(salePrice)
															+ parseInt($(
																	"#salePrice"
																			+ i)
																	.val());
													str += "<input type='hidden' id='cartId' name='cartId' value='"+id+"'>";
												}
											}

											$("#totalPrice")
													.html(
															totalPrice
																	.toLocaleString());
											saleTotal = salePrice;
											$("#final_saleTotal").html(
													saleTotal.toLocaleString());
											total = totalPrice - saleTotal;
											$("#final_total").html(
													total.toLocaleString());
											$("#result_info_hidden").html(str);
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
						$(".deleteBtn")
								.click(
										function() {
											var confirm_val = confirm("삭제하시겠습니까?");

											// 확인 클릭 시 삭제
											if (confirm_val) {
												var checkArr = new Array();
												$(
														"input[class='chkBox']:checked")
														.each(
																function() {
																	checkArr
																			.push($(
																					this)
																					.attr(
																							"data-cartId"));
																});//종료 input선택자
												$
														.ajax({
															url : "/merchandise/delete",
															type : "post",
															data : {
																chkbox : checkArr
															},
															success : function(
																	result) {
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

						$(".orderBtn").click(
								function() {
									//alert("클릭");
									if ($('#cartId').val() != null) {
										$("#order_form").attr("action",
												"/order/orderForm");
										$("#order_form").submit();
									} else {
										alert("주문하실 상품을 선택해주세요.")
									}

								});

					});
</script>
</html>