<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-
				q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-
			GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<title>농장등록문의 게시판 입니다!!</title>
<c:url var="getBoardListURL" value="/hp/getBoardList"></c:url>
</head>


<body>
	<br>
	<h5>농장등록문의 게시판</h5>
	<article>
		<div class="container">
			<div class="table-responsive">

				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty articlesList}">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty articlesList}">
								<c:forEach var="list" items="${articlesList}">
									<tr>
										<td><c:out value="${list.rnum}" /></td>
										<td><a href="#"
											onClick="fn_contentView(<c:out value="${list.article_no}"/>)">
												<c:out value="${list.article_nm}" />
										</a></td>
										<td><c:out value="${list.writer_id}" /></td>
										<td><c:out value="${list.read_cnt}" /></td>
										<td><c:out value="${list.reg_date}" /></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- 	</article> -->
		</div>


		<div>
			<button type="button" class="btn btn-sm btn-primary"
				id="btnWriteForm">글쓰기</button>

		</div>

		<!-- pagination2{s} -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination2.prev}">
					<li class="page-item"><a class="page-link" href="#"
						 onClick="fn_prev('${pagination2.page}', '${pagination2.range}', '${pagination2.rangeSize}')">Previous</a></li>
				</c:if>



				<c:forEach begin="${pagination2.startPage}"
					end="${pagination2.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination2.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination2('${idx}', '${pagination2.range}', '${pagination2.rangeSize}')">
							${idx} </a></li>
				</c:forEach>



				<c:if test="${pagination2.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination2.range}','${pagination2.range}', '${pagination2.rangeSize}')">Next</a></li>
				</c:if>
			</ul>
			
			<!-- search{s} -->
			<div class = "form-group row justify-content-center">
				<div class ="w100" style="padding-right: 10px">
					<select class= "form-control form-control-sm" name="searchType" id="searchType">
						<option value="">제목	</option>
						<option value="">본문	</option>
						<option value="">작성자	</option>
					</select>
			</div>
			<div class="w300" style="padding-right: 10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
				</div>
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
				</div>
			<!-- search{e} -->
			
		</div>
		<!-- pagination2{e} -->
	</article>



	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(document).on('click','#btnWriteForm', function(e){
		console.log("3333");
		e.preventDefault();	
	
		location.href = "${pageContext.request.contextPath}/hp/hp001_d002Form";
	});
	
	function fn_contentView(article_no) {
		var url = "${pageContext.request.contextPath}/hp/getBoardContent2";
		url = url + "?article_no="+article_no;
		location.href = url;
	}
	
	
	
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			
			var url = "${pageContext.request.contextPath}/hp/hp001_d002";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		
			location.href = url;
		}
	 	 //페이지 번호 클릭
		function fn_pagination2(page, range, rangeSize, searchType, keyword) {
			var url = "${pageContext.request.contextPath}/hp/hp001_d002";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;	
		}
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			
			var url = "${pageContext.request.contextPath}/hp/hp001_d002";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
		
			location.href = url;
		}
</script>
</body>
</html>