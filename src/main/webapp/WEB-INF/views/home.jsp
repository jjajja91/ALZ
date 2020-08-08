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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
<!-- <style>
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
-->

	<style>
		body * {font-family: 'Open Sans', 'Noto Sans KR', sans-serif;}
		.inner {
			max-width: 1200px;
			width: 100%;
			margin: 0 auto;
		}
		header {width: 100%; box-shadow: 0 0 5px rgba(0,0,0,0.3);background: #fff; position: fixed; z-index: 99; left: 0; top: 0;}
		
		header .logo {padding: 15px 0;}
		header .logo img {
			width: 120px;
		}

		header .bottom_line {
			display: flex;
			justify-content: space-between;
			align-items: center;
			border-top: 1px solid #ccc;
		}

		header .bottom_line nav {
			width: 50%;
		}

		header .bottom_line nav>ul {
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		header .bottom_line nav>ul>li {
			flex: 1; position: relative;
		}
		header .bottom_line .m_menu {display: block; text-align: center; padding: 20px 0; font-size: 18px; color: #212121;}
		header .bottom_line nav .s_nav {/*display: none;*/ position: absolute; left: 0; top: 61px; 
			width: 100%; background: #fff; border: 1px solid #ddd; display:none;}
		header .bottom_line nav .s_nav a {display: block; font-size: 16px; padding: 10px 0; 
			text-align: center; color: #585858;}
		header .bottom_line .right {
			display: flex;
			justify-content: flex-end;
			align-items: center;
		}
		header .bottom_line .mypage {
			width: 50%;
		}

		header .bottom_line .mypage>ul {
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		header .bottom_line .mypage>ul>li {
			flex: 1; position: relative;
		}
		header .bottom_line .mypage .s_nav {/*display: none;*/ position: absolute; left: -60px; top: 64px; 
			width: 150px; background: #fff; border: 1px solid #ddd; display:none;}
		header .bottom_line .mypage .s_nav a {display: block; font-size: 16px; padding: 10px 0; 
			text-align: center; color: #585858;}
			
			
		header .bottom_line .right > div {margin-left: 20px;}
		header .bottom_line .right > div i {font-size: 24px; color: #212121;}
		header .bottom_line .right .search_wrap {display: flex; align-items: center;}
		header .bottom_line .right .search_wrap .search_bar input{
			width: 0; margin-right: 10px; padding: 0; visibility: hidden; opacity: 0; transition: all 0.3s;
			border: 0; border-bottom: 2px solid #212121; height: 36px;
		}
		header .bottom_line .right .search_wrap .search_bar.on input {width: 200px; visibility: visible; opacity: 1;
			transition: all 0.3s; 
		}
		.slide_wrap .swiper-container {
			overflow: hidden;
			position: relative;
		}

		.slide_wrap .swiper-slide {
			height: 500px;
			background: #888;
		}

		.slide_wrap .pager_wrap {
			position: absolute;
			left: 0;
			bottom: 50px;
			width: 100%;
			z-index: 9;
		}

		.slide_wrap .pager_wrap .pager_line {
			display: flex;
			align-items: center;
		}

		.slide_wrap .pager_wrap .pager_line * {
			line-height: 1;
		}

		.slide_wrap .pager_wrap .swiper_fraction {
			width: auto;
			margin: 0 20px;
		}

		.main_wrap section {
			padding: 80px 0 0;
		}
		.main_wrap section:last-child {padding-bottom: 80px;}
		.main_wrap section h2 {
			font-size: 30px;
			font-weight: 500;
		}

		.main_wrap section ul {
			display: flex;
			flex-flow: row wrap;
			margin-top: 30px;
		}
		.main_wrap section ul li {width: 220px; margin-right: 25px;}
		.main_wrap section ul li:last-child {margin-right: 0;}
		.main_wrap section ul li .img {height: 200px; background: #000;}
		.main_wrap section ul li h3 {font-size: 18px; text-align: center; margin-top: 10px;}
		footer {background: #1e222b; color: #fff; padding: 30px 0;}
	
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
	</style>
</head>

<body>
<sec:authentication var="principal" property="principal" />

<body>
	<div class="container">
		<header>
			<div class="inner">
				<div class="logo"><a href=""><img src="/resources/img/로고.png" alt="알랴쥼"></a></div>
				<div class="bottom_line">
					<nav>
						<ul>
							<li><a href="" class="m_menu">알랴쥼</a>
								<ul class="s_nav">
									<li><a href="/board/list?typeId=1">공지사항</a></li>
									<li><a href="">알랴쥼</a></li>
									<li><a href="/board/list?typeId=2">이벤트</a></li>
								</ul>
							</li>
							<li><a href="" class="m_menu">취미</a>
								<ul class="s_nav">
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
								</ul>
							</li>
							<li><a href="" class="m_menu">자기계발</a>
								<ul class="s_nav">
									<li><a href="/lesson/list?main=2&sub=0">언어</a></li>
									<li><a href="/lesson/list?main=2&sub=1">직무/커리어</a></li>
									<li><a href="/lesson/list?main=2&sub=2">개발</a></li>
									<li><a href="/lesson/list?main=2&sub=3">디자인</a></li>
									<li><a href="/lesson/list?main=2&sub=4">부업/창업</a></li>
									<li><a href="/lesson/list?main=2&sub=5">자격증</a></li>
									<li><a href="/lesson/list?main=2&sub=6">심리상담</a></li>
								</ul>
							</li>
							<li><a href="" class="m_menu">커뮤니티</a>
								<ul class="s_nav">
									<li><a href="/board/list?typeId=3">커뮤니티</a></li>
									<li><a href="/board/list?typeId=4">후기</a></li>
									<li><a href="/board/list?typeId=5">문의하기</a></li>
								</ul>
							</li>
						</ul>
					</nav>
					<div class="right">
						<div class="search_wrap">
							<div class="search_bar">
								<input type="text" placeholder="검색어를 입력하세요.">
							</div>
							<a href="#null" class="search_btn"><i class="xi-search"></i></a>
						</div>
						<div class="mypage">
						<ul><li><a href="" class="m_menu"><i class="xi-user-o"></i></a>
							<sec:authorize access="isAuthenticated()">
							<ul class="s_nav">
								<li><a href="myPage/activeLesson">마이페이지</a></li>
								<li><a href="/lesson/register">클래스등록</a></li>
								<c:if test="${principal.role eq 'ROLE_ADMIN'}">
								<li><a href="/admin/index">관리자</a></li>
								</c:if>
								<li><a href="/logout">LOGOUT</a></li>
							</ul>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<ul class="s_nav">
								<li><a href="/join">회원가입</a></li>
								<li><a href="/login">로그인</a></li>
							</ul>
							</sec:authorize>
						</li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="slide_wrap">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide">Slide 1</div>
					<div class="swiper-slide">Slide 2</div>
					<div class="swiper-slide">Slide 3</div>
					<div class="swiper-slide">Slide 4</div>
				</div>
				<div class="pager_wrap">
					<div class="inner">
						<div class="pager_line">
							<div class="swiper_prev swiper_button"><i class="xi-arrow-left"></i></div>
							<div class="swiper_fraction"></div>
							<div class="swiper_next swiper_button"><i class="xi-arrow-right"></i></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_wrap">
			<section class="sec01">
				<div class="inner">
					<h2>베스트클래스</h2>
					<ul>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
					</ul>
				</div>
			</section>
			<section class="sec02">
				<div class="inner">
					<h2>마감임박클래스</h2>
					<ul>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
					</ul>
				</div>
			</section>
			<section class="sec03">
				<div class="inner">
					<h2>신규출시클래스</h2>
					<ul>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
						<li><a href="">
								<div class="img"></div>
								<h3>리스트</h3>
							</a></li>
					</ul>
				</div>
			</section>
		</div>
		<footer>
			<div class="inner">
				<p class="copy"> Copyright, ⓒ ALZ. All rights reserved.</p>
			</div>
		</footer>
		<div class="bot">
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
			var $menus = $("nav").find("li");
			var $mypage = $(".mypage").find("li");

			//호버 드롭다운
			$menus.hover(function(e) {
				$(this).find("ul").stop().slideToggle();
			});
			
			$mypage.hover(function(e) {
				$(this).find("ul").stop().slideToggle();
			});


			var swiper = new Swiper('.swiper-container', {
				pagination: {
					el: '.swiper_fraction',
					type: 'fraction',
				},
				loop: true,
				autoplay: {
					delay: 2500,
					disableOnInteraction: false,
				},
				navigation: {
					nextEl: '.swiper_next',
					prevEl: '.swiper_prev',
				},
			});
			
			if($(window).scrollTop() < 0)(function(){
				$(header .logo).hide(); 
			});
			$(".search_btn").click(function(e){
				e.preventDefault();
				$(".search_bar").toggleClass("on");
			});
			
			
			
		});
	</script>
</body>

</html>