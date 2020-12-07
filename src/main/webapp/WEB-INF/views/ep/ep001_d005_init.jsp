<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e33026c580a9b0fdf9e6e48910d757e&libraries=services, clusterer"></script>
<style>
	#wrapper {
		width: 55%;
		margin: 0 auto;
		margin-top: 40px;
		padding: 29px 29px 0;
		border: 1px solid lightgray;
		border-radius: 6px;
	}
	#selectedGarden {
		padding: 10px;
		margin-top: 30px;
		text-align: left;
		border: 1px solid lightgray;
	}
	#garden_info {
		color: #f4623a;
	}
	.help {
		padding: 10px 0 6px 10px;
		color: gray;
		font-size: 13px;
	}
	#collapse2>.panel-body {
		padding: 0;
	}
	h5 {
		margin: 0;
	}
	#collapse1btn{
		padding-top: 2px;
	}
	.label {margin-bottom: 96px;}
	.label * {display: inline-block;vertical-align: top;}
	.label .left {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	.label .center {background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 24px;}
	.label .right {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
	.form-group {
		margin: 0;
	}
	.card-header {
		background-color: #343a40;
		color: white;
	}
	
	#info_fm {
		display: inline;
		font-weight: 400;
		font-size: 18px;
		padding-left: 20px;
	}
	
	#step{
		display: inline;
		font-size: 20px;
		font-weight: 600;
	}
	
	#button_fin {
		background-color: #f4623a;
		color:white;
		border-color: #f4623a;
		font-size: 18px;
		margin-top: 30px;
		margin-bottom: 10px;
		width: 120px;
		height: 40px;
	}
	
	#button_fin_2 {
		background-color: #f7f7f7;
		color: #c2c2c2;
		border-color: lightgray;
		font-size: 18px;
		margin-top: 30px;
		margin-bottom: 10px;
		width: 120px;
		height: 40px;
	}
	
	#collapse1btn{
		float: right;
	}
	
	#selectedGarden {
		padding: 10px;
		margin-top: 30px;
		text-align: left;
		border: 1px solid rgba(0,0,0,.125);
		margin-bottom: 10px;
		background-color: #f7f7f7;
		border-radius: .25rem;
	}
	
	#selectBtn{
		background-color: #f4623a;
		color: white;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h4 style="text-align: left;"><strong>수확 상품결제</strong></h4>
		</div>
		<hr color= #f4623a style="height: 2px;">
		<!--  STEP1 CARD -->
		<div class="card" style="margin-bottom: 17p">
			<div class="card-header">
				<div>
					<div id="step">STEP1</div>
						<div id="info_fm">수확 할 텃밭을 선택하세요.</div>
							<button class="btn" id="collapse1btn" type="button" id="toggle-btn">
							<i class="fas fa-chevron-down" id="icon"></i>
							</button>
				</div>
			</div>
			<div id="collapse1" class="card-collapse collapse show" role="tabpanel" style="background-color: #f7f7f7;">
				<div class="card-block" style="padding: 10px 0 0 10px;">
				<form>
					<label style="font-size: 16px; font-weight: bold; margin-top: 10px;">
						<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 50px; margin-right: 10px;"></i>내 텃밭 고르기</label>
						<div class="form-group row col-sm-10">
							<div style="margin-left: 60px; margin-bottom: 20px; width: 150px;">
								<select id="farm" class="form-control form-control-sm" onchange="selectFarm()">
									<option value="-1">농장선택</option>
									<c:forEach items="${farmList}" var="farm">
										<option value="<c:out value="${farm.FARM_NO }"></c:out>">
										<c:out value="${farm.FARM_NM }"></c:out></option>
									</c:forEach>
								</select>
							</div>
							<div style="margin-left: 10px;">
								<select id="garden" class="form-control form-control-sm" style="width: 150px;">
									<option value="">텃밭선택</option>
								</select>
							</div>
							<div class="col-sm-3">
								<button type="button" id="selectBtn" class="btn btn-sm" onclick="selectGarden()">선택</button>
							</div>
						</div>
				</form>
				</div>
			</div>
			<!-- collapse1 -->
		</div>
		<!-- card -->
		
		<div id="selectedGarden">
		<span style="font-size: 15px; font-weight: bold;">
			<i class="fas fa-check" style="color: #f4623a; margin-right: 10px;"></i>
			선택한 텃밭 : <span id="garden_info"></span></span>
		</div>
		
		<!--  STEP 2 -->
		<div class="card">
			<div class="card-header"> 
				<div>
					<div id="step">STEP2</div>
					<div id="info_fm">수확 방법을 선택하세요.</div>
				</div>
			</div>
			<div id="collapse2"  class="card-collapse collapse" role="tabpanel" style="background-color: #f7f7f7">
				<div class="card-block" style="padding: 10px 0 0 10px;">
					<table>
						<tr>
							<td style="padding-bottom: 10px; font-weight: bold;">
								<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 5px; margin-right: 10px;"></i>수확방법선택</td>
						</tr>
						<tr>
							<td style="padding-left: 32px;">
								<input type="radio" class="contract_date" name="harvest" value="01" style="margin-right: 5px;">직접방문 (+0원)
							</td>
							<td style="padding-left: 20px;">
								<input type="radio" class="contract_date" name="harvest" value="02" style="margin-right: 5px;">택배수령 (+20,000원)
							</td>
						</tr>
					</table>
					<div class="help">
						* 수확 방법은 결제 후에 변경이 어려우므로, 신중히 선택하세요.
					</div>
				</div>
			</div>
		</div>
		<form id="applyform" method="post" action="${contextPath }/ep/ep001_d005/pay.do" style="text-align: center;">
			<input type="hidden" name="farm_no" id="farm_no">
			<input type="hidden" name="farm_nm" id="farm_nm">
			<input type="hidden" name="garden_nm" id="garden_nm">
			<input type="hidden" name="garden_no" id="garden_no">
			<input type="hidden" name="harvest_type" id="harvest_type">
			<div>
				<button class="btn" type="button" id="button_fin_2" onclick="location.reload()">다시선택</button>
				<button class="btn" type="button" id="button_fin" onclick="pay()">결제하기</button>
			</div>
		</form>
	</div>
	<script>
		document.querySelector('ul#sidebar li:nth-child(5) div').style.backgroundColor = "#343a40";
		document.querySelector('ul#sidebar li:nth-child(5) p').style.fontWeight = "bold";
		// 농장번호, 텃밭번호
		let harvest = {
				farm_nm : "",
				farm_no : "",
				garden_nm : "",
				garden_no : "",
				farm_address : "",
				harvest_type : ""
		}
		
		$('#collapse1btn').click(function() {
			$('#collapse1').collapse('toggle')	
		});
		
		function selectFarm() {
			let farm_select = document.querySelector('#farm');
			harvest.farm_no = farm_select.options[farm_select.selectedIndex].value; // 농장번호
			harvest.farm_nm = farm_select.options[farm_select.selectedIndex].innerText; // 농장 이름
			let gardenselect = document.querySelector('#garden');
			$.ajax({
				url: "selectGardenList.do",
				method : "post",
				data : { farm_no : harvest.farm_no },
				success : function(data) {
					gardenselect.options.length = 0; // option 모두 제거
					const obj = JSON.parse(data);	// string -> obj
					
					for(let i=0; i < obj.length; i++) {
						let option = document.createElement('option'); // <option></option>
						option.appendChild(document.createTextNode(obj[i].GARDEN_NM+' '));  // <option>개나리</option>
						option.appendChild(document.createTextNode(obj[i].GARDEN_NO));
						option.value = obj[i].GARDEN_NO;	// <option value="1">개나리</option>
						
						gardenselect.appendChild(option);	// <select> <option>개나리</option> </select>	
					}
				}
			});
		}
		
		function selectGarden() {
			let farm_select = document.querySelector('#farm');
			if(farm_select.options[farm_select.selectedIndex].value == -1) {
				alert('농장과 텃밭을 선택해주세요.');
				return false;
			}
			$('#collapse2').collapse('show')
			let garden_select = document.querySelector('#garden');
			let garden_nm = garden_select.options[garden_select.selectedIndex].innerText.split(' ')[0];
			harvest.garden_nm = garden_nm;
			harvest.garden_no = garden_select.options[garden_select.selectedIndex].value;
			document.querySelector('#garden_info').innerText = garden_nm + ' ' + harvest.garden_no;
			document.querySelector('#selectBtn').disabled = true;
		}
		
		function cancel() {
			location.reload();
		}
		
		function pay() {
			if(document.querySelector('input[name = harvest]:checked') == null) {
				alert('수확방법을 선택해주세요.')
			} else {
				harvest.harvest_type = document.querySelector('input[name = harvest]:checked').value;
			
				document.querySelector('#farm_no').value = harvest.farm_no;
				document.querySelector('#farm_nm').value = harvest.farm_nm;
				document.querySelector('#garden_no').value = harvest.garden_no;
				document.querySelector('#garden_nm').value = harvest.garden_nm;
				document.querySelector('#harvest_type').value = harvest.harvest_type;
				document.querySelector('#applyform').submit();
			}
		}
	</script>
</body>
</html>