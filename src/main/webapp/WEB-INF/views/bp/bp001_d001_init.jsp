<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<style>
 body {
	/* z-index: 1039; */
	background-color: #f5f5f5;
	font-family: Dotum,'돋움',Helvetica,sans-serif;
} 
.modal-backdrop {
	z-index: 1;
}
.modal {
	z-index: 2;
}
.form-signin input[type="id"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}
.my-module {
	position: fiexd;
	top: 0;
	left: 0;
}
#wrapper {
	/* border: 1px solid lightgray; */
	width: 50%;
	margin: 0 auto;
	margin-top: 100px;
	padding: 40px;
}
h1 {
	margin-bottom: 30px;
}
::placeholder {
	font-size: 1em;
}
label {
	font-size: 14px;
	font-weight: bold;
}
form {
	padding: 10px;
}
small {
	margin: 0 auto;
}

.box {
	padding-right : 14px;
	display : block;
	postion: relative;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 10px 10px 14px;
	background: #fff;
	verical-align : top;
	border-radius: 3px;
}

.int{
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	padding-right: 25px;
	line-height: 29px;
	border : none;
	background: #fff;
	font-size: 15px;
	box-sizing: border-box;
	z-index: 1;
}

.btn_send {
	position: absolute;
	top: 0;
	right: 0;
	width: 115px;
	heigt: 51px;
	text-align: center;
	box-sizing: border-box;
	text-decoration: none;
	color: #fff;
	border: solid 1px rgba(0,0,0,.08);
	background-color: #f4623a ;
	padding: 13px 0 11px;
}

.btn_type {
	display: block;
	width: 65%;
	padding: 15px 0 15px;
	margin: 0 auto;
	font-size: 18px;
	text-align: center;
	cursor: pointer;
	box-sizing: border-box;
	border: solid 1px rgba(0,0,0,.08);
	color: #fff;
	background-color: #f4623a;
	
}

	input[type="text"]:disabled{
		background-color: #fff9f0;
	}
	
	input#confirm{
		background-color: #fff9f0;
	}
	
	 #confirm_sp {
	 	background-color: #fff9f0;
	 }
	 
	 #emailHelp {
	 	margin-left : 0;
	 	color: #f4623a;
	 }

