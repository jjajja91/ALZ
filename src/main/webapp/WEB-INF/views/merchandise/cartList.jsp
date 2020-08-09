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
<title>상품 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<sec:authentication var="principal" property="principal" />
	<h2>장바구니</h2>
	<c:choose>
		<c:when test="${map.count == 0}">
			<div>장바구니가 비어있습니다.</div>
		</c:when>
		<c:otherwise>
		${principal.nickname}님의 장바구니
				<table border="1">
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
						<td><fmt:formatNumber value="${row.salePrice }" pattern="#,###" /> 원<br><del><fmt:formatNumber value="${row.originPrice }" pattern="#,###" /> 원</del></td>
						<td><a class="delete" href="/merchandise/delete?id=${row.id }">X</a></td>
					</tr>

					<input type="hidden" id="totalPrice${i}" value="${row.originPrice }">
					<input type="hidden" id="salePrice${i}" value="${row.originPrice - row.salePrice }">

					<c:set var="i" value="${i+1}"></c:set>
					<c:set var="totalPrice" value="${totalPrice + row.salePrice}" />
					<c:set var="salePrice" value="${salePrice + row.originPrice - row.salePrice}" />

				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>

	<br>
	<button class="deleteBtn">선택 삭제</button>
	<button class="listBtn">상품 목록</button>
	<br>
	
	<form id="order_form" method="post">
		<div id="result_info_hidden"></div>
		<table width=80% class="list_view" style="background: #cacaff">
			<thead>
				<!-- 상품리스트 부분 -->
				<tr align=center class="fixed">
					<td>상품금액</td>
					<td></td>
					<td>총 할인 금액</td>
					<td></td>
					<td>최종 결제금액</td>
				</tr>
			</thead>
			<tbody>
				<!-- 장바구니 금액 출력 부분 -->
				<tr cellpadding=40 align=center>
					<td id="result_info_price">
						<h1><span id="totalPrice"></span> 원</h1>
					</td>
					<td><img width="25" alt="" src="/resources/img/minus.jpg"></td>
					<td><h1><span id="final_saleTotal"></span> 원</h1></td>
					<td><img width="25" alt="" src="/resources/img/equal.jpg"></td>
					<td id="result_info_total">
						<h1><span id="final_total"></span> 원</h1>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<br>
	<div id="nav_main_1_result_btn">
		<button class="orderBtn"><strong>주문하기</strong>	</button>
	</div>
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
		total = totalPrice-saleTotal;
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

			$("input[type=checkbox]").change(function() {
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
				total = totalPrice-saleTotal;
				$("#final_total").html(total.toLocaleString());
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
			$(".deleteBtn").click(function() {
				var confirm_val = confirm("삭제하시겠습니까?");

				// 확인 클릭 시 삭제
				if (confirm_val) {
					var checkArr = new Array();
					$("input[class='chkBox']:checked").each(
						function() {
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

			$(".orderBtn").click(function() {
					//alert("클릭");
					if ($('#cartId').val() != null) {
						$("#order_form").attr("action","/order/orderForm");
						$("#order_form").submit();
					} else {
						alert("주문하실 상품을 선택해주세요.")
					}

			});

	});
</script>
</html>