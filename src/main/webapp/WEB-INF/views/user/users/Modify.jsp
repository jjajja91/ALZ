<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="resources/css/common.css" /> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>


<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  width: 150px;
  position: fixed;
  z-index: 1;
  top: 20px;
  left: 10px;
  background: #eee;
  overflow-x: hidden;
  padding: 8px 0;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 15px;
  color: #2196F3;
  display: block;
}

.sidenav a:hover {
  color: #064579;
}

.main {
  margin-left: 140px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 13px;}
}
</style>
</head>
<body>

<div class="sidenav">
  <lable>결제 내역</lable>
  <a href="#about">진행 중인 클래스</a>
  <a href="#services">완료된 클래스</a>
  <a href="#clients">취소/환불</a>
  
    <lable>관심 클래스</lable>
  <a href="#about">찜 클래스</a>
  <a href="#services">좋아요 클래스</a>

  
    <lable>내가 쓴 글</lable>
  <a href="/board/list">내 게시글</a>
  <a href="#services">내 댓글</a>
  <a href="#clients">내 좋아요</a>
  
    <lable>내 정보 수정</lable>
  <a href="/callModify">개인 정보 수정</a>
  <a href="#services">회원 탈퇴</a>
 
</div>
<div class="main">
		<h3>수정 정보 출력</h3>
		<form role='form' action="/users/Modify" method="post">
			<table>
				<tr>
					<td>EMAIL</td>
					<td>
 						<input type="text" id="email" name="email" value="${sessionUser.email}" readonly="readonly">
					 </td>
				</tr>
				<tr>
					<td>NICKNAME</td>
					<td>
						<input type="text"  id="nickname" name="nickname" value="${sessionUser.nickname}">
							<button id="nicknameChk">닉네임 중복확인</button>
					</td>
				
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<input type="password" id="password" name="password" value="${sessionUser.password}">
					</td>
				</tr>
				<tr>
					<td>PHONENUMBER</td>
					<td>
						<input type="text" id="phoneNumber" name="phoneNumber" value="${sessionUser.phoneNumber}">
						<button>실명인증</button>
					</td>
				</tr>
				<%-- <tr>
					<td>PW확인</td>
					<td>
						<input type="text" name="memberPwChk" value="${sessionMember.memberPwChk}">
					</td>
				</tr> --%>
				<tr>
					<td colspan="2">
						<button type="submit" data-oper='update' class="btn btn-default">수정</button>
						<button type="submit" data-oper='cancle' class="btn btn-default">취소</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
		<hr>
		
		<a href="/">메인 페이지 이동</a>	<br>
		
		
		<script type="text/javascript">
		$(document).ready(function() {
			var $email = $("#email");
	  		var $password = $("#password");
	  		var $nickname = $("#nickname");
	  		var $phoneNumber = $("#phoneNumber");
	  		var $nicknameChk = $("#nicknameChk");
	  	  var $nicknameChkResult = $("#nicknameChkResult");
	  	 $nickname.change(function(){
	            $nicknameChkResult.val("false");
	         });
	  	 
			//정보 수정 함수
			function UserUpdateApi(data) {
				console.log(data);
					  return $.ajax({
		  		    url: "/users/",
		  		    type: "PUT",
		  		    data: JSON.stringify(data),
		  		    contentType: "application/json",
		  		  });
		  		}
			var formObj = $("form[role='form']");
		
			$('button[type=submit]').on("click", function(e) {
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
		  		var data = {
		  				email: $email.val(),
						nickname: $nickname.val(),
						password : $password.val(),
						phoneNumber :$phoneNumber.val(),
						};
				 if(operation === 'update') {			
					UserUpdateApi(data) 
					.then(function(response){
						console.log(data);
					   self.location = "/callMypage";
					})			
				} 
				 else if(operation === 'cancle'){
					 alert()
				 } 
			 
		});
			   
	         function nicknameChk(){
	            return $.ajax({
	               url: 'users/nicknameChk/'+$nickname.val(),
	               type: 'GET',
	               contentType : "application/json; charset=utf-8"
	            });
	         };
			
	         
	         $nicknameChk.click(function(e){
	            e.preventDefault();
	           if($nickname.val()==null || $nickname.val().trim()==""){
	               alert("닉네임이 비어있습니다");
	            } else if($nickname.val().length > 16) {
	               alert("닉네임을 16자 이내로 적어주세요");
	            } else {
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
	            } 
	            });
	         
			
			
			
			
			
		});
		</script>
</body>
</html>

