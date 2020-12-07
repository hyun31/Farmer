<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	.article_wrap {
		position: relative;
		width: 50%;
		margin: 0 auto;
		fon-size: 12px;
		margin-top: 40px;
	}
	
	div {
		display : block;
	}
	
	a {
		text-decoration: none;
		font-color: gray;
	}
	
	.ArticleTopBtns {
		padding: 0 0 0px;
	}
	
	
	.BaseButton {
		margin-left: 0;
		max-width: 50px;
		height: 36px;
		padding: 0 11px;
		font-size: 14px;
		line-height: 36px;
		border: 1px solid #f4623a;
		background: #f4623a;
		color: white;
		display: inline-block;
		border-radius: 6px;
		box-sizing: border-box;
		font-weight: 700;
		text-align: center;
		verical-align: top;
		margin-bottom: 5px;
	}
	
	
	.ProductImage {
		float: left;
		position: relative;
		margin-right: 30px;
	}
	
	.ProductCategory {
		margin-bottom: 7px;
		font-size: 14px;
		color: gray;
	}
	
	.SaleLabel {
	 color: #f4623a;
	 font-weight: 500;
	 float: left;
	 margin-right: 5px;
	 line-height: 30px;
	 font-size: 27px;
	}
	
	div .ProductName {
		margin-bottom: 6px;
		font-size: 22px;
	}
	
	em {
		font-style: normal;
		
	}
	
	body button dd dl dt h1, h2, h3, h4, h5, h6 {
		margin: 0;
		padding: 0;
	}
	
 	.list_title {
		width: 70px;
		font-size: 16px;
		line-height: 25px;
		text-align: left;
		font-wegiht: 400;
		color: gray;
	}
	 
	 
	 .list_detail {
	 	position: relative;
	 	padding: 0 0 110x;
	 	vertical-align: top;
	 	word-break: break-all;
	 	font-size: 17px;
	 	line-heihgt: 17px;
	 	box-sizing: border-box;
	 }
	 
	 .section {
	 	margin-top: 40px;
	 	padding-top: 30px;
	 	padding-bottom: 3px;
	 	border-top: 1px solid lightgray;
	 	border-bottom: 1px solid lightgray;
	 	margin-bottom: 13px;
	 	
	 }
	 
	 .article_header {
	 	position: relative;
	 	margin-bottom: 15px;
	 	padding-bottom: 15px;
	 	border-bottom: 3px solid #f4623a;
	 }
	 
	 .ArticleContentBox {
	 	padding: 29px 29px 0;
	 	border: 1px solid lightgray;
	 	border-radius: 6px;
	 }
	 
	.thumb {
	float: left;
	margin-right: 5px;
	}
	 
	 img {
	 	vertical-align: top;
	 	margin-top: 40px;
	 }
	 
	 img[Attributes Style] {
	 	width: 36px;
	 	height: 36px;
	 }
	 
	 .nickname {
	 	margin-right: 6px;
	 	font-size: 13px;
	 	font-weight: 700;
	 	display: inline-block;
	 	position: relative;
	 	vertical-align: top;
	 }
	 
	 .link_talk {
	 	display: inline-block;
	 	min-width: 60px;
	 	height: 20px;
	 	margin-top: -3px;
	 	line-heihgt: 25px;
	 	font-size: 12px;
	 	border-radius: 6px;
	 	box-sizing: border-box;
	 	font-weight: 700px;
	 	text-align: center;
	 	verical-align: top;
	 	background: lightgray;
	 	color: black;
	 }
	 
	 
	 em .nick_lever {
	 	display : inline-block;
	 	margin-right: 6px;
	 	font-size: 13px;
	 	vertical-align: top;
	 	color: gray;
	 }
	 
	 dt {
	 float: left;
	 margin-right: 10px;
	 }
	 
	 .btn_commerce_status {
	 	display: block;
	 	width: 350px;
	 	height: 46px;
	 	font-size: 16px;
	 	line-height: 42px;
	 	border-radius: 6px;
	 	box-sizing: border-box;
	 	font-weight: 700;
	 	text-align: center;
	 	vertical-align: top;
	 	border: 1px solid #343a40;
	 	background: #343a40;
	 	color: white;
	 	margin-right: 5px;
	 }
	 
	 
	 .fa-comment-dots {
		color: #f4623a;
		margin-right: 5px;
	 }
	 .writerInfo {
		 float: left;
		 margin-right: 5px;
	 }
	 
	 .date {
	 	margin-right: 8px;
	 	color: gray;
	 }
	 
	 .count {
	 	margin-right: 8px;
	 	color: gray;
	 }
	 
	 .ArticleTool {
	 	position: relative;
	 	font-size: 13px;
	 	display: inline-block;
	 }
	 
	 .nick_level {
		display: inline-block;
		min-width: 51px;
		height: 20px;
		margin-top: 2px;
		font-size: 13px;
		border-radius: 6px;
		box-sizing: border-box;
		font-weight: 700;
		text-align: center;
		vertical-align: top;
		background: #343a40;
		color: white;
		float: left;
	 }
	 
	 .content_detail {
		padding-left: 29px;
		padding-right: 29px;
		border-radius: 0;
		border: 1px solid #ebecef;
		background-color: #f9f9f9;
		font-size: 14px;
		line-height: 23px;
		color: #323232;
		word-break: break-all;
		border-radius: 6px;
		margin: 10px auto 20px;
	 }
	 
	 .content_text {
	 	margin-top: 10px;
	 }
	 
	 .left_area {
	 	float: left;
	 }
 
	 .right_area {
	 	margin-left: 783px;
	 }
	 
	 .product_area {
	 	width: 354px;
	 	float: right;
	 }
	 
	 .market_span {
	 	color: gray;
	 }
	 
	.ArticleTitle a {
		text-decoration: none;
		color: gray;
	 }
	 
	 .ArticleTitle a:hover{
		text-decoration: underline;
		color: #f4623a;
	 }
	 
	.FormNoticeContent {
		margin: 12px 0;
		padding-left: 29px;
		padding-right: 29px;
		border-radius: 0;
		padding: 20px 24px;
		border: 1px solid #ebecef;
		background-color: #f9f9f9;
		font-size: 14px;
		line-height: 14px;
		color: #323232;
		word-break: break-all;
		white-space: pre-wrap;
		border-radius: 6px;
		margin: 10px auto 30px;
	}
	
	.form-control {
		height: 47px;
		width: 147px;
	}
	
	hr {
		margin-top: 4rem;
	}
	
	p {
		margin-top: 9px;
		margin-bottom: 10px;
		line-height: 19px;
	}
	
	.detail_info{
		color: gray;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div id="app">
	<div class="Article">
		<!-- article_wrap 시작 -->
		<div class="article_wrap">
			<!-- ArticleTopBtns 시작 -->
			<div class="ArticleTopBtns">
				<div class="left_area">
				<c:if test="${user.USER_ID == viewArticles.writer_id }">
					<a href="#" role="button" id="update" class="BaseButton" onclick="fp_updateBoard()">
						<span class="BaseButton_text">수정</span>
					</a>
					<a href="#" role="button" class="BaseButton" data-toggle="modal" data-target="#exampleModal">
						<span class="BaseButton_text">삭제</span>
					</a>
				</c:if>
				</div>
				<div class="right_area">
					<a href="#" role="button" class="BaseButton" onclick="fp_openBoardList()">
						<span class="BaseButton_txt">목록</span>
					</a>
				</div>
			</div>
			<!-- ArticleTopBtns 끝 -->
			<!-- ArticleContentBox 시작 -->
			<div class="ArticleContentBox">
				<div class="article_header">
					<div class="ArticleTitle">
						<div style="margin-bottom: 25px; float: left;">
						<span class="market_span">장터 <i class="fas fa-angle-right" style="color: lightgray;"></i></span>
						<a href="${contextPath}/fp/fp001_d001/articlesInit.do?board_cd=01" class="link_board">
							교환하기
							<!-- 화살표 아이콘 -->
						</a>
						</div>
						<div style="margin-bottom: 25px; margin-left: 620px;">
						<div class="ArticleTool">
						<span class="date"><i class="far fa-clock" style="color: #f4623a; margin-right: 5px;"></i>${viewArticles.reg_date}</span>
						<span class="count"><i class="far fa-eye" style="color: #f4623a; margin-right: 5px;"></i>${viewArticles.read_cnt}</span>
						</div>
						</div>
					<div class="title_area">
						<div class="ProductName">
							<em class="ProductName">
								<span class="SaleLabel">[교환]</span>
								<!-- 토마토 10개랑 감자 10개 교환 원해요. -->
							</em>
							<h3 class="title_text">
								${viewArticles.article_nm}
							</h3>
						
							
						</div>
					</div>
					<div class="WriterInfo">
						<div class="thumb"> 
						<i class="fas fa-hat-cowboy-side" style="color: #f4623a; font-size: 14px;"></i>
						</div>
						<div class="profile_area">
							<div class="profile_info">
								<div class="nick_box">
									<!-- <a id="writerInfodldsan" href="#" role="button" class="nickname" style="float: left;">작성자명</a> -->
									<span class="writerInfo" style="color: gray; font-weight: 500;">${viewArticles.user_nm}(${viewArticles.writer_id})</span>
								</div>
								<!-- <em class="nick_level">농장주<img src="" class="icon_level"></em> -->
								<!-- <a href="" class="link_talk">구매문의</a> -->
							</div>
							<div class="profile_info">
								<span class="date">&nbsp;</span>
							</div>
						</div>
					</div>
					<%-- <div class="ArticleTool">
						<span class="date"><i class="far fa-clock" style="color: lightgray; margin-right: 5px;"></i>${viewArticles.reg_date}</span>
						<span class="count"><i class="far fa-eye" style="color: lightgray; margin-right: 5px;"></i>${viewArticles.read_cnt}</span>
					</div> --%>
				</div>
				<div class="article_container">
					<div class="article_viewer">
						<div class="SaleInfo">
							<div class="product_section">
								<!--  ProductImage 시작 -->
								<div class="ProductImage">
									<div class="product_thmb">
										<img src="http://localhost:8090/devD/resources/upload/${viewArticles.img_nm }"
										width="380" height="380" alt="이미지" class="image">
									</div>
								</div>
								<!--  ProductImage 끝 -->
								<!-- product_area 시작 -->
								<div class="product_area">
									<div class="product_detail">
										<!-- product_detail_box 시작 -->
										<div class="product_detail_box">
											<div class="ProductCategory">
												
											</div>
											<%-- <p class="ProductName">
												<em class="SaleLabel">교환</em>
												<!-- 토마토 10개랑 감자 10개 교환 원해요. -->
												${viewArticles.article_nm}
											</p> --%>
										</div>
										
										<!-- product_detail_box 끝 -->
										<!-- CommerciaDetail 시작 -->
										<div class="CommerciaDetail">
											<div class="section">
												<dl class="detail_list">
													<dt class="list_title">
													판매자
													</dt>
													<dd class="list_detail">
													${viewArticles.user_nm}(${viewArticles.writer_id})
													</dd>
												</dl>
												<dl class="detail_list">
													<dt class="list_title">
													거래 구분
													</dt>
													<dd class="list_detail">
													${viewArticles.board_nm}
													</dd>
												</dl>
												<dl class="detail_list">
													<dt class="list_title">
													거래 지역
													</dt>
													<dd class="list_detail">
													${viewArticles.local_nm }
													</dd>
												</dl>
												<dl class="detail_list">
													<dt class="list_title">
														거래 방법
													</dt>
													<dd class="list_detail">
														<label>${viewArticles.trans_nm }</label>
													</dd>
												</dl>
											</div>
											
											<div class="CommercialDetailSellerInfo">
											
											</div>
										</div>
										<!-- CommerciaDetail 끝 -->
									</div>
									<!-- product_detail 끝 -->
									<div class="PurchaseButton">
										<div class="purchase_chat">
											<div class="btn_purchase">
												
											</div>
										</div>
										
										<div class="purchase_chat">
											<div class="btn_purchase">
												<c:if test="${user.USER_ID == viewArticles.writer_id }">
													<button type="button" class="btn_commerce_status" onclick="chatList()" style="width: 200px; float:left;">
													<i class="fas fa-comment-dots"></i>
													거래 채팅 목록
													</button>
													
													<select id="state" name="local_no" class="form-control" title="">
														<option>판매중</option>
														<option>판매완료</option>
													</select>
												<c:if test="${user.USER_ID != viewArticles.writer_id }">
													
												</c:if>
												</c:if>
												<c:if test="${user.USER_ID != viewArticles.writer_id }">
													<button type="button" class="btn_commerce_status" onclick="chat()">
													<i class="fas fa-comment-dots"></i>
													거래 문의 채팅
													</button>
												</c:if>
											</div>
										</div>
									</div>
									
									<!-- PurchaseButton 끝 -->
									<div class="content_detail">
										<div style="margin-top: 5px;">
											<strong class="content_text" style="color: #f4623a;">
											<i class="fas fa-exclamation-circle" style="color: #f4623a; margin-right: 5px;"></i>거래 채팅이용 시 유의사항
											</strong>
										</div>
										<p class="detail_info">
										처음 거래 문의 시 아임파머스 채팅을 이용해 연락하고 외부 메신저 이용 및 개인 정보 유출에 주의하세요.<br>
										돈을 요구하는 판매자와는 거래하지 말아주세요.
										</p>
								</div> 
								</div>
								<!-- product_area 끝 -->
							</div>
						</div>
						<!-- saleInfo 끝 -->
					</div>
					<!-- article_viewer 끝 -->
				</div>
			</div>
				<!-- ArticleContentBox 끝 -->
			<div class="ArticleBottomBtns">
				<div class="left_area2">
					<div style="border-bottom: 1px solid lightgray; color: white;">aa</div>
						<div class="article_board_content" style="padding: 10px; font-size: 18px;">${viewArticles.article_content }</div>
				</div>
			</div>
			
		</div>
		<!-- article_wrap 끝 -->
		</div>
	</div>
</div>


	<!-- Modal --> 	<!-- 삭제 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalLabel">게시글을 삭제하시겠습니까?</h6>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onClick="fp_deleteBoard()" id="delete">삭제</button>
					</div>
				</div>
			</div>
		</div>

	<form id="frm" name="frm" method="post">
		 <input type="hidden" name="article_no" value="${viewArticles.article_no}">
		 <input type="hidden" name="article_nm" value="${viewArticles.article_nm}">
		 <input type="hidden" name="local_no" value="${viewArticles.local_no }">
		 <input type="hidden" name="trans_no" value="${viewArticles.trans_no }">
		 <input type="hidden" name="board_cd" value="${viewArticles.board_cd }">
		 <input type="hidden" name="writer_id" value="${viewArticles.writer_id }">
	</form>

	<script type="text/javascript">
		function fp_openBoardList() {
			window.location.href = "articlesInit.do?board_cd=${viewArticles.board_cd}";
		}

		function fp_writeBoard() {
			document.frm.action = "articlesInsert.do?board_cd=${viewArticles.board_cd}";
			document.frm.submit();
		}

		function fp_updateBoard() {
			document.frm.action = "updateView.do";
			document.frm.submit();
		}
		
		function fp_chat(){
			document.frm.action = "chat.do";
			document.frm.submit();
		}

		function fp_deleteBoard() {
			document.frm.action = "deleteArticles.do?no=${viewArticles.article_no}&board_cd=${viewArticles.board_cd}";
			document.frm.submit();
		}
		
		// 거래 문의 채팅 버튼 클릭시
		const chat = function(e) {
			window.open('${contextPath}/fp/fp001_d001/chat.do?writer_id=${viewArticles.writer_id}','','width=400, height=620, left=350, top=150')
		}
		// 채팅목록 버튼
		const chatList = function(e) {
			window.open('${contextPath}/fp/fp001_d001/chatList.do','window','width=400, height=620, left=350, top=150, location=no,directories=no,resizable=no,status=no,toolbar=no,menubar=no')
		}
		
	</script>
	
	</body>
	</html>