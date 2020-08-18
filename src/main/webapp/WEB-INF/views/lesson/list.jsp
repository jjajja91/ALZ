<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
.container {
	position: absolute;
	margin-top: 200px;
	margin-left: 10%;
	width:100%;
}

.lessonHeaderTitle {
	color: #335492;
    font-size: 25px;
    font-weight: 500;
    padding: 20px;
    border-bottom: solid;
    width: 75%;
}
.lessonImg {
width : 150px;
height : 120px;
}
</style>
<body>

<div class="container">     
	<c:forEach items="${list}" var="lesson" begin="1" end="1" step="1">
		<div class="lessonHeaderTitle"><c:out value="${lesson.categoryName}" /></div>
	</c:forEach>
	<div class="lessonSortDiv">
		<select name="sort" id="lessonListSort">
		    <option value="newest">최신순</option>
		    <option value="rate">평점순</option>
		</select>
	</div>
	
	<div class="lessonRowDiv">
		<c:forEach items="${list}" var="lesson">
			<div class="lessonInfoDiv">
				<c:if test= "${empty lesson.thumbnail}">
					<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
				</c:if>
				<c:if test= "${!empty lesson.thumbnail}">
					<img class="lessonImg" src="/resources/img/lesson/thumb/${lesson.teacherId}${lesson.openAt}/${lesson.thumbnail}">
				</c:if>
				<p>[<c:out value="${lesson.typeName}" />] <c:out value="${lesson.categoryName}" /></p>
				<a class='read' href='<c:out value="${lesson.id }"/>'><c:out value="${lesson.title}" /></a>
				<br>
				<fmt:formatNumber type="number" var="originPrice" maxFractionDigits="3" value="${lesson.originPrice}" />
				<fmt:parseNumber var= "discountRate" integerOnly= "true" value= "${lesson.discountRate }" />
				<del><c:out value="${originPrice }"/></del>원 <c:out value="${discountRate}" />%
				<fmt:formatNumber type="number" var="salePrice" maxFractionDigits="3" value="${lesson.salePrice}" />
				<br>
				<c:out value="${salePrice}" />원
			</div>
		</c:forEach>
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
	
	<%-- <table class="lessonTable">
		<thead id="table-header">
			<tr>
				<th>클래스</th>
				<th>클래스</th>
				<th>클래스</th>
				<th>클래스</th>
				<th>클래스</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<c:forEach items="${list}" var="lesson">
					<td>
						<img class="lessonImg" src="../../../resources/img/classtmpimg.jpg">
						<p><small>[<c:out value="${lesson.typeName}" />] <c:out value="${lesson.categoryName}" /></small></p>
						<a class='read' href='<c:out value="${lesson.id }"/>'><strong><c:out value="${lesson.title}" /></strong></a>
						<p>★★★☆☆</p>
						<p>100,000원</p>
					</td>
					<td><a href="get?id=${lesson.id}"><c:out value="${lesson.name}" /></a></td>
					<td><c:out value="${classes.description}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${classes.openAt}" />~<fmt:formatDate pattern="yyyy/MM/dd"
							value="${classes.closeAt}" /></td>
					<td><c:out value="${classes.startAt}" />~<c:out
							value="${classes.endAt}" /></td>
					<td><c:out value="${classes.studentCnt}" /></td>
					<td><c:out value="${classes.likeCnt}" /></td>
					<td><c:out value="${classes.reservCnt}" /></td>
					<td><c:out value="${classes.rate}" /></td>
			</c:forEach>
				</tr>
		</tbody>
	</table> --%>
	
</div>
<script type="text/javascript">
	
	$(document).ready(function() {
		
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
		
	});
	
</script>
</body>
</html>