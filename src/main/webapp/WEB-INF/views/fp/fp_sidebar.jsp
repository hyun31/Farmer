<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul id="sidebar">
			<li>
				<div class="circle"
					onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=01'"><i class="fas fa-exchange-alt"></i>
				</div>
				<p>
					교환하기
				</p>
			</li>
			<li>
				<div class="circle" 
					onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=02'"><i class="fas fa-hand-holding-heart"></i>
				</div>
				<p>
					나눔하기
				</p>
			</li>

			<li>
				<div class="circle" 
					onclick="window.location.href='${contextPath }/fp/fp001_d001/articlesInit.do?board_cd=03'"><i class="fas fa-user-edit"></i>
				</div>
				<p>
					자랑하기
				</p>
			</li>
			<li>
				<div class="top circle" onclick="topFunction()" style="background-color: #f4623a;"><i class="fas fa-arrow-up fa-lg"></i></div>
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