<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>아임파머스</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/template/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- Third party plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<%-- <link href='${contextPath}/resources/template/css/styles.css' rel='stylesheet' /> --%>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<link href='${contextPath}/resources/template/css/styles.css' rel='stylesheet' />
</head>
<style>
	#user_controller .navbar-brand {
		font-size: 1rem;
		margin: 0;
	}
	
	nav .navbar-brand {
		color: white;
	}
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	#user_controller {
		padding: 4px;
		float: right;
	}
	
	.dropdown-item :active {
		background-color: green;
	}
	
	.dropdown-menu {
   		min-width: 10rem;
   		font-size: 14.4px;
   		line-height: 20px;
    }
    
   	#navbarDropdownMenuLink{
    	color: white;
    	font-weight: 500;
    	padding-top: 15px;
    	float: right;
    	
    }
    a.navbar-brand {
    	color: white !important;
    	font-weight: bold;
    	font-size: 25px;
    }
    div.navbar-collapse {
    	text-align: right;
    	float: right;
    }
    nav.navbar {
    	display: block;
    } 
    hr.divider {
    	max-width: 90px;
    	border-width: 0.01rem;
    	border-color: lightgrey;
    }
    a.dropdown-item {
    	padding: 0.7rem 0.7rem;
    }
    a.dropdown-menu {
    	min-width: 0.1rem;
    	font-size: 14.4px;
    	line-height: 5px;
    }
    #mainNav {
    	background-color: #f4623a !important;
    }
    li.nav-item a {
    	font-size: 15px !important;
    }
</style>
<body>

<nav class="navbar navbar-expand-lg navbar-light py-2" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="${contextPath}/main.do">아임파머스</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                      <!--   <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">사이트소개</a></li> -->
                        
                        <!-- 농장분양 -->
                         <li class="nav-item dropdown">
	                         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
	                         role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농장분양</a>
		                        	<div class="dropdown-menu">
										  	<a class="dropdown-item" href="${contextPath}/ep/ep001_d001/init.do">전체 농장정보</a>
										  	<div class="dropdown-divider"></div>										  	
										  	<a class="dropdown-item" href="${contextPath}/ep/ep001_d002/init.do">텃밭 분양신청</a>
										  	<c:if test="${user.USER_TYPE != null}">
										    <a class="dropdown-item" href="${contextPath}/ep/ep001_d003/init.do">텃밭 연장신청</a>
										    <div class="dropdown-divider"></div>
										    <a class="dropdown-item" href="${contextPath}/ep/ep001_d004/init.do">텃밭 상품구매</a>
										    <a class="dropdown-item" href="${contextPath}/ep/ep001_d005/init.do">텃밭 수확결제</a>
										    </c:if>
									</div> 
									
						<!-- 농장관리 -->
						<c:if test="${user.USER_TYPE == 2 || user.USER_TYPE == 3 }">
							<li class="nav-item dropdown">
								 
		                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
		                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">농장관리</a>
			                    	<div class="dropdown-menu">
										<a class="dropdown-item" href="${contextPath}/jp/jp001_d001/init.do">내농장정보</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="${contextPath}/jp/jp001_d002/init.do">농장상품관리</a>
										<a class="dropdown-item" href="${contextPath }/jp/jp001_d003/init.do">고객주문내역</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="${contextPath}/fp/fp001_d001/notifications.do">농장알림사항</a>
									</div> 
						</c:if>
								
                        <!-- 장터 -->
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">장터</a>
                        <div class="dropdown-menu">
									  	<a class="dropdown-item" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=01">교환하기</a>
									  	<a class="dropdown-item" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=02">나눔하기</a>
									  		<div class="dropdown-divider"></div>		
									    <a class="dropdown-item" href="#">자랑하기</a>
								</div> 
                        
                        <!-- 추천 농작물 -->
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/gp/gp001_d001_growmain.do">추천농작물</a></li>
                        
                        <!-- 고객센터 -->
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        고객센터
                        </a>
                        <div class="dropdown-menu">
									  	<a class="dropdown-item" href="${contextPath}/hp/hp001_d006">자주하는질문</a>
									  	<a class="dropdown-item" href="${contextPath}/hp/hp001_d001">공지사항</a>
									    <a class="dropdown-item" href="${contextPath}/hp/hp001_d004">질문게시판</a>
									    <a class="dropdown-item" href="${contextPath}/hp/hp001_d003">분양문의</a>
									    <a class="dropdown-item" href="${contextPath}/hp/hp001_d002">농장등록문의</a>
									    <c:if test="${user.USER_TYPE != null}">
									  		<div class="dropdown-divider"></div>
									  	
									    <a class="dropdown-item" href="${contextPath}/hp/hp001_d007/insertInit.do">농장등록신청</a>
									    </c:if>
								</div> 
								
						<!-- 로그인상태 아이콘 -->	
                        <li class="nav-item dropdown" style="line-height:5px;">
	                        <c:if test="${user != null}"> 
	                        	<a class="nav-link badge badge-pill badge-warning dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" 
	                        	aria-expanded="false" style="padding: 3px 10px 3px 10px; color: white; background-color: #343a40; cursor: pointer;">
	                        		${user.USER_NM }님
	                        	</a>
	                        	<div class="dropdown-menu">
	                        		<c:if test="${user.USER_TYPE == 1 }">
									  	<a class="dropdown-item" href="">내 텃밭 정보</a>
									  	<a class="dropdown-item" href="${contextPath}/ip/ip001_d001/calendarInit.do">텃밭 캘린더</a>
									</c:if>
									  <c:if test="${user.USER_TYPE == 2 }">
									  	<a class="dropdown-item" href="">내 농장 정보</a>
									  	<a class="dropdown-item" href="${contextPath}/ip/ip001_d001/calendarInit.do">농장 캘린더</a>
									  </c:if>
									  <c:if test="${user.USER_TYPE != 3}">
									    <hr class="divider my-2">
									    <a class="dropdown-item" href="${contextPath}/cp/cp001_d005/joinInit.do">마이페이지</a>
									    <a class="dropdown-item" href="#">결제내역</a>
									    <a class="dropdown-item" href="#">1:1문의</a>
									  </c:if>
									  <c:if test="${user.USER_TYPE == 3}">
									    <a class="dropdown-item" href="${contextPath}/admin.do" style="color: #f4623a; font-weight: bold;">관리자페이지</a>
									  </c:if>
									    <hr class="divider my-2"> 
									    <a class="dropdown-item" href="${contextPath}/ap/ap001_d001/logout.do">로그아웃</a>
								</div> 
	                        </c:if>
	 						<c:if test="${user == null }">	                       	
	                       		<a class="nav-link badge badge-pill badge-warning" style="padding: 3px 10px 3px 10px; color: white; background-color: #343a40;" href="${contextPath}/ap/ap001_d001/loginInit.do">시작하기</a>
	                       	</c:if>
						</li>                       	
                    </ul>
                </div>
            </div>
        </nav>
        
        

	<%-- <nav class="navbar navbar-expand-lg navbar navbar-light shadow-sm" style="background-color: #f4623a; padding: .5rem 425px .5rem 330px;">
		<a class="navbar-brand" href="${contextPath}/main.do">
		<!-- 메인로고 -->
		 <img src="${contextPath}/resources/image/farmer_ic.ico" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy" style="margin-top: 4px;">
		아임파머스</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<!-- 로그인상태 아이콘 -->
