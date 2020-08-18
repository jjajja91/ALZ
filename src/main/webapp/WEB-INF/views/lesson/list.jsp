<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./resources/css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link
        href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&family=Open+Sans:wght@300;400;700&display=swap"
        rel="stylesheet">

    <style>
        body * {
            font-family: 'Open Sans', 'Noto Sans KR', sans-serif;
        }
        
        .lessonHeaderTitle {
			color: #335492;
    		font-size: 25px;
    		font-weight: 500;
    		padding: 20px;
    		border-bottom: solid;
    		width: 75%;
		}

        #lessonList {
            width: 1000px;
            margin: 0 auto;
        }

        h2 {
            font-size: 30px;
            font-weight: 500;
        }

        .main_wrap section {
            padding: 80px 0 0;
        }

        .main_wrap section:last-child {
            padding-bottom: 80px;
        }

        .main_wrap section ul {
            display: flex;
            flex-flow: row wrap;
            margin-top: 30px;
        }

        .main_wrap section ul li {
            width: 200px;
            margin-right: 25px;
            margin-bottom: 20px;
        }

        .main_wrap section ul li:last-child {
            margin-right: 0;
        }

        .main_wrap section ul li .img {
            height: 160px;
            width: 200px;
            margin-bottom: 10px;
        }
        
        .main_wrap section ul li .img img {
            height: 160px;
            width: 200px;
        }

        .main_wrap section ul li h3 {
            font-size: 18px;
            text-align: left;
            margin-top: 10px;
        }

        .main_wrap section ul li a {
            text-decoration: none;
            color: black;
        }

        .main_wrap section ul li span {
            border: none;
            padding: 2px 10px;
            background-color: #335492;
            color: #f4f4f4;
            margin-right: 5px;
            font-size: 12px;
        }

        h6 {
            display: inline;
        }

        .likeInfo {
            text-align: right;
            font-size: 20px;
        }

        .likeInfo a {
            margin-left: 10px;
        }

        h3 {
            margin-bottom: 10px;
        }

        h4 {
            text-decoration: line-through;
            display: inline;
        }

        h5 {
            display: inline;
            color: red;
        }

        h1 {
            margin-top: 10px;
            font-size: 25px;
            font-weight: bold;
        }
        
        .price {
            text-align: right;
        }
    </style>
</head>

<body>
    <div id="lessonList">
        <div class="main_wrap">    
			<c:forEach items="${list}" var="lesson" begin="1" end="1" step="1">
			<div class="lessonHeaderTitle"><c:out value="${lesson.categoryName}" /></div>
			</c:forEach>
				<div class="lessonSortDiv">
					<select name="sort" id="lessonListSort">
		    		<option value="newest">최신순</option>
		    		<option value="rate">평점순</option>
					</select>
				</div>
            <section class="sec">
                <div class="inner">
                    <ul>
                		<c:forEach items="${list}" var="lesson">
                        <li>
                            <div class="likeInfo">
                                <a id="like" href=""><i class="xi-heart-o"></i>
                                <h6>200</h6></a>
                                <a id="reserv" href=""><i class="xi-star-o"></i>
                                <h6>200</h6></a>
                            </div>
                            <a href="">
                                <div class="img">
                                <c:if test= "${empty lesson.thumbnail}">
								<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
								</c:if>
								<c:if test= "${!empty lesson.thumbnail}">
								<img class="lessonImg" src="/resources/img/lesson/thumb/${lesson.teacherId}${lesson.openAt}/${lesson.thumbnail}">
								</c:if>
                                </div>
                                <span>${lesson.typeName}</span><span>${lesson.categoryName}</span>
                                <h3>${lesson.title}</h3>
                                <div class="price">
                                	<fmt:formatNumber type="number" var="originPrice" maxFractionDigits="3" value="${lesson.originPrice}" />
                                    <h4>${originPrice}원</h4>
                                    <fmt:parseNumber var= "discountRate" integerOnly= "true" value= "${lesson.discountRate }" />
                                    <h5>${discountRate}%</h5>
                                    <fmt:formatNumber type="number" var="salePrice" maxFractionDigits="3" value="${lesson.salePrice}" />
                                    <h1>${salePrice}원</h1>
                                </div>
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </section>
        </div>

    </div>


</body>

</html>