<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.choice {
	color: #dba531;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: #43516c;
}

body {
	text-align: center;
	font-family: 'GmarketSansMedium';
}

.head {
	height: 120px;
	position: relative;
}

.logo {
	position: absolute;
	top: 10px;
	left: 20px;
	padding: 0px;
	width: 220px;
	height: 100px;
}

.logo a img {
	width: 100%;
}

.nav {
	height: 50px;
	position: sticky;
	top: 0px;
	background-color: white;
	border-bottom: 2px solid #05659e;
	z-index: 1;
	display: flex;
	justify-content: space-between;
}

.menu {
	list-style: none;
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
	width: 700px;
	height: 100%;
}

.menu li {
	flex: 1;
	align-items: center;
	position: relative;
	font-size: 22px;
}

.menu1 a span {
	line-height: 100%;
	text-align: center;
}

.sub {
	list-style: none;
	position: absolute;
	top: 38px;
	margin-top: 0;
	width: 100%;
	left: 0;
	display: none;
	background: #fff;
	text-align: center;
	padding-bottom: 10px;
}

.sub li {
	margin-top: 10px;
}

.sub li a {
	font-size: 20px;
}

.info {
	margin: 0;
	padding: 0;
	list-style: none;
	right: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
	width: 400px;
}

.info li {
	flex: 1;
	align-items: center;
	position: relative;
	font-size: 22px;
}

.info2 {
	position: relative;
	width: 300px;
}

.info2 ul {
	top: 27px;
	padding-bottom: 10px;
}

.slide {
	margin: 0;
	height: 500px;
	position: relative;
}

#slide1 {
	background-color: #f16856;
	height: 500px;
}

#slide2 {
	background-color: #dba531;
	height: 500px;
	display: none;
}

#slide3 {
	background-color: #05659e;
	height: 500px;
	display: none;
}

#slide1 a img {
	width: 100%;
	height: 500px;
}

#myInfoBtn {
	width: 30px;
	height: 30px;
	border: none;
	outline: none;
	cursor: pointer;
	margin-top: 10px;
}

#myInfoBtn {
	width: 35px;
	height: 35px;
	position: absolute;
	right: 10px;
	bottom: -19px;
}

#myInfoBtn {
	background: transparent url("/resources/img/마이.png") no-repeat center;
	background-size: contain;
}

.info2:hover #myInfoBtn {
	background: transparent url("/resources/img/마이2.png") no-repeat center;
	background-size: contain;
}

.leftBtn {
	height: 30px;
	width: 30px;
	top: 50%;
	position: absolute;
	left: 0%;
}

.rightBtn {
	height: 30px;
	width: 30px;
	top: 50%;
	position: absolute;
	right: 0%;
}

.category {
	margin: 0;
	height: 350px;
}

.subject {
	margin: 0;
	height: 100px;
	width: 400px;
}

.items {
	margin: 0;
	height: 250px;
	padding: 0;
	display: flex;
	justify-content: space-between;
}

.items div {
	width: 200px;
	height: 200px;
}

.items div img {
	width: 100%;
	height: 100%;
}

.footer {
	height: 300px;
	background-color: #43516c;
	margin: 0px auto;
}

.bot {
	position: fixed;
	width: 50px;
	height: 50px;
	right: 50px;
	bottom: 50px;
	margin: 0;
	border-radius: 30px;
}

.bot button {
	border: none;
	outline: none;
	cursor: pointer;
	width: 100%;
	height: 100%;
	background: transparent url("/resources/img/챗봇.png") no-repeat center;
	background-size: contain;
}

/* 중단 서치바 관련 */
.search-wrapper {
	position: absolute;
	top: 45%;
	width: 100%;
}

.search-div {
	position: absolute;
	top: 50%;
	right: 50%;
	transform: translate(-50%, -50%);
}

