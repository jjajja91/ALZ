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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Page
					<form id='cartForm' action="/merchandise/cart" method='get'>
						<input type="hidden" id="userId" name="userId" value="${principal.id }">
						<button id='cartBtn' class="btn btn-xs pull-right">장바구니</button>
					</form>
					<button id='regBtn' type="button" class="btn btn-xs pull-right">상품
						등록</button>
				</div>

				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#상품번호</th>
								<th>상품 유형</th>
								<th>상품명</th>
								<th>상품 가격</th>
								<th>상품 편집</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="merchandise">
							<tr>
								<td><c:out value="${merchandise.id }" /></td>
								<td><c:out value="${merchandise.codeType }" /></td>
								<td><a class='move'
									href='<c:out value="${merchandise.id }"/>'>
								<c:out value="${merchandise.name }" /></a><br> 
								</td>
								<td><fmt:formatNumber value="${merchandise.salePrice}" pattern="#,###"/></td>
								<td><a class='modify'
									href='<c:out value="${merchandise.id }"/>'>상품 편집</a></td>
							</tr>
						</c:forEach>
					</table>

					<!-- 검색창 -->
					<div class='row'>
						<div class="col-lg-12">

							<form id='searchForm' action="/merchandise/list" method='get'>
								<select name='type'>
									<option value=""
										<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>검색</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>타입</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품명</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>내용</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>타입
										or 상품명</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>타입
										or 내용</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>타입
										or 상품명 or 내용</option>
								</select> <input type='text' name='keyword'
									value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
									type='hidden' name='pageNum'
									value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
									type='hidden' name='amount'
									value='<c:out value="${pageMaker.cri.amount}"/>' />
								<button class='btn btn-default'>Search</button>
							</form>
						</div>
					</div>

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->


	<!-- 페이징 -->
	<div class='pull-right'>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" :"" }"><a
					href="${num}">${num}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>

		</ul>
	</div>

	<form id='actionForm' action="/merchandise/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	</form>

</body>

<form id='actionForm' action="/merchandise/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type'
		value='<c:out value="${ pageMaker.cri.type }"/>'> <input
		type='hidden' name='keyword'
		value='<c:out value="${ pageMaker.cri.keyword }"/>'>
</form>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#regBtn').click(function() {
							location.href = "/merchandise/register";
						});

						/* $('#cartBtn').click(function() {
							location.href = "/merchandise/cart";
						}); */

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log('click');
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='id' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/merchandise/get");
											actionForm.submit();

										});

						$(".modify")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='id' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/merchandise/modify");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});
					});
</script>
</html>