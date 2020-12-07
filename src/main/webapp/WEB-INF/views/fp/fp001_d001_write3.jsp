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
<title>글 작성하기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/template/assets/img/farmer_ic.ico" />
        <link rel="shortcut icon" type="image/x-ikcon" href="${contextPath}/resources/template/assets/img/farmer_ic.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
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
#wrapper {
	width: 55%;
	margin: 0 auto;
	margin-top: 40px
}

</style>
</head>
<body>
	<div id="wrapper">
		<div class="writingHeader">
			<h4 style="text-align: left;">
				<strong>글쓰기</strong>
			</h4>
		</div>
			<hr color= #f4623a style="height: 2px;">

	<form id="frm" name="frm" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<div class="form-group row" id="table">
			<label class="col-sm-2 col-form-label"><strong>게시판</strong></label>
			<div class="col-sm-3">
				<select id="board" name="board_cd" class="form-control">
					<c:forEach items="${boardList }" var="board">
						<option value="${board.code_id }"><c:out value="${board.code_nm }"></c:out></option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label"><strong>지역</strong></label>
			<div class="col-sm-3">
				<select id="state" name="local_no" class="form-control">
					<c:forEach items="${cityList }" var="city">
						<option value="${city.code_id }"><c:out value="${city.code_nm }"></c:out></option>
					</c:forEach>
				</select>
			</div>

			<label class="col-xs-2 col-form-label"><strong>거래방법</strong></label>
			<div class="col-sm-3">
				<select id="transcation" name="trans_no" class="form-control">
					<c:forEach items="${transList }" var="trans">
						<option value="${trans.code_id }"><c:out value="${trans.code_nm }"></c:out></option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label"><strong>제목</strong></label>
			<div class="col-sm-7">
				<input type="text" id="farm_name" name="title" class="form-control" placeholder="제목을 입력하세요." maxlength="30">
			</div>
		</div>
		<div class="form-group row">
				<label class="col-form-label"><strong>사진</strong></label>
				<input type="file" class="form-control-file col-sm-6" id="farm_photo" name="file" required>
				
				<div class="select_img"><img src=""></div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label"><strong>내용</strong></label>
			<textarea style="width: 600px;" rows="5" cols="80" id="description"
				name="description" title="내용" placeholder="내용을 입력하세요."></textarea>
				
				
		</div>
		</form>
		</div>
		<input type="hidden" name="article_number" value="${article_no}" />
		<input type="hidden" name="farm_number" value="${farm_no}" />
		<input type="hidden" name="writer_name" value="${user_nm}" />
		<!-- button은 form안에 있으면 자동 submit이 된다. 그래서 type="button"을 해주거나 form에 action을 설정해줘야한다. -->
		<button type="button" onclick="fp_openBoardList()" class="btn"
			style="background-color: #e36b47; color: white;">목록</button>
		<button type="button" onclick="fp_writeBoard()" id="write" class="btn"
			style="background-color: #e36b47; color: white;">저장</button>
	
	<script type="text/javascript">
	
		function fp_openBoardList() {
			window.location.href="articlesInit.do?board_cd=${board_cd}";
		}
		
		// ck에디터
		CKEDITOR.replace("description", {
		    fullPage: false,
		    // You may want to disable content filtering because if you use full page mode, you probably
		    // want to  freely enter any HTML content in source mode without any limitations.
		    allowedContent: true,
		    autoGrow_onStartup: true,
		    enterMode: CKEDITOR.ENTER_BR,
		    shiftEnterMode: CKEDITOR.ENTER_P,
		    filebrowserUploadUrl: '${contextPath}/fp/fp001_d001/ckeditorUpload.do'
		} );
		// 게시판 구분 불러오기 (글작성시)
		console.log("bbb" + ${board_cd});
		if(${board_cd} == '01') {
			console.log(document.querySelector('#board'));
			document.querySelector('#board').options[0].selected = true;	
		} else if(${board_cd} == '02') {
			document.querySelector('#board').options[1].selected = true;
		}
		
		// 글 작성
		function fp_writeBoard() {
			var title = document.frm.title;
			var description = CKEDITOR.instances["description"].getData();
			console.log(description);
			
			if(title.value == ""){
				alert("제목을 입력해주세요.");
				title.focus();
			}else if(description==""){
				alert("내용을 입력해주세요.");
				document.frm.description.focus();
			}else{
				document.frm.action="articlesInsert.do";
				document.frm.submit();
			}	
		}
		
		// 이미지 확인
		// img 첨부 확인
      	$("#farm_photo").change(function(){
         if(this.files && this.files[0]) {
            var reader = new FileReader;
             reader.onload = function(data) {
               $(".select_img img").attr("src", data.target.result).width(380).height(380);        
            }
            reader.readAsDataURL(this.files[0]);
         }
      });
	</script>
</body>
</html>