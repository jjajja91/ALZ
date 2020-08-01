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
            <td><input name="email" id="email" type="text" value="${email}" readonly>
            </td>
         </tr>
         <tr>
            <td>NICKNAME</td>
            <td><input name="nickname" id="nickname" placeholder="nickname"
               maxlength="10" autocomplete="off"></td>
               <td><button id="nicknameChk">닉네임 중복 체크</button></td>
         </tr>
         <tr>
            <td>PHONE_NUMBER('-' 없이 번호만 입력해주세요)</td>
            <td><input name="phoneNumber" id="phoneNumber" type="text" placeholder="Phone Number" maxlength="11" autocomplete="off">
            </td>
         </tr>

         <tr>
            <td align="center">
      			<input name="password" type="hidden" value="${id}" readonly>
               <input type="submit" id="joinSubmit" value="Join"> 
               <input type="reset" value="Cancel">
            </td>
         </tr>
         </table>
      </form>
            <input type="hidden" id="nicknameChkResult" value="false"/>
      
      <hr>
      
      <a href="/">메인 페이지 이동</a>
      
      <script>
         var $nicknameChk = $("#nicknameChk");
         var $nickname = $("#nickname");
         var $nicknameChkResult = $("#nicknameChkResult");
         var $joinSubmit = $("#joinSubmit");
         var $joinForm = $("#joinForm");

         
         $nickname.change(function(){
            $nicknameChkResult.val("false");
         });
         
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
         
         
         function nicknameChk(){
            return $.ajax({
               url: 'users/nicknameChk/'+$nickname.val(),
               type: 'GET',
               contentType : "application/json; charset=utf-8"
            });
         };
         
         $joinSubmit.click(function(e){
            e.preventDefault();
            if($nickname.val()==null || $nickname.val().trim()==""){
               alert("닉네임이 비어있습니다");
            } else if($nickname.val().length > 16) {
               alert("닉네임을 16자 이내로 적어주세요");
            } else if ($nicknameChkResult.val()=="false"){
               alert("닉네임 중복체크를 해주세요");
            } else {
               joinForm.submit();
            }
         })
         
      </script>
</body>
</html>