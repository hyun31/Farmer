<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrapper {
	width: 55%;
	margin: 0 auto;
	margin-top: 40px
}
</style>
</head>
<body>
<div class="wrapper">
	<div class="article_board m-tcol-c" id="upperArticleList">
		<table>
			<caption>
				<span class="blind">게시물 목록</span>
			</caption>
			<colgroup>
				<col style="width:88px">
				<col>
				<col style="width:118px">
				<col style="width:80px">
				<col style="width:68px">
				<col style="width:68px">
			</colgroup>
			<thead>
				<tr id="normalTableTitle">
					<th></th>
					<th>
						<span class="article_title">제목</span>
					</th>
					<th scope="col" class="th_name">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회</th>
					<th scope="col">지역</th>
			</thead>
		</table>
	</div>
</div>
</body>
</html>