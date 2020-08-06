<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="576736845363-o0474pib5q69qlcv6lm7o42hs6lu5u59.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<!-- 로그인 실패나 성공시 메시지를 받아서 출력하는 자바스크립트 구문 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function() {
	$("#adminHomeBtn").click(function() {
		location.href = '/admin/index';
	})
})
</script>
</head>
<br><br>
	<center>
		<table border="1" width="500px" class="table-hover">
			<div class="card align-middle" style="width: 40rem; border-radius: 20px;">
				<div class="card-body"><br>
					<center>
						<span style="color: green; font-weight: bold;">회원 강제 탈퇴</span> <br><br>
						<center>
							<form action="admin_member_forced_eviction" method="post">
								<center>
									<span style="color: black; font-weight: bold;">회원 아이디</span><br><br> 
									<input type="text" name="email" placeholder="탈퇴시킬 회원의 이메일을 입력 " class="form-control"> <br><br>
									<button type="submit" name="submit" class="form-control btn btn-success">회원 탈퇴</button><br> <br> <br>
									<button type="button" id=adminHomeBtn class="form-control btn btn-primary">관리자 홈으로</button><br><br> <br>
								</center>
							</form>
						</center>
					</center>
				</div>
			</div>
		</table>
	</center>
</body>
</html>