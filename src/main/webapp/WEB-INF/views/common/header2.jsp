<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        #header {
            width: 100%;
            height: 80px;
            background-color: lightgray;
            position: relative;
        }
        #logo {
            float: left;
            font-size: 40px;
            margin-top: 13px
        }
        #user_menu {
            float: right;
            display: flex;
            width: 195px;
            justify-content: space-between;   
            font-size: 12px;
        }
        a, a:visited {
            text-decoration: none;
            color: black;
            margin-left: 5px;
        }
        a:hover {
            color: rebeccapurple;
        }
        #logo_text:hover {
        	color: black;
        }
        ul {
            list-style: none;
            overflow: hidden;
        }
        #navi {
            position: relative;
            top: 55px;
            max-width: 1000px;
            float: center;
            margin: 0 auto;
        }
        #navi li {
            float: left;
            width: 20%;
        }
        #sub_navi {
            max-width: 100%;
            text-align: -webkit-center;
            z-index: 1;
        }
        #sub {
            position: relative;
            max-width: 1000px;
            padding-left: 40px;
            height: 155px;
            margin: 0 auto;
            background-color: gray;
            opcacity: 0.75;
        }
        #sub ul{
            display: table-row;
            float: left;
            width: 20%;
            padding: 0;
            margin-top: 5px;
        }
        #sub ul li {
            text-align: -webkit-match-parent;
            margin-top: 2px;
        }
    </style>
</head>
<body>
    <div id="header">

        <div id="logo"><a id="logo_text" href="${contextPath}/main.do">아임파머스</a></div>
        <c:if test="${user == null}">
	        <div id="user_menu">
	            <a href="">로그인</a>
	            <a href="">회원가입</a>
	            <a href="">마이페이지</a>
	        </div>
        </c:if>
        <c:if test="${user != null}">
	        <div id="user_menu">
	        	<span>${user.USER_NM }님!</span>
	            <a href="">로그아웃</a>
	            <a href="">마이페이지</a>
	        </div>
        </c:if>

        <ul id="navi">
            <li><a href="">사이트소개</a></li>
            <li><a href="">농장보기</a></li>
            <li><a href="">장터</a></li>
            <li><a href="">추천농작물</a></li>
            <li><a href="">고객센터</a></li>
        </ul>
    </div>
    <div id="sub_navi" >
        <div id="sub" style="display: none">
            <ul>
                <li><a href="">인사말</a></li>
                <li><a href="">이용방법</a></li>
            </ul>
            <ul>
                <li><a href="">전체농장위치</a></li>
                <li><a href="">농장둘러보기</a></li>
                <li><a href="">텃밭자랑하기</a></li>
            </ul>
            <ul>
                <li><a href="">교환하기</a></li>
                <li><a href="">나눔하기</a></li>
                <li><a href="">자랑하기</a></li>
            </ul>
            <ul>
                <li><a href="">연중재배가능작물</a></li>
                <li><a href="">재배방법</a></li>
            </ul>
            <ul>
                <li><a href="">공지사항</a></li>
                <li><a href="">자주하는질문</a></li>
                <li><a href="">질문게시판</a></li>
                <li><a href="">농장등록문의</a></li>
                <li><a href="">농장등록신청</a></li>
                <li><a href="">분양문의</a></li>
            </ul>
        </div>
    </div>
    <script>
        let navi_lis = document.querySelectorAll("#navi li");
        let sub_navi = document.querySelector("#sub_navi");
        let sub = document.querySelector("#sub");
        navi_lis.forEach((li) => {
            console.log(li);
            li.addEventListener("mouseover", function() {
                sub.style.display = "block";
            });
        });

        sub.addEventListener("mouseleave", function() {
            sub.style.display = "none";
        });
    </script>
</body>
</html>