<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"></script>
</head>
	<style>
	.map_wrap {
		position:relative;
		overflow:hidden;
		width:100%;
		height:500px;
	}
		
	.radius_border{
		border:1px solid #919191;
		border-radius:5px;
	}
	
	#map {
		width: 100%;
		height: 100%;
	}
	
	#wrapper {
		width: 55%;
		margin: 0 auto;
		margin-top: 40px;
		padding: 29px 29px 0;
		border: 1px solid lightgray;
		border-radius: 6px;
	}
	
	table.dataTable thead th {
		border-bottom: 0;
		border-top: 3px solid #343a40;
		background-color: #f7f7f7;
	}
	
	div.dataTables_wrapper .pagination {
		text-align: center;
		margin-bottom: 50px;
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
	
	#table_wrapper {
		text-align: center;
	}
	
	.pagination a:hover:not(.active) {
		background-color: #f7f7f7; 
	}
	
	#table button.btn-sm {
		font-size: 13px;
		background-color: white; 
		border:1px solid #f4623a;
		color: #f4623a;
		padding: 3px;
	}
	
	.box {
		padding-right : 14px;
		display : block;
		postion: relative;
		width: 100%;
		height: 37px;
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
		height: 25px;
		padding-right: 25px;
		padding-bottom: 8px;
		line-height: 29px;
		border : none;
		background: #fff;
		font-size: 15px;
		box-sizing: border-box;
		z-index: 1;
	}

	#label_farm {
		font-size: 15px;
		font-weight: bold;
	}
	
	#back_color{
		width: 100%;
		height: 80px;
		background-color: #f7f7f7;
		padding: 25px;
		border-radius: .25rem;
		margin-bottom: 0px;
		border: 1px solid rgba(0,0,0,.125);
	}
	

    </style>
	<body>
	<div id="wrapper">
		<div><h4 style="text-align: left;"><strong>전체 농장정보</strong></h4></div>
    	<hr color= #f4623a style="height: 2px;">
    	<div style="margin-bottom: 10px">
	    	<div class="map_wrap">
	    		<div id="map"></div>
	    	</div>
	    	<div>
	    	<label class="col-xs-2 col-form-label-sm" id="label_farm">
				<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
				농장검색</label>
				</div>
	    	<div id="back_color">
				 <form id="searchForm" onsubmit="return false;">
					<div class="form-group row" style="margin-right: 17px;">
