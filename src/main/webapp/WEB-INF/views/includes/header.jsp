<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ALZ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<style>
.preContent {
    border: none;
    background: none;
    padding: 5px;
    font-size : 100%;
}
.commentDiv {
	width: inherit;
    position: relative;
}
.commentDropBtn {
    font-weight: bold;
    border: none;
    background-color: transparent;
	position: absolute;
    left: 95%;
	top: 0;
}
#replyTextarea {
	width : 80%;
	resize: none;
}
#textAreaEdit {
	width : 80%;
	resize: none;
}
#commentContent {
	width : 90%;
	resize: none;
}
.chat, .chat li{
	padding-left: 0px;
	list-style :none;
}
.uploadResult {
	width: 100%;
	background-color: gray;
}


.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigpicture img {
	width: 600px
}


.lessonSortDiv {
    text-align: right;
    padding-bottom: 20px;
}

.lessonImg {
	width: 150px;
}

.lessonInfoDiv {
	padding: 10px;
    width: 170px;
    display: inline-grid;
    margin-right: 0px;
}

.lessonInfoDiv p {
	margin-bottom: 3px;
}

.lesson-container {
	display: flex;
    width: 90%;
    margin: auto;
}

.lesson-main {
	width: 66.6%;
    margin: 5px;
}
.lessonDetailImgDiv {
	padding: 10px;
}
.lessonDetailImg {
	width: 100%;
}
.lesson-info {
	width: 33.3%;
    margin: 5px;
}

.lesson-detail {
	padding-top: 10px;
}
.lesson-detail-nav {
	padding: 10px;
}
.lesson-detail-nav a  {
	padding: 10px;
}

.detailDiv {
    padding-top: 30px;
}
.detailDiv ul {
	padding: 5px;
}
.detailDiv li {
    display: inline-block;
}
pre {
    white-space: pre-wrap;
}
.pre {
    background-color: transparent;
    border: none;
}
.shortReview {
	padding-top: 10px;
}
.shortReview p{
	margin: 2px;
}
.shortReview #lesson_star_rate a {
	text-decoration: none;
	color: gray;
	font-size: 13px;
}

#lesson_star_rate a.lessonOn {
	color: red;
}

.lessonSideDiv {
	padding: 15px;
    border: 1px solid #eee;
    position: sticky;
    top: 20px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
        
</head>
<body>
