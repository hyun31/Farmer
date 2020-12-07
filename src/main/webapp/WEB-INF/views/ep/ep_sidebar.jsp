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
	<div>
		<ul id="sidebar">
			<li>
				<div onclick="window.location.href='${contextPath }/ep/ep001_d001/init.do'" class="circle" ><i class="fas fa-tractor fa-lg"></i></div>
				<p>전체농장<br>정보</p>
			</li>
			<li>
				<div class="circle" onclick="window.location.href='${contextPath }/ep/ep001_d002/init.do'"><i class="fab fa-microsoft fa-lg"></i></div>
				<p>농장/텃밭<br>분양신청</p>
			</li>
			<li>
				<div class="circle" onclick="window.location.href='${contextPath }/ep/ep001_d003/init.do'"><i class="fas fa-plus fa-lg"></i></div>
				<p>농장/텃밭연장신청</p>
			</li>
			<li>
				<div class="circle" onclick="window.location.href='${contextPath }/ep/ep001_d004/init.do'"><i class="fas fa-seedling fa-lg"></i></div>
				<p>씨앗/모종 상품구매</p>
			</li>
			<li>
				<div class="circle" onclick="window.location.href='${contextPath }/ep/ep001_d005/init.do'"><i class="fas fa-cut fa-lg"></i></div>
				<p>수확 결제</p>
			</li>
			<li>
				<div class="top circle" onclick="topFunction()"><i class="fas fa-arrow-up fa-lg"></i></div>
			</li>
		</ul>
	</div>
	<script>
	// TOP 버튼
	function topFunction() {
	  document.body.scrollTop = 0; // For Safari
	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	</script>
</body>
</html>