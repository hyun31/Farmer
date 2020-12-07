<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
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

<style>
	#wrapper {
	width: 55%;
	margin: 0 auto;
	margin-top: 40px
	}

	.table{
	width: 100%;
	height: 150px;
	table-layout: fixed;
	border-bottom: 2px solid grey;
	border-top: 2px solid grey;
	
	}
	
	.table2{
	width: 100%;
	height: 400px;
	table-layout: fixed;
	border-bottom: 2px solid grey;
	border-top: 2px solid grey;
	}
	
	img {
	width: 100% !important;
	height: auto !important;
	}
	
	.title {
	width: 200px;
	font-weight: bold;
	background-color: #f7f7f7;
	}
	
	.title2{
	width: 200px;
	font-weight: bold;
	background-color: #f7f7f7;
	}
	
	h4 {
	margin-bottom: 30px;
	color: grey;
	
	}
</style>
<title>농장 신청 조회</title>
</head>
<body>

<div id="wrapper">
		<div>
			<h2 style="text-align: left;">농장 신청 조회</h2>
		</div>
		<hr>
		<div style="float: right;">
		
		
		<form id="frm" name="frm" method="post">
			<div>
				<h4>기본 정보</h4>
			</div>
			<table class="table">
					<tr>
						<td class="title">농장주 성명</td>
						<td class="content" colspan="4">${farmInfo.FARMER_NAME}</td>
					</tr>
					<tr>
						<td class="title">농장주 연락처</td>
						<td class="content" colspan="4">${farmInfo.FARMER_PHONE }</td>
					</tr>
					<tr>
						<td class="title">농장주 이메일</td>
						<td class="content" colspan="4">${farmInfo.FARMER_EMAIL }</td>
					</tr>
					<tr>
						<td class="title">계약기간</td>
						<td class="content" colspan="4" style="text-align: left;">${farmInfo.CONTRACT_TERM}</td>
					</tr>
					<tr>
						<td class="title">농장명</td>
						<td class="content" colspan="4" style="text-align: left;">${farmInfo.FARM_NM}</td>
					</tr>
					<tr>
						<td class="title">농장 연락처</td>
						<td class="content" colspan="4" style="text-align: left;">${farmInfo.FARM_PHONE}</td>
					</tr>
					<tr>
						<td class="title">농장 주소</td>
						<td class="content" colspan="4" style="text-align: left;">${farmInfo.ADDRESS}</td>
					</tr>
			</table>
			
			<div>
				<h4>농장 정보</h4>
			</div>
			<table class="table table2" style="margin-bottom: 100px;">
				<tr>
					<td class="title2">신청 구획수</td>
					<td class="content" colspan="4" style="text-align: left;">${farmInfo.GARDEN_CNT}</td>
				</tr>
				<tr>
					<td class="title2">농장 설명</td>
					<td class="content" colspan="4" style="text-align: left;">${farmInfo.FARM_INFO}</td>
				</tr>
				<tr>
					<td class="title2">토지대장사진</td>
					<td class="content" colspan="4"><img src="http://localhost:8090/devD/resources/upload/${farmInfo.LAND_SAVE_FILE_NAME }"></td>
				</tr>
			</table>
	</form>
	</div>
	</div>
	<script>
	/* document.querySelector('ul#sidebar li:nth-child(4) div').style.backgroundColor = "#343a40";
	document.querySelector('ul#sidebar li:nth-child(4) p').style.fontWeight = "bold"; */
	</script>
</body>
</html>