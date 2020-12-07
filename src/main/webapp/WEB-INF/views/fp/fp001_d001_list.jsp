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
	width: 50%;
	margin: 0 auto;
	margin-top: 40px
}

       #sidebar {
            position:fixed;
            width: 66px;
            top: 160px;
            left: 20%;
            text-align: center;
        }
        #sidebar ul {
            padding: 0;
        }
        #sidebar p {
			font-size: 13px;
			margin: 0;
		}
        #wrapper {
        	width: 50%;
        	margin: 0 auto;
        	margin-top: 40px
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
 			white-space: nowrap;
  			width: 100px;
  				height: 20px;
        }

</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h2 style="text-align: left;">${title_nm}</h2>
		</div>
		<hr>
		

<!-- 사이드 네비게이션바 -->
<div id="sidebar">
			<ul>
				<li>
					<div class="circle"
						onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=01'"><i class="fas fa-exchange-alt"></i>
					</div>
					<p>
						교환하기
					</p>
				</li>
				<li>
					<div class="circle" 
						onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=02'"><i class="fas fa-hand-holding-heart"></i>
					</div>
					<p>
						나눔하기
					</p>
				</li>
				<li>
					<div class="top circle" onclick="topFunction()"><i class="fas fa-arrow-up fa-lg"></i></div>
				</li>
			</ul>
		</div>





		<div class="container">
			<div style="float: right;">
				<div class="btn-group" role="group" aria-label="Basic example">
					<select id="cntPerPage" style="width: 110px; margin-bottom: 5px;" class="form-control"
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
							<button type="button" onclick="fn_write()"
								style="float: right; background-color: #e36b47; color: white; margin-left: 10px; margin-bottom: 5px;"
								id="write" class="btn">글쓰기</button>
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
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th width=5%>번호</th>
							<th width=8%>구분</th>
							<th width=12%>지역</th>
							<th width=40%>제목</th>
							<!-- <th>상태</th> -->
							<th width=10%>작성자</th>
							<th widtg=15%>작성일</th>
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
										<td style="color: grey;">${articles.local_nm}</td>
										<!-- 글 제목 -->
										<td>
										<a href='#' style="color: #e36b47;"
											onClick='fn_view();' class="duck">
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
			    		  <button type="submit" class="btn btn-primary mb-2" style="background-color: #e36b47; border-color: #e36b47;">검색</button>
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
function fn_view(){
    
    var form = document.getElementById("boardForm");
    form.action  = "<c:url value='viewArticles.do'/>";
    
    form.submit();
}
// 페이징
function selChange() {
	var form = document.getElementById("boardForm");
	var sel = document.getElementById('cntPerPage').value;
	form.action = "<c:url value='articlesInit.do?board_cd=${board_cd}&nowPage=${paging.nowPage}&cntPerPage="+sel+"'/>";
    form.submit();
}
</script>
</body>
</html>