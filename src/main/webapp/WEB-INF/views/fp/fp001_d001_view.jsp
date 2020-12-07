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
	}
	.table img {
		width: 100% !important;
		height: auto !important;
	}
</style>
<title>게시글 보기</title>
</head>
<body>

<div id="wrapper">
		<div>
			<h2 style="text-align: left;">상세글보기</h2>
		</div>
		<hr>
		<div style="float: right;">
		
		
		<button onclick="fp_chat()" id="update" class="btn btn-primary pull-right"
			style="background-color: #e36b47; color: white; margin-left: 5px; margin-bottom: 8px;">거래하기</button>
		
		<c:if test="${user.USER_ID == viewArticles.writer_id }">
			<button onclick="fp_updateBoard()" id="update" class="btn btn-primary pull-right"
			style="background-color: #e36b47; color: white; margin-left: 5px; margin-bottom: 8px;">수정</button>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
			style="background-color: #e36b47; color: white; margin-left: 5px; margin-bottom: 8px;">삭제</button>
		</c:if>
		
		<button type="button" onclick="fp_openBoardList()" class="btn btn-primary pull-right"
		style="background-color: #e36b47; color: white; margin-left: 5px; margin-bottom: 8px;">목록</button>
		</div>
		<form id="frm" name="frm" method="post">
		<!-- submit할 때 가지고 가는 값, 그래서 폼 안에 있어야함 -->
		 <input type="hidden" name="article_no" value="${viewArticles.article_no}">
		 <input type="hidden" name="article_nm" value="${viewArticles.article_nm}">
		 <input type="hidden" name="local_no" value="${viewArticles.local_no }">
		 <input type="hidden" name="trans_no" value="${viewArticles.trans_no }">
		 <input type="hidden" name="board_cd" value="${viewArticles.board_cd }">
		 <input type="hidden" name="writer_id" value="${viewArticles.writer_id }">
			<table class="table">
				<!--  border="2" -->
				<thead>
				
					<tr>
						<td style="background-color: #dee2e6; width: 120px;">구분</td>
						<td style="width: 140px;">${viewArticles.board_nm}</td>
						
						<td style="background-color: #dee2e6; width: 120px;">지역</td>
						<td style="width: 140px;">${viewArticles.local_nm }</td>
						<td style="background-color: #dee2e6; width: 120px;">거래방법</td>
						<td style="width: 140px;">${viewArticles.trans_nm }</td>
					</tr>

					<tr>
						<td style="background-color: #dee2e6; width: 120px;">제목</td>
						<td colspan="5" style="text-align: left;">${viewArticles.article_nm}</td>
					</tr>



					<tr>
						<td style="background-color: #dee2e6; width: 250px; height: 500px;">내용</td>
						<td colspan="5" style="text-align: left;">${viewArticles.article_content }</td>
					</tr>
					
				</thead>
			</table>
		</form>
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
	
	</script>
	
</body>
</html>