<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/myPageNav.jsp"%>
<style>
.container {
	margin-top: 350px;
	min-height: 100%;
	position: relative;
	text-align: center;
}

p, label, input, button {
	font-size: 24px;
	margin: 10px 5px;
	vertical-align: middle;
	text-align: center;
}

input {
	width: 350px;
}

button {
	background-color: #335492;
	color: #ffffff;
	border-radius: 5px 5px;
	border: 1px solid #dddddd;
	font-size: 24px;
	padding: 1px 5px;
}
</style>


<body>
	<div class="container">
		<c:if test="${param.verify eq 'no'}">
			<input type="hidden" name="verify"
				value='<c:out value="${param.verify}"/>'>
			<p>탈퇴에 실패했습니다.</p>
			<p>비밀번호를 다시 입력해 주세요.</p>
		</c:if>
		<form role="form" action="/myPage/deleteAcc" method="post">
			<div>
				<label for="password">비밀번호</label> <input type="password"
					name="password" autocomplete="off" placeholder="password">
			</div>
			<div>
				<label for="description">탈퇴사유</label> <input type="text"
					id="description" name="description">
			</div>
			<div>
				<button class="del" type=submit>탈퇴하기</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".del")
									.click(
											function(e) {

												var delConfirm = confirm('정말로 탈퇴하시겠습니까?');

												if (delConfirm) {
													if (confirm('정말로요!?')) {
														if (confirm('한번만 더 생각해봐요!')) {
															if (confirm('진심이신가요!?')) {
																if (confirm('마지막으로 딱 한번만 더....')) {
																	if (confirm('제가 졌습니다.')) {
																		if (confirm('힝 속았지.')) {
																			if (confirm('좋은 수업 많은데...')) {
																				if (confirm('고생했어요 아디오스~')) {
																				} else {
																					e
																							.preventDefault();
																					self.location = "/myPage/boardList"
																					return;
																				}
																				e
																						.preventDefault();
																				self.location = "/myPage/boardList"
																				return;
																			}
																			e
																					.preventDefault();
																			self.location = "/myPage/boardList"
																			return;
																		}
																		e
																				.preventDefault();
																		self.location = "/myPage/boardList"
																		return;
																	}
																	e
																			.preventDefault();
																	self.location = "/myPage/boardList"
																	return;
																}
																e
																		.preventDefault();
																self.location = "/myPage/boardList"
																return;
															}
															e.preventDefault();
															self.location = "/myPage/boardList"
															return;
														}
														e.preventDefault();
														self.location = "/myPage/boardList"
														return;
													}
													e.preventDefault();
													self.location = "/myPage/boardList"
													return;
												} else {
													e.preventDefault();
													self.location = "/myPage/boardList"
													return;
												}

											});

						});
	</script>
</body>
</html>