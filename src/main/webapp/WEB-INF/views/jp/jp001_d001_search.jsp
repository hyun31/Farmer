<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border='1' width='1000' align='center'>
   <tr align='center' bgcolor='#FFFF66'> 
     <td>아이디</td>
     <td>이름</td>
     <td>전화번호</td>
     <td>이메일</td>
     <td>회원구분</td>
     <td>텃밭유무</td>
     <td>가입일</td>
     <td>토지대장번호</td>
     <td>관리</td>
</tr>

  <c:forEach var="user" items="${searchList}" >	
	 <c:url var="modurl"  value="searchMod.do"  >
	   <c:param  name="p_mod_id" value="${user.user_id}" />
	 </c:url>     
	<c:url var="delurl"  value="/jp/jp001_d001/deleteUser.do"  >
	   <c:param  name="p_del_id" value="${user.user_id}" />
	 </c:url>
     <tr align=center>
       <td>${user.user_id}</td>
       <td>${user.user_nm}</td>
       <td>${user.user_phone}</td>
       <td>${user.user_email}</td>
       <td>${user.user_type}</td>
       <td>${user.gardenyn}</td>
       <td>${user.reg_date}</td>
       <td>${user.land_register_no}</td>
       <td>
       	<button onclick="window.location.href='${modurl}'">수정</button>
       	<button onclick="window.location.href='${delurl}'">삭제</button>
       </td>
     </tr>
  </c:forEach>
</table>
</body>
</html>