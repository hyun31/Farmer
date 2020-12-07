<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.ip.ip001_d001.vo.Ip001_d001VO" %>
<%
	List<Ip001_d001VO> list = new ArrayList<Ip001_d001VO>();
	if(request.getAttribute("showSchedule") != null) {
		list = (ArrayList<Ip001_d001VO>)request.getAttribute("showSchedule");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='${contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/lib/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
#wrapper {
	display: table-cell;
	margin-top: 50px;
}

#wrapper_inner {
	display: inline-block;
	width: 70%;
	margin-top: 50px;
}

#sidebar {
	position: relative;
	float: left;
	top: 65px;
	width: auto;
	height: 732px;
	border: 1px solid lightgray;
	border-collapse: collapse;
}

#calendar {
	float: left;
	width: 79%;
}

#img {
	display: inline-block;
	width: 60%;
	height: 170px;
	border: 1px solid black;
}

#info {
	display: inline-block;
	float: right;
	width: 35%;
	height: 170px;
}

#add_popup, #schedule_popup {
	border: 5px solid #3571b5;
	position: fixed;
	width: 400px;
	height: 500px;
	margin-left: -200px;
	margin-top: -300px;
	left: 50%;
	top: 50%;
	z-index: 100;
	background-color: white;
}

.hidden {
	display: none;
}

