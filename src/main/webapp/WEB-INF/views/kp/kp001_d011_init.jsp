<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	#collapse-wrap {
		margin-bottom: 15px;
	}
	#table {
		text-align: center;
	}
	/* .collapse input, .collapse select, .collapse button {
		height: 30px;
	} */
	/* .collapse button {
		line-height: 0px;
	} */
	div.card {
		padding-bottom: 0;
	}
	.form-group {
		height: 65px;
	}
	.abc {
		height: 40px;
	}
</style>
</head>
<body>
	<h3 style="color: black;">텃밭관리</h3>
	<hr>
	<div id="collapse-wrap">
		<p>
			<a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
	   			텃밭등록폼
			</a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				<form action="${contextPath }/kp/kp001_d011/insertGarden.do" method="post">
		    		<div class="form-group row">
						<div class="form-group col-md-2">
							<label for="farm_no">농장번호</label>
							<input type="text" class="form-control" name="farm_no" id="farm_no" value="${farm_no }" readonly required>
						</div>
						<div class="form-group col-md-2">
							<label for="farm_nm">농장명</label>
							<input type="text" class="form-control" name="farm_nm" id="farm_nm" value="${farm_nm }" readonly required>
						</div>
						<div class="form-group col-md-2">
							<label for="farmer_id">농장주</label>
							<input type="text" class="form-control" name="farmer_id" id="farmer_id" placeholder="아이디를입력하세요" required>
						</div>
						<div class="form-group col-md-2">
							<label for="garden">텃밭명</label>
							<select id="garden" class="form-control" onchange="selectChange(this)">
							   	<c:forEach items="${gardenList}" var="garden">
									<option value="<c:out value="${garden.code_nm }"></c:out>"><c:out value="${garden.code_nm }"></c:out></option>
								</c:forEach>
						    </select>
						    <input type="hidden" id="garden_hidden" name="garden_nm">
						</div>
						<div class="form-group col-md-1">
							<label for="garden_cnt">구좌수</label>
							<input type="number" class="form-control" name="garden_cnt" id="garden_cnt" required>
						</div>
						<div class="form-group col-md-2">
							<label for="add">&nbsp;</label>
							<div>
								<button type="button" class="btn btn-primary" onclick="gardenFormAdd(this)">추가하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<table id="table" class="table table-bordered">
		<thead>
			<tr>
				<th>농장번호</th>
				<th>농장명</th>
				<th>텃밭명</th>
				<th>텃밭번호</th>
				<th>위도</th>
				<th>경도</th>
				<th>대여유무</th>
				<th>대여자</th>
				<th>대여시작일</th>
				<th>대여만료일</th>
			</tr>
    	</thead>
	</table>
	<script>
	const selectChange = function(e) {
		document.querySelector('#garden_hidden').value = e.value;
		console.log(document.querySelector('#garden_hidden').value);
	}
	
	// 추가하기 버튼
	const gardenFormAdd = function(e) {
		e.disabled = true;
		document.querySelector('#farmer_id').readOnly = true;
		document.querySelector('#garden').disabled = true;
		document.querySelector('#garden_cnt').readOnly = true;
		
		const garden_cnt = document.querySelector("#garden_cnt").value;
		const card_body = document.querySelector('.card-body > form');
		for(let i=1; i<=garden_cnt; i++) {
			let form_group = document.createElement('div');
			form_group.classList.add('form-group', 'row', 'abc');
			
			let label = document.createElement('label');
			label.classList.add('col-xs-1', 'col-form-label');
			label.innerText = i + '번';
			
			let inner_div = document.createElement('div');
			let inner_div2 = document.createElement('div');
			inner_div.classList.add('col-sm-3');
			inner_div2.classList.add('col-sm-3')
			
			let input = document.createElement('input');
			let input2 = document.createElement('input');
			input.classList.add('form-control');
			input2.classList.add('form-control');
			input.name = "latitude" + i;
			input2.name = "longitude" + i;
			input.placeholder = "위도";
			input2.placeholder = "경도";
			
			form_group.appendChild(label);
			inner_div.appendChild(input);
			inner_div2.appendChild(input2);
			form_group.appendChild(inner_div);
			form_group.appendChild(inner_div2);
			
			card_body.appendChild(form_group);
		}
		let button = document.createElement('button');
		button.classList.add('btn', 'btn-primary');
		button.innerText = '텃밭등록';
		card_body.appendChild(button);
	}
	// 데이터테이블 한글
	var lang_kor = {
	        "decimal" : "",
	        "emptyTable" : "텃밭이 없습니다.",
	        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
	        "infoEmpty" : "0개",
	        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
	        "infoPostFix" : "",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 텃밭이 없습니다.",
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
	// 테이블 생성
	var makeTable = function() {
		const farm_no = document.querySelector("#farm_no").value;
		console.log(farm_no);
		$('#table').DataTable({
			destroy : true,//테이블 파괴가능
			bPaginate : true, //페이징처리
			bLengthChange : true, // n개씩보기
			lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], // 10/25/50/All 개씩보기
			bAutoWidth : false, //자동너비
			ordering : true, //칼럼별 정렬
			searching : true, //검색기능
			language: lang_kor, // 한글화
			ajax : {
				method : "post",
				url : "${contextPath}/kp/kp001_d011/gardenList.do",
				dataType: "json",
				dataSrc : "",
				data: {
					farm_no : farm_no
				}
			},
			columns : [ 
				{data : "FARM_NO"},
				{data : "FARM_NM"},
				{data : "GARDEN_NM"},
				{data : "GARDEN_NO"},
				{data : "LATITUDE"},
				{data : "LONGITUDE"},
				{data : "IS_RENTAL"},
				{
					data : "CUST_ID",
				 	defaultContent : "-"	
				},
				{
					data : "START_DATE",
					defaultContent : "-"
				},
				{
					data : "END_DATE",
					defaultContent : "-"
				}
			]
		});
	};
	
	$(document).ready(makeTable());
	</script>
</body>
</html>