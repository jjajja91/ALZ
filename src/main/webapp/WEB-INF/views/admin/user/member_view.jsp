<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 상세 페이지</title>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			// 확인 대화상자	
			if(confirm("수정하시겠습니까?")){
				document.form1.action = "${path}/admin/update";
				document.form1.submit();
			}
		});
	});
	/* $(document).ready(function(){
		$("#btnDelete").click(function(){
			// 확인 대화상자 
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "${path}/admin/delete";
				document.form1.submit();
			}
		});
	}); */
	$(function() {
		$("#adminHomeBtn").click(function() {
			location.href = '/admin/index';
		})
	})
</script>
</head>
<body>
	<h2>회원정보 상세</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>이메일</td>
				 <!-- id는 수정이 불가능하도록 readonly속성 추가 -->
				<td><input name="email" value="${dto.email}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input name="nickname" value="${dto.nickname}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<!-- 누락된 부분 -->
			<tr>
				<td>전화번호</td>
	            <td><input name="phoneNumber" id="phoneNumber" value="${dto.phoneNumber}" type="text" placeholder="'-'없이 번호만 입력하세요" maxlength="11" autocomplete="off"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" id="btnUpdate">
					<!-- <input type="button" value="삭제" id="btnDelete"> -->
					<button type="button" id=adminHomeBtn class="form-control btn btn-primary">관리자 홈으로</button><br><br>
					<div style="color: red;">${message}</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>