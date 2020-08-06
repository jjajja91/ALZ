<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/admin_header.jsp"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-2 text-gray-800">주문 통합 리스트</h1>
				<a href="#"
					class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
					data-toggle="modal" data-target="#logoutModal"><i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Log
					out</a>
			</div>
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">주문 검색</h6>
				</div>
				<div class="card shadow mb-4">

					<div class="card-body">
						<div class="table-responsive">
							<form>
								<table class="table table-bordered" id="search" width="100%"
									cellspacing="0">
									<tbody>
										<tr>
											<th>검색어</th>
											<td colspan="3">
												<div class="form-inline">
													<select class="form controll" id="key" name="key">
														<option value="orderNo">주문번호</option>
														<option value="orderer">주문자명</option>
														<option value="orderPhone">주문자 휴대폰번호</option>
														<option value="orderName">상품명</option>
													</select>
													<p>&nbsp;</p>
													<input type="text" name="keyword" value="">
												</div>
											</td>
										</tr>
										<tr>
											<th>기간 검색</th>
											<td colspan="3">
												<div class="form-inline">
													<div class="input-group js-datepicker">
														<input type="date" name="treatDate[]" value="2020-07-31"
															class="form-control width-xs"> <span
															class="input-group-addon"> <span
															class="btn-icon-calendar"> </span>
														</span>
													</div>
													~
													<div class="input-group js-datepicker">
														<input type="date" name="treatDate[]" value="2020-08-06"
															class="form-control width-xs"> <span
															class="input-group-addon"> <span
															class="btn-icon-calendar"> </span>
														</span>
													</div>
													<div class="btn-group js-dateperiod" data-toggle="buttons"
														data-target-name="treatDate[]">
														<label class="btn btn-white btn-sm hand"><input
															type="radio" name="searchPeriod" value="0">오늘</label><label
															class="btn btn-white btn-sm hand active"><input
															type="radio" name="searchPeriod" value="6">7일</label><label
															class="btn btn-white btn-sm hand"><input
															type="radio" name="searchPeriod" value="14">15일</label><label
															class="btn btn-white btn-sm hand"><input
															type="radio" name="searchPeriod" value="29">1개월</label><label
															class="btn btn-white btn-sm hand "><input
															type="radio" name="searchPeriod" value="89">3개월</label><label
															class="btn btn-white btn-sm hand "><input
															type="radio" name="searchPeriod" value="364">1년</label>
													</div>

												</div>
											</td>
										</tr>

									</tbody>
								</table>
								<div class="text-center my-auto">
									<button type="submit" class="btn btn-outline-primary">검
										색</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="card-body">
					<div class="table-responsive">

						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkAll"></th>
									<th>번호</th>
									<th>주문 일시</th>
									<th>주문 번호</th>
									<th>주문자</th>
									<th>주문 상품</th>
									<th>결제 금액</th>
									<th>결제 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="order">
									<tr>
										<td><input type="checkbox" class="checkEach"></td>
										<td><c:out value="${order.no}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${order.orderAt}" /></td>
										<td><a
											href='/admin/order/orderDetail?id=<c:out value="${order.id}" />'>
												<c:out value="${order.id}" />
										</a></td>
										<td><c:out value="${order.name}" /></td>
										<td>
											<!-- 단독 구매 시 "상품명" / 2개 이상일 시 수량 표시 --> <c:choose>
												<c:when test="${order.count == 1}">
													<c:out value="${order.merchandiseName}" />
												</c:when>
												<c:otherwise>
													<c:out value="${order.merchandiseName}" /> 외 <c:out
														value="${order.count-1}" />건
														</c:otherwise>
											</c:choose>
										</td>
										<td><c:out value="${order.totalPrice}" /></td>
										<td><c:out value="${order.state}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
	<script>
		$(document).ready(function() {
			// 체크박스 전체 체크 하기
			$("#checkAll").click(function() {
				var check = $('#checkAll').prop("checked");
				if (check) {
					$(".checkEach").prop("checked", true);
				} else {
					$(".checkEach").prop("checked", false);
				}
			});

			// 개별 체크 해제 시 전체 체크 해제
			$(".checkEach").click(function() {
				$("#checkAll").prop("checked", false);
			});
		});
	</script>

	<%@include file="../../includes/admin_footer.jsp"%>