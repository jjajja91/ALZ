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
								<h2>회원정보 상세</h2>
								<form name="form" method="post">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<td>이메일</td>
												<!-- id는 수정이 불가능하도록 readonly속성 추가 -->
												<td>
													<div class="col-lg-5">
														<input name="email" value="${dto.email}"
															readonly="readonly">
													</div>
												</td>
											</tr>
										</thead>
										<thead>
											<tr>
												<td>닉네임</td>
												<td>
													<div class="col-lg-3">
														<input name="nickname" value="${dto.nickname}">
													</div>
												</td>
											</tr>
										</thead>
										<thead>
											<tr>
												<td>비밀번호</td>
												<td>
													<div class="col-lg-3">
														<input type="password" name="password">
													</div>
												</td>
											</tr>
											<!-- 누락된 부분 -->
										</thead>
										<thead>
											<tr>
												<td>전화번호</td>
												<td>
													<div class="col-lg-3">
														<input name="phoneNumber" id="phoneNumber"
															value="${dto.phoneNumber}" type="text"
															placeholder="'-'없이 번호만 입력하세요" maxlength="11"
															autocomplete="off">
													</div>
												</td>
											</tr>
										</thead>
										<thead>
											<tr>
												<td colspan="2" align="center"><input type="button"
													value="수정" id="btnUpdate"> <!-- <input type="button" value="삭제" id="btnDelete"> -->
													<button type="button" id=adminListBtn
														class="btn btn-primary btn-sm">회원 목록</button> <br> <br>
													<br>
													<button type="button" id=adminHomeBtn
														class="btn btn-primary btn-sm">관리자 홈으로</button> <br>
													<br> <%-- <div style="color: red;">${message}</div> --%>
												</td>
											</tr>
										</thead>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자	
				if (confirm("수정하시겠습니까?")) {
					document.form.action = "${path}/admin/update";
					document.form.submit();
				}
			});
		});
		/* $(document).ready(function(){
			$("#btnDelete").click(function(){
				// 확인 대화상자 
				if(confirm("삭제하시겠습니까?")){
					document.form.action = "${path}/admin/delete";
					document.form.submit();
				}
			});
		}); */
		$(function() {
			var responseMessage = "<c:out value="${message}" />";
			if (responseMessage != "") {
				alert(responseMessage)
			}
		})
		$(function() {
			$("#adminListBtn").click(function() {
				location.href = '/admin/list';
			})
		})
		$(function() {
			$("#adminHomeBtn").click(function() {
				location.href = '/admin/index';
			})
		})
	</script>
	<%@include file="../../includes/admin_footer.jsp"%>