<!-- 						<label class="col-sm-1 col-form-label-sm"></label>
 -->							<div class="col-sm-11" style="margin-left: 30px;">
								<div class="form-group row">
					 				<label class="col-xs-2 col-form-label-sm" id="label_farm">
					 				<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
					 				시/도</label>
								<div class="col-sm-3">
					  				<select id="state" class="form-control form-control-sm" onchange="categoryChange(this)" style="height:29px;">
										<c:forEach items="${stateList}" var="state">
											<option value="<c:out value="${state.code_id }"></c:out>"><c:out value="${state.code_nm }"></c:out></option>
										</c:forEach>
									</select>
								</div>
									<label class="col-xs-2 col-form-label-sm" id="label_farm">
									<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
									군/구</label>
										<div class="col-sm-3">
											<select id="city" class="form-control form-control-sm">
											<option value="">시/군/구</option>
											</select>
										</div>
										
										<label class="col-xs-2 col-form-label-sm" id="label_farm">
									<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
									농장명</label>
								<div class="col-sm-3">
								<input type="text" id="farm_name" class="form-control form-control-sm" maxlength="10" style="width: 170px;"
								placeholder="농장명을 입력하세요." onkeyup="enterkey();">
					 			</div>
											
					 			</div>
				 			</div>
					<button type="button" id="searchBtn" class="btn btn-sm" onclick="makeTable()"
					style="float:left; height:31px; background-color: #f4623a; color: white;">
					<i class="fas fa-search"></i></button> 
					</div>
				</form>
	    	</div> 
	    </div>	 
	    <div style="margin-top: 20px;">
			<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
			 <span style="font-weight: bold; font-size: 16px;">검색결과</span>
		</div>
	    <table id="table" class="table table-bordered dt-responsive wrap">
	    	<thead>
        		<tr>
        			<th>번호</th>
		            <th>농장명</th>
		            <th>주소</th>
		            <th>연락처</th>
		            <th>구좌수</th>
		            <th>농장정보</th>
        		</tr>
    		</thead>
	    </table>
    </div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e33026c580a9b0fdf9e6e48910d757e&libraries=services, clusterer"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script>
		// 카카오지도
	    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	    var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.570623, 126.985319), //지도의 중심좌표.
	    	level: 6 //지도의 레벨(확대, 축소 정도)
	    };
	    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	    
	    var mapTypeControl = new kakao.maps.MapTypeControl();
		 // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		 // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		 var zoomControl = new kakao.maps.ZoomControl();
		 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	    
	    
	    // 농장 주소 리스트
	    const list = ${roadAddressList};
	    
	    // 마커 생성
	    const infowindow = new kakao.maps.InfoWindow({zIndex:1});
	    const geocoder = new kakao.maps.services.Geocoder();
	    list.forEach(function(item, index) {
	    	geocoder.addressSearch(item['ADDRESS'], function(result, status) {
	    		if(status === kakao.maps.services.Status.OK) {	// 검색이 정상이면
	    			const coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	    			var marker = new kakao.maps.Marker({
	    				map: map,
	    				position: coords
	    			});
	    			const place_name = list[index]['FARM_NM']	// 농장이름
	    			kakao.maps.event.addListener(marker, 'click', function() {
	    		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	    		        infowindow.setContent('<div style="width:150px; text-align:center; padding:5px; font-size:13px;">' + place_name + '</div>');
	    		        infowindow.open(map, marker);
	    		    });
	    		}
	    	});
	    });
	    
		// 테이블 생성
		var makeTable = function() {
			
			
			const state = document.querySelector("#state").value;
			var city = "";
			if(state == '08') {
				city = '세종특별자치시';
				console.log('08');
			} else {
				city = document.querySelector("#city").value;	
			}
			const name = document.querySelector("#farm_name").value;
			
			$('#table').DataTable({
				destroy : true,//테이블 파괴가능
				bPaginate : true, //페이징처리
				bLengthChange : false, // n개씩보기
				lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], // 10/25/50/All 개씩보기
				bAutoWidth : false, //자동너비
				ordering : false, //칼럼별 정렬
				searching : false, //검색기능
				bInfo: false,
				language: lang_kor, // 한글화
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
				columns : [ 
					{data : "ROWNUM"},
					{data : "FARM_NM"},
					{data : "ADDRESS"},
					{data : "FARMER_PHONE"},
					{data : "GARDEN_CNT"},
					{defaultContent : "<button id='info' class='btn btn-sm' onclick='urlFarm(this)'>상세보기</button>" }
				]
				
			});
			document.querySelector('#table_paginate').className = "";
			document.querySelector('#table_paginate').classList.add('pagination');
			
		};
		$(document).ready(makeTable());
		
		// 데이터테이블 한글
		var lang_kor = {
		        "decimal" : "",
		        "emptyTable" : "해당 지역에 농장이 없습니다.",
		        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
		        "infoEmpty" : "0개",
		        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
		        "infoPostFix" : "",
		        "thousands" : ",",
		        "lengthMenu" : "_MENU_ 개씩 보기",
		        "loadingRecords" : "로딩중...",
		        "processing" : "처리중...",
		        "search" : "검색 : ",
		        "zeroRecords" : "검색된 농장이 없습니다.",
		        "paginate" : {
		            "first" : "첫 페이지",
		            "last" : "마지막 페이지",
		            "next" : "다음",
		            "previous" : "이전"
		        },
		        "aria" : {
		            "sortAscending" : " :  오름차순 정렬",
		            "sortDescending" : " :  내림차순 정렬"
		        }
		        
		        
		    };
		
		// select 선택 시
		function categoryChange(e) {
			$("select#city option").remove();
			
			const target = document.querySelector("#city");
			
			if(e.value == '01') { var area = ${seoul}; }
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
		
		document.querySelector('#table_paginate').className = "";
		document.querySelector('#table_paginate').classList.add('pagination');
		
		document.querySelector('ul#sidebar li:nth-child(1) div').style.backgroundColor = "#343a40";
		document.querySelector('ul#sidebar li:nth-child(1) p').style.fontWeight = "bold";
		
		// 엔터키 체크
		function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용'
             /* $("#searchBtn").click; */
             makeTable();
       		 }
		}
	</script>
</body>
</html>