.ready {
	background-color: red;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.fc-sun {
	color: red;
}
.category {
	font-size: 0.9em;
	padding: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="modal">
	</div>
	<!-- 일정 추가 팝업 -->
	<div class="group hidden" id="add_popup">
    	<div class = "group-head">
    		<h1 class = "zTree-h1">일정 추가</h1>
    	</div>
    	<div class="gorup-body">
    		<form id="scheduleData">
    			<div class="top">
    				<input class="subject" id="subject" type="text" name="schedule_name" placeholder="제목을 입력해주세요">
    			</div>
    			<div class="category">
    				<select name="schedule_category" id="category" onchange="categorySelected(this);">
                        <c:forEach items="${scheduleCategoryList}" var="list">
                        	<option><c:out value="${list.code_nm }" ></c:out></option>
                        </c:forEach>
                    </select>
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">시작</h3>
    			</div>
    			<div class="domain">
    				<input class="date" id="startDate" type="text" name="start_date">
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">종료</h3>
    			</div>
    			<div class="domain">
    				<input class="date" id="endDate" type="text" name="end_date">
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">메모</h3>
    			</div>
    			<div class="domain">
    				<textarea class="memo" id="memmo" name="schedule_content" rows="5" cols="40" placeholder="100글자까지 입력 가능합니다"></textarea>
    			</div>
    		</form>
    			<button class="ok-button" type="button" onclick="click_ok();">확인</button>
    			<button class="button" type="button" onclick="click_close();">닫기</button>
    	</div>
    </div>
    <!-- 일정 보기 팝업 -->
    <div class="group hidden" id="schedule_popup">
    	<div class = "group-head">
    		<h1 class = "zTree-h1">일정 보기</h1>
    	</div>
    	<div class="gorup-body">
    		<form>
    			<div class="top">
    				<input class="subject" id="result_subject" type="text" name="subject" readonly>
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">시작</h3>
    			</div>
    			<div class="domain">
    				<input class="date" id="result_startdate" type="text" name="startDate" readonly>
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">종료</h3>
    			</div>
    			<div class="domain">
    				<input class="date" id="result_enddate" type="text" name="endDate" readonly>
    			</div>
    			<div class="domain">
    				<h3 class="zTree-h3">메모</h3>
    			</div>
    			<div class="domain">
    				<textarea class="memo" id="result_memo" name="memo" rows="5" cols="40" readonly></textarea>
    			</div>
    		</form>
    			<button class="button" type="button" onclick="click_close();">닫기</button>
    	</div>
    </div>

	<!-- 사이드 바와 달력 -->
	<div id="wraaper">
		<div id="wrapper_inner">
			<div id="sidebar">
        		<div id="farm_info">
            		<div id="img"></div>
            		<div id="info">
                		<div>농장이름</div>
                		<div>텃밭이름</div>
                		<div>기간</div>
            		</div>
            		<div id="buttons">
                		<button>농장정보<br>보러가기</button>
                		<button>농장<br>알림사항</button>
                		<button>내 농장<br>연장하기</button>
            		</div>
            		<div>
            			<span class="category" onclick="category('all')">전체</span>
            			<span class="category" onclick="category('ready')">준비</span>
            			<span class="category" onclick="category('sowing')">파종</span>
            			<span class="category" onclick="category('plant')">정식</span>
            			<span class="category" onclick="category('fertilizer')">비료</span>
            			<span class="category" onclick="category('harvest')">수확</span>
            		</div>
        		</div>
    		</div>
			<div id="calendar"></div>
			<form name="frmDate" method="get">
				<input type="hidden" name="dateStr" id="dateStr">
			</form>
		</div>
	</div>
	<script>
		function category(name) {
			const events = document.querySelectorAll('.fc-event-main');
			events.forEach((element) => {
				element.style.display = 'none';
				if(name === 'all') {
					element.style.display = 'block';
				} else if(name === 'ready' && element.innerText.includes('준비')) {
					element.style.display = 'block';
				} else if(name === 'sowing' && element.innerText.includes('파종')) {
					element.style.display = 'block';
				} else if(name === 'plant' && element.innerText.includes('정식')) {
					element.style.display = 'block';
				} else if(name === 'fertilizer' && element.innerText.includes('비료')) {
					element.style.display = 'block';
				} else if(name === 'harvest' && element.innerText.includes('수확')) {
					element.style.display = 'block';
				}
			});
			console.log(events[0].innerText);
		}
		function categorySelected(select) {
			const subject = document.querySelector("#subject");
			if(select.options[select.selectedIndex].value !== '미선택') {
				const subject_value = select.options[select.selectedIndex].value + " 하는 주 입니다.";
				subject.value = subject_value;
				subject.readOnly = true;
			} else {
				subject.readOnly = false;
				subject.value = "";
			}
				
		}
	
		document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          locales: 'ko',
          height: 800,
          dayMaxEvents: true,
          editable: true,
          displayEventTime: false,
          dateClick: function(info) {
	      	  //const user_type = ${sessionScope.user.USER_TYPE};
	          const add_popup = document.querySelector("#add_popup");
	          const modal = document.querySelector(".modal");
	          if(user_type === 2) {
	        	  $("#startDate").datepicker('setDate', info.dateStr);
		       	  $("#endDate").datepicker('setDate', info.dateStr);
		      	  add_popup.classList.remove('hidden');
		       	  modal.style.display = "block";
	          } else {
	        	  alert("농장주만 일정등록이 가능합니다.");
	          }
          },
          events: [
        	<%
        	 for(int i=0; i < list.size(); i++) {
        		 Ip001_d001VO vo = (Ip001_d001VO)list.get(i);
        		 String title = vo.getSchedule_name();
        		 String start = vo.getStart_date();
        		 String end = vo.getEnd_date();
        		 String memo = vo.getSchedule_content();
        		 String category = vo.getSchedule_category();
     		 %>
     		 {
     			 title : '<%= title %>',
     			 start : '<%= start %>',
     			 end : '<%= end %>',
     			 memo : '<%= memo%>',
     			 category : '<%= category %>',
     			 borderColor: 'white',
     			 backgroundColor: 
     			 		<%
     			 		if("미선택".equals(category)) {
     			 		%>
     			 			'#000000',
     			 		<%
     			 		} else if("준비".equals(category)) {
     			 		%>
     			 			'#827f68',
     			 		<%
     			 		} else if("파종".equals(category)) {
     			 		%>
     			 			'blue',
     			 		<%
     			 		} else if("정식".equals(category)) {
         			 	%>
         			 		'#3d1147',
         			 	<%
         			 	} else if("비료".equals(category)) {
         			 	%>
         			 		'#ffd6bf',
         			 	<%
         			 	} else if("수확".equals(category)) {
         			 	%>
         			 		'#4b8059',
         			 	<%
         			 	}
     			 		%>
     			 	<%
     			 		if(start.split(" ")[0].equals(end.split(" ")[0])) {
     			 	%>
     			 		allDay: true
     			 	<%
     			 		}
     			 	%>
     		 },
     		 <%
        	 }
        	 %>
         	 ],
         eventClick: function(info) {
        	 const modal = document.querySelector(".modal");
      	 	 modal.style.display = "block";
        	 
        	 const schedule_popup = document.querySelector("#schedule_popup");
        	 console.log(info);
        	 document.querySelector("#result_subject").value = info.event.title;
        	 document.querySelector("#result_startdate").value = info.event.startStr.split("T")[0];
        	 if(!info.event.endStr.split("T")[0]) {
        		 document.querySelector("#result_enddate").value = info.event.startStr.split("T")[0];
        	 } else {
        		 document.querySelector("#result_enddate").value = info.event.endStr.split("T")[0];
        	 }       	  
        	 document.querySelector("#result_memo").value = info.event.extendedProps.memo;
        	 schedule_popup.classList.remove('hidden');
         }
        });
        console.log(calendar);
        calendar.render();
      });

	  $(function() {
  		$.datepicker.setDefaults({
  			dateFormat : 'yy-mm-dd',
  			showOtherMonths: true,
  			showMonthAfterYear: true,
  			changeYear: true,
  			changeMonth: true,
  			yearSuffix: "년",
  			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
  			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
  			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
  			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
  		});
  		$("#startDate").datepicker();
  		$("#endDate").datepicker();
  	});
  	
  	var getParam = function(key){
          var _parammap = {};
          document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
              function decode(s) {
                  return decodeURIComponent(s.split("+").join(" "));
              }
   
              _parammap[decode(arguments[1])] = decode(arguments[2]);
          });
   
          return _parammap[key];
      };
      
      $.fn.serializeObject = function() {
      	var o = {};
      	var a = this.serializeArray();
      	$.each(a, function() {
      		var name = $.trim(this.name),
      			value = $.trim(this.value);
      		console.log(value);
      		if(o[name]) {
      			if(!o[name].push) {
      				o[name] = [o[name]];
      			}
      			o[name].push(value || '');
      		} else {
      			o[name] = value || '';
      		}
      	});
      	return o;
      }
      
      function click_ok() {
    	const end_date = document.querySelector('#endDate');
    	end_date.value = end_date.value + ' 01:00:00';
      	var scheduleData = JSON.stringify($('form#scheduleData').serializeObject());
      	console.log(scheduleData);
      	$.ajax({
      		data : scheduleData,
      		url : "addSchedule.do",
      		type: "post",
      		dataType : "json",
      		contentType : "application/json; charset=UTF-8",
      		success : function(data) {
      			const add_popup = document.querySelector("#add_popup");
         	 	add_popup.classList.add('hidden');
         	 	location.reload();
      		}
      	})
      };
      
      function click_close() {
    	  const schedule_popup = document.querySelector("#schedule_popup");
    	  const add_popup = document.querySelector("#add_popup");
    	  add_popup.classList.add('hidden');
    	  schedule_popup.classList.add('hidden');
    	  const modal = document.querySelector(".modal");
   	 	  modal.style.display = "none";
      }
      
	</script>
</body>
</html>