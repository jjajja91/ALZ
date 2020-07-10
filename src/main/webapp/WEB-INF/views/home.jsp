<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <style>
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
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
            height: 80px;
            position: relative;
        }

        .logo {
            position: absolute;
            top: 10px;
            left: 20px;
            padding: 0px;
            width: 140px;
            height: 60px;
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
        }

        .sub li {
            font-size: 20px;
            margin-top: 10px;
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
            width: 200px;
        }

        .info li {
            flex: 1;
            align-items: center;
            position: relative;
            font-size: 22px;
        }

        .info1 ul {
            top: 50px;
        }

        .info2 ul {
            top: 51px;
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

        #searchBtn,
        #myInfoBtn {
            width: 30px;
            height: 30px;
            border: none;
            outline: none;
            cursor: pointer;
            margin-top: 10px;
        }

        #myInfoBtn{
            width: 35px;
            height: 35px;
            margin-top: 7px;
        }

        #searchBtn {

            background: transparent url("/resources/img/검색2.png") no-repeat center;
            background-size: contain;
        }

        #myInfoBtn {
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
    </style>
</head>

<body>
    <div class="container">
        <div class="head">
            <div class="logo">
                <a href="">
                    <img src="/resources/img/로고.png" alt="">
                </a>
            </div>
        </div>
        <div class="nav">
            <ul class="menu">
                <li class="menu1">
                    <a href=""><span>공지&이벤트</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="">공지사항</a>
                        </li>
                        <li>
                            <a href="">알랴쥼</a>
                        </li>
                        <li>
                            <a href="">이벤트</a>
                        </li>
                    </ul>
                </li>
                <li class="menu2"><a href=""><span>취미</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="">공예</a>
                        </li>
                        <li>
                            <a href="">요리</a>
                        </li>
                    </ul>
                </li>
                <li class="menu3"><a href=""><span>자기계발</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="">웹개발</a>
                        </li>
                        <li>
                            <a href="">안드로이드</a>
                        </li>
                    </ul>
                </li>
                <li class="menu4">
                    <a href=""><span>커뮤니티</span>
                    </a>
                    <ul class="sub">
                        <li>
                            <a href="/board/list">커뮤니티</a>
                        </li>
                        <li>
                            <a href="/board/list">후기</a>
                        </li>
                        <li>
                            <a href="/board/list">문의하기</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="info">
                <li class="info1"><button id="searchBtn"></button>
                    <ul class="sub">
                        <li>
                            <input type="text" name="" id="">
                        </li>
                    </ul>
                </li>
                <li class="info2"><button id="myInfoBtn"></button>
                    <ul class="sub">
                        <li>
                            <a href="/callJoin">회원가입</a>
                        </li>
                        <li>
                            <a href="/callLogin">로그인</a>
                        </li>
                        <li>
                            <a href="">내정보</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="slide">
            <a href="" class="leftBtn">◀</a>
            <a href="" class="rightBtn">▶</a>
            <div id="slide1">
                <a href="">
                </a>
            </div>
            <div id="slide2">
                <a href="">
                </a>
            </div>
            <div id="slide3">
                <a href="">
                </a>
            </div>
        </div>
        <div class="category">
            <div class="subject">베스트클래스</div>
            <div class="items">
                <div class="items1"><img src="/resources/img/자바의정석.jpg" alt=""></div>
                <div class="items2"><img src="/resources/img/c언어의정석.jpg" alt=""></div>
                <div class="items3"><img src="/resources/img/문워크.gif" alt=""></div>
                <div class="items4"><img src="" alt=""></div>
                <div class="items5"><img src="" alt=""></div>
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
        <div class="footer">
            푸터
        </div>
        <div class="bot">
            <button></button>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            var $menus = $(".menu").find("li");
            var $infos = $(".info").find("li");
            var $leftBtn = $("#leftBtn");
            var $rightBtn = $("#rightBtn");
            var $myInfoBtn = $("#myInfoBtn");
            //호버 드롭다운
            $menus.hover(function (e) {
                $(this).find("ul").stop().slideToggle();
            });
            $infos.hover(function (e) {
                $(this).find("ul").stop().slideToggle();
            });
            // 슬라이드 왼쪽
            $leftBtn.click(function (e) {

            });
            // 슬라이드 오른쪽
            $rightBtn.click(function (e) {

            });
        });
    </script>
</body>

</html>