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
		border: 1px solid rgba(0,0,0,.125);
		margin-bottom: 10px;
		background-color: #f7f7f7;
		border-radius: .25rem;
	}
	
	thead tr th {
		text-align: center;
	}
	
	#garden_nm, #garden_info, #garden_date {
		color: #f4623a;
	}
	
	.help {
		padding-top: 10px 0 6px 10px;
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
	
	contract {
		padding-right: 10px;
	}
	
	#contract_help {
		padding-top: 10px;
		color: gray;
		font-size: 13px;
		padding-bottom : 6px;
	}
	
	.label {
		margin-bottom: 96px;
	}
	
	.label * {
		display: inline-block;
		vertical-align: top;
	}
	
	.label .left {
		background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;
		display: inline-block;
		height: 24px;
		overflow: hidden;
		vertical-align: top;
		width: 7px;
	}
	
	.label .center {
		background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;
		display: inline-block;
		height: 24px;
		font-size: 12px;
		line-height: 24px;
	}
	
	.label .right {
		background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;
		display: inline-block;
		height: 24px;
		overflow: hidden;
		width: 6px;
	}
	
	.form-group {
		margin: 0;
	}
	.card-header {
		background-color: #343a40;
		color: white;
	}
	
	table.dataTable {
		margin: 0 auto 10px auto;
		font-size: 14px;
	}
	
	table.dataTable thead th {
       	border-bottom: 0;
       	border-top: 1px solid #111;
       	background-color: #f7f7f7;
    }
    
    div.dataTables_wrapper .pagination {
        text-align: center;
    }
    
    .pagination {
  		display: inline-block;
	}
	
	.pagination a {
		color: black;
		float: left;
		padding: 8px 16px;
		text-decoration: none;
	}
	
	.pagination a.current {
		background-color: #f4623a;
		color: white;
	}
	
	#farmTable_wrapper {
		text-align: center;
	}
	
	.pagination a:hover:not(.active) {
		background-color: #f7f7f7; 
	}
	
	button#info {
		margin-right: 5px;
	}
	
	#wrapper button.btn-sm {
		background-color : #f4623a;
		color: white;
	}
		
	#button_wrapper button {
		background-color: #f4623a;
		color: white;
		float: right;
		margin-left: 10px;
	}
	
	tbody input[type="number"] {
		width: 60px;
	}
	
	tbody select.form-control {
		width: 130px;
	}
	
	#step{
		display: inline;
		font-size: 20px;
		font-weight: 600;
	}
	
	#info_fm {
		display: inline;
		font-weight: 400;
		font-size: 18px;
		padding-left: 20px;
	}
	
	#collapse1btn {
		float: right;
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
	
	#table_period {
		margin-top: 10px;
		text-align: center;
		border-top: 2px solid #343a40;
		border-bottom: 2px solid #343a40;
		
	}
	
	#table_thead {
		background-color: #f7f7f7;
		font-size: 15px;
		font-weight: bold;
	}
	