<div class="btn-group" id="user_controller">
 <c:if test="${user != null}"> 
  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" 
  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border-radius: 25px; background-color: #343a40; border-color:#343a40; margin: 7px 0px 0px 13px;">${user.USER_NM }님</button>
  
  <div class="dropdown-menu dropdown-menu-right">
  <c:if test="${user.USER_TYPE == 1 }">
  	<a class="dropdown-item" href="">내 텃밭 정보</a>
  	<a class="dropdown-item" href="${contextPath}/ip/ip001_d001/calendarInit.do">텃밭 캘린더</a>
  </c:if>
  <c:if test="${user.USER_TYPE == 2 }">
  	<a class="dropdown-item" href="">내 농장 정보</a>
  	<a class="dropdown-item" href="${contextPath}/ip/ip001_d001/calendarInit.do">농장 캘린더</a>
  </c:if>
  <c:if test="${user.USER_TYPE != 3}">
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="${contextPath}/cp/cp001_d005/joinInit.do">마이페이지</a>
    <a class="dropdown-item" href="#">결제내역</a>
    <a class="dropdown-item" href="#">1:1문의</a>
  </c:if>
  <c:if test="${user.USER_TYPE == 3}">
    <a class="dropdown-item" href="${contextPath}/admin.do" style="color: #f4623a; font-weight: bold;">관리자페이지</a>
  </c:if>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="${contextPath}/ap/ap001_d001/logout.do">로그아웃</a>
  </div>
  </c:if>
    <c:if test="${user == null }">
  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" 
  data-toggle="dropdown" arias-haspopup="true" aria-expanded="false" style="border-radius: 25px; background-color: #343a40; border-color:#343a40; margin: 7px 0px 0px 13px;" onclick="location.href='${contextPath}/ap/ap001_d001/loginInit.do'">시작하기</button>
  </c:if>
</div> 
		<div class="navbar-collapse" id="navbarNavDropdown" >
			<ul class="navbar-nav">
			<!-- 농장관리 -->
					<li class="nav-item dropdown">
					<c:if test="${user.USER_TYPE == 2 || user.USER_TYPE == 3}">
						<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">농장관리</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${contextPath}/jp/jp001_d001/init.do">내농장정보</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${contextPath}/jp/jp001_d002/init.do">농장상품관리</a>
							<a class="dropdown-item" href="${contextPath }/jp/jp001_d003/init.do">고객주문내역</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">농장알림게시판</a>
						</div>
					</c:if>
				</li>
				
				<!-- 농장분양 -->
				<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false" style="">농장분양</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="${contextPath}/ep/ep001_d001/init.do">전체농장정보</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${contextPath}/ep/ep001_d002/init.do">농장/텃밭 분양신청</a>
							<c:if test="${user.USER_TYPE == 1 }">
							<a class="dropdown-item" href="${contextPath}/ep/ep001_d003/init.do">농장/텃밭 연장신청</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${contextPath}/ep/ep001_d004/init.do">씨앗/모종 상품구매</a>
							<a class="dropdown-item" href="${contextPath}/ep/ep001_d005/init.do">수확/기타 상품결제</a>
							</c:if>
						</div>
						</li>
						
				<!-- 장터 -->
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=${board_cd}"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 장터 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=01">교환하기</a>
						<a class="dropdown-item" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=02">나눔하기</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">자랑하기</a>
					</div>
				</li>
				
				<!-- 추천농작물 -->
				<li class="nav-item">
				<a class="nav-link" id=navbarDropdownMenuLink href="#"> 추천농작물 </a></li>
				
				<!-- 고객센터 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">고객센터</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">자주하는질문</a> 
						<a class="dropdown-item" href="#">공지사항</a> 
						<a class="dropdown-item" href="#">질문게시판</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="${contextPath}/hp/hp001_d004/insertInit.do">농장등록신청</a>
					</div>
				</li>
			</ul>
		</div>
	</nav> --%>
</body>
</html>