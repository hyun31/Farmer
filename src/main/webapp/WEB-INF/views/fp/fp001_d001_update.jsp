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
<title>글수정창</title>
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
	
	<!-- ckeditor 사용을 위해 js 파일 연결 -->
	<script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
	
	<style>
	#table{
		margin: 0 auto;
	}
	</style>
	
	
</head>
<body>
	<form id="frm" name="frm" method="post" onsubmit="return check()">
		<input type="hidden" name="update_number" value="${article_no}" />
		<input type="hidden" name="farm_no" value="02" />
		<input type="hidden" name="writer_id" />
		<input type="hidden" name="board_cd" value="${board_cd}" />
		<table class="board_view" id="table">
			<colgroup>
				<col width="15%">
				<col width="*">
			</colgroup>
			<span class="d-block p-2 bg-dark text-white">글쓰기</span>
			<tbody>
				<tr>
					<th>게시판</th>
					
						<td>
							<select class="form-control col-sm-4" name="board">
								<c:forEach items="${boardList}" var="board">
									<option><c:out value="${board.code_nm}"></c:out></option>
								</c:forEach>
							</select>
						</td>
				<tr>
					<th>지역</th>
						<td>
							<select class="form-control col-sm-4" name="city">
							<c:forEach items="${cityList}" var="city">
								<option><c:out value="${city.code_nm}"></c:out></option>
								</c:forEach>
							</select>
						</td>
				</tr>
				<tr>
					<th>거래방법</th>
					<td>
						<select class="form-control col-sm-4" name="Transaction">
							<c:forEach items="${transList}" var="trans">
								<option><c:out value="${trans.code_nm}"></c:out></option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input style="width: 500px" type="text" name="title" class="wdp_90" placeholder="제목을 입력하세요."
								value="${article_nm }" maxlength="25" /></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea style="width: 500px" rows="10" cols="10"
							id="description" name="description" title="내용" placeholder="내용을 입력하세요.">${article_content }</textarea>
					<script>
					 var ckeditor_config = {
					   resize_enaleb : false,
					   enterMode : CKEDITOR.ENTER_BR,
					   shiftEnterMode : CKEDITOR.ENTER_P,
					   filebrowserUploadUrl : "/admin/goods/ckUpload.do"
					 };
					 
					 CKEDITOR.replace("description", ckeditor_config);
					</script>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- button은 form안에 있으면 자동 submit이 된다. 그래서 type="button"을 해주거나 form에 action을 설정해줘야한다. -->
		<button type="button" onclick="fp_openBoardList()" class="btn btn-primary pull-right">목록</button>
		<button onclick="fp_updateBoard()" id="update" class="btn btn-primary pull-right">수정</button>
	</form>
	
	<script type="text/javascript">
	function check() {
		var title = document.frm.title;
		var content = document.frm.content;
		
		if(title.value == ""){
			alert("제목을 입력해주세요.");
			title.focus();
			return false;
		}else if(content.value == ""){
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
		}else{
			alert("글이 수정됩니다.");
			return true;
		}
	}
	
		function fp_openBoardList() {
			window.location.href="articlesInit.do?board_cd=${board_cd}";
		}

		function fp_updateBoard() {
			document.frm.action="updateArticles.do";
			document.frm.submit();
		}
	</script>
</body>
</html>