</style>
<body>
	<div id="wrapper">
		<div style="width:500px; margin: 0 auto;">
		<div class="form-group">
			<div class="form-row">
		<h2 style="margin: 0 auto;">아임파머스 회원가입</h2>
		</div>
		</div>
		<form action="${contextPath}/bp/bp001_d001/join.do" method="post" id="joinForm" class="was-validated">
			<div class="form-group">
					<label>아이디</label>
					<span class="box" id="id_sp">
					<input type="text" name="user_id" class="int" id="id" title="아이디" aria-describedby="idHelp"
							placeholder="영문 또는 숫자 6~16자리로 입력해 주세요." maxlength="16" onblur="checkId()">
					</span>
					<small id="idHelp">&nbsp;</small>
			</div>
			
			<div class="form-group">
				<label>비밀번호</label>
				<span class="box">
					<input type="password" name="user_pwd" class="int" id="pwd" title="비밀번호" aria-describedby="pwdHelp"
						placeholder="8~16자/문자, 숫자, 특수문자 혼용" onblur="checkPwd()">
				</span>
					<small id="pwdHelp">&nbsp;</small>
			</div>
			<div class="form-group">
				<label>비밀번호확인</label> 
				<span class="box">
					<input type="password" class="int" id="pwd_check" title="비밀번호확인"
						placeholder="비밀번호를 확인해 주세요." onblur="checkSame()">
				</span>
					<small id="pwdCheckHelp">&nbsp;</small>
			</div>
			<div class="form-group">
				<label for="user_nm">이름</label>
				<span class="box">
					<input type="text" name="user_nm" class="int" id="user_nm" maxlength="4" onblur="checkName()">
				</span>
					<small id="nameHelp">&nbsp;</small>
			</div>
			<div class="form-group">
				<label style="margin-right: 15px">휴대전화</label> 
					<span class="box">
					<input class="int" type="text" name="phone" id="phone" maxlength="13" onblur="checkPhone()" onKeyup="inputPhoneNumber(this);" placeholder="전화번호 입력"> 
					</span>
					<small id="phoneHelp">&nbsp;</small>
			</div>
					<div class="form-group">
						<label>이메일</label> 
								<div class="form-row">
									<div style="width: 367px; margin-bottom: 10px;">
										<span class="box">
											<input class="int" type="text" name="email" id="email" onblur="checkEmailId()" placeholder="이메일 입력"> 
										</span>
									</div>
									<div class="col-md-3 mb-3">
										 <button class="btn_send" id="confirm_btn" type="button" onclick="confirmBtn();" onload="">
											<span>인증번호 받기</span>
										</button>
									
									</div>
								</div>
									<div class="form-row">
										<span class="box" id="confirm_sp">
											<input type="text" class="int" name="confirm" id="confirm" placeholder="인증번호 입력하세요" onblur="confirmCheck()" disabled 
												style="display: inline-block; width: 404px;">
											<span id="success" style="font-size: 13px; color:green; display: none;">일치 <i class="fas fa-check"></i></span>
											<span id="fail" style="font-size: 13px; color:red; display: none;">불일치 <i class="fas fa-times"></i></span> 
										</span>
										<small id="emailHelp">&nbsp;</small>
									</div>
						</div>
					</div>
					<hr color= "#e36b47" style="width: 490px; margin-bottom: 20px;">
				<div class="btn_area" >
			<button type="button" id="join" class="btn_type" onclick="validation()">
			<span>가입하기</span>
			</button>
				</div>
		</form>
		</div>
		<input type="hidden" id="random" value="${random }">
	<script>
		let idOK = false;
		let pwdOK = false;
		let authOK = false;

		
		// 전화번호 하이픈 추가
		function inputPhoneNumber(obj){
		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";
		    
		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		} 
		
		// 인증번호 확인 버튼
		function confirmCheck() {
			let auth_code = document.querySelector('#confirm').value;
			let random = document.querySelector('#random').value;
			
			$.ajax({
				type: "post",
				url: "emailAuth.do",
				data: {auth_code: auth_code, random: random},
				success: function(data) {
					if(data == 'complete') {
						document.querySelector('#emailHelp').innerHTML = '인증이 성공했습니다.';
						document.querySelector('#confirm_sp').style.border = '1px solid green';
						document.querySelector('#emailHelp').style.color = 'green';
						document.querySelector('#fail').style.display = 'none';
						document.querySelector('#success').style.display = 'inline';
						
						authOK = true;
					} else if(data == 'false') {
						document.querySelector('#emailHelp').innerHTML = '인증번호를 다시 확인해주세요.';
						document.querySelector('#emailHelp').style.color = 'red';
						document.querySelector('#confirm_sp').style.border = '1px solid red';
						document.querySelector('#success').style.display = 'none';
						document.querySelector('#fail').style.display = 'inline';
					}	
				} 
			});
		}
		
		
	 	// 인증번호 버튼
		function confirmBtn(){
			let email = document.querySelector('#email').value;
			let random = document.querySelector('#random').value;
			
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(email.match(regExp) != null) {
				document.querySelector('#emailHelp').innerHTML = '입력한 이메일로 인증번호를 발송했습니다.';
				/* $("#confirm").attr("disabled", true); // 비활성화 */
				$('#confirm').attr("disbaled", true); // 버튼 비활성화
				$('#confirm').prop('disabled', false); // 입력칸 활성화
				$.ajax({
					type: "post",
					url: "sendAuthCode.do",
					data: {user_email: email, random: random},
					success: function(data) {
						document.querySelector('#emailHelp').innerHTML = '입력한 이메일로 인증번호를 발송했습니다.';
					},
					error: function(data) {
						alert("이메일을 확인해주세요.");
					}
				});
			} else {
				document.querySelector('#emailHelp').innerHTML = '잘못된 이메일 주소입니다.';
			}
		}
		
		// 아이디 형식 확인
		function checkId() {
			const id = document.querySelector("#id").value;
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			const spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/ig);
			
			if(id.length < 6 || id.length > 16 || check.test(id)) {
				document.querySelector('#idHelp').innerHTML = '영문 또는 숫자 6~16자리로 입력해주세요.';
				document.querySelector('#idHelp').style.color = '#f4623a';
				document.querySelector('#id_sp').style.border = '1px solid red';
				return false;
			}
			if(spe > 0) {
				document.querySelector('#idHelp').innerHTML = '영문 또는 숫자로만 입력해주세요.';
				document.querySelector('#idHelp').style.color = '#ff8533';
				document.querySelector('#id_sp').style.border = '1px solid red';
				return false;
			}

			$.ajax({
				type: "post",
				url: "checkId.do",
				data: {user_id : id},
				success: function(data) {
					if(data == 'okay') {
						document.querySelector('#idHelp').innerHTML = '사용할 수 있는 아이디입니다.';
						document.querySelector('#idHelp').style.color = '#3385ff';
						document.querySelector('#id_sp').style.border = '1px solid green';
						idOK = true;
						return true;
					} else if(data == 'duplicate'){
						document.querySelector('#idHelp').innerHTML = '아이디가 중복됩니다.';
						document.querySelector('#idHelp').style.color = '#ff8533';
						document.querySelector('#id_sp').style.border = '1px solid red';
						return false;
					}
				}
			});
		}
		
		// 비밀번호 형식 확인
		function checkPwd() {
			const pwd = document.querySelector("#pwd").value;
	        const num = pwd.search(/[0-9]/g);
	        const eng = pwd.search(/[a-z]/ig);
	        const spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/ig);

	        if(pwd.length < 8 || pwd.length > 16){
	        	document.querySelector('#pwdHelp').innerHTML = "8자리 ~ 16자리 이내로 영문,숫자,특수문자를 혼합하여 입력해주세요."
	        	document.querySelector('#pwdHelp').style.color = '#ff8533';
	            return false;
	        }

	        if(pwd.search(/₩s/) != -1){
	        	document.querySelector('#pwdHelp').innerHTML = "공백없이 입력해주세요.";
	        	document.querySelector('#pwdHelp').style.color = '#ff8533';
	            return false;
	        }

	        if(num < 0 || eng < 0 || spe < 0 ){
	        	document.querySelector('#pwdHelp').innerHTML = "영문,숫자,특수문자를 혼합하여 입력해주세요.";
	        	document.querySelector('#pwdHelp').style.color = '#ff8533';
	            return false;
	        }
	        
	        document.querySelector('#pwdHelp').innerHTML = "사용 할 수 있는 비밀번호입니다.";
	        document.querySelector('#pwdHelp').style.color = '#3385ff';
	        return true;
		}
		
		// 비밀번호 확인이 일치하는지 확인
		function checkSame() {
			const pwd = document.querySelector("#pwd").value;
			const check_pwd = document.querySelector("#pwd_check").value;
			if(checkPwd() && pwd === check_pwd) {
				document.querySelector('#pwdCheckHelp').innerHTML = "비밀번호가 일치합니다."
				document.querySelector('#pwdCheckHelp').style.color = '#3385ff';
				pwdOK = true;
				return true;
			}
			if(pwd == 0) {
				document.querySelector('#pwdCheckHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#pwdCheckHelp').style.color = '#ff8533';
				return false;
			}
			document.querySelector('#pwdCheckHelp').innerHTML = "비밀번호가 일치하지 않습니다."
			document.querySelector('#pwdCheckHelp').style.color = '#ff8533';
			return false;
		}
		
		
		function checkName() {
			if(document.querySelector('#user_nm').value.length != 0) {
				document.querySelector('#nameHelp').innerHTML = "&nbsp;";
			}
		}
		
		function checkPhone() {
			const phone = document.querySelector('#phone').value;
			if(phone.length == 13)  {
				document.querySelector('#phoneHelp').innerHTML = "&nbsp;";
			}
		}
		
		// 가입하기 버튼
		function validation() {
			console.log(idOK + "/" + pwdOK + "/" + authOK);
			const id = document.querySelector('#id').value;
			const pwd = document.querySelector('#pwd').value;
			const name = document.querySelector('#user_nm').value;
			const phone = document.querySelector('#phone').value;
			const email_id = document.querySelector('#email').value;
			// 일단 true이고 비었으면 false
			let nameOK = true;
			let phoneOK = true;
			let emailOK = true;
			if(id.length == 0) {
				document.querySelector('#idHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#idHelp').style.color = '#ff8533';
			}
			if(pwd.length == 0) {
				document.querySelector('#pwdHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#pwdHelp').style.color = '#ff8533';
				document.querySelector('#pwdCheckHelp').innerHTML = "필수 정보입니다."
				document.querySelector('#pwdCheckHelp').style.color = '#ff8533';
			}
			if(name.length == 0) {
				document.querySelector('#nameHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#nameHelp').style.color = '#ff8533';
				nameOK = false;
			} 
			if(phone.length == 0) {
				document.querySelector('#phoneHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#phoneHelp').style.color = '#ff8533';
				phoneOK = false;
			}
			if(email_id.length == 0) {
				document.querySelector('#emailHelp').innerHTML = "필수 정보입니다.";
				document.querySelector('#emailHelp').style.color = '#ff8533';
				emailOK = false;
			}
			if(idOK && pwdOK && nameOK && phoneOK && emailOK && authOK) {
				document.querySelector('#joinForm').submit();
			}
		}
	</script>
</body>
</html>