<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
 <%@include file="../../includes/myPageNav.jsp"%>

<div class="main">
		<sec:authentication var="principal" property="principal" />
		<h3>수정 정보 출력</h3>
		<form role='form' action="/users/Modify" method="post">
			<table>
				<tr>
					<td>EMAIL</td>
					<td>
 						<input type="text" id="email" name="email" value="${principal.username}" readonly="readonly">
					 </td>
				</tr>
				<tr>
					<td>NICKNAME</td>
					<td>
						<input type="text"  id="nickname" name="nickname" value="${principal.nickname}">
						<input type="hidden" id="originNickname" value="${principal.nickname}">
						<input type="hidden" id="originPhone" value="${principal.phoneNumber}">
						<input type="hidden" id="description" name="description" value="">
							<button id="nicknameChk">닉네임 중복확인</button>
					</td>
				
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<input type="password" id="password" name="password" value="">
					</td>
				</tr>
				<tr>
					<td>PHONENUMBER</td>
					<td>
						<input type="text" id="phoneNumber" name="phoneNumber" value="${principal.phoneNumber}">
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
			var $id = $("#id");
			var $email = $("#email");
	  		var $password = $("#password");
	  		var $nickname = $("#nickname");
	  		var $phoneNumber = $("#phoneNumber");
	  		var $nicknameChk = $("#nicknameChk");
	  		var $description = $("#description");
	  		var $originNickname = $("#originNickname");
	  		var $originPhone = $("#originPhone");
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
						description : $originNickname.val()+"/"+$nickname.val()+"/"+$originPhone.val()+"/"+$phoneNumber.val(),
						};
				 if(operation === 'update') {			
					UserUpdateApi(data) 
					.then(function(response){
						console.log(data);
						
					   self.location = "/callMypage";
					   alert("수정 완료!");
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
	               if($nickname.val()==$originNickname.val()){
	            	   alert("사용 가능한 닉네임입니다");
	            	   $nicknameChkResult.val("true");
	               } else if(response==true){
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