/* 검색바 */
.searchInput {
	position: absolute;
	right: -110px;
	top: -15px;
	width: 27px;
	height: 27px;
	background: none;
	border-radius: 50%;
	border: 3px solid #43516c;
	box-sizing: border-box;
	outline: none;
	transition: width 0.4s ease-in-out, border-radius 0.8s ease-in-out,
		padding 0.2s;
	transition-delay: 0.4s;
	color: #43516c;
	font-family: 'GmarketSansMedium';
	font-size: 15px;
}

.inclicked {
	width: 300px;
	border-radius: 20px;
	padding: 4px 15px;
	padding-right: 30px;
	border: 3px solid #dba531;
}

.searchBtn {
	position: absolute;
	width: 40px;
	height: 40px;
	top: -15px;
	right: -116px;
	box-sizing: border-box;
	background: none;
	border: none;
	outline: none;
	cursor: pointer;
}

.searchBtn::before {
	content: "";
	width: 3px;
	height: 15px;
	background: #43516c;
	position: absolute;
	transform: rotate(-45deg);
	bottom: 3px;
	right: 2px;
	transition: 0.5s;
}

.close::before, .close::after {
	content: "";
	width: 3px;
	height: 15px;
	background: #dba531;
	position: absolute;
	bottom: 19px;
	right: 19px;
}

.close::before {
	transform: rotate(-45deg);
}

.close::after {
	transform: rotate(45deg);
}
</style>
</head>

<body>
<sec:authentication var="principal" property="principal" />
	<div class="container">
		<div class="head">
			<div class="logo">
				<a href=""> <img src="/resources/img/로고.png" alt="">
				</a>
			</div>
		</div>
		<div class="nav">
			<ul class="menu">
				<li class="menu1"><a href=""><span>공지&이벤트</span> </a>
					<ul class="sub">
						<li><a href="/board/list?typeId=1">공지사항</a></li>
						<li><a href="">알랴쥼</a></li>
						<li><a href="/board/list?typeId=2">이벤트</a></li>
					</ul></li>
				<li class="menu2"><a href=""><span>취미</span> </a>
					<ul class="sub">
						<li><a href="/lesson/list?main=1&sub=0">미술</a></li>
						<li><a href="/lesson/list?main=1&sub=1">공예</a></li>
						<li><a href="/lesson/list?main=1&sub=2">디지털드로잉</a></li>
						<li><a href="/lesson/list?main=1&sub=3">사진/영상</a></li>
						<li><a href="/lesson/list?main=1&sub=4">라이프스타일</a></li>
						<li><a href="/lesson/list?main=1&sub=5">뷰티</a></li>
						<li><a href="/lesson/list?main=1&sub=6">요리/음료</a></li>
						<li><a href="/lesson/list?main=1&sub=7">음악</a></li>
						<li><a href="/lesson/list?main=1&sub=8">운동</a></li>
						<li><a href="/lesson/list?main=1&sub=9">댄스</a></li>
					</ul></li>
				<li class="menu3"><a href=""><span>자기계발</span> </a>
					<ul class="sub">
						<li><a href="/lesson/list?main=2&sub=0">언어</a></li>
						<li><a href="/lesson/list?main=2&sub=1">직무/커리어</a></li>
						<li><a href="/lesson/list?main=2&sub=2">개발</a></li>
						<li><a href="/lesson/list?main=2&sub=3">디자인</a></li>
						<li><a href="/lesson/list?main=2&sub=4">부업/창업</a></li>
						<li><a href="/lesson/list?main=2&sub=5">자격증</a></li>
						<li><a href="/lesson/list?main=2&sub=6">심리상담</a></li>
					</ul></li>
				<li class="menu4"><a href=""><span>커뮤니티</span> </a>
					<ul class="sub">
						<li><a href="/board/list?typeId=3">커뮤니티</a></li>
						<li><a href="/board/list?typeId=4">후기</a></li>
						<li><a href="/board/list?typeId=5">문의하기</a></li>
					</ul></li>
			</ul>
			<ul class="info">
				<li class="info1">
					<div class="middle">
						<form class="search-box" action="index.html" method="post">
							<input type="text" class="searchInput" name="searchInput"
								value="">
							<button type="button" class="searchBtn" name="searchBtn"></button>
						</form>
					</div>
				</li>
				<li class="info2"><button id="myInfoBtn"></button>

					<sec:authorize access="isAuthenticated()">
					<ul class="sub">
						<li><a href="myPage/activeLesson">마이페이지</a></li>
						<li><a href="/lesson/register">클래스등록</a></li>
						<c:if test="${principal.role eq 'ROLE_ADMIN'}">
						<li><a href="/admin/index">관리자</a></li>
						</c:if>
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
					<ul class="sub">
						<li><a href="/join">회원가입</a></li>
						<li><a href="/login">로그인</a></li>
					</ul>
					</sec:authorize>
				</li>
			</ul>
		</div>
		<div class="slide">
			<a href="" class="leftBtn">◀</a> <a href="" class="rightBtn">▶</a>
			<div id="slide1">
				<a href=""> </a>
			</div>
			<div id="slide2">
				<a href=""> </a>
			</div>
			<div id="slide3">
				<a href=""> </a>
			</div>
		</div>
		<div class="category">
			<div class="subject">베스트클래스</div>
			<div class="items">
				<div class="items1">
					<img src="/resources/img/자바의정석.jpg" alt="">
				</div>
				<div class="items2">
					<img src="/resources/img/c언어의정석.jpg" alt="">
				</div>
				<div class="items3">
					<img src="/resources/img/문워크.gif" alt="">
				</div>
				<div class="items4">
					<img src="" alt="">
				</div>
				<div class="items5">
					<img src="" alt="">
				</div>
			</div>
		</div>
		<div class="category">
			<div class="subject">마감임박클래스</div>
			<div class="items">
				<div class="items1">희</div>
				<div class="items2">지</div>
				<div class="items3">매</div>
				<div class="items4">문</div>
				<div class="items5">웤</div>
			</div>
		</div>
		<div class="category">
			<div class="subject">신규출시클래스</div>
			<div class="items">
				<div class="items1">희</div>
				<div class="items2">지</div>
				<div class="items3">매</div>
				<div class="items4">문</div>
				<div class="items5">웤</div>
			</div>
		</div>
		<div class="footer">푸터</div>
		<div class="bot">z
			<button></button>
		</div>
	</div>

	<script>
	
