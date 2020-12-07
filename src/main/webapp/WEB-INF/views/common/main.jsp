<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아임파머스</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/template/assets/img/farmer_ic.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href='${contextPath}/resources/template/css/styles.css' rel='stylesheet' />
        <script	src="https://kit.fontawesome.com/f87cff2a76.js" crossorigin="anonymous"></script>
    </head>
    <style>
    	hr.divider {
    		max-width: 90px;
    		border-width: 0.01rem;
    		border-color: lightgray;
    	}
    	.dropdown-item {
    		padding: 0.25rem 0.7rem;
    	}
    	.dropdown-menu {
    		min-width: 0.7rem;
    		font-size: 14.4px;
    	}
    </style>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">아임파머스</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto my-2 my-lg-0">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">사이트소개</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/ep/ep001_d001/init.do">농장분양</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=01">장터</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">추천농작물</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="${contextPath}/hp/hp001_d001.do">고객센터</a></li>
                        <li class="nav-item dropdown"  style="line-height:5px;">
	                        <c:if test="${user != null}"> 
	                        	<a class="nav-link badge badge-pill badge-warning dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" 
	                        	aria-expanded="false" style="padding: 3px 10px 3px 10px; color: white; background-color: #e36b47; text-decoration: underline; cursor: pointer;">
	                        		${user.USER_NM }님
	                        	</a>
	                        	<div class="dropdown-menu">
		                        	<c:if test="${user.USER_TYPE != 3}">
		            					<a class="dropdown-item" href="${contextPath}/cp/cp001_d005/joinInit.do">마이페이지</a>
		            				</c:if>
			            			<c:if test="${user.USER_TYPE == 3}">
			            				<a class="dropdown-item" href="${contextPath}/admin.do">관리자페이지</a>
			            			</c:if>
									<hr class="divider my-2"> 
									<a class="dropdown-item" href="${contextPath}/ap/ap001_d001/logout.do">로그아웃</a> 
								</div> 
	                        </c:if>
	 						<c:if test="${user == null }">	                       	
	                       		<a class="nav-link badge badge-pill badge-warning" style="padding: 3px 10px 3px 10px; color: white; background-color: #e36b47;" href="${contextPath}/ap/ap001_d001/loginInit.do">시작하기</a>
	                       	</c:if>
						</li>                       	
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end">
                        <h1 class="text-uppercase text-white font-weight-bold">아임파머스에 오신 것을 환영합니다!</h1>
                        <hr class="divider my-4" />
                    </div>
                    <div class="col-lg-8 align-self-baseline">
                        <p class="text-white-75 font-weight-light mb-5">아임파머스에서 나만의 작은 농장을 만들어 키워나가 보세요.</p>
                        <a class="btn btn-primary btn-xl js-scroll-trigger" href="${contextPath}/ip/ip001_d001/calendarInit.do">시작하기</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- 사이트소개-->
        <section class="page-section bg-primary" id="about">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="text-white mt-0">나만의 텃밭을 가꾸어 보세요.</h2>
                        <hr class="divider light my-4" />
                        <p class="text-white-50 mb-4">바쁜 일상속 작은 나만의 텃밭을 관리해서 건강한 식탁을 만들어보세요!<br> 아임파머스는 농장주의 대리관리를 통해 텃밭관리를 받을 수 있어 쉽게 텃밭관리를 해볼 수 있습니다.</p>
                        <a class="btn btn-light btn-xl js-scroll-trigger" href="${contextPath}/ep/ep001_d002/init.do">분양신청 하러 가기</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <h2 class="text-center mt-0">아임파머스란?</h2>
                <hr class="divider my-4" />
                <div class="row">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <!-- <i class="fas fa-4x fa-gem text-primary mb-4"></i> -->
                            <h3 class="h4 mb-2"></h3>
                            <p class="text-muted mb-0"></p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
                            <h3 class="h4 mb-2">농장주</h3>
                            <p class="text-muted mb-0">소유하고 계신 농장의 텃밭을<br> 아임파머스에 등록하시면<br> 텃밭 분양과 관리를 해드립니다.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <i class="fas fa-4x fa-globe text-primary mb-4"></i>
                            <h3 class="h4 mb-2">소비자</h3>
                            <p class="text-muted mb-0">원하는 농장에 나만의 텃밭을 고르고<br>아임파머스를 통해 언제어디서든<br>새로운 것들을 심고 수확해보세요.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <!-- <i class="fas fa-4x fa-heart text-primary mb-4"></i> -->
                            <h3 class="h4 mb-2"></h3>
                            <p class="text-muted mb-0"></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/01.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/01.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">경기도 용인시</div>
                                <div class="project-name">커피농장</div>
                                <div class="project-category text-white-50">02-1234-5678</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/02.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/02.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">경기도 과천시</div>
                                <div class="project-name">해피농장</div>
                                <div class="project-category text-white-50">02-1234-5678</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/03.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/03.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">경기도 여주시</div>
                                <div class="project-name">꽃잎농장</div>
                                <div class="project-category text-white-50">02-1234-5678</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/04.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/04.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">경기도 안산시</div>
                                <div class="project-name">서해농장</div>
                                <div class="project-category text-white-50">02-1234-5678</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/05.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/05.jpg" alt="" />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">경기도 화성시</div>
                                <div class="project-name">슈퍼팜</div>
                                <div class="project-category text-white-50">02-1234-5678</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="${contextPath}/resources/template/assets/img/portfolio/fullsize/06.jpg">
                            <img class="img-fluid" src="${contextPath}/resources/template/assets/img/portfolio/thumbnails/06.jpg" alt="" />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">강원도 춘천시</div>
                                <div class="project-name">우설농장</div>
                                <div class="project-category text-white-50">02-2009-1466</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call to action-->
        <section class="page-section bg-dark text-white">
            <div class="container text-center">
                <h2 class="mb-4">현재 아임파머스는<br> 각 지역 농장의 농부님들과 소통하며 여러 농장을 관리하고 있습니다.</h2>
                <a class="btn btn-light btn-xl" href="https://startbootstrap.com/themes/creative/">아임파머스 이용후기</a>
            </div>
        </section>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="mt-0">아임파머스 고객센터</h2>
                        <hr class="divider my-4" />
                        <p class="text-muted mb-5">평일 오전 9시 ~ 오후 18시<br> 주말 오전 9시 ~ 오후 15시<br>일요일 및 공휴일 휴무</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                        <div>1466-1466</div>
                    </div>
                    <div class="col-lg-4 mr-auto text-center">
                        <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                        <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                        <a class="d-block" href="mailto:imfarmers1466@gmail.com">imfarmers1466@gmail.com</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container"><div class="small text-center text-muted">Copyright © 202009 - BitCamp imfarmers</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/template/js/scripts.js"></script>
    </body>

</html>