<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/myPageNav.jsp"%>
<%@include file="../includes/header.jsp"%>
<head>
<style>
.container {
	position: relative;
	margin-top: 200px;
}

.container h1 {
	text-align: center;
	font-size: 2em;
	color: #335492;
}

.table-container {
	position: absolute;
	top: 90px;
	right: 15%;
}

.content-table {
	border-collapse: collapse;
	font-size: 0.8em;
	min-width: 400px;
	width: 700px;
	border-radius: 5px 5px 0 0;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.content-table thead tr {
	background-color: #335492;
	color: #ffffff;
	text-align: left;
}

.content-table th {
	padding: 13px 15px
}

.content-table td {
	padding: 8px 15px;
}

.content-table td a {
	text-decoration: none;
	color: #335492;
}

.content-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.content-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.content-table tbody tr:last-of-type {
	border-bottom: 2px solid #335492;
}

.content-table tbody tr.active-row {
	font-weight: bold;
	color: #335492;
}

.page-footer {
	right: 0%;
	bottom: 0%;
	margin-top: 20px;
}

.page-footer li {
	float: left;
}

.paginate_button a {
	text-decoration: none;
	background-color: #eee;
	padding: 5px 10px;
	color: #335492;
}

.active a {
	color: #eee;
	background-color: #335492;
}
</style>
</head>
<body>



	<div class="container">
		<h1 class="page-header">내 게시글</h1>

		<div class="table-container">


			<table class="content-table" id="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.id }" /></td>
							<td><a class='read' href='<c:out value="${board.id }"/>'><c:out
										value="${board.title }" /> (<c:out
										value="${board.commentCnt}" />)</a></td>
							<td><c:out value="${board.nickname }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.writtenAt }" /></td>
							<td><c:out value="${board.viewCnt }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- paging -->
			<div class="page-footer">
				<ul class="pagination pull-right">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1 }">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li
							class="paginate_button ${pageMaker.cri.pageNum == num? 'active':'' }"><a
							href="${num }">${num }</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>


		<form id='actionForm' action="/myPage/boardList" method='get'>
			<input type='hidden' id='pageNum' name='pageNum'
				value='<c:out value="${pageMaker.cri.pageNum }"/>' /> <input
				type='hidden' id='amount' name='amount'
				value='<c:out value="${pageMaker.cri.amount }"/>' />
		</form>

	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>