</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h4 style="text-align: left;">
				<strong>농장/텃밭 연장신청</strong>
			</h4>
		</div>
		<hr color= #f4623a style="height: 2px;">
		
		<!--  STEP1 CARD -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header" >
					<div>
						<div id="step">STEP1</div>
							<div id="info_fm">연장할 농장/텃밭을 선택하세요.</div>
								<button class="btn" id="collapse1btn" type="button" id="toggle-btn">
									<i class="fas fa-chevron-down" id="icon"></i>
								</button>
					</div>
			</div>
			<div id="collapse1" class="card-collapse collapse show" role="tabpanel" style="background-color: #f7f7f7">
				<div class="card-block" style="padding: 10px 0 0 10px;">
				<form>
						<label style="font-size: 16px; font-weight: bold; margin-top: 10px;">
						<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 50px; margin-right: 10px;"></i>내 텃밭 고르기</label>
						<div class="form-group row col-sm-10">
							<div style="margin-left: 60px; margin-bottom: 20px; width: 150px;">
								<select id="farm" class="form-control form-control-sm" style="width: 150px;" onchange="selectFarm()">
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
			선택한 텃밭 : <span id="garden_info"></span></span><br>
			<span style="font-size: 15px; font-weight: bold;">
			<i class="fas fa-check" style="color: #f4623a; margin-right: 10px;"></i>
			계약 날짜 : <span id="garden_date"></span></span><br>
		</div>
		
		<!--  STEP 2 -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header"> 
				<div>
					<div id="step">STEP2</div>
					<div id="info_fm">연장할 분양기간을 선택하세요.</div>
				</div>
			</div>
			<div id="collapse2"  class="card-collapse collapse" role="tabpanel" style="background-color: #f7f7f7;">
				<div class="card-block" style="padding: 10px 0 0 10px;">
					<div id="contract">
						<table>
							<tr>
								<td style="padding-bottom: 10px; font-weight: bold;">
								<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 5px; margin-right: 10px;"></i>분양기간</td>
							</tr>
							<tr>
								<c:forEach items="${contractDate}" var="contract">
									<td style="padding-left: 32px;">
										<input type="radio" class="contract_date" name="contract" value="<c:out value="${contract.code_id}"></c:out>" onclick="selectContract(this)" required>
										<c:out value="${contract.code_nm}"></c:out>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>	
					<div id="contract_help">
						* 분양기간은 텃밭이용 시작 후 변경 혹은 중단이 어려우므로 신중하게 선택해주시기 바랍니다.
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 40px;">
			<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
			 <span style="font-weight: bold; font-size: 16px;">분양기간 정보</span>
		</div>
		<table class="table table-hover table-sm" id="table_period">
			<thead id="table_thead">
				<tr>
					<td scope="col">번호</td>
					<td scope="col">농장명</td>
					<td scope="col">텃밭명</td>
					<td scope="col">시작일</td>
					<td scope="col">종료일</td>
				</tr>
			</thead>
			<tbody id="info"></tbody>
		</table>
		
		<form id="applyform" method="post" action="${contextPath }/ep/ep001_d003/extensionApply.do" style="text-align: center;">
			<input type="hidden" name="farm_no" id="farm_no">
			<input type="hidden" name="farm_nm" id="farm_nm">
			<input type="hidden" name="garden_nm" id="garden_nm">
			<input type="hidden" name="garden_no" id="garden_no">
			<input type="hidden" name="extension_date" id="extension_date">
			<input type="hidden" name="new_end_date" id="new_end_date">
			<input type="hidden" name="farm_address" id="farm_address">
			<input type="hidden" name="area_size" id="area_size">
			<div>
				<button class="btn" type="button" id="button_fin_2" onclick="location.reload()">다시선택</button>
				<button class="btn" type="button" id="button_fin" onclick="apply()">신청하기</button>
			</div>
		</form>	
	</div>
	<script>
		// 농장번호, 텃밭번호, 시작일, 끝나는일
		let extension = {
				farm_nm : "",
				farm_no : "",
				garden_nm : "",
				garden_no : "",
				start_date : "",
				end_date : "",
				extension_date : "",
				new_end_date : "",
				farm_address : ""
		}
		
		$('#collapse1btn').click(function() {
			$('#collapse1').collapse('toggle')	
		});
		
		function selectFarm() {
			let farm_select = document.querySelector('#farm');
			extension.farm_no = farm_select.options[farm_select.selectedIndex].value; // 농장번호
			extension.farm_nm = farm_select.options[farm_select.selectedIndex].innerText; // 농장 이름
			console.log(extension.farm_no + " / / " + extension.farm_nm);
			let gardenselect = document.querySelector('#garden');
			$.ajax({
				url: "selectGardenList.do",
				method : "post",
				data : { farm_no : extension.farm_no },
				success : function(data) {
					gardenselect.options.length = 0; // option 모두 제거
					
					console.log(data);
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
			extension.garden_nm = garden_nm;
			extension.garden_no = garden_select.options[garden_select.selectedIndex].value; // 텃밭번호저장
			document.querySelector('#garden_info').appendChild(document.createTextNode(garden_nm+' '+extension.garden_no));
			$.ajax({
				url : "selectGardenInfo.do",
				method : "post",
				data: {farm_no : extension.farm_no, garden_no : extension.garden_no},
				success: function(data) {
					console.log(data);
					let obj = JSON.parse(data);
					extension.start_date = obj.START_DATE; // 마지막에 사용하기 위해 저장
					extension.end_date = obj.END_DATE;	// 마지막에 사용하기 위해 저장
					extension.farm_address = obj.ADDRESS;
					let text = document.createTextNode(obj.START_DATE + '~' + obj.END_DATE);
					document.querySelector('#garden_date').appendChild(text);
					document.querySelector('#selectBtn').disabled = true;
					document.querySelector('#area_size').value = obj.AREA_SIZE;
				}
			})
		}
		
		function selectContract(e) {
			let extension_date = e.value==1 ? 3 : 6;
			extension.extension_date = extension_date;
			const tbody = document.querySelector('#info');
			console.log(tbody.childNodes.length);
			if(tbody.childNodes.length == 0) {
				let tr = document.createElement('tr');
				let td = document.createElement('td');
				
				td.appendChild(document.createTextNode('1'));
				tr.appendChild(td);
				
				td = document.createElement('td');
				td.appendChild(document.createTextNode(extension.farm_nm));
				tr.appendChild(td);
				
				td = document.createElement('td');
				td.appendChild(document.createTextNode(extension.garden_nm));
				tr.appendChild(td);
				
				td = document.createElement('td');
				td.appendChild(document.createTextNode(extension.end_date));
				tr.appendChild(td);
				
				let new_date = new Date(extension.end_date);
				new_date.setMonth(new_date.getMonth() + extension_date);
				extension.new_end_date = formatDate(new_date);
				
				td = document.createElement('td');
				td.appendChild(document.createTextNode(extension.new_end_date));
				td.style.color = '#f4623a';
				tr.appendChild(td);
				
				tbody.appendChild(tr);
			} else {
				console.log(tbody.childNodes[0].lastChild);
				let new_date = new Date(extension.end_date);
				new_date.setMonth(new_date.getMonth() + extension_date);
				extension.new_end_date = formatDate(new_date);
				tbody.childNodes[0].lastChild.replaceChild(document.createTextNode(extension.new_end_date), tbody.childNodes[0].lastChild.childNodes[0]);
			}
		}
		
		// Date -> String(yyyy-mm-dd)
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;

		    return [year, month, day].join('-');
		}
		
		function apply() {
			console.log(extension);
			document.querySelector('#farm_no').value = extension.farm_no;
			document.querySelector('#farm_nm').value = extension.farm_nm;
			document.querySelector('#garden_no').value = extension.garden_no;
			document.querySelector('#garden_nm').value = extension.garden_nm;
			document.querySelector('#extension_date').value = extension.extension_date;
			document.querySelector('#new_end_date').value = extension.new_end_date;
			document.querySelector('#farm_address').value = extension.farm_address;
			if(extension.garden_no == "") {
				alert('농장과 텃밭을 선택해주세요.')
				return false;
			}
			if(extension.extension_date == "") {
				alert('연장할 분양기간을 선택해주세요.')
				return false;
			}
			document.querySelector('#applyform').submit();
		}
		
		document.querySelector('ul#sidebar li:nth-child(3) div').style.backgroundColor = "#343a40";
		document.querySelector('ul#sidebar li:nth-child(3) p').style.fontWeight = "bold";
	</script>
</body>
</html>