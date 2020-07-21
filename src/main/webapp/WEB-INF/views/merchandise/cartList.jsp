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
			<form name="cartForm" id="cartForm" action="/cart/update"
				method="post">
				<table border="1">
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck">
						</th>
						<th>상품명</th>
						<th>금액</th>
						<th></th>
					</tr>
					<c:forEach var="row" items="${map.list}">
						<tr>
							<td><input type="checkbox" id="chkBox" name="chkBox"
								class="chkBox" data-cartId="${row.id }"> <input
								type="hidden" id="id" name="id" value="${row.id }"></td>
							<td>${row.name }</td>
							<td>${row.originPrice }</td>
							<td><a class="delete"
								href="/merchandise/delete?id=${row.id }">X</a></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">장바구니 금액 합계 : ${map.sumMoney}<br>
							전체 주문금액 : ${map.allSum}
						</td>
					</tr>
				</table>
				<input type="hidden" name="count" value="${row.merchandiseId}">
			</form>
		</c:otherwise>
	</c:choose>


	<button class="deleteBtn">선택 삭제</button>
	<button class="listBtn">상품 목록</button>
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