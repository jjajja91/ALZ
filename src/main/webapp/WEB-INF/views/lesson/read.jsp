<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<div class="container">
	<h1 class="page-header">클래스 상세보기</h1>
</div>

<div class="lesson-container">

	<div class="lesson-main">
		<div class="lessonDetailImgDiv">
			<img class="lessonDetailImg" src="../../../resources/img/javaclass.jpg">
		</div>
		<div class="lesson-detail">
			<div class="lesson-detail-nav">
				<a>클래스소개</a>
				<a>커리큘럼</a>
				<a>강사소개</a>
				<a>후기</a>
				<a>환불정책</a>
			</div>
			
			<div class="detailDiv">
				<h3><strong>이런 걸 배울 거예요</strong></h3>
				<ul>
					<li>
						<span>
							<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
							<p>for문으로 별찍기</p>
						</span>
					</li>	
					<li>
						<span>					
							<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
							<p>for문으로 별찍기</p>
						</span>
					</li>	
					<li>
						<span>					
							<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
							<p>for문으로 별찍기</p>
						</span>
					</li>	
				</ul>
				
				<br><br>
				<h3><c:out value="${lesson.lessonLevel}" />자들을 위한
				<br><c:out value="${lesson.categoryName}" /> 클래스입니다.</h3>
				
				<br><br>
				<pre class="pre"><c:out value="${lesson.detail}"></c:out></pre>
			</div>
			
			<div class="curriculumDiv">
				<br><br>
				<h3>커리큘럼</h3>
				
				<c:forEach items='${curriculum}' var='list'>
					<h4><c:out value="${list.subject}" /></h4>
					
					<c:forEach items='${list.detailList}' var='detail'>
						<h5><c:out value="${detail.detailOrder}" />. <c:out value="${detail.detail}" /></h5>
					</c:forEach>
					<br>
				</c:forEach>
			</div>
			
			<div class="teacherDiv">
				<br><br>
				<h3>강사 소개</h3>
				<br>
				<h4><c:out value="${teacher.nickname}" /></h4>
				<c:out value="${teacher.snsType}" /> - <c:out value="${teacher.snsId}" />
				<br><br>
				<h5><c:out value="${teacher.profile}" /></h5>
			</div>
			
			<div class="shortReview">
				<input type='hidden' name='lessonRate'>
			</div>
		</div>
	</div>

	
	<div class="lesson-info">
		<div class="lessonSideDiv">
			<strong><c:out value="${teacher.nickname}" /></strong>
			<h4>[<c:out value="${lesson.categoryName}" />] <c:out value="${lesson.title}" /></h4>
			<h4>100,000원</h4>
			<p>수강대상[<c:out value="${lesson.lessonLevel}" />]</p>
		</div>
	</div>

</div>
<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#lesson_star_rate a').click(function(){
			
            $(this).parent().children("a").removeClass("lessonOn");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("lessonOn").prevAll("a").addClass("lessonOn"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var lesson_star_rate = $(".lessonOn").length;
            return $("input[type=hidden][name=lessonRate]").val(lesson_star_rate);
            
        });
		
		var str="";
		str += "<br><br><h3>한줄평</h3><br>";
		<c:forEach items='${quickReview}' var='review'>
			str += "<c:out value='${review.nickname}' />";
			str += "<p id='lesson_star_rate'>";
			for(var i=0; i<'${review.rate}'; i++) {
				str += "<a class='lessonOn'>★</a>"
			}
			for(var j=0; j<(5-'${review.rate}'); j++) {
				str += "<a>★</a>"
			}
			str += "</p>";
			str += "<p><c:out value='${review.content}' /></p>";
			str += "<br>";
		</c:forEach>
		$('.shortReview').html(str);
		
	});


</script>
</body>
</html>