<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
.cls1 {
	text-decoration: none;
}

.cls2 {
	text-align: center;
	font-size: 30px;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg th {
	border-color: black;
	border-style: solid;
	border-width: 1px;
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	overflow: hidden;
	padding: 10px 5px;
	word-break: normal;
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
}

.body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	
	<table align="center" class="tg">
	<thead><br><br>
		<tr>
			<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d001">공지사항</a></td>
			<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d006">자주하는질문</a></td>
			<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d004">질문게시판</a></td>
		</tr>
	</thead>
	<tobody>
	<tr>
		<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d002">농장등록문의</a></td>
		<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d005">농장등록신청</a></td>
		<td class="tg-0lax"><a href="${contextPath}/devFw/hp/hp001_d003">분양문의</a></td>
	</tr>
	</tobody>
</table>
	<body>
		<section id="container">
			<form action="" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="farmer_id">농장주 성함</label>
					<input class="form-control" type="text" id="farmer_id" name="farmer_id" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="farm_phn">농장주 연락처</label>
					<input class="form-control" type="password" id="farm_phn" name="farm_phn" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">농장주 이메일</label>
					<input class="form-control" type="text" id="email" name="email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="farm_phone">농장 연락처</label>
					<input class="form-control" type="text" id="farm_phone" name="farm_phone" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="address">농장 주소</label>
					<input class="form-control" type="text" id="address" name="address" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="farm_intro">농장 소개</label>
					<input class="form-control" type="text" id="farm_intro" name="farm_intro" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="land_register_num">토지대장 소재지</label>
					<input class="form-control" type="text" id="land_register_num" name="land_register_num" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="farm_photo">파일첨부</label>
					<input class="form-control" type="text" id="farm_photo" name="farm_photo" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">신청</button>
					<button class="cencle btn btn-danger" type="button" id="btnList">취소</button>

				</div>
			</form>
		</section>
		
	</body>
	<script type="text/javascript">
	
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/hp/hp001_d001";
						    
			})
			
			$("#submit").on("click", function(){
				if($("#farmer_id").val()==""){
					alert("농장주성함을 입력해주세요.");
					$("#farmer_id").focus();
					return false;
				}
				if($("#farm_phn").val()==""){
					alert("농장주연락처를 입력해주세요.");
					$("#farm_phn").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#farm_phone").val()==""){
					alert("농장연락처를 입력해주세요.");
					$("#farm_phone").focus();
					return false;
				}
				if($("#address").val()==""){
					alert("농장주소를 입력해주세요.");
					$("#address").focus();
					return false;
				}
				if($("#farm_intro").val()==""){
					alert("농장소개를 입력해주세요.");
					$("#farm_intro").focus();
					return false;
				}
				if($("#land_register_num").val()==""){
					alert("토지대장소재지를 입력해주세요.");
					$("#land_register_num").focus();
					return false;
				}
				if($("#farm_photo").val()==""){
					alert("토지대장을 첨부해주세요.");
					$("#farm_photo").focus();
					return false;
				}
			});
			
			
		})
		
	
	</script>
</html>