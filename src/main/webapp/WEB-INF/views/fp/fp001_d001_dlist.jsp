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
<title>게시판목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/image/farmer_ic.ico" />

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
		width: 65%;
		margin: 0 auto;
		margin-top: 40px;
		padding-top: 40px;
		padding: 29px 29px 0;
		border: 1px solid lightgray;
		border-radius: 6px;
	}

       #sidebar {
            position:fixed;
            width: 66px;
            top: 160px;
            left: 17%;
            text-align: center;
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
       		background-color: #e36b47;
       		color: white;
       		height: 33px;
       		width: 33px;
        	cursor: pointer;
        	line-height: 33px;
        }         
        .circle {
        	border-radius : 50%;
       		background-color: lightgray;
       		height: 60px;
       		width: 60px;
       		cursor: pointer;
        	line-height: 59px;
        	white-space: pre;
        }
        .duck {
			overflow: hidden;
			text-overflow: ellipsis;
			width: 100%;
			height: 5px;
			-o-text-overflow: ellipsis;
			-ms-text-overflow: ellipsis;
			white-space: nowrap;
        }
        
        .table td {
        	white-space: nowrap;
        	width: 100%;
        	overflow: hidden;
        }
		
		.table thead th {
			text-align: center;
			font-size: 15px;
		}
		
		.table tbody td {
			text-align: center;
			font-size: 15px;
			overflow: hidden;
			width: 100%;
		}
		
		#write {
		float: right;
		background-color: #f4623a;
		color: white;
		margin-left: 10px;
		margin-bottom: 5px;
		}
		
		#write:hover {
			color: #f4623a;
			background-color: white;
			border : 1px solid  #f4623a;
			
		}
		
		a {
			color: gray;
		}
		
		#sidebar {
			left: 12% !important;
		}
</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h2 style="text-align: left;">${title_nm}</h2>
		</div>
		<hr color= #f4623a style="height: 2px;">

		<div class="container">
			<div style="float: right;">
				<div class="btn-group" role="group" aria-label="Basic example">
					<select id="cntPerPage" style="width: 120px; margin-bottom: 5px;" class="form-control"
						name="sel" onchange="selChange()">
						<option value="5"
							<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
					<c:if test="${session_user != null}">
						<div>
							<button type="button" onclick="fn_write()" id="write" class="btn">글쓰기</button>
						</div>
					</c:if>
						<%-- <button type="button" class="btn"
				style="background-color: #e36b47; color: white; width:90px; margin-right: 2px;"
				onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=${board_cd}'">교환하기</button>
			<button type="button" class="btn"
				style="background-color: #e36b44; color: white; width:90px; margin-right: 3px;"
				onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=02'">나눔하기</button> --%>
				</div>
			</div>
			<!-- 옵션선택 끝 -->

			<form id="boardForm" name="boardForm" method="post">
				<input type="hidden" name="start" value="1" />
				<input type="hidden" name="board_cd" value="${board_cd}" />
				
				<table class="table table-sm table-hover" style="table-layout: fixed;">
					<thead>
						<tr style="background-color: #f7f7f7; height: 20px;">
							<th width=8%>번호</th>
							<th width=8%>구분</th>
							<th width=14%>지역</th>
							<th width=50%>제목</th>
							<!-- <th>상태</th> -->
							<th width=10%>작성자</th>
							<th width=13%>작성일</th>
							<th width=10%>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty listArticles }">
								<tr>
									<td colspan="7" align="center">작성된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty listArticles }">

								<!-- 반복 구간 시작 -->
								<c:forEach items="${listArticles }" var="articles">
									<input type="hidden" name="article_no" value="${articles.article_no}" />
									<tr>
										<!-- 글 번호 -->
										<td>${articles.rnum}</td>
										<!-- 카테고리 -->
										<td><span class="badge badge-pill badge-light">${articles.board_nm}</span></td>
										<!-- 지역 -->
										<td style="color: gray;">${articles.local_nm}</td>
										<!-- 글 제목 -->
										<td style="text-overflow: ellipis; overflow: hidden; white-space: nowrap; text-align: left;">
										<a href='#' style="color: #e36b47;"
											onClick='fn_view(${articles.article_no});' class="duck">
											<c:out value="${articles.article_nm}" /></a></td>
										<!-- 상태 -->
										<!-- <td><span class="badge badge-pill badge-primary">완료</span></td>  -->
										<!-- 작성자 -->
										<td><c:out value="${articles.user_nm}" /></td>
										<!-- 작성일 -->
										<td><c:out value="${articles.reg_date}" /></td>
										<!-- 조회수 -->
										<td><c:out value="${articles.read_cnt}" /></td>
									</tr>
								</c:forEach>
								<!-- 반복 구간 끝 -->
							</c:when>
						</c:choose>
					</tbody>
				</table>

				<!-- 페이징 시작-->
				<div style="display: block; text-align: center; color:#e36b47;">
					<c:if test="${paging.startPage != 1 }">
						<a
							href="articlesInit.do?board_cd=${board_cd}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						<!-- &lt; 부등호(<) -->
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="articlesInit.do?board_cd=${board_cd}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="articlesInit.do?board_cd=${board_cd}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						<!-- &gt; 부등호(>) -->
					</c:if>
				</div>

				<!-- 페이징 끝 -->
				<hr>
				<!-- 검색 기능 -->
	    	<div class="form-group row" style="margin-left: 200px; margin-right: 200px;">
	    		<div style="padding: 10px; padding-top: 6px;"><i class="fas fa-search"></i></div>
	    		<div class="col-sm-10">
		    		<div class="form-group row">
		    			<select class="form-control" style="width: 110px;">
 						 <option>카테고리</option>
					</select>
		    			<div class="col-sm">
				    		<input type="text" id="searchForm" class="form-control">
			    		</div>
			    		<div>
			    		  <button type="submit" class="btn btn-primary mb-2" style="background-color: #f4623a; border-color: #f4623a;">검색</button>
			    		</div>
			    	</div>
			    </div>
			</div>

			</form>
		</div>
	</div>
	<script>
	
//글쓰기
function fn_write(){
    
    var form = document.getElementById("boardForm");
    form.action = "<c:url value='articlesWrite.do'/>";
    form.submit();
    
}
 
//글조회
function fn_view(article_no){
    
    var form = document.getElementById("boardForm");
	var url = "<c:url value='viewArticles.do'/>";
	url = url + "?article_no=" + article_no + "&board_cd=${board_cd}";
	
    form.action  = url;
    form.submit();
}
// 페이징
function selChange() {
	var form = document.getElementById("boardForm");
	var sel = document.getElementById('cntPerPage').value;
	form.action = "<c:url value='articlesInit.do?board_cd=${board_cd}&nowPage=${paging.nowPage}&cntPerPage="+sel+"'/>";
    form.submit();
}

// 사이드바 선택시 색깔
	
	document.querySelector('ul#sidebar li:nth-child(${board_cd}) div').style.backgroundColor = "#343a40";
	document.querySelector('ul#sidebar li:nth-child(${board_cd}) p').style.fontWeight = "bold";
	

</script>
</body>
</html>