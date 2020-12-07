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
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

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
	#table {
		text-align : center;
	}
</style>
</head>
<body>
	<h3 style="color: black;">회원관리</h3>
	<hr>
	<table id="table" class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>게시판명<th>
				<th>게시글명</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>관리</th>
			</tr>
		</thead>
	</table>
	<script src="${contextPath }/resources/js/datatable-editor.js"></script>
	<script>
	// 데이터테이블 한글
	var lang_kor = {
	        "decimal" : "",
	        "emptyTable" : "글이 없습니다.",
	        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
	        "infoEmpty" : "0개",
	        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
	        "infoPostFix" : "",
	        "thousands" : ",",
	        "lengthMenu" : "_MENU_ 개씩 보기",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "search" : "검색 : ",
	        "zeroRecords" : "검색된 글이 없습니다.",
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
				filename : '농장정보',
				title : '아임파머스 게시글정보'
			},
			'copy', 'pdf', 'print'
			],
		ajax : {
			method : "post",
			url : "${contextPath}/kp/kp001_d001/list.do",
			dataType: "json",
			dataSrc : ""
		},
		columns : [ 
			{data : "USER_ID"},
			{data : "USER_NM"},
			{data : "USER_PHONE"},
			{data : "USER_EMAIL"},
			{data : "USER_TYPE"},
			{data : "GARDENYN"},
			{data : "REG_DATE"},
			{
				data : "LAND_REGISTER_NO",
				defaultContent : "-"
			},
			{defaultContent : "<button class='btn btn-primary btn-sm'>삭제</button>"}
		]
	});
	
	datatableEdit({
		dataTable : table,
		columnDefs : 
		[
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
			}
		],
		onEdited : function(prev, changed, index, cell) {
			console.log(prev, changed, index, cell);
		}
	});
   </script>
</body>
</html>