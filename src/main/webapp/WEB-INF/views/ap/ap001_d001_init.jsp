<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 
 <style>
body {
	display: -ms-flexbox;
	/* display: flex; */
	-ms-flex-align: center;
	align-items: center;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}
.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
	margin-top: 150px;
	border: 1px solid lightgray;
}
.form-signin .checkbox {
	font-weight: 400;
}
.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}
.form-signin .form-control:focus {
	z-index: 2;
}
.form-signin input[type="id"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
#kakaoLogin:hover {
	cursor: pointer;
}
#loginHelp {
	font-size: 1em;
	color: red;
	margin-bottom: 5px;
	float: left;
}
#join-wrapper {
	width: ;
	height: 300px;
	border: 1px solid lightgray;
}

.login{
	text-align: center;
	background-color: lightgrey;
	padding: 10px;
	width: 300px;
	border: 2px solid black;
}

</style>
</head>
  <body>
    <form class="form-signin shadow-sm p-3 mb-5" method="post" action="${contextPath }/ap/ap001_d001/login.do">
      <h1 class="h3 mb-5 font-weight-normal">로그인</h1>
      <input type="text" name="user_id" id="inputId" class="form-control" placeholder="아이디" style="margin-bottom: 8px;" required maxlength="16">
      <input type="password" name="user_pwd" id="inputPassword" class="form-control" placeholder="비밀번호" style="margin-bottom: 20px;" required>
      <c:if test = "${login == 'fail' }">
	      <div>
	      	<p id="loginHelp"> 아이디, 비밀번호를 확인해주세요. </p>
	      </div>
      </c:if>
      <button class="btn btn-lg btn-block" type="submit" style="background-color: #e36b47; color:white;">로그인</button>
      <hr>
      <img id="kakaoLogin" src="${contextPath }/resources/image/kakao_login_wide.png" style="margin-top: 5px;">
   
    </form>
     <div id="bottombar">
		<div>
			<div id="login">아임파머스 회원이 되세요.<a href="${contextPath }/bp/bp001_d001/joinInit.do">가입하기</a></div>
		</div>
      </div>
    <script>
   		document.querySelector('#kakaoLogin').addEventListener('click' , function() {
   			window.location.href = "https://kauth.kakao.com/oauth/authorize?client_id=a694f4365babb8eddda731ecf6315a87&redirect_uri=http://localhost:8090/devD/ap/ap001_d002/kakaoLogin.do&response_type=code";
   		})
    </script>
</body>
</html>