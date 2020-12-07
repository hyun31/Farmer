<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script	src="https://kit.fontawesome.com/f87cff2a76.js" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#wrapper {
	width: 55%;
	margin: 0 auto;
	margin-top: 40px;
	padding: 29px 29px 0;
	border: 1px solid lightgray;
	border-radius: 6px;
}
#collapse1btn{
	padding-top: 2px;
}
.form-group {
	margin: 0;
}
.card-header {
	background-color: #343a40;
	color: white;
}
#farmTable {
	text-align: center;
	border-top: 2px solid #343a40;
	border-bottom: 2px solid #343a40;
}
#price {
		border: 1px solid lightgray;
		padding: 10px;
		margin-bottom: 60px;
		text-align: right;
	}
	#collapse1btn, #collapse2btn {
		float: right;
	}
	#step{
		display: inline;
		font-size: 20px;
		font-weight: 600;
	}
	#info {
		display: inline;
		font-weight: 400;
		font-size: 18px;
		padding-left: 20px;
	}
	#collapse1 label {
		font-size : 16px;
		font-weight: bold;
		text-align: right;
	}
	#address {
	border-color: #f4623a;
	margin-left: 5px;
	background-color: #f4623a;
	color: white;
	font-weight: 500;
	width: 122px;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h4 style="text-align: left;"><strong>수확 결제</strong></h4>
		</div>
		<hr color= #f4623a style="height: 2px;">
		<!--  농장테이블 -->
		<table id="farmTable" class="table table-bordered" style="margin-bottom: 0;">
			<thead>
				<tr>
					<th>번호</th>
					<th>농장명</th>
					<th>농장주소</th>
					<th>텃밭명</th>
					<th>수확방법</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>${harvestInfo.farm_nm }</td>
					<td>${harvestInfo.farm_address }</td>
					<td>${harvestInfo.garden_nm } ${harvestInfo.garden_no }</td>
					<c:if test="${harvestInfo.harvest_type == 01 }">
						<td>직접 방문</td>
					</c:if>
					<c:if test="${harvestInfo.harvest_type == 02 }">
						<td>택배수령</td>
					</c:if>
				</tr>
			</tbody>
		</table>
		
		<div  id="price">
			<h6>
			결제금액 :
			<c:if test="${harvestInfo.harvest_type == 01}">
				0원
			</c:if> 
			<c:if test="${harvestInfo.harvest_type == 02 }">
				20,000원
			</c:if> 
			</h6>
		</div>
		<!--  STEP1 CARD -->
		<div class="card">
			<div class="card-header">
				<div id="step">STEP1</div>
				<div id="info">주문자 정보를 입력하세요.</div>
				<button class="btn" id="collapse1btn" type="button" id="toggle-btn">
					<i class="fas fa-chevron-down" id="icon"></i>
				</button>
			</div>
			<div id="collapse1" class="card-collapse collapse show" role="tabpanel">
				<div class="card-block" style="padding-top: 10px;">
					<form action="${contextPath }/ep/ep001_d007/kakaoPay" method="post" id="form">
						<input type="hidden" name="farm_no" value="${harvestInfo.farm_no }">
						<input type="hidden" name="farm_nm" value="${harvestInfo.farm_nm }">
						<input type="hidden" name="garden_no" value="${harvestInfo.garden_no }">
						<input type="hidden" name="garden_nm" value="${harvestInfo.garden_nm }">
						<input type="hidden" name="harvest_type" value="${harvestInfo.harvest_type }">
						<input type="hidden" name="order_code" value="04">
						<input type="hidden" name="quantity" value="1">
						<div class="form-group row">
						<label class="col-sm-2 col-form-label-sm">주문자</label>
						<input type="text" id="user_nm" name="user_nm" class="form-control form-control-sm col-sm-3" value="${user.USER_NM }" placeholder="이름" maxlength="4" required>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label-sm">이메일</label>
							<input type="text" class="form-control form-control-sm col-sm-5" name="email" id="email" value="${user.USER_EMAIL }" required>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label-sm">휴대전화</label>
								<input type="text" class="form-control form-control-sm col-sm-5" name="phone" id="phone" value="${user.USER_PHONE }" required> 
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label-sm">주소</label> 
							<input type="text" class="form-control form-control-sm col-sm-3" id="postcode" name="postcode" placeholder="우편번호" readonly>
							<input type="button" class="form-control form-control-sm col-sm-1" id="address" value="주소검색" style="margin-left: 5px; background-color: #e36b47; color:white;">
							
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label-sm">&nbsp;</label> 
							<input type="text" class="form-control form-control-sm col-sm-5" id="roadAddress" name="roadAddress" placeholder="도로명주소" readonly>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label-sm">&nbsp;</label> 
							<input type="text" class="form-control form-control-sm col-sm-5" id="detailAddress" name="detailAddress" placeholder="상세주소" required>
						</div>
				</div>
			</div>
			<!-- collapse1 -->
		</div>
		<!-- card -->
		
		<!--  STEP 2 -->
		<div class="card">
			<div class="card-header">
				<div id="step">STEP2</div>
				<div id="info">결제수단을 선택하세요.</div>
				<button class="btn" id="collapse2btn" type="button" id="toggle-btn">
					<i class="fas fa-chevron-down" id="icon"></i>
				</button>
			</div>
			<div id="collapse2" class="card-collapse collapse" role="tabpanel">
				<div class="card-block" style="margin: 10px;">
					<div>
						<table>
						<tr>
							<td style="padding-bottom: 10px; font-weight: bold;">
							<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 5px; margin-right: 10px;"></i>결제수단</td>
						</tr>
						<tr>
							<c:forEach items="${paymentList}" var="payment">
								<td style="padding-left: 32px;">
									<input type="radio" class="auth" name="payment_way" value="<c:out value="${payment.code_id}"></c:out>"onclick="selectContract(this)"  required>
									<c:out value="${payment.code_nm}"></c:out>
								</td>
							</c:forEach>
						</tr>
						</table>
		        	</div>
				</div>
			</div>
		</div>
		<div style="text-align: center; margin: 40px;">
			<button class="btn btn-sm" onclick="window.location.href='${contextPath}/ep/ep001_d005/init.do'" style="background-color: #f4623a; color:white;">뒤로가기</button>
			<button class="btn btn-sm" type="button" onclick="check()" style="background-color: #f4623a; color:white;">결제하기</button>
		</div>
		</form>
	</div>
	<script>
	document.querySelector('ul#sidebar li:nth-child(5) div').style.backgroundColor = "#343a40";
	document.querySelector('ul#sidebar li:nth-child(5) p').style.fontWeight = "bold";
	
	// toggle 버튼
	$('#collapse1btn').click(function() {
		$('#collapse1').collapse('toggle')	
	});
	$('#collapse2btn').click(function() {
		$('#collapse2').collapse('toggle')	
	});
	// 우편번호찾기 버튼 클릭시
	document.querySelector("#address").addEventListener('click', function() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
            }
        }).open();
	});
	
	// 휴대폰 번호 입력 칸 숫자인지 확인
	function inNumber() {
		if (event.keyCode<48 || event.keyCode>57) {
			event.returnValue = false;
		}
	}
	
	function check() {
		if(document.querySelector('#user_nm').value.length == 0) {
			document.querySelector('#user_nm').style.borderColor = 'red';
			return false;
		} else {
			document.querySelector('#user_nm').style.borderColor = '#ced4da';
		}
		
		if(document.querySelector('#email').value.length == 0) {
			document.querySelector('#email').style.borderColor = 'red';
			return false;
		} else {
			document.querySelector('#email').style.borderColor = '#ced4da';
		}
		
		if(document.querySelector('#phone').value.length == 0) {
			document.querySelector('#phone').style.borderColor = 'red';
			return false;
		} else {
			document.querySelector('#phone').style.borderColor = '#ced4da';
		}
		if(document.querySelector('#detailAddress').value.length == 0) {
			document.querySelector('#detailAddress').style.borderColor = 'red';
			return false;
		} else {
			document.querySelector('#detailAddress').style.borderColor = '#ced4da';
		}
		
		let radio = document.getElementsByName('payment_way');
		for(let i=0; i<radio.length; i++) {
			if(radio[i].checked == true) {
				document.querySelector('#form').submit();
				return true;
			}
		}
		alert('결제 수단을 선택해주세요.');
		$('#collapse2').collapse('show')
	}
	</script>
</body>
</html>