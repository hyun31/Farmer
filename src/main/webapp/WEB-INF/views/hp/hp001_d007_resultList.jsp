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
        	/* border: solid 0.04em grey; */
        	padding : 20px;
        }
</style>
</head>
<body>
	<div id="wrapper">
		<h4 style="text-align: left;">
			<strong>농장 신청 관리</strong>
		</h4>
		<hr align="left" style="border: solid 1px #e36b47; width: 100%;">
		<form method="post" action="${contextPath }/hp/hp001_d004/insertFarm.do" enctype="multipart/form-data">
			<table class="table table-bordered">
				<thead>
	    			<tr>
						<th scope="col">신청일자</th>
					    <th scope="col">농장명</th>
					    <th scope="col">상태</th>
					    <th scope="col">신청서</th>
					    <th scope="col">비고</th>
					</tr>
				</thead>
		  		<tbody>
		  			<c:forEach items="${applyList}" var="apply">
			    		<tr>
			    			<input type="hidden" value="${apply.FARM_NO }">
			      			<th scope="row">${apply.APPLICATION_DATE }</th>
						     <td>${apply.FARM_NM }</td>
						     <c:if test="${apply.APPROVAL_CD == 01 }">
						     	<td style="color: green;">승인대기</td>
						     </c:if>
						     <c:if test="${apply.APPROVAL_CD == 02 }">
						     	<td style="color: green;">승인완료</td>
						     </c:if>
						     <c:if test="${apply.APPROVAL_CD == 03 }">
						     	<td style="color: green;">승인거절</td>
						     </c:if>
						     <td><button type="button" class="btn btn-outline-dark btn-sm" onclick="view(this)">조회</button></td> <!-- 누르면 result.jsp이동 -->
						     <td>-</td>
			    		</tr>
		    		</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
	function view(e) {
		const farm_no = e.parentNode.parentNode.childNodes[1].value;
			window.open('${contextPath}/hp/hp001_d004/insertFarmResult.do?farm_no=' + farm_no,'','width=900, height=500, left=350, top=150');
	}
</script>
</body>
</html>