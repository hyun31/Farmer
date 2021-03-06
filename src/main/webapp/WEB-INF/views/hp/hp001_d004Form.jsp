<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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

<title>질문게시판 작성</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
	
		location.href="${pageContext.request.contextPath}/hp/hp001_d004";
	});
	
	$(document).ready(function(){
		var mode = '<c:out value= "${mode}"/>';
		if (mode == 'edit'){
			  //입력 폼 셋팅
			  $("#writer_id").prop('readonly', true);
			  $("input:hidden[name='article_no']").val('<c:out value="${hp001_d004Content.article_no}"/>');
			  $("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			  
			  $("#writer_id").val('<c:out value= "${hp001_d004Content.writer_id}"/>');
			  $("#queston_type").val('<c:out value= "${hp001_d004Content.question_type}"/>');
			  $("#order_number").val('<c:out value= "${hp001_d004Content.order_number}"/>');
			  $("#email").val('<c:out value= "${hp001_d004Content.email}"/>');
			  $("#article_nm").val('<c:out value= "${hp001_d004Content.article_nm}"/>');
			  $("#article_content").val('<c:out value= "${hp001_d004Content.article_content}"/>');
			  
		}
	});
</script>




<style>
body {
	padding-bottom: 30px;
}
h5{
	color: green;
}
</style>

</head>
<body>
	<article>
		<div class="container" role="main" >
			<br><h5>질문게시판 작성하기</h5>
			
			<form:form  name="form" id="form" role="form" modelAttribute="hp001_d004VO" method="post"
				action="${pageContext.request.contextPath}/hp/saveBoard4">
				
				<form:hidden path="article_no"/>
				<input type="hidden" name="mode" />
				
				<div class="mb-3" align="left">
					<label for="writer_id">작성자</label>
					<form:input path="writer_id" class="form-control" id="writer_id"
					placeholder="이름을 입력해 주세요" />
				</div>
				
				<div class="mb-3" align="left">
					<label for="question_type">질문유형</label>
					<form:input path="question_type" class="form-control" id="question_type"
					placeholder="질문유형을 선택해 주세요" />
				</div>
				
				<div class="mb-3" align="left">
					<label for="order_number">주문번호</label>
					<form:input path="order_number" class="form-control"  id="order_number"
					placeholder="주문번호를 입력해 주세요" />
				</div>
				
				<div class="mb-3" align="left">
					<label for="email">이메일</label>
					<form:input path="email" class="form-control"  id="email"
					placeholder="이메일을 입력해 주세요" />
				</div>
				
				
				<div class="mb-3" align="left">
					<lable for="article_nm">제목</lable>
					<form:input path="article_nm" class="form-control" 
						 id="article_nm" placeholder="제목을 입력해 주세요" />
				</div>

				<div class="mb-3">
					<label for="article_content">내용</label>
					<form:textarea path="article_content" id="article_content" 
					class="form-control" rows="5" placeholder="내용을 입력해 주세요" />
					</div>
					
				
			</form:form>
			<div>
				<button type="button" class="btn btn-sm btn_primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm-btn primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>