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
				<a href="#detailDiv">클래스소개</a>
				<a href="#scheduleDiv">시간표</a>
				<a href="#curriculumDiv">커리큘럼</a>
				<a href="#teacherDiv">강사소개</a>
				<a href="#shortReview">후기</a>
				<a href="#refundTerm">환불정책</a>
			</div>
			
			<div class="detailDiv" id="detailDiv">
				<br>
				<br>
				<br>
				<br>
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
				<h3><strong><c:out value="${lesson.levelName}" /><c:if test="${lesson.levelName != '누구나'}">자들</c:if></strong>을 위한
				<br><c:out value="${lesson.categoryName}" /> 클래스입니다.</h3>
				
				<br><br>
				<pre class="pre"><c:out value="${lesson.detail}"></c:out></pre>
			</div>
			
			<div class="scheduleDiv" id="scheduleDiv">
				<br>
				<br>
				<br>
				<br>
				<h3><strong>세부 스케줄</strong></h3>
				<br>
				<c:forEach items="${schedule }" var="schedule">
					<strong><c:out value="${schedule.lessonDate }"/></strong>
					<c:out value="${schedule.startAt }"/> ~ <c:out value="${schedule.endAt }"/>
					<br>
				</c:forEach>
				<br>
				<br>
			</div>
			
			<div class="curriculumDiv" id="curriculumDiv">
				<br><br>
				<br>
				<br>
				<h3><strong>커리큘럼</strong></h3>
				
				<c:forEach items='${curriculum}' var='list'>
					<h4><c:out value="${list.subject}" /></h4>
					
					<c:forEach items='${list.detailList}' var='detail'>
						<h5><c:out value="${detail.detailOrder}" />. <c:out value="${detail.detail}" /></h5>
					</c:forEach>
					<br>
				</c:forEach>
			</div>
			
			<div class="teacherDiv" id="teacherDiv">
				<br><br>
				<br>
				<br>
				<h3><strong>강사 소개</strong></h3>
				<br>
				<h4><c:out value="${teacher.nickname}" /></h4>
				<c:out value="${teacher.snsType}" /> - <c:out value="${teacher.snsId}" />
				<br><br>
				<h5><c:out value="${teacher.profile}" /></h5>
			</div>
			
			
		    <br><br>
			<br>
			<br><h3><strong>한줄평</strong></h3><br>
			<p id="lesson_star_rate">
				<a href="#" id="star1">★</a> <a href="#" id="star2">★</a> <a
					href="#" id="star3">★</a> <a href="#" id="star4">★</a> <a
					href="#" id="star5">★</a>
			</p>
			<input type='hidden' name='lessonReview'>
			+ <input type="text" id="quickReviewText" placeholder="한줄평을 입력해주세요">
			<button type="submit">입력</button>
			<div class="shortReview" id="shortReview">
				<input type='hidden' name='lessonRate'>
			</div>
			
			<div id="refundTerm">
				<br>
				<br>
				<br>
				<br>
				<h4><strong>환불정책</strong></h4>
				환불은 1주일 전까지 해드립니다.
				<br>
				수강 후에는 수업1회당 20% 차감 환불.
				<br>
				<br>
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
		
		$('#lesson_star_rate a').click(function(){
            $(this).parent().children("a").removeClass("lessonOn");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("lessonOn").prevAll("a").addClass("lessonOn"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var lesson_star_rate = $(".lessonOn").length;
            return $("input[type=hidden][name=lessonReview]").val(lesson_star_rate);
        });
		
	});


</script>
</body>
</html>