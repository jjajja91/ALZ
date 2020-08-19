<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="./includes/header.jsp"%>
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
	<style>
		body * {font-family: 'Open Sans', 'Noto Sans KR', sans-serif;}
		
		.slide_wrap {
			margin-top: 150px;
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
			background-color: black;
			color: white;
			width: 105px;
			padding: 10px 5px;
		}

		.slide_wrap .pager_wrap .pager_line * {
			line-height: 1;
			cursor: pointer;
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
		footer {background: #335492; color: #fff; padding: 30px 0;}
	
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

<sec:authentication var="principal" property="principal" />

<body>
	<div class="container">
		<div class="slide_wrap">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide"><a href=""><img src="/resources/img/배너1.png"></a>
					</div>
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
						<li>
                            <div class="img">                           	
                        		<div class="likeInfo">
                                	<a class="like" href=""><i class="xi-heart-o">657</i></a>
                                	<a class="reserv" href=""><i class="xi-star-o">329</i></a>
                            	</div>
                            	<a href="/lesson/read?id=">
                            	<!-- /resources/img/lesson/thumb// -->
								<img class="lessonImg" src="">
                                </div>
                                <span>타입이름</span><span>카테고리이름</span>
                                <h3>제목</h3>
                                <div class="price">
                                	<h4>원</h4>
                                    <h5>%</h5>
                                    <h1>원</h1>
                                </div>
                                </a>
                        	</li>
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

			var swiper = new Swiper('.swiper-container', {
				pagination: {
					el: '.swiper_fraction',
					type: 'fraction',
				},
				loop: true,
				autoplay: {
					delay: 5000,
					disableOnInteraction: false,
				},
				navigation: {
					nextEl: '.swiper_next',
					prevEl: '.swiper_prev',
				},
			});	
			
		});
	</script>
</body>

</html>