<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.thoughtworks.qdox.parser.ParseException"%>
<%@include file="../../includes/admin_header.jsp"%>
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">
		<div class="container-fluid">
			<br> <br>
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-2 text-gray-800">회원 정보 검색</h1>
			</div>
			<div class="card shadow mb-4">
				<div class="card shadow mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<div>
								<center>
									<br> <br>
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<center>
											<!-- 회원의 아이디를 입력하면 해당 회원에 정보가 하단에 출력되게 함 -->
											<form action="find_member" method="post">
												<span style="color: black; font-weight: bold;"><h3>회원
														정보</h3></span> <br> <br>
												<div class="col-lg-3">
													<input type="text" name="email" placeholder="이메일을 입력하세요."
														class="form-control"><br>
												</div>
												<button type="submit" name="submit"
													class="btn btn-primary btn-sm">확인</button>
												&nbsp;&nbsp;
												<button type="button" id=adminHomeBtn
													class="btn btn-primary btn-sm">관리자 홈으로</button>
												<br> <br>
											</form>
										</center>
									</table>
								</center>


								<c:if test="${map.list != null}">
									<center>
										<span style="color: black; font-weight: bold;">해당하는 회원
											정보</span> <br> <br>
										<table border="1" width="500px" class="table-hover">
											<div class="card align-middle"
												style="width: 50rem; border-radius: 20px;">
												<div class="card-body">
													<div style="text-align: center;">
														<center>
															<c:forEach var="member" items="${map.list}">
																<!-- 컨트롤러에서 넘어온 map의 값 -->
																<span style="color: black; font-weight: bold;">이메일
																	:</span>
																<span style="color: blue; font-weight: bold;">${member.email}</span>
																<br>
																<br>

																<span style="color: black; font-weight: bold;">닉네임
																	:</span>
																<span style="color: blue; font-weight: bold;">${member.nickname}</span>
																<br>
																<br>

																<span style="color: black; font-weight: bold;">전화번호
																	:</span>
																<span style="color: blue; font-weight: bold;">${member.phoneNumber}</span>
																<br>
																<br>
															</c:forEach>
														</center>
													</div>
												</div>
											</div>
										</table>
									</center>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원정보에 없는 아이디를 입력할 시에 출력되는 경고창 -->
	<script>
		$(function() {
			var responseMessage = "<c:out value="${message}" />";
			if (responseMessage != "") {
				alert(responseMessage)
			}
		})

		$(function() {
			$("#adminHomeBtn").click(function() {
				location.href = '/admin/index';
			})
		})
	</script>
	<%@include file="../../includes/admin_footer.jsp"%>