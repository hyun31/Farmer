<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<style>
	#wrapper {
		width: 55%;
		margin: 0 auto;
		margin-top: 40px;
		padding-top: 40px;
		padding: 29px 29px 0;
		border: 1px solid lightgray;
		border-radius: 6px;
	}
        
	#state {
		padding: 10px;
		margin-top: 30px;
		text-align: left;
		border: 1px solid lightgray;
	}
   
   #wrapper label {
   		width: 130px;
   		margin-left: 30px;
   }
</style>
</head>
<body>
<div id="wrapper">
	<h4 style="text-align: left;">
		<strong>농장 등록 신청서</strong>
		<span style="font-size: 16px; float:right; aling: right; text-align: right;">*필수</span>
	</h4>
	<hr color= #f4623a style="height: 2px;">
	
	<form method="post" action="${contextPath }/hp/hp001_d004/insertFarm.do" enctype="multipart/form-data">
		<div class = "form-group row">
			<label class="col-form-label"><strong>양식 구분</strong></label>
			<div class="form-check-inline">
				<label><input class="form-check-input" type="radio" name="form_type" id="exampleRadios1" value="01" checked>등록 신청서</label>
			</div>
			<!-- <div class="form-check-inline">
				<label><input class="form-check-input" type="radio" name="form_type" id="exampleRadios1" value="02" >연장 신청서</label>
			</div> -->
		</div>
		<hr>
		<div class = "form-group row">
			<label for="staticEmail" class="col-form-label"><strong>농장주 성명</strong></label>
			<!-- <div class="col-sm-10"> -->
	     		<input type="text" class="form-control" name="farmer_nm" id="farmer_nm" style="width: 300px; background-color: #f7f7f7;" maxlength="4" required>
			<!-- </div> -->
	 	</div>
		<hr>
		<div class = "form-group row">
			<label for="staticEmail" class="col-form-label"><strong>농장주 연락처</strong></label>
	 		<!-- <div class="col-sm-10"> -->
	 			<input type="text" class="form-control" name="farmer_phone" id="farmer_phone" style="width: 300px; background-color: #f7f7f7;" maxlength="13" onKeyup="inputTelNumber(this);" required>
	 		<!-- </div> -->
	 	</div>
		<hr>
	    <div class = "form-group row">
			<label for="staticEmail" class="col-form-label"><strong>농장주 이메일</strong></label>
			<!-- <div class="col-sm-10"> -->
				<input type="text" class="form-control" name="farmer_email" id="farmer_email" style="width: 300px; background-color: #f7f7f7;" placeholder="(ex) imfarmers@gmail.com" required>
			<!-- </div> -->
		</div>
		<hr color= "#f4623a">
		<div class = "form-group row">
			<label for="staticEmail" class="col-form-label"><strong>계약기간</strong></label>
			<c:forEach items="${contractDate}" var="date">
				<div class="form-check-inline">
					<label><input class="form-check-input" type="radio" name="contract_term" value="${date.code_id }" checked>${date.code_nm }</label>
				</div>
			</c:forEach>
		</div>
		<hr>
		<div class = "form-group row">
			<label for="staticEmail" class="col-form-label"><strong>농장명</strong></label>
			<!-- <div class="col-sm-10"> -->
				<input type="text" class="form-control" name="farm_name" id="farm_name" style="width: 300px; background-color: #f7f7f7;" id="farm_name" required>
			<!-- </div> -->
		</div>
		<hr>
		<div class = "form-group row">
			<label class="col-form-label"><strong>농장 연락처</strong></label>
			<!-- <div class="col-sm-10"> -->
				<input type="text" class="form-control" name="farm_phone" id="farm_phone" style="width: 300px; background-color: #f7f7f7;" maxlength="13" onKeyup="inputTelNumber(this);">
			<!-- </div> -->
		</div>
		<hr>
		<div class = "form-group row">
			<label class="col-form-label" ><strong>농장주소</strong></label>
			<input type="text" class="form-control col-sm-4" id="postcode" name="postcode" placeholder="우편번호" style="background-color: #f7f7f7;" readonly required>
			<button type="button" class="form-control" id="address" style="margin-left: 15px; width: 100px;">주소검색</button>
		</div>
		<div class = "form-group row">
			<label class="col-form-label" >&nbsp;</label>
			<input type="text" class="form-control col-sm-6" id="roadAddress" name="roadAddress" placeholder="도로명주소" style="background-color: #f7f7f7;" readonly required>	
		</div>
		<div class = "form-group row">
			<label class="col-form-label" >&nbsp;</label>
			<input type="text" class="form-control col-sm-6" id="detailAddress" name="detailAddress" placeholder="상세주소" style="background-color: #f7f7f7;" required>
		</div>
		<hr>
		<div class = "form-group row">
			<label class="col-form-label"><strong>토지대장<br>첨부파일</strong></label>
			<!-- <div class="col-sm-10"> -->
				<input type="file" class="form-control-file col-sm-6" id="farm_photo" name="file" required>
			<!-- </div> -->
		</div>
		<hr color= "#e36b47">
	
		<h5 style="text-align: left; color: grey; margin-bottom: 40px;">
			<strong>농장 상세정보 입력</strong>
		</h5>
		<div class = "form-group row">
			<label class="col-form-label"><strong>신청 구획수</strong></label>
			<input type="number" class="form-control" name="garden_cnt" id="garden_cnt" style="width: 190px; background-color: #f7f7f7;" placeholder="구획수를 입력하세요." required>
			<label class="col-form-label"><strong>구획 당 면적</strong></label>
			<select class="form-control" name="area_size" style="width: 100px; background-color: #f7f7f7;" required>
				<c:forEach items="${areaSize}" var="size">
					<option value="${size.code_id }">${size.code_nm }</option>
				</c:forEach>
			</select>
		</div>
		<hr>
		<div class = "form-group row">
			<label class="col-form-label"><strong>농장소개글</strong></label>
			<textarea class="form-control col-sm-8" name="farm_info" id="farm_info" rows="6" style="background-color: #f7f7f7;" required></textarea>
	  	 </div>
	  	 	
		<div class = "form-group row">
			<label class="col-form-label"><strong>농장메인사진</strong></label>
			<!-- <div class="col-sm-9"> -->
				<input type="file" class="form-control-file col-sm-6" id="farm_photo" name="file" required>
			<!-- </div> -->
	  	 </div>	
		<hr align="left" style="border: solid 1px #e36b47; width: 100%;">
	
		<button type="submit" class="btn btn-primary" style="background-color: #e36b47; border-color: #e36b47; margin: 0 auto;">신청하기</button>
		<%-- <button type="button" class="btn btn-primary" style="background-color: #e36b47; border-color: #e36b47; margin: 0 auto;" onClick="window.open('${contextPath}/hp/hp001_d004/insertFarmResultList.do','','width=1000, height=250, left=350, top=400')">신청목록</button> --%>
		<div>
			<span>※ 신청하기를 누르기 전에 다시 한번 작성하신 내용을 확인해주세요.
			<br>신청하기를 누른 후에는 수정이 어렵습니다.</span>
		</div>
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.querySelector('ul#sidebar li:nth-child(4) div').style.backgroundColor = "#343a40";
document.querySelector('ul#sidebar li:nth-child(4) p').style.fontWeight = "bold";

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

function inputTelNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var tel = "";

    // 서울 지역번호(02)가 들어오는 경우
    if(number.substring(0, 2).indexOf('02') == 0) {
        if(number.length < 3) {
            return number;
        } else if(number.length < 6) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2);
        } else if(number.length < 10) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 3);
            tel += "-";
            tel += number.substr(5);
        } else {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 4);
            tel += "-";
            tel += number.substr(6);
        }
    
    // 서울 지역번호(02)가 아닌경우
    } else {
        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3);
        } else if(number.length < 11) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 3);
            tel += "-";
            tel += number.substr(6);
        } else {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 4);
            tel += "-";
            tel += number.substr(7);
        }
    }

    obj.value = tel;
}

</script>
</body>
</html>