/*      window.onload = function () {
        var ref = this.open('http://a2-alz.web.app/');
        this.addEventListener('message', function (e) {
            if (e.data.permission === "granted") { ref.close(); }
            console.log(e.data.token);
        });
    } */
	 
		$(document).ready(function() {
			var $menus = $(".menu").find("li");
			var $infos = $(".info").find("li");
			var $leftBtn = $("#leftBtn");
			var $rightBtn = $("#rightBtn");
			var $myInfoBtn = $("#myInfoBtn");
			var $searchBtn = $(".searchBtn");
			var $searchInput = $(".searchInput");

			//호버 드롭다운
			$menus.hover(function(e) {
				$(this).find("ul").stop().slideToggle();
				$(this).find("span").toggleClass("choice");
			});
			$infos.hover(function(e) {
				$(this).find("ul").stop().slideToggle();
			});
			// 슬라이드 왼쪽
			$leftBtn.click(function(e) {

			});
			// 슬라이드 오른쪽
			$rightBtn.click(function(e) {

			});

			// 토글을 위한 제이쿼리(검색바)
			$searchBtn.on("click", function() {
				$searchInput.toggleClass("inclicked");
				$searchBtn.toggleClass("close");
				if ($searchBtn.attr("class") !== "searchBtn close") {
					$searchInput.val("");
				}
			});
		});
	</script>
</body>

</html>