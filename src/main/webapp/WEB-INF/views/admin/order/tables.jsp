<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="/resources/vendor/datatables/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">ALZ Admin</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>


			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-user"></i> <span>회원 관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Components:</h6>
						<a class="collapse-item" href="buttons.html">Buttons</a> <a
							class="collapse-item" href="cards.html">Cards</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-shopping-cart"></i> <span>주문 관리</span>
			</a>
				<div id="collapseUtilities" class="collapse show"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">관리 메뉴</h6>
						<a class="collapse-item active" href="/admin/order/orderMain">주문
							통합 리스트</a> <a class="collapse-item" href="/admin/order/orderCanceled">주문
							취소 리스트</a>
						<!--  <a class="collapse-item" href="utilities-animation.html">메뉴3</a>
            <a class="collapse-item" href="utilities-other.html">메뉴4</a> -->
					</div>
				</div></li>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-play-circle"></i> <span>클래스 관리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>차트</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-2 text-gray-800">주문 통합 리스트</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
							data-toggle="modal" data-target="#logoutModal"><i
							class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							Log out</a>
					</div>
					
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">주문 검색</h6>
						</div>
						<div class="card shadow mb-4">

							<div class="card-body">
								<div class="table-responsive">
									<form>
										<table class="table table-bordered" id="search"
											width="100%" cellspacing="0">
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
															<div class="btn-group js-dateperiod"
																data-toggle="buttons" data-target-name="treatDate[]">
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
						</div>
					
					
					
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
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
												<td><c:out value="${order.rownum}" /></td>
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

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/datatables-demo.js"></script>

</body>

</html>
