<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
    <sec:authentication var="principal" property="principal" />
   <a href="/myPage/boardList?writerId=${principal.id}">내 게시글</a>
  <a href="/myPage/commentList?writerId=${principal.id}">내 댓글</a>
  <a href="/myPage/likeList?writerId=${principal.id}">내 좋아요</a>
  
    <lable>내 정보 수정</lable>
  <a href="/myPage/modifyAcc">개인 정보 수정</a>
  <a href="/myPage/deleteAcc">회원 탈퇴</a>
 
</div>