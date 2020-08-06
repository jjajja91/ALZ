<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.thoughtworks.qdox.parser.ParseException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 회원정보에 없는 아이디를 입력할 시에 출력되는 경고창 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
</head>
<body>
	<center>
		<br> <br>
		<table border="1" width="500px" class="table-hover">
			<div class="card align-middle" style="width: 50rem; border-radius: 20px;">
				<div class="card-body">
					<span style="color: green; font-weight: bold;">회원 정보 검색</span> <br><br>
					<center>
						<!-- 회원의 아이디를 입력하면 해당 회원에 정보가 하단에 출력되게 함 -->
						<form action="find_member" method="post">
							<span style="color: black; font-weight: bold;">회원 아이디</span> <br><br>
							<input type="text" name="email" placeholder="이메일을 입력하세요." class="form-control"><br><br>
							<button type="submit" name="submit" class="form-control btn btn-primary">확인</button><br><br>
							<button type="button" id=adminHomeBtn class="form-control btn btn-primary">관리자 홈으로</button><br><br>
						</form>
					</center>
				</div>
			</div>
		</table>
	</center>


	<c:if test="${map.list != null}">
		<center>
			<span style="color: green; font-weight: bold;">해당하는 회원 정보</span> <br><br>
			<table border="1" width="500px" class="table-hover">
				<div class="card align-middle" style="width: 50rem; border-radius: 20px;">
					<div class="card-body">
						<div style="text-align: center;">
							<center>
								<c:forEach var="member" items="${map.list}">
									<!-- 컨트롤러에서 넘어온 map의 값 -->
									<span style="color: black; font-weight: bold;">아이디 :</span>
									<span style="color: red; font-weight: bold;">${member.email}</span><br><br>

									<span style="color: black; font-weight: bold;">이메일 :</span>
									<span style="color: red; font-weight: bold;">${member.nickname}</span><br><br>

									<span style="color: black; font-weight: bold;">전화번호 :</span>
									<span style="color: red; font-weight: bold;">${member.phoneNumber}</span><br><br>
								</c:forEach>
							</center>
						</div>
					</div>
				</div>
			</table>
		</center>
	</c:if>
</body>
</html>