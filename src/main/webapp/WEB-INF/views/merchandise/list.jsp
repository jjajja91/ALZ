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

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					Board List Page
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
									href='<c:out value="${merchandise.id }"/>'><c:out
											value="${merchandise.name }" /></a><br> <!--  
					<button data-oper='modify' class="btn btn-default">상품 편집</button>
					<form id='operForm'  method="get">
						<input type='hidden' id='id' name='id' value="" >
					</form>
					--></td>
								<td><c:out value="${merchandise.originPrice }" /></td>
								<td><a class='modify'
									href='<c:out value="${merchandise.id }"/>'>상품 편집</a></td>
							</tr>
						</c:forEach>
					</table>

				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->

	

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
</body>

<form id='actionForm' action="/merchandise/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#regBtn').click(function() {
							location.href = "/merchandise/register";
						});

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
					});
</script>
</html>