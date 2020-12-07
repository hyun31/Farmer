<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3 style="color:black;">농장등록</h3>
	<hr>
	<form method="post" action="${contextPath }/kp/kp001_d009/insertFarm.do" enctype="multipart/form-data">
	<div class="form-row">
		<div class="form-group col-md-4">
			<label for="farm_name">농장명</label>
			<input type="text" class="form-control" name="farm_name" id="farm_name" placeholder="농장명을 입력하세요" required>
		</div>
		<div class="form-group col-md-2">
			<label>계약기간</label>
			<select class="form-control" name="contractDate">
				<c:forEach items="${contractDate}" var="date">
					<option><c:out value="${date.code_nm }"></c:out></option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group col-md-3">
			<label for="farm_name">구좌수</label>
			<input type="number" class="form-control" name="garden_cnt" id="garden_cnt" placeholder="구좌수를 입력하세요" required>
		</div>
	</div>
	<div class="form-row">
		<div class="form-group col-md-6">	
			<label for="farm_position">농장주소</label>
			<input type="text" class="form-control" name="postcode" id="postcode" placeholder="우편번호" required>
		</div>
		<div class="form-group col-md-3">
			<label>&nbsp;</label>
			<input type="button" class="form-control" id="address" value="주소검색">
		</div>
		<div class="form-group col-md-6">
			<input type="text" class="form-control" name="roadAddress" id="roadAddress" placeholder="도로명주소">
		</div>
		<div class="form-group col-md-6">
			<input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="상세주소">
		</div>
	</div>
	<div class="form-group">
		<label for="farm_phone">농장전화번호</label>
		<input type="number" class="form-control" name="farm_phone" id="farm_phone" placeholder="농장 전화번호를 입력하세요" required>
	</div>
	<div class="form-row">
		<div class="form-group col-md-6">	
			<label for="farm_position">농장주아이디</label>
			<input type="text" class="form-control" name="farmer_id" id="farmer_id" placeholder="농장주아이디를 입력하세요." required>
		</div>
		<div class="form-group col-md-6">
			<label for="farmer_id">농장주연락처</label>
			<input type="number" class="form-control" name="farmer_phone" id="farmer_phone" placeholder="농장주연락처를 입력하세요." required> 
		</div>
	</div>
	<div class="form-group">
		<label for="farm_info">농장소개글</label>
		<textarea class="form-control" name="farm_info" id="farm_info" rows="7" required></textarea>
	</div>
	<div class="form-group">
		<label for="farm_photo">농장메인사진</label>
		<input type="file" class="form-control-file" id="farm_photo" name="file" required>
		<div class="select_img"><img src=""></div>
	</div>
	<button type="submit" class="btn btn-primary">등록하기</button>
	</form>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// img 첨부 확인
		$("#farm_photo").change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
			    reader.onload = function(data) {
					$(".select_img img").attr("src", data.target.result).width(500);        
				}
				reader.readAsDataURL(this.files[0]);
			}
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
		
		document.querySelector('#farm_phone').addEventListener('keyup', function(e) {
			const value = document.querySelector('#farm_phone').value;
			console.log(value);
			var str = value.replace(/[^0-9]/g, '');
		    var tmp = '';
		    if( str.length < 4){
		    	return str;
		    }else if(str.length < 7){
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			}else if(str.length < 11){
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			}else{              
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}
			return str;
		});
	</script>
</body>
</html>