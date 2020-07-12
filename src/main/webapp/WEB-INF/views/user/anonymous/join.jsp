<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
</head>
<body>
		<h3>회원가입</h3>

		<form action="create" id="joinForm" method="post">
			<table>
				<!-- 
			<tr>
               <td>ID</td>
               <td>
                  <input name="id" placeholder="Id" maxlength="10" autocomplete="off">
                </td>
            </tr> 
            -->
			<tr>
				<td>EMAIL</td>
				<td><input name="email" id="email" type="text" placeholder="6~12자리 이내의 영어와 숫자" autocomplete="off">
				</td>
				<td><button id="emailChk">이메일 중복 체크</button></td>
			</tr>
			<tr>
				<td>NICKNAME</td>
				<td><input name="nickname" id="nickname" placeholder="6~12자리 이내의 한글"
					maxlength="10" autocomplete="off"></td>
					<td><button id="nicknameChk">닉네임 중복 체크</button></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="password" type="password" placeholder="6~12자리 이내의 숫자" maxlength="10" autocomplete="off">
				</td>
			</tr>
			<!--             
			<tr>
               <td>PW확인</td>
               <td>
                  <input name="memberPwChk" type="password" placeholder="Pw확인" maxlength="10" autocomplete="off">
               </td>
            </tr> 
            -->
			<!-- 
			<tr>
               <td>INTRODUCE</td>
               <td>
                  <input name="introduce" type="text" placeholder="Introduce" maxlength="10" autocomplete="off">
               </td>
            </tr> 
            -->

			<tr>
				<td align="center">
					<input type="submit" id="joinSubmit" value="Join"> 
					<input type="reset" value="Cancel">
				</td>
			</tr>
			</table>
		</form>
				<input type="hidden" id="emailChkResult" value="false"/>
				<input type="hidden" id="nicknameChkResult" value="false"/>
		
		<hr>
		
		<a href="/">메인 페이지 이동</a>
		
		<script>
			$emailChk = $("#emailChk");
			$nicknameChk = $("#nicknameChk");
			$email = $("#email");
			$nickname = $("#nickname");
			$emailChkResult = $("#emailChkResult");
			$nicknameChkResult = $("#nicknameChkResult");
			$joinSubmit = $("#joinSubmit");
			$joinForm = $("#joinForm");
			
			$emailChk.click(function(e){
				e.preventDefault();
				emailChk()
				.then(function(response){
					console.log(response);
				})
				.catch(function(error){
					console.log(error);
				});
			});
			
			$nicknameChk.click(function(e){
				e.preventDefault();
				nicknameChk()
				.then(function(response){
					console.log(response);
					if(response.nickname==$nickname.val()){
						alert("중복된 닉네임이 있습니다");
					} else {
						alert("사용 가능한 닉네임입니다");
						$nicknameChkResult.val("true");
					}
				})
				.catch(function(error){
					console.log(error);
				});
			});
			
			function emailChk(){
				return $.ajax({
					url: 'users/emailChk/'+$email.val(),
					type: 'GET',
					contentType : "application/json; charset=utf-8"
				});
			};
			
			function nicknameChk(){
				return $.ajax({
					url: 'users/nicknameChk/'+$nickname.val(),
					type: 'GET',
					contentType : "application/json; charset=utf-8"
				});
			};
			
			$joinSubmit.click(function(e){
				e.preventDefault();
				if($emailChkResult.val()=="false"){
					alert("이메일 중복체크를 해주세요");
				} else if ($nicknameChkResult.val()=="false"){
					alert("닉네임 중복체크를 해주세요");
				} else {
					joinForm.submit();
				}
			})
			
		</script>
</body>
</html>