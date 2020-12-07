<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" id="frm" method="post" action="${contextPath}/jp/jp001_d001/searchList.do">
	   id:<input type="text" id="p_id" name="p_id">
	   <input type="submit" value="조회하기"><br>
	   <div id="result"></div>
   </form>
   <script>
   </script>
</body>
</html>