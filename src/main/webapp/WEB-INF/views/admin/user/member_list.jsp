<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../includes/admin_header.jsp"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">
		<div class="container-fluid">
			<div class="card shadow mb-4">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<div>
								<br>회원 목록<br> <br>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>이메일</th>
											<th>닉네임</th>
											<th>권한</th>
											<th>전화번호</th>
											<th>회원 상태</th>
											<th>상태 시작일시</th>
											<th>상태 종료일시</th>
										</tr>
									</thead>
									<thead>
										<c:forEach var="row" items="${list}">
											<tr>
												<td>${row.email}</td>
												<!-- 회원정보 상세조회를 위해 a태그 추가 -->
												<td><a href="${path}/admin/view?email=${row.email}">${row.nickname}</a></td>
												<td>${row.role}</td>
												<td>${row.phoneNumber}</td>
												<td>${row.state}</td>
												<td>${row.startAt}</td>
												<td>${row.endAt}</td>
											</tr>
										</c:forEach>
									</thead>
								</table>
								<br>
								<button type="button" id=adminHomeBtn
									class="btn btn-primary btn-sm">관리자 홈으로</button>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(function() {
			$("#adminHomeBtn").click(function() {
				location.href = '/admin/index';
			})
		})
	</script>
	<%@include file="../../includes/admin_footer.jsp"%>