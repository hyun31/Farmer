<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/f87cff2a76.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
      #wrapper {
        width: 55%;
        margin: 0 auto;
        margin-top: 40px;
      }
      #collapse1btn {
        padding-top: 2px;
      }
      .form-group {
        margin: 0;
      }
      body {
        text-align: left;
      }
      .table {
        text-align: left;
      }
      .head {
        background-color: #f7f7f7;
        font-weight: bold;
      }

      #border_top {
        border-top: 2px solid #343a40;
      }

      #border_bottom {
        border-bottom: 2px solid #343a40;
      }

      #border_line {
        border-top: 2px solid #343a40;
        border-bottom: 2px solid #343a40;
      }
      #table {
		text-align: center;
		border-top: 2px solid #343a40;
		border-bottom: 2px solid #343a40;
	  }
    </style>
  </head>
  <body>
    <div id="wrapper">
      <div>
        <h4 style="text-align: left">
          <strong>결제가 완료 되었습니다!</strong>
        </h4>
      </div>
      <div>&nbsp;</div>
      <div><h5>주문정보</h5></div>
      <table class="table">
        <tr>
          <td class="head" id="border_top" style="width: 20%">주문번호</td>
          <td id="border_top">${orderInfo.ORDER_NO }</td>
        </tr>
        <tr>
          <td class="head">주문일자</td>
          <td>${orderInfo.ORDER_DATE }</td>
        </tr>
        <tr>
          <td class="head">농장명/텃밭명</td>
          <td>${orderInfo.FARM_NM } / ${orderInfo.GARDEN_NM } ${orderInfo.GARDEN_NO }</td>
        </tr>
        <tr>
          <td class="head">주문자</td>
          <td>${orderInfo.USER_NM }</td>
        </tr>
        <tr>
          <td class="head" id="border_bottom">주문처리상태</td>
          <td id="border_bottom" style="color: #f4623a">결제완료</td>
        </tr>
      </table>
      <div>&nbsp;</div>
      <div><h5>주문상품정보</h5></div>

      <table class="table" id="table">
      	<c:if test="${orderInfo.ORDER_CODE == 01 || orderInfo.ORDER_CODE == 02 }">
	        <thead>
	          <tr>
	            <td class="head">번호</td>
	            <td class="head">농장명</td>
	            <td class="head">텃밭명</td>
	            <c:if test="${orderInfo.ORDER_CODE == 01 }">
	            	<td class="head">분양기간</td>
	            </c:if>
	            <c:if test="${orderInfo.ORDER_CODE == 02 }">
	            	<td class="head">연장기간</td>
	            </c:if>
	            <td class="head">수량</td>
	            <td class="head">금액</td>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>01</td>
	            <td>${orderInfo.FARM_NM}</td>
	            <td>${orderInfo.GARDEN_NM}${orderInfo.GARDEN_NO}</td>
	            <td>${orderInfo.CONTRACT_TERM}개월</td>
	            <td>1</td>
	            <td>${orderInfo.TOTAL_PRICE}원</td>
	          </tr>
	        </tbody>
        </c:if>
         <c:if test="${orderInfo.ORDER_CODE == 03 }">
        	<thead>
	          <tr>
	            <td class="head">번호</td>
	            <td class="head">상품분류</td>
	            <td class="head">상품명</td>
	            <td class="head">수량</td>
	            <td class="head">금액</td>
	            <td class="head">옵션</td>
	          </tr>
	        </thead>
	        <tbody>
	        	<c:forEach items="${items}" var="item">
	          		<tr>
			            <td>${item.ROWNUM }</td>
			            <c:if test="${item.PROD_GR_ID == 01 }">
			            	<td>씨앗</td>
			            </c:if>
			            <c:if test="${item.PROD_GR_ID == 02 }">
			            	<td>모종</td>
			            </c:if>
			            <c:if test="${item.PROD_GR_ID == 03 }">
			            	<td>세트</td>
			            </c:if>
			            <td>${item.PROD_NAME }</td>
			            <td>${item.PROD_CNT }</td>
			            <td>${item.PRICE }</td>
			            <c:if test="${item.PLANT_TYPE == 01 }">
			            	<td>바로사용</td>
			            </c:if>
			            <c:if test="${item.PLANT_TYPE == 02 }">
			            	<td>나중에사용</td>
			            </c:if>
	          		</tr>
	          	</c:forEach>
	        </tbody>
        </c:if>
        <c:if test="${orderInfo.ORDER_CODE == 04 }">
        	<thead>
	          <tr>
	            <td class="head">번호</td>
	            <td class="head">상품분류</td>
	            <td class="head">상품명</td>
	            <td class="head">수량</td>
	            <td class="head">금액</td>
	            <td class="head">옵션</td>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>01</td>
	            <td>수확</td>
	            <c:if test="${orderInfo.HARVEST_TYPE == 01 }">
	            	<td>직접방문</td>
	            </c:if>
	            <c:if test="${orderInfo.HARVEST_TYPE == 02 }">
	            	<td>택배수령</td>
	            </c:if>
	            <td>1</td>
	            <td>${orderInfo.TOTAL_PRICE }</td>
	            <td>-</td>
	          </tr>
	        </tbody>
        </c:if>
      </table>
      
      
      <div>&nbsp;</div>
      <div><h5>결제정보</h5></div>
      <table class="table">
        <tr>
          <td class="head" style="width: 20%" id="border_top">총 결제금액</td>
          <td id="border_top">${orderInfo.TOTAL_PRICE}원</td>
        </tr>
        <tr>
          <td class="head" id="border_bottom">결제수단</td>
          <td id="border_bottom">카카오페이</td>
        </tr>
      </table>
      <div>&nbsp;</div>
      <div><h5>주문자정보</h5></div>
      <table class="table">
        <tr>
          <td class="head" id="border_top" style="width: 20%">수령인</td>
          <td id="border_top">${orderInfo.USER_NM}</td>
        </tr>
        <tr>
          <td class="head">이메일</td>
          <td>${orderInfo.EMAIL}</td>
        </tr>
        <tr>
          <td class="head">휴대전화</td>
          <td>${orderInfo.PHONE}</td>
        </tr>
        <tr>
          <td class="head" id="border_bottom">주소</td>
          <td id="border_bottom">${orderInfo.ADDRESS}</td>
        </tr>
      </table>
       <div>&nbsp;</div>
       <div>&nbsp;</div>
       <div>&nbsp;</div>
    </div>
    <script>
    	if(${orderInfo.ORDER_CODE} == '01') {
    		document.querySelector('ul#sidebar li:nth-child(2) div').style.backgroundColor = "#343a40";
    		document.querySelector('ul#sidebar li:nth-child(2) p').style.fontWeight = "bold";
    	} else if(${orderInfo.ORDER_CODE} == '02'){
    		document.querySelector('ul#sidebar li:nth-child(3) div').style.backgroundColor = "#343a40";
    		document.querySelector('ul#sidebar li:nth-child(3) p').style.fontWeight = "bold";
    	} else if(${orderInfo.ORDER_CODE} == '03') {
    		document.querySelector('ul#sidebar li:nth-child(4) div').style.backgroundColor = "#343a40";
    		document.querySelector('ul#sidebar li:nth-child(4) p').style.fontWeight = "bold";
    	} else if(${orderInfo.ORDER_CODE} == '04') {
    		document.querySelector('ul#sidebar li:nth-child(5) div').style.backgroundColor = "#343a40";
    		document.querySelector('ul#sidebar li:nth-child(5) p').style.fontWeight = "bold";
    	}
    </script>
  </body>
</html>