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
	thead tr th {
		text-align: center;
	}
	
	#garden_nm {
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
		float: right;
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
	#wrapper button.btn-sm {
		background-color : #f4623a;
		color: white;
	}
	
	tbody input[type='number'] {
		display: inline;
		width: 35px;
	}
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
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
	
	#selectedGarden {
		padding: 10px;
		margin-top: 30px;
		text-align: left;
		border: 1px solid rgba(0,0,0,.125);
		margin-bottom: 10px;
		background-color: #f7f7f7;
		border-radius: .25rem;
	}
	
	#table_thead {
		background-color: #f7f7f7;
		font-size: 15px;
		font-weight: bold;
	}
	
	#table_period {
		margin-top: 10px;
		text-align: center;
		border-top: 2px solid #343a40;
		border-bottom: 2px solid #343a40;
		
	}
	.cnt_btn {
		display: inline;
		width: 30x;
		height: 20px;
		line-height: 10px;
		border: 1px solid #f7f7f7;
		margin-left: 10px;
		margin-right: 10px;
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
			<strong>씨앗/모종 상품구매</strong>
			</h4>
		</div>
		<hr color= #f4623a style="height: 2px;">
		
		<!--  STEP1 CARD -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header">
				<div>
					<div id="step">STEP1</div>
						<div id="info_fm">상품을 구매 할 텃밭을 선택하세요.</div>
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
								<select id="farm" class="form-control form-control-sm"  onchange="selectFarm(this)">
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
			선택한 텃밭 : <span id="garden_nm"></span></span><br>
		</div>
		
		<!--  STEP 2 -->
		<div class="card" style="margin-bottom: 17px;">
			<div class="card-header"> 
				<div>
					<div id="step">STEP2</div>
					<div id="info_fm">구매할 상품을 선택하세요.</div>
				</div>
			</div>
			<div id="collapse2"  class="card-collapse collapse" role="tabpanel" style="background-color: #f7f7f7">
				<div class="card-block" style="padding: 10px 0 0 10px;">
					<div class="form-group row" style="margin-top: 20px;">
					<label style="font-size: 16px; font-weight: bold;">
						<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-left: 50px; margin-right: 10px;"></i>상품 선택하기</label>
						<div class="form-group row col-sm-10">
							<div style="margin-left: 60px; margin-right: 10px; margin-bottom: 20px; width: 150px;">
								<select id="prod_type" class="form-control form-control-sm" onchange="selectProdType(this)">
									<option value="-1">상품분류</option>
									<c:forEach items="${productGroup}" var="product">
										<option value="<c:out value="${product.code_id }"></c:out>">
										<c:out value="${product.code_nm }"></c:out></option>
									</c:forEach>
								</select>
							</div>
							<div style="margin-bottom: 20px; width: 150px; margin-right: 10px;">
								<select id="product" class="form-control form-control-sm">
									<option value="">상품명</option>
								</select>
							</div>
							<div style="margin-bottom: 20px; width: 150px;">
								<select id="prod_option" class="form-control form-control-sm">
									<option value="">심는시기선택</option>
									<c:forEach items="${useType}" var="type">
										<option value="<c:out value="${type.code_id }"></c:out>"><c:out value="${type.code_nm }"></c:out></option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-2">
								<button type="button" id="prodSelecthBtn" class="btn btn-sm" onclick="selectProduct()">선택</button>
							</div>
						</div>
					</div>
					<div class="help">
						* '상품 분류'에 원하시는 상품이 안 나오면, 해당 상품은 판매중이지 않거나 판매종료된 상품입니다.
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 40px;">
			<i class="fas fa-chevron-circle-right" style="color: #f4623a; margin-right: 5px;"></i>
			 <span style="font-weight: bold; font-size: 16px;">선택한 상품</span>
		</div>
		<form method="post" action="${contextPath }/ep/ep001_d004/pay.do" id="form">
		<table class="table table-hover table-sm" id="table_period">
			<thead id="table_thead">
				<tr>
					<td scope="col">상품분류</td>
					<td scope="col">상품명</td>
					<td scope="col">심는시기선택</td>
					<td scope="col">수량</td>
					<td scope="col">상품가격</td>
					<td scope="col">상품삭제</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		</form>
		<div id="button_wrapper" style="text-align: center;">
			<button class="btn" id="button_fin_2" onclick="location.reload()">다시선택</button>
			<button class="btn" id="button_fin" onclick="pay()">주문결제</button>
		</div>
		
		
	</div>
	<script>
		// 농장번호, 텃밭번호
		let farm_no = "";
		let garden_no = "";
		
		document.querySelector('ul#sidebar li:nth-child(4) div').style.backgroundColor = "#343a40";
		document.querySelector('ul#sidebar li:nth-child(4) p').style.fontWeight = "bold";
		
		$('#collapse1btn').click(function() {
			$('#collapse1').collapse('toggle')	
		});
		
		function selectFarm(e) {
			farm_no = e.value;
			let gardenselect = document.querySelector('#garden');
			$.ajax({
				url: "selectGardenList.do",
				method : "post",
				data : { farm_no : farm_no },
				success : function(data) {
					gardenselect.options.length = 0; // option 모두 제거
					
					console.log(data);
					const obj = JSON.parse(data);	// string -> obj
					
					for(let i=0; i < obj.length; i++) {
						let option = document.createElement('option'); // <option></option>
						option.appendChild(document.createTextNode(obj[i].GARDEN_NM + ' '));  // <option>개나리</option>
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
			garden_no = garden_select.options[garden_select.selectedIndex].value;
			document.querySelector('#garden_nm').innerText = garden_nm + ' ' + garden_no;
			document.querySelector('#selectBtn').disabled = true;
			
			//form안에 농장번호, 텃밭번호 추가
			let input_hidden = document.createElement('input');
			input_hidden.setAttribute('type', 'hidden');
			input_hidden.value = farm_no;
			input_hidden.name = 'farm_no';
			document.querySelector('#form').appendChild(input_hidden);
			input_hidden = document.createElement('input');
			input_hidden.setAttribute('type', 'hidden');
			input_hidden.value = garden_no;
			input_hidden.name = 'garden_no';
			document.querySelector('#form').appendChild(input_hidden);
		}
		
		function selectProdType(e) {
			let prod_type_cd = e.value;
			let product_select = document.querySelector('#product');
			$.ajax({
				url: "selectProductList.do",
				type: "post",
				data :
					{
					farm_no : farm_no,
					prod_type_cd : prod_type_cd
					},
				success : function(data) {
					product_select.options.length = 0; // option 모두 제거
					const obj = JSON.parse(data);
					console.log(data);
					for(let i=0; i < obj.length; i++) {
						let option = document.createElement('option'); // <option></option>
						option.appendChild(document.createTextNode(obj[i].PROD_NAME));  // <option>씨앗</option>
						option.value = obj[i].PROD_NO; // <option value="1">씨앗</option>
						
						product_select.appendChild(option);	// <select> <option>개나리</option> </select>
					}
				}
			});
		}
		
		let index = 1;
		let prod_count = 0;
		function selectProduct() {
			let prod_no = document.querySelector('#product').value;
			let prod_type_cd = document.querySelector('#prod_type').value;
			let option_select = document.querySelector('#prod_option');
			let option_value = option_select.options[option_select.selectedIndex].value;
			let option_nm = option_select.options[option_select.selectedIndex].innerText;
			if(prod_no == "") {
				alert('상품을 선택해주세요');
				return false;
			}
			if(option_value == "") {
				alert('심는시기를 선택해주세요');
				return false;
			}
			if(check_duplicate(prod_no, prod_type_cd)) {
				$.ajax({
					url: "selectProdInfo.do",
					method: "post",
					data: 
					{ 
						prod_no : prod_no,
						prod_type_cd : prod_type_cd
					},
					success: function(data) {
						const obj = JSON.parse(data);
						console.log(obj);
						const tbody = document.querySelector('tbody');
						let tr = document.createElement('tr');
						
						// 상품번호, 상품분류코드 저장
						let input_hidden = document.createElement('input');
						input_hidden.setAttribute('type', 'hidden');
						input_hidden.value = obj.PROD_NO;
						input_hidden.name = 'prod_no_' + index;
						tr.appendChild(input_hidden);
						input_hidden = document.createElement('input');
						input_hidden.setAttribute('type', 'hidden');
						input_hidden.value = obj.PROD_TYPE_CD;
						input_hidden.name = 'prod_type_cd_' + index;
						tr.appendChild(input_hidden);
						input_hidden = document.createElement('input');
						input_hidden.setAttribute('type', 'hidden');
						input_hidden.value = obj.PROD_PRICE;
						input_hidden.name = 'prod_price_' + index;
						tr.appendChild(input_hidden);
						input_hidden = document.createElement('input');
						input_hidden.setAttribute('type', 'hidden');
						input_hidden.value = option_value;
						input_hidden.name = 'prod_option_' + index;
						tr.appendChild(input_hidden);
						// 상품분류
						let td = document.createElement('td');
						let prod_type = "";
						if(obj.PROD_TYPE_CD == 01) {
							prod_type = "씨앗";
						} else if(obj.PROD_TYPE_CD == 02) {
							prod_type = "모종";
						} else if(obj.PROD_TYPE_CD == 03) {
							prod_type = "세트";
						}
						td.appendChild(document.createTextNode(prod_type));
						tr.appendChild(td);
						// 상품명
						td = document.createElement('td');
						td.appendChild(document.createTextNode(obj.PROD_NAME));
						tr.appendChild(td);
						// 심는시기
						td = document.createElement('td');
						td.appendChild(document.createTextNode(option_nm));
						tr.appendChild(td);
						// 수량 마이너스버튼
						td = document.createElement('td');
						let minus_btn = document.createElement('button'); // 마이너스버튼
						minus_btn.classList.add('cnt_btn');
						minus_btn.setAttribute('type', 'button');
						minus_btn.appendChild(document.createTextNode('-'));
						minus_btn.style.display = 'inline-block';
						minus_btn.addEventListener('click', function(e) {
							if(this.nextSibling.value > 1) {
								this.nextSibling.value--;
								this.parentNode.nextSibling.innerText = parseInt(this.parentNode.nextSibling.innerText) - obj.PROD_PRICE;
							} else {
								alert('1개 이상부터 구매하실 수 있습니다.')
							}
						});
						td.appendChild(minus_btn);
						// 수량 input 
						let input_count = document.createElement('input');
						input_count.name = 'prod_count_' + index++;
						input_count.setAttribute('type', 'number');
						input_count.classList.add('form-control', 'form-control-sm');
						input_count.value = 1
						input_count.onkeydown = function() { return false; }
						td.appendChild(input_count);
						// 수량 플러스버튼
						let plus_btn = document.createElement('button');
						plus_btn.classList.add('cnt_btn');
						plus_btn.setAttribute('type', 'button');
						plus_btn.appendChild(document.createTextNode('+'));
						plus_btn.style.display = 'inline-block';
						plus_btn.addEventListener('click', function(e) {
							if(this.previousSibling.value < 99) {
								this.previousSibling.value++;
								this.parentNode.nextSibling.innerText = parseInt(this.parentNode.nextSibling.innerText) + obj.PROD_PRICE;
							} else {
								alert('최대 99개 까지 구입할 수 있습니다.')
							}
							
						})
						td.appendChild(plus_btn);
						tr.appendChild(td);
						// 상품가격
						td = document.createElement('td');
						td.appendChild(document.createTextNode(obj.PROD_PRICE));
						tr.appendChild(td);
						// 삭제
						td = document.createElement('td');
						let button = document.createElement('button');
						button.classList.add('btn', 'btn-sm');
						button.appendChild(document.createTextNode('삭제'));
						button.addEventListener('click', function(e){
							this.parentNode.parentNode.remove();
							prod_count--;
						})
						td.appendChild(button);
						
						tr.appendChild(td);					
						tbody.appendChild(tr);
						prod_count++;
					}
				});
			} else {
				alert('이미 등록된 상품입니다.')
			}
		}
	
		function check_duplicate(prod_no, prod_type_cd) {
			let childrens = document.querySelector('tbody').children;
			for(let i=0; i < childrens.length; i++) {
				if(childrens[i].children[0].value === prod_no && childrens[i].children[1].value === prod_type_cd) {
					return false;
				}
			}
			return true;
		}
		
		function pay() {
			console.log(prod_count);
			if(prod_count == 0) {
				alert('상품을 선택해주세요.')
			} else {
				let input_hidden = document.createElement('input');
				input_hidden.setAttribute('type', 'hidden');
				input_hidden.value = index;
				input_hidden.name = 'index';
				document.querySelector('#form').appendChild(input_hidden);
				document.querySelector('#form').submit();
			}
		}

	</script>
</body>
</html>