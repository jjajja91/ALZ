<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정/삭제</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 편집</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form id="merchandiseEdit" name="merchandiseEdit"
						action="/merchandise/modify" method="post">
						<table border="">
							<tr>
								<td>상품 번호</td>
								<td><input type="text" id="id" name="id"
									value="${merchandise.id}" readonly="readonly"></td>
							</tr>
							<tr>
								<td>상품이미지</td>
								<td>이미지 <br> <input type="file" id="merchandiseImage"
									name="merchandiseImage">
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td><input type="text" id="name" name="name"
									value="${merchandise.name }"></td>
							</tr>
							<tr>
								<td>상품 유형</td>
								<td id="codeType"><input type="radio" name="codeType"
									value="클래스"
									<c:if test="${merchandise.codeType eq '클래스'}">checked</c:if>>
									클래스 <input type="radio" name="codeType" value="준비물"
									<c:if test="${merchandise.codeType eq '준비물'}">checked</c:if>>
									준비물</td>
							</tr>
							<tr>
								<td>상품 내용</td>
								<td><textarea id="description" name="description" row="5"
										cols="60">${merchandise.description }</textarea></td>
							</tr>

							<tr>
								<td>상품 마감일</td>
								<td><input type="text" id="closedAt" name="closedAt"
									value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${merchandise.closedAt }" />'></td>
							</tr>

							<tr>
								<td>가격</td>
								<td><input type="text" id="originPrice" name="originPrice"
									value='<fmt:formatNumber value="${merchandise.originPrice }" pattern="#,###"/>'></td>
							</tr>

							<tr>
								<td>할인금액</td>
								<td><input type="text" id="salePrice" name="salePrice"
									value='<fmt:formatNumber value="${merchandise.salePrice }" pattern="#,###"/>'></td>
							</tr>

							<tr>
								<td>할인율</td>
								<td><input type="text" id="discountRate"
									name="discountRate" value="${merchandise.discountRate }"></td>
							</tr>

							<tr>
								<td>할인 마감일</td>
								<td><input type="text" id="discountDeadline"
									name="discountDeadline"
									value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${merchandise.discountDeadline }" />'></td>
							</tr>

							<tr>
								<td>진열 상태</td>
								<td id="displayState"><input type="radio"
									name="displayState" value="1"
									<c:if test="${merchandise.displayState eq '1'}">checked</c:if>>
									진열 <input type="radio" name="displayState" value="0"
									<c:if test="${merchandise.displayState eq '0'}">checked</c:if>>
									미진열</td>

							</tr>

							<tr>
								<td>상품 대상 식별자</td>
								<td><input type="text" id="refId" name="refId"
									value="${merchandise.refId }"></td>
							</tr>

							<tr>
								<td>상품 식별자</td>
								<td><input type="text" id="merchandiseId"
									name="merchandiseId" value="${merchandise.merchandiseId }"></td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									<button type="submit" data-oper='modify'
										class="btn btn-default">수정</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
									<button type="submit" data-oper='list' class="btn btn-info">목록</button>
								</td>
							</tr>
						</table>

						<input type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum }"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount }"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>


					</form>
				</div>
				<!--  end panel-body -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				var formObj = $("form");

				$('button').on(
						"click",
						function(e) {

							e.preventDefault();

							var operation = $(this).data("oper");

							console.log(operation);

							if (operation === 'remove') {
								console.log("리무브");
								formObj.attr("action", "/merchandise/remove");
							} else if (operation === 'list') {
								formObj.attr("action", "/merchandise/list")
										.attr("method", "get");

								var pageNumTag = $("input[name='pageNum']")
										.clone();
								var amountTag = $("input[name='amount']")
										.clone();

								var typeTag = $("input[name='type']").clone();
								var keywordTag = $("input[name='keyword']")
										.clone();

								formObj.empty();

								formObj.append(pageNumTag);
								formObj.append(amountTag);
								formObj.append(typeTag);
								formObj.append(keywordTag);

							}
							formObj.submit();

						})

			})
</script>
</html>