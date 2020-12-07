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
<title>글 수정하기</title>
 <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${contextPath}/resources/template/assets/img/farmer_ic.ico" />
        <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/template/assets/img/farmer_ic.ico" />
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
body {
	font-family: Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,돋움,dotum,sans-serif;
	}
	
	div {
		display: block;
	}

	.wrapper {
		width: 55%;
		margin: 0 auto;
		margin-top: 40px
	}
	
	.WritingHeader {
		position: relative;
		margin-top: 20px;
		border-bottom: 3px solid #f4623a;
	}
	
	.BaseButton {
		display: inline-block;
		border-radius: 6px;
		box-sizing: border-box;
		font-weight: 700;
		text-align: center;
		vertical_align: top;
	}
	
	.BaseButton.size_default {
		min-width: 60px;
		height: 36px;
		margin-left: 790px;
		padding: 0 12px;
		font-size: 13px;
		line-height: 36px;
		font-size: 15px;
	}
	
	.BaseButton--skinOrange {
		background : #f4623a;
		color: white;
	}
	
	.WritingHeader .title {
		margin-bottom: 16px;
		font-size: 22px;
		color: black;
		text-align: left;
		float: left;
	}
	
	a {
		decoration: none;
	}
	
	#state {
		float: left;
	}
	
	#board {
		float: left;
		height: 49px;
		padding: 0 11px;
		font-size: 16px;
		color: #333;
		font-family: "돋움","Dotum","Apple Gothic",sans-serif;
		border: 1px solid #ccc;
		line-height: 49px;
		box-shadow: none;
	}
	
	.temp_save_area {
		margin-bottom: 5px;
	}
	
	.FormSelectBox {
		margin-top: 20px;
	}
	
	.WritingCommerce {
		margin-top: 10px;
		padding: 0 29px 40px;
		box-sizing: border-box;
		border: 1px solid #ebecef;
		background: #fff;
		height: 405px;
	} 
	
	.WritingCommerce .form_box {
		margin-top: 50px;
	}
	
	.WritingCommerce .form_box .form_label .validation {
		margin-left: 3px;
		color: #f4623a;
		font-family: Arial,Sans-serif;
	}
	
	.WritingCommerce .form_box .form_label {
		display: inline-block;
		font-size: 15px;
		font-weight: bold;
	}
	
	input.text51 {
		height: 49px;
		padding: 0 11px;
		font-size: 16px;
		color: #333;
		font-family: "돋움","Dotum","Apple Gothic",sans-serif;
		border: 1px solid #ccc;
		line-height: 49px;
		box-shadow: none;
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
	
	.group_content {
		margin-top: 10px;
		padding: 3px 20px 10px;
		/* box-sizing: border-box; */
		/* border: 1px solid #ebecef; */
		background: #fff;
		width: 400px;
		float: right;
	}
	
	.group_img {
		background-color: green;
		margin-top: 10px;
		display: inline-block;
		border: 1px solid #ebecef;
		background: #fff;
		width: 380px;
		height: 380px;
		
	}
	
	#cke_description {
		width: 920px;
		heigt: 1000px;
		margin-left: 10px;
	}

