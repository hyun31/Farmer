<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>아임파머스관리자</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- FONTS and ICONS -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500|Poppins:400,500,600,700|Roboto:400,500"
	rel="stylesheet" />
<link
	href="https://cdn.materialdesignicons.com/3.0.39/css/materialdesignicons.min.css"
	rel="stylesheet" />

<!-- SLEEK STYLE FILE -->
<link id="sleek-css" rel="stylesheet"
	href="${contextPath}/resources/sleekdashboard/assets/css/sleek.min.css" />
	<style>
		.content-wrapper {
			margin: 0 auto;
			width: 90%;
			padding-top: 10px;
		}
		#table tbody tr td {
			color : black;
		}
	</style>
</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light" id="body">
	<div id="toaster"></div>
	<div class="wrapper">
		<!-- Github Link -->
		<a href="https://github.com/oriyou" target="_blank"
			class="github-link"> <svg width="70" height="70"
				viewBox="0 0 250 250" aria-hidden="true">
        <defs>
          <linearGradient id="grad1" x1="0%" y1="75%" x2="100%" y2="0%">
            <stop offset="0%" style="stop-color:#896def;stop-opacity:1" />
            <stop offset="100%"
					style="stop-color:#482271;stop-opacity:1" />
          </linearGradient>
        </defs>
        <path d="M 0,0 L115,115 L115,115 L142,142 L250,250 L250,0 Z"
					fill="url(#grad1)"></path>
      </svg> <i class="mdi mdi-github-circle"></i>
		</a>

		<!--
          ====================================
          ——— LEFT SIDEBAR
          =====================================
        -->
		<aside class="left-sidebar bg-sidebar">
			<div id="sidebar" class="sidebar">
				<!-- Aplication Brand -->
				<div class="app-brand">
					<a href="${contextPath}/admin.do" title="Sleek Dashboard"> <svg
							class="brand-icon" xmlns="http://www.w3.org/2000/svg"
							preserveAspectRatio="xMidYMid" width="30" height="33"
							viewBox="0 0 30 33">
                  <g fill="none" fill-rule="evenodd">
                    <path class="logo-fill-blue" fill="#7DBCFF"
								d="M0 4v25l8 4V0zM22 4v25l8 4V0z" />
                    <path class="logo-fill-white" fill="#FFF"
								d="M11 4v25l8 4V0z" />
                  </g>
                </svg> <span class="brand-name text-truncate">아임파머스</span>
					</a>
				</div>
				<!-- begin sidebar scrollbar -->
				<div class="sidebar-scrollbar">
					<!-- sidebar menu -->
					<ul class="nav sidebar-inner" id="sidebar-menu">
						<li><a class="sidenav-item-link"
							href="${contextPath}/kp/kp001_d001/searchInit.do"> <i
								class="mdi mdi-account-circle"></i> <span class="nav-text">회원관리</span>
						</a></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#app" aria-expanded="false" aria-controls="app">
								<i class="mdi mdi-clipboard-outline"></i> <span class="nav-text">게시판관리</span>
						</a>
							<ul class="collapse" id="app" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href=""> <span
											class="nav-text">게시판관리</span>
									</a></li>
									<li><a class="sidenav-item-link" href=""> <span
											class="nav-text">게시물통합관리</span>
									</a></li>
								</div>
							</ul></li>
						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#components" aria-expanded="false"
							aria-controls="components"> <i class="mdi mdi-barcode"></i> <span
								class="nav-text">상품관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="components" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="${contextPath}/kp/kp001_d004/init.do"> <span
											class="nav-text">전체상품관리</span>
									</a></li>
									<li><a class="sidenav-item-link" href=""> <span
											class="nav-text">농장별판매상품</span>
									</a></li>
								</div>
							</ul></li>

						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#icons" aria-expanded="false" aria-controls="icons">
								<i class="mdi mdi-forklift"></i> <span class="nav-text">주문관리</span>
								<b class="caret"></b>
						</a>
							<ul class="collapse" id="icons" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="">
											<span class="nav-text">주문통합관리</span>

									</a></li>
									<li><a class="sidenav-item-link" href="">
											<span class="nav-text">배송관리</span>
									</a></li>
								</div>
							</ul></li>

						<li><a class="sidenav-item-link" href=""> <i
								class="mdi mdi-bomb"></i> <span class="nav-text">신고관리</span>
						</a></li>

						<li class="has-sub"><a class="sidenav-item-link"
							href="javascript:void(0)" data-toggle="collapse"
							data-target="#tables" aria-expanded="false"
							aria-controls="tables"> <i class="mdi mdi-gate"></i> <span
								class="nav-text">농장관리</span> <b class="caret"></b>
						</a>
							<ul class="collapse" id="tables" data-parent="#sidebar-menu">
								<div class="sub-menu">
									<li><a class="sidenav-item-link" href="${contextPath}/kp/kp001_d009/listInit.do"> <span
											class="nav-text">전체농장관리</span>
									</a></li>
									<li><a class="sidenav-item-link" href=""> <span
											class="nav-text">농장신청/연장관리</span>
									</a></li>
									<li><a class="sidenav-item-link" href="${contextPath}/kp/kp001_d009/insertInit.do"> <span
											class="nav-text">농장등록</span>
									</a></li>
								</div>
							</ul>
							</li>

						<li>
							<a class="sidenav-item-link" href=""> 
							<i class="mdi mdi-calendar-blank"></i>
							<span class="nav-text">일정관리</span>
							</a>
						</li>
				</div>
			</div>
			</aside>
			<div class="page-wrapper">
				<!-- Header -->
				<header class="main-header " id="header">
					<nav class="navbar navbar-static-top navbar-expand-lg">
						<!-- Sidebar toggle button -->
						<button id="sidebar-toggler" class="sidebar-toggle">
							<span class="sr-only">Toggle navigation</span>
						</button>
						<!-- search form -->
						<div class="search-form d-none d-lg-inline-block">
							<div class="input-group"></div>
							<div id="search-results-container">
								<ul id="search-results"></ul>
							</div>
						</div>

						<div class="navbar-right ">
							<ul class="nav navbar-nav">
								<li class="dropdown notifications-menu">
									<button class="dropdown-toggle" data-toggle="dropdown">
										<i class="mdi mdi-bell-outline"></i>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<li class="dropdown-header">You have 5 notifications</li>
										<li><a href="#"> <i class="mdi mdi-account-plus"></i>
												New user registered <span
												class=" font-size-12 d-inline-block float-right"><i
													class="mdi mdi-clock-outline"></i> 10 AM</span>
										</a></li>
										<li><a href="#"> <i class="mdi mdi-account-remove"></i>
												User deleted <span
												class=" font-size-12 d-inline-block float-right"><i
													class="mdi mdi-clock-outline"></i> 07 AM</span>
										</a></li>
										<li><a href="#"> <i class="mdi mdi-chart-areaspline"></i>
												Sales report is ready <span
												class=" font-size-12 d-inline-block float-right"><i
													class="mdi mdi-clock-outline"></i> 12 PM</span>
										</a></li>
										<li><a href="#"> <i
												class="mdi mdi-account-supervisor"></i> New client <span
												class=" font-size-12 d-inline-block float-right"><i
													class="mdi mdi-clock-outline"></i> 10 AM</span>
										</a></li>
										<li><a href="#"> <i
												class="mdi mdi-server-network-off"></i> Server overloaded <span
												class=" font-size-12 d-inline-block float-right"><i
													class="mdi mdi-clock-outline"></i> 05 AM</span>
										</a></li>
										<li class="dropdown-footer"><a class="text-center"
											href="#"> View All </a></li>
									</ul>
								</li>
								<li class="right-sidebar-in right-sidebar-2-menu"><i
									class="mdi mdi-settings mdi-spin"></i></li>
								<!-- User Account -->
								<li class="dropdown user-menu">
									<button href="#" class="dropdown-toggle nav-link"
										data-toggle="dropdown">
										<img
											src="${contextPath}/resources/sleekdashboard/assets/img/dongdong2.jpg"
											class="user-image" alt="User Image" /> <span
											class="d-none d-lg-inline-block">아임파머스</span>
									</button>
									<ul class="dropdown-menu dropdown-menu-right">
										<!-- User image -->
										<li class="dropdown-header"><img
											src="${contextPath}/resources/sleekdashboard/assets/img/dongdong2.jpg"
											class="img-circle" alt="User Image" />
											<div class="d-inline-block">
												아임파머스 <small class="pt-1">imfarmers1466@gmail.com</small>
											</div></li>

										<li><a href="user-profile.html"> <i
												class="mdi mdi-account"></i> My Profile
										</a></li>
										<li><a href="#"> <i class="mdi mdi-email"></i>
												Message
										</a></li>
										<li><a href="#"> <i class="mdi mdi-diamond-stone"></i>
												Projects
										</a></li>
										<li class="right-sidebar-in"><a href="javascript:0">
												<i class="mdi mdi-settings"></i> Setting
										</a></li>

										<li class="dropdown-footer"><a href="${contextPath}/ap/ap001_d001/logout.do"> <i
												class="mdi mdi-logout"></i> Log Out
										</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</nav>
				</header>
				<div class="content-wrapper">
					<tiles:insertAttribute name="content" />
				</div>
				<footer class="footer mt-auto">
					<div class="copyright bg-white">
						<p>
							&copy; <span id="copy-year">2020</span> Copyright IMFARMERS
						</p>
					</div>
					<script>
                var d = new Date();
                var year = d.getFullYear();
                document.getElementById("copy-year").innerHTML = year;
            </script>
				</footer>
			</div>
	</div>
	<script src="${contextPath}/resources/sleekdashboard/assets/plugins/jquery/jquery.min.js"></script>
	<script src="${contextPath}/resources/sleekdashboard/assets/js/sleek.bundle.js"></script>
	<script src="${contextPath}/resources/sleekdashboard/assets/plugins/nprogress/nprogress.js"></script>
	<script src="${contextPath}/resources/sleekdashboard/assets/plugins/slimscrollbar/jquery.slimscroll.min.js"></script>
	<script src="${contextPath}/resources/sleekdashboard/assets/plugins/jekyll-search.min.js"></script>
</body>
</html>