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
	html {
		height: 100%;
	}
	body {
		heigth: 100%;
		width: 100%;
	}
	#wrapper {
		width: 55%;
		margin: 0 auto;
		margin-top: 40px;
		padding: 29px 29px 0;
		border: 1px solid lightgray;
		border-radius: 6px;
	}
	#selectedFarm {
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

	#table button.btn {
		padding: 3px 6px;
		margin: 0px 2px;
	}

	#farm_nm {
		color: #f4623a;
	}

	#contract {
		padding-right: 10px;
	}

	#contract_help {
		padding-top: 10px;
		color: gray;
		font-size: 14px;
		padding-bottom : 6px;
	}

	#collapse2>.panel-body {
		padding: 0;
	}
	
	h5 {
		margin: 0;
	}
	
	#map_wrap {
		position:relative;
		overflow:hidden;
		width:100%;
		height:600px;
		margin-bottom:20px;
	}
	
	#map {
		height: 100%;
		width: 100%;
	}
	
	#collapse1btn{
		padding-top: 2px;
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
		text-align: center;
	}
	
	table.dataTable thead th {
       	border-bottom: 0;
       	border-top: 3px solid #343a40;
       	background-color: #f7f7f7;
       	font-size: 15px;
       	margin-bottom: 10px;
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
	
	#collapse2.collapse.show {
		height: 344px;
	}
	
	#farmTable button.btn-sm {
		font-size: 13px;
		background-color: white; 
		border:1px solid #f4623a;
		color: #f4623a;
		padding: 3px;
	}
	
	#farmTable {
		margin-top: 20px;
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

	
</style>
</head>
<body>
	<div id="wrapper">
		<div>
			<h4 style="text-align: left;">
				<strong>농장/텃밭 분양신청</strong>
			</h4>
		</div>
		<hr color= #f4623a style="height: 2px;">
		
		<!--  STEP1 CARD -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header">
					<div>
						<div id="step">STEP1</div>
							<div id="info">농장을 선택하세요.</div>
								<button class="btn" id="collapse1btn" type="button" id="toggle-btn">
									<i class="fas fa-chevron-down" id="icon"></i>
								</button>
					</div>
			</div>
			<div id="collapse1" class="card-collapse collapse show" role="tabpanel" style="background-color: #f7f7f7">
				<div class="card-block" style="padding-top: 10px;">
				<form onsubmit="return false;">
					<div class="form-group row" style="margin-top: 20px;">
						<label style="font-size: 16px; font-weight: bold;">
							<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 50px; margin-right: 10px;"></i>지역검색
						</label>
							<div class="form-group row col-sm-10">
								<div style="margin-left: 30px; margin-right: 10px; margin-bottom: 20px;">
									<select id="state" class="form-control form-control-sm" style="width: 130px;" onchange="categoryChange(this)">
										<c:forEach items="${stateList}" var="state">
											<option value="<c:out value="${state.code_id }"></c:out>"><c:out
													value="${state.code_nm }"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<div>
									<select id="city" class="form-control form-control-sm" style="width: 130px;">
										<option value="">시/군/구</option>
									</select>
								</div>
							<!-- </div> -->
						</div>
					</div>
					<div class="form-group row">
						<label style="font-size: 16px; font-weight: bold;">
						<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 50px; margin-right: 10px;"></i>농장명</label>
						<div class="form-group row col-sm-10">
							<div style="margin-left: 42px; margin-bottom: 0px;">
								<input type="text" id="farm_name" class="form-control form-control-sm" style="width: 270px;" placeholder="농장명을 입력하세요." onkeyup="enterkey();">
							</div>
							<div class="col-sm-3">
								<button type="button" id="searchBtn" class="btn btn-sm" onclick="makeFarmsTable()">
								<i class="fas fa-search"></i></button>
							</div>
						</div>
					</div>
					</form>
				</div>
				<!--  농장테이블 -->
				<table id="farmTable" class="table table-bordered dt-responsive wrap table-sm">
					<thead style="display: none;">
						<tr>
							<th>농장번호</th>
							<th>농장명</th>
							<th>주소</th>
							<th>분양가능구획수</th>
							<th>구분</th>
						</tr>
					</thead>
				</table>

			</div>
			<!-- collapse1 -->
		</div>
		<div id="selectedFarm">
			<span style="font-size: 15px; font-weight: bold;">
			<i class="fas fa-check" style="color: #f4623a; margin-right: 10px;"></i>
			선택한 농장 : <span id="farm_nm" style="margin-left: 5px;"></span></span>
		</div>
		<!-- card -->
		<!--  STEP 2 -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header"> 
				<div>
					<div id="step">STEP2</div>
					<div id="info">텃밭을 선택하세요.</div>
				</div>
			</div>

			<div id="collapse2"  class="card-collapse collapse" role="tabpanel" style="background-color: #f7f7f7">
				<div class="card-block">
						<div style="width:60%; float: left; border-right: 1px solid lightgray; height:344px;">
							<span style="width: 60%; float:left; text-align: left; padding-left: 10px; line-height: 45px; font-weight: bold;">
								<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 5px; margin-right: 10px;"></i>텃밭고르기
							</span>
							<div class="table-wrapper-scroll-y">
							<table id="gardenTable" class="table table-bordered table-sm" style="height: 300px; overflow: scroll;">
								<thead>
									<tr>
										<th>선택</th>
										<th>텃밭명</th>
										<th>텃밭번호</th>
										<th>면적</th>
									</tr>
								</thead>
							</table>
							</div>
						</div>
						<span>
							<span style="width: 40%; float:right; text-align: left; padding-left: 10px; line-height: 45px; font-weight: bold;">
								<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 5px; margin-right: 10px;"></i>농장위치
							</span>
							<div id="map_wrap" style="width: 40%; height: 300px;">
								<div id="map" ></div>
							</div>
						</span>
				</div>
			</div>
		</div>
		<!--  STEP3 -->
		<div class="card" id="step3">
			<div class="card-header">
				<div>
					<div id="step">STEP3</div>
					<div id="info">분양기간을 선택하세요.</div>
				</div>
			</div>
			<div id="collapse3" class="card-collapse collapse" role="tabpanel" style="background-color: #f7f7f7;">			
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
										<input type="radio" class="contract_date" name="contract"
										value="<c:out value="${contract.code_id}"></c:out>"onclick="selectContract(this)"  required>
										<c:out value="${contract.code_nm}"></c:out>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>	
					<div id="contract_help" style="float: left;">
						* 분양기간은 텃밭이용 시작 후 변경 혹은 중단이 어려우므로 신중하게 선택해주시기 바랍니다.
					</div>
				</div>
			</div>
		</div>
		<form id="applyform" method="post" action="${contextPath }/ep/ep001_d002/apply.do" style="text-align: center;">
			<input type="hidden" name="farm_no" id="farm_no">
			<input type="hidden" name="farm_nm" id="farm_nm">
			<input type="hidden" name="farm_address" id="farm_address">
			<input type="hidden" name="garden_nm" id="garden_nm">
			<input type="hidden" name="garden_no" id="garden_no">
			<input type="hidden" name="contract_term" id="contract_term">
			<input type="hidden" name="area_size" id="area_size">
			<button class="btn" type="button" id="button_fin_2" onclick="location.reload()">다시선택</button>
			<button class="btn" type="button" onclick="apply()" id="button_fin">신청하기</button>
		</form>
	</div>
	<script>
		let obj = "";
		let area_size = "";
		
		// 카드 여는 버튼_1
		$('#collapse1btn').click(function() {
			$('#collapse1').collapse('toggle')	
		});
		
		// 카카오지도생성
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.570623, 126.985319), //지도의 중심좌표.
	    	level: 1, //지도의 레벨(확대, 축소 정도)
	    	draggable: false
	    };
	    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		// select 선택 시
		function categoryChange(e) {
			$("select#city option").remove();
			
			const target = document.querySelector("#city");
			
			if(e.value == '01') var area = ${seoul};
			else if(e.value == '02') var area = ${busan};
			else if(e.value == '03') var area = ${incheon};
			else if(e.value == '04') var area = ${daegu};
			else if(e.value == '05') var area = ${gwangju};
			else if(e.value == '06') var area = ${daejeon};
			else if(e.value == '07') var area = ${ulsan};
			else if(e.value == '08') return;
			else if(e.value == '09') var area = ${gg};
			else if(e.value == '10') var area = ${gw};
			else if(e.value == '11') var area = ${cn};
			else if(e.value == '12') var area = ${cb};
			else if(e.value == '13') var area = ${gb};
			else if(e.value == '14') var area = ${gn};
			else if(e.value == '15') var area = ${jb};
			else if(e.value == '16') var area = ${jn};
			else if(e.value == '17') var area = ${jj};
			
			area.forEach(function(item, index) {
				const opt = document.createElement("option");
				opt.innerHTML = item['AREA_NM'];
				target.appendChild(opt);
			});
		}
		// 농장테이블 생성
		var makeFarmsTable = function() {
			document.querySelector('#farmTable thead').style.display = "table-header-group";
			const state = document.querySelector("#state").value;
			var city = "";
			if(state == '08') {
				city = '세종특별자치시';
				console.log('08');
			} else {
				city = document.querySelector("#city").value;	
			}
			const name = document.querySelector("#farm_name").value;
			$('#farmTable').DataTable({
				destroy : true,//테이블 파괴가능
				bPaginate : true, //페이징처리
				bLengthChange : false, // n개씩보기
				lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], // 10/25/50/All 개씩보기
				bAutoWidth : false, //자동너비
				ordering : false, //칼럼별 정렬
				searching : false, //검색기능
				bInfo : false,
				language: lang_kor_farm, // 한글화
				ajax : {
					method : "post",
					url : "${contextPath}/ep/ep001_d001/farmList.do",
					dataType: "json",
					dataSrc : "",
					data : {
						city : city,
						name : name
					}
				},
				initComplete : function(settings, json) {
					obj = JSON.parse(JSON.stringify(json));
				},
				columns : [
					{data : "ROWNUM"},
					{data : "FARM_NM"},
					{data : "ADDRESS"},
					{data : "AVAILABLE"},
					{defaultContent : "<button id='info' class='btn btn-sm' onclick='urlFarm(this)'>상세정보</button><button onclick='selectFarm(this)' class='btn btn-sm'>농장선택</button>" }
				]
			});
			document.querySelector('#farmTable_paginate').className = "";
			document.querySelector('#farmTable_paginate').classList.add('pagination');
		};
		
		// 데이터테이블 한글
		var lang_kor_farm = {
		       	"decimal" : "",
		        "emptyTable" : "해당 지역에 농장이 없습니다.",
		        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
		        "infoEmpty" : "0개",
		        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		        "infoPostFix" : "",
		        "thousands" : ",",
		        "lengthMenu" : "_MENU_ 개씩 보기",
		        "loadingRecords" : "로딩중...",
		        "processing" : "처리중..."
		};
		
		// 데이터테이블 한글
		var lang_kor_garden = {
		       	"decimal" : "",
		        "emptyTable" : "해당 지역에 텃밭이 없습니다.",
		        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
		        "infoEmpty" : "0개",
		        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		        "infoPostFix" : "",
		        "thousands" : ",",
		        "lengthMenu" : "_MENU_ 개씩 보기",
		        "loadingRecords" : "로딩중...",
		        "processing" : "처리중..."
		};
		
		// 상세정보 버튼 클릭시
		const urlFarm = function(e) {
			window.open('${contextPath}/ep/ep001_d009/init.do?farm_no='+farm_no,'','width=800, height=550, left=350, top=250')
		}
		
		// 농장선택 버튼 클릭시
		const selectFarm = function(e) {
			console.log(obj);
			const rownum = e.parentNode.parentNode.childNodes[0].innerText; // 선택한 농장번호
			const farm_no = obj[rownum-1].FARM_NO;
			const farm_nm = e.parentNode.parentNode.childNodes[1].innerText; // 선택한 농장이름
			const farm_address = e.parentNode.parentNode.childNodes[2].innerText; // 선택한 농장이름
			
			// 다음화면에 쓰기 위한 폼에 저장
			document.querySelector("#applyform #farm_no").value = farm_no;
			document.querySelector("#applyform #farm_nm").value = farm_nm;
			document.querySelector("#applyform #farm_address").value = farm_address;
			
			// 선택한 계약기간 가져오기 (01-6개월 02-12개월)
			const contract_radio = document.querySelectorAll('.contract_date');
			let contract_date = "";
			contract_radio.forEach(function(item) {
				if(item.checked == true) {
					contract_date = item.value;
				}
			});
			document.querySelector("#farm_nm").innerText = farm_nm;
			$('#collapse2').collapse('show');	// STEP2 열기
			
			// 마커 생성
		    const infowindow = new kakao.maps.InfoWindow({zIndex:1});
		    const geocoder = new kakao.maps.services.Geocoder();
		    geocoder.addressSearch(farm_address, function(result, status) {
		    	console.log(result);
	    		if(status === kakao.maps.services.Status.OK) {	// 검색이 정상이면
	    			const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    			var marker = new kakao.maps.Marker({
	    				map: map,
	    				position: coords
	    			});
	    		}
	    		map.relayout();
	    		map.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));
		    });
			
			$('#gardenTable').DataTable({
				destroy : true,//테이블 파괴가능
				bPaginate : false, //페이징처리
				bLengthChange : false, // n개씩보기
				bAutoWidth : false, //자동너비
				ordering : false, //칼럼별 정렬
				searching : false, //검색기능
				bInfo : false,
				language: lang_kor_garden, // 한글화
				scrollY: '244px',
				scrollCollapse: true,
				paging: false,
				ajax : {
					method : "post",
					url : "${contextPath}/ep/ep001_d002/gardenList.do",
					dataType: "json",
					dataSrc : "",
					data : {
						farm_no: farm_no
					}
				},
				columns : [
					{defaultContent: "<input type='radio' name='garden' onclick='selectGarden(this)'>"},
					{data : "GARDEN_NM"},
					{data : "GARDEN_NO"},
					{data : "AREA_SIZE"}
				]
			});
			
			const location = document.querySelector('#selectedFarm').offsetTop;
			window.scrollTo({top:location, behavior:'smooth'});
		}
		
		const selectGarden = function(e) {
			const garden_nm = e.parentNode.nextSibling.innerText;
			const garden_no = e.parentNode.nextSibling.nextSibling.innerText;
			const area_size = e.parentNode.nextSibling.nextSibling.nextSibling.innerText;
			document.querySelector("#applyform #garden_nm").value = garden_nm;
			document.querySelector("#applyform #garden_no").value = garden_no;
			document.querySelector("#applyform #area_size").value = area_size;
			$('#collapse3').collapse('show');	// STEP3 열기
			
			const location = document.querySelector('#applyform').offsetTop;
			window.scrollTo({top:location, behavior:'smooth'});
		}
		
		const selectContract = function(e) {
			document.querySelector("#applyform #contract_term").value = e.value;
		}
		
		// 신청하기버튼
		function apply() {
			if(document.querySelector("#applyform #garden_no").value == "") {
				alert('농장과 텃밭을 선택해주세요.');
				return false;
			}
			if(document.querySelector("#applyform #contract_term").value == "") {
				alert('분양기간을 선택해주세요.')
				return false;
			}
			document.querySelector('#applyform').submit();
		}
		
		document.querySelector('ul#sidebar li:nth-child(2) div').style.backgroundColor = "#343a40";
		document.querySelector('ul#sidebar li:nth-child(2) p').style.fontWeight = "bold";
		
		// 엔터키 체크
		function enterkey() {
	        if (window.event.keyCode == 13) {
	             // 엔터키가 눌렸을 때 실행할 내용
	             /* $("#searchBtn").click; */
	             makeFarmsTable();
	       	}
		}
	</script>
</body>
</html>