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

<script
   src=https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js></script>
<!--  이거 없으면 버튼 안생김  -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<!--  //엑셀 -->
<script type="text/javascript"
   src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<!-- // 카피+ pdf -->
<script type="text/javascript"
   src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<!--  // 프린트 -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<!--  // pdf -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<!--  //pdf -->
<script type="text/javascript"
   src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
   
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
	<h3 style="color: black;">전체상품관리</h3>
	<hr>
	<div id="collapse-wrap">
		<p>
			<a class="btn btn-secondary btn-sm" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
	   			상품추가폼
			</a>
		</p>
		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				<form action="${contextPath }/kp/kp001_d004/insertProduct.do" method="post">
		    		<div class="form-group row">
						<div class="form-group col-md-2">
							<label >상품분류</label>
							<select id="garden" class="form-control" name="prod_code" onchange="selectChange(this)">
							   	<c:forEach items="${productGroup}" var="product">
									<option value="<c:out value="${product.code_id }"></c:out>"><c:out value="${product.code_nm }"></c:out></option>
								</c:forEach>
						    </select>
						</div>
						<div class="form-group col-md-2">
							<label>상품명</label>
							<input type="text" class="form-control" name="prod_name" id="prod_nm" placeholder="상품명" required>
						</div>
						<div class="form-group col-md-2">
							<label>상품가격</label>
							<input type="text" class="form-control" name="prod_price" id="prod_price" placeholder="상품가격" required>
						</div>
						<div class="form-group col-md-2">
							<label>&nbsp;</label>
							<div>
								<button class="btn btn-primary">상품추가</button>
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
				<th>번호</th>
				<th>상품분류</th>
				<th>상품명</th>
				<th>상품가격</th>
				<th>등록일</th>
				<th>수정일</th>
				<th>관리</th>
			</tr>
    	</thead>
	</table>
	<script src="${contextPath }/resources/js/datatable-editor.js"></script>
	<script>	
	// 데이터테이블 한글
	var lang_kor = {
	        "decimal" : "",
	        "emptyTable" : "상품이 없습니다.",
	        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
	        "infoEmpty" : "0개",
	        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
	        "infoPostFix" : "",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 상품이 없습니다.",
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
	var table = $('#table').DataTable({
			destroy : true,//테이블 파괴가능
			bPaginate : true, //페이징처리
			bLengthChange : true, // n개씩보기
			lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], // 10/25/50/All 개씩보기
			bAutoWidth : false, //자동너비
			ordering : true, //칼럼별 정렬
			searching : true, //검색기능
			language: lang_kor, // 한글화
			dom : 'Blfrtip',	// copy, excel, pdf, print 활성화?
			buttons : [
				{
					extend : 'excel',
		            text : 'excel',
		            filename : '상품정보',
		            title : '아임파머스 상품정보'
				},
				'copy', 'pdf', 'print'
				],
			ajax : {
				method : "post",
				url : "${contextPath}/kp/kp001_d004/productList.do",
				dataType: "json",
				dataSrc : ""
			},
			columns : [ 
				{data : "PROD_NO"},
				{data : "CODE_NM"},
				{data : "PROD_NAME"},
				{data : "PROD_PRICE"},
				{data : "REG_DATE"},
				{
					data : "CHG_DATE",
					defaultContent: "-"
				},
				{
					defaultContent : "<button id='info' class='btn btn-primary btn-sm'>상품관리</button>"}
			]
		});
	
	datatableEdit({
		dataTable : table,
		columnDefs : [
		{
			targets : 1
		},
		{
			targets : 2
		},
		{
			targets : 3
		},
		{
			targets : 4
		},
		{
			targets : 5
		},
		],
		onEdited : function(prev, changed, index, cell) {
			console.log(prev, changed, index, cell);
		}
	});
	</script>
</body>
</html>