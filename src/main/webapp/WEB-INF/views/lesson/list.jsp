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
    <link rel="stylesheet" href="/resources/css/reset.css">
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
    		width: 95%;
		}

        #lessonList {
            width: 1000px;
            margin: 0 auto;
            padding-top: 180px;
        }

        h2 {
            font-size: 30px;
            font-weight: 500;
        }

        .main_wrap section {
            padding: 40px 0 0;
        }

        .main_wrap section:last-child {
            padding-bottom: 80px;
        }

        .main_wrap section ul {
            display: flex;
            flex-flow: row wrap;
            margin-top: 30px;
            margin-left: 30px;
        }

        .main_wrap section ul li {
            width: 200px;
            margin-left: 15px;
            margin-right: 15px;
            margin-bottom: 20px;
            position: relative;
        }

        .main_wrap section ul li .img {
            height: 160px;
            max-height: 160px;
            width: 200px;
            max-width: 200px;
            margin-bottom: 10px;
            position: relative;
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

        .main_wrap section ul li span {
            border: none;
            padding: 2px 10px;
            background-color: #335492;
            color: #f4f4f4;
            margin-right: 5px;
            font-size: 12px;
        }
        
        .main_wrap section ul li a {
            text-decoration: none;
            color: black;
        }

        h6 {
            display: inline;
        }
        
        .main_wrap section ul li .selected {
        	display: flex;
        }
        
        .main_wrap section ul li .selected a {
        	color: white;
        }
        
        .likeInfo {

            position:absolute;
            right: 0%;
            top: 0%;
                  width: 100%;
                  height: 100%;
                  justify-content:center;
                  align-items:center;
            display: none;
            z-index: 1;
                  background: rgba(0,0,0,0.7);

        }
        
        .likeInfo a {color: #fff; display: flex; align-items:center; font-size: 20px; padding: 0 10px;}
        
        i {
        	margin-right: 5px;
        }

        h3 {
            margin: 10px 0px;
            height: 70px;
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
            font-weight: 200px;
        }
        
        .price {
            text-align: right;
            margin-bottom: 50px;
        }
    </style>
</head>

<body>
    <div id="lessonList">
        <div class="main_wrap">    
			<c:forEach items="${list}" var="lesson" begin="1" end="1" step="1">
			<div class="lessonHeaderTitle"><c:out value="${lesson.categoryName}" /></div>
			</c:forEach>
<!-- 				<div class="lessonSortDiv">
					<select name="sort" id="lessonListSort">
		    		<option value="newest">최신순</option>
		    		<option value="rate">평점순</option>
					</select>
				</div> -->
            <section class="sec">
                <div class="inner">
                    <ul>
                		<c:forEach items="${list}" var="lesson">
                        	<li>
                                <div class="img">                           	
                        		<div class="likeInfo">
                                	<a id="like" href=""><i class="xi-heart-o"></i>62</a>
                                	<a id="reserv" href=""><i class="xi-star-o"></i>15</a>
                            	</div>
                            	<a href="/lesson/read?id=${lesson.id }">
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
			<!-- paging -->
	
	<div class="page-footer" id="pagingDiv">
		<ul class="pagination pull-right">
			<c:if test="${pageMaker.prev }">
				<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">Previous</a></li>
			</c:if>
			
			<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="paginate_button ${pageMaker.cri.pageNum == num? 'active':'' }"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
	
	
	<form id='actionForm' action="/lesson/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
		<input type='hidden' name='categoryMain' value='<c:out value="${pageMaker.cri.categoryMain}"/>' />
		<input type='hidden' name='categorySub' value='<c:out value="${pageMaker.cri.categorySub}"/>' />
	</form>
    </div>
	<script>
		$(document).ready(function(e){
			var hoverImg = $(".main_wrap section ul li .img");
			hoverImg.hover(function(e) {
				$(this).parent().find(".likeInfo").toggleClass("selected");
			});
		});
		
		
		
		var actionForm = $("#actionForm");
		
		$(".read").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='id' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/lesson/read");
			actionForm.submit();
		})
		
		//페이지 번호 이동
		$('#pagingDiv a').click(function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			
		});
		
		// 좋아요 추가
		function addLike(likeData) {
			return $.ajax({
				type : "POST",
				url : '/boards/like/',
				data : JSON.stringify(likeData),
				contentType : "application/json; charset=utf-8"
			});
		}
		
		// 좋아요 삭제
		function removeLike(likeData) {
			return $.ajax({
				type : 'DELETE',
				url : '/boards/like/' +likeData.userId+'/'+likeData.boardId,
				contentType : "application/json; charset=utf-8"
			});
		}
		
		// 좋아요 수
		function countLike(id) {
			return $.ajax({
				type : "GET",
				url : '/boards/like/' + id,
				contentType : "application/json; charset=utf-8;"
			});
		}

	</script>

</body>

</html>