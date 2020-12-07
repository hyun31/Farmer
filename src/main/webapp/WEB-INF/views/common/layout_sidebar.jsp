<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon-->
	<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/template/assets/img/favicon.ico" />
	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
body {
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	height: 100%;
}
#container {
	width: 100%;
	min-height: 100%;
	margin: 0;
	/* text-align: center; */
	border: 0px solid #bcbcbc;
	
}

#header {
	padding: 0;
	/* z-index: 1050; */
}

#content {
	position: relative;
	width: 100%;
	margin: 0 auto;
	min-height: 900px;
	padding-bottom: 30px;
}

#footer {
	position: absolute;
	left: 0;
	right: 0;
    width:100%;
    height: 115px;
    background-color: #f8f9fa;
    color: #6c757d;
    text-align: center;
}
#sidebar {
	position:fixed;
	width: 66px;
	top: 160px;
    left: 17%;
	text-align: center;
	z-index: 2;
}
#sidebar ul {
	padding: 0;
}
#sidebar p {
	font-size: 13px;
	margin: 0;
}
#sidebar ul li {
	display: inline-block;
	text-align: center;
	list-style: none;
	padding: 5px;
}
div.top {
	border-radius : 50%;
	background-color: #f4623a;
	color: white;
	height: 33px;
	width: 33px;
	cursor: pointer;
	line-height: 33px;
}         
.circle {
	border-radius : 50%;
	background-color: #A6A6A6;
	height: 60px;
	width: 60px;
	cursor: pointer;
	line-height: 59px;
	white-space: pre;
}
svg {
	color: white;
}
.circle.selected {
	background-color: #343a40;  
}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="sidebar">
			<tiles:insertAttribute name="sidebar" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>