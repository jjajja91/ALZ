<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="576736845363-o0474pib5q69qlcv6lm7o42hs6lu5u59.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<%@include file="../../includes/admin_header.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">
		<div class="container-fluid">
			<br> <br>
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-2 text-gray-800">회원 상태 변경</h1>
			</div>
			<div class="card shadow mb-4">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<div>
								<center>
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<div class="card align-middle"
											style="width: 40rem; border-radius: 20px;">
											<div class="card-body">
												<br>
												<center>
													<center>
														<form name="form" method="post">
															<center>
																<span style="color: black; font-weight: bold;">회원
																	이메일</span><br> <br> <input type="text" name="email"
																	style="width: 300px;"
																	placeholder="상태 혹은 권한을 변환 시킬 회원의 이메일 입력 "
																	class="form-control"> <br> <br> <input
																	type="button" value="탈퇴" id="btnDropOut"> <input
																	type="button" value="정지" id="btnSuspended"> <input
																	type="button" value="휴면" id="btnInactive"> <input
																	type="button" value="일반상태" id="btnBackNormal"><br>
																<br> <input type="button" value="일반계정"
																	id="btnAsUser"> <input type="button"
																	value="관리자계정" id="btnAsManager"><br> <br>
																<br>
																<button type="button" id=adminHomeBtn
																	class="btn btn-primary btn-sm">관리자 홈으로</button>
																<br> <br> <br>
															</center>
														</form>
													</center>
												</center>
											</div>
										</div>
									</table>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
	<script>
		$(document).ready(function() {
			$("#btnDropOut").click(function() {
				// 확인 대화상자	
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else if (confirm("해당 계정을 탈퇴 시키겠습니까?")) {
					document.form.action = "${path}/admin/dropOut";
					document.form.submit();

				}
			});
			$("#btnSuspended").click(function() {
				// 확인 대화상자
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else {
					if (confirm("해당 계정을 정지 시키겠습니까?")) {
						document.form.action = "${path}/admin/suspended";
						document.form.submit();
					}
				}
			});
			$("#btnInactive").click(function() {
				// 확인 대화상자	
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else {
					if (confirm("해당 계정을 휴면전환 시키겠습니까?")) {
						document.form.action = "${path}/admin/inactive";
						document.form.submit();
					}
				}
			});
			$("#btnBackNormal").click(function() {
				// 확인 대화상자	
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else {
					if (confirm("해당 계정을 일반상태로 전환 시키겠습니까?")) {
						document.form.action = "${path}/admin/backNormal";
						document.form.submit();
					}
				}
			});
			$("#btnAsUser").click(function() {
				// 확인 대화상자	
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else {
					if (confirm("해당 계정을 일반 계정으로 전환 시키겠습니까?")) {
						document.form.action = "${path}/admin/asUser";
						document.form.submit();
					}
				}
			});
			$("#btnAsManager").click(function() {
				// 확인 대화상자	
				if (document.form[0].value == "") {
					alert("이메일을 입력해주세요");
				} else {
					if (confirm("해당 계정을 관리자 계정으로 전환 시키겠습니까?")) {
						document.form.action = "${path}/admin/asManager";
						document.form.submit();
					}
				}
			});
		});
		$(function() {
			$("#adminHomeBtn").click(function() {
				location.href = '/admin/index';
			})
		})
	</script>
	<%@include file="../../includes/admin_footer.jsp"%>