</style>
</head>
<body>
<div class="wrapper">
	<form id="frm" name="frm" method="post" onsubmit="return check()" enctype="multipart/form-data">
		<div class="WritingWrap">
			<div class="WritingHeader">
				<h4 class="title">
					<strong>글쓰기</strong>
				</h4>
		    	<!-- <hr color= #f4623a style="height: 2px;"> -->
		    	<div class="tool_area">
		    		<div class="temp_save_area">
		    			<a href="javascript:void(0);" onclick="fp_updateBoard();" id="update" role="button" class="BaseButton BaseButton--skinOrange size_default">
		    				<span class="BaseButton_txt">수정</span>
		    			</a>
		    		</div>
		    	</div>
			</div>
			<div class="WritingContent">
				<div class="WritingEditor">
					<div class="ArticleWritingTitle">
						<div class="row">
							<div class="column_title">
									<div class="form-group row" style="margin-top: 20px;">
										<select id="board" name="board_cd" class="form-control" style="width: 240px; margin-left: 30px;">
											<c:forEach items="${boardList }" var="board">
												<option value="${board.code_id }"><c:out value="${board.code_nm }"></c:out></option>
											</c:forEach>
										</select>
										<input type="text" name="title" id="farm_name" placeholder="제목을 입력하세요." title="제목"
			    						value="${article_nm }" class="text51" style="width: 667px; margin-left: 8px;" maxlength="60">
									</div>
							</div>
							<div class="column_category"></div>
						</div>
					</div>
					<div class="WritingCommerce">
					
					<div class="group_img">
					
							<div class="select_img"><img src="http://localhost:8090/devD/resources/upload/${content.img_nm}"
							width="380" height="380" alt="이미지" class="image"></div>
						</div>
					
					
					<div class="group_content">
						<div class="form_box">
							<h4 class="form_label">거래 지역
								<span role="img" aria-label="필수" class="validation">*</span>
							</h4>
								<div class="input_box">
									<div class="FormInputText">
										<div class="col-sm-3">
											<select id="state" name="local_no" class="form-control" title="" style="width: 300px;">
												<c:forEach items="${cityList }" var="city">
													<option value="${city.code_id }"><c:out value="${city.code_nm }"></c:out></option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
										<p class="message red" style="display: none;">거래 지역을 선택하세요.</p>
						</div>
						
						<div class="form_box">
							<h4 class="form_label">거래 방법
								<span role="img" aria-label="필수" class="validation">*</span>
							</h4>
								<div class="input_box">
									<div class="FormInputText">
										<div class="col-sm-3">
											<select id="transcation" name="trans_no" class="form-control" title="" style="width: 300px;">
												<c:forEach items="${transList }" var="trans">
													<option value="${trans.code_id }"><c:out value="${trans.code_nm }"></c:out></option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
										<p class="message red" style="display: none;">거래 지역을 선택하세요.</p>
						</div>
							<div class="form_box">
								<h4 class="form_label">사진 첨부
									<span role="img" aria-label="필수" class="validation">*</span>
								</h4>
									<div class="input_box">
										<div class="FormInputText">
											<div class="col-sm-3">
												<input type="file" class="form-control-file col-sm-6" id="farm_photo" name="file" required>
						
												
											</div>
										</div>
									</div>
											<p class="message red" style="display: none;">거래 지역을 선택하세요.</p>
							</div>
						</div>
						
						
						
						
						
						
					</div>
					<div class="FormNoticeContent">
						거래전 필독! 주의하세요!
						<br>
						 * 안전결제는 카페 내에서만 결제가 가능합니다(카카오톡으로 링크 첨부 후 결제 유도는 사기99%!).
					</div>
					<div class="SmartEditor" class="CafeEditor">
						<div class="form-group row">
								<textarea style="width: 800px;" rows="5" cols="80" id="description"
								name="description" title="내용" placeholder="내용을 입력하세요."></textarea>
						</div>
					</div>
				</div>
			</div>
	    </div>
		<input type="hidden" name="article_no" value="${article_no}" />
		<input type="hidden" name="article_number" value="${article_no}" />
		<input type="hidden" name="farm_number" value="${farm_no}" />
		<input type="hidden" name="writer_name" value="${user_nm}" />
    </form>
</div>

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
		
		var content ='${content.article_content }';
		CKEDITOR.instances["description"].setData(content);
		
		// 글 수정
		function fp_updateBoard() {
			var title = document.frm.title;
			var description = CKEDITOR.instances["description"].getData();
			
			if(title.value == ""){
				alert("제목을 입력해주세요.");
				title.focus();
			}else if(description==""){
				alert("내용을 입력해주세요.");
				document.frm.content.focus();
			}else{
				document.frm.action="updateArticles.do";
				document.frm.submit();
			}
		}

		
		// 게시판 구분 불러오기 (글작성시)
		if(${board_cd} == '01') {
			console.log(document.querySelector('#board'));
			document.querySelector('#board').options[0].selected = true;	
		} else if(${board_cd} == '02') {
			document.querySelector('#board').options[1].selected = true;
		}
		
		// 지역
		if(${local_no} != null) {
			document.querySelector('#state').options[${local_no}].selected = true;
		}
		
		
		// 거래방법
		if(${trans_no} == '01') {
			console.log(document.querySelector('#transcation'));
			document.querySelector('#transcation').options[1].selected = true;	
		} else if(${trans_no} == '02') {
			document.querySelector('#transcation').options[2].selected = true;
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