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
<!--  bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

	
<link href='${contextPath}/resources/css/ip001_d001_init.css' rel='stylesheet' />
<link href='${contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${contextPath}/resources/fullcalendar/lib/main.js'></script>
<script src='${contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
	
	<!-- google font -->
	
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
.modal-backdrop {
	z-index: 1;
}
.modal {
	z-index: 2;
}
.fc .fc-prev-button {
	background-color: white;
	border: 0;
	background-image : none;
}
.fc .fc-next-button {
	background-color: white;
	border: 0;
}
.fc .fc-prev-button:hover{
	background-color: white;
	border: 0;
}
.fc .fc-icon-chevron-left {
	color: black;
}
.fc .fc-icon-chevron-right {
	color: black;
}
.fc .fc-today-button:disabled {
	background-color: white;
}
.fc .fc-today-button {
	background-color: #e36b47;
	color: black;
	border: 0;
}
.fc .fc-prev-button, .fc-next-button {
	background-color : white;
}
a {
	color: black;
}
a:hover {
	text-decoration: none;
}
span.category.br {
	border-right: 1px solid lightgray;
}
#sidebar_category {
	margin-top: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	border-top : 1px solid lightgray;
	border-bottom : 1px solid lightgray;
}
.card {
	font-size: 0.9rem;
}
.list-group-item {
	padding: 8px 20px 8px 20px;
}
p {
	margin-bottom: 10px;
}
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
	<!-- 일정 추가 팝업 -->
	<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" style="top: 50%; margin-top: -260px; width: 370px;">
  			<form id="scheduleData">
    			<div class="modal-content">
      				<div class="modal-header">
      					<h5 class="modal-title" id="exampleModalLabel1">일정 추가</h5>
      					<select class="form-control form-control-sm col-sm-5" name="garden_no" id="gardens" style="margin-left: 10px; margin-top:2px;">
      						<option>텃밭선택</option>
                       		<c:forEach items="${gardens}" var="garden">
                       			<option value="${garden.garden_no }"><c:out value="${garden.garden_nm} ${garden.garden_no }"></c:out></option>
                       		</c:forEach>
                   		</select>
      				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
      					<span aria-hidden="true">&times;</span>
      				</button>
      				</div>
      				<div class="modal-body">
        				<div class="form-group row">
        					<label class="col-form-label col-sm-3">카테고리</label>
    						<select class="form-control form-control-sm col-sm-7" name="schedule_category" id="schedule_category" onchange="categorySelected(this);">
                       			<c:forEach items="${scheduleCategoryList}" var="list">
                       				<option><c:out value="${list.code_nm }" ></c:out></option>
                       			</c:forEach>
                   			</select>
                   		</div>
                   		<div class="form-group row">
		            		<label for="schedule_name" class="col-form-label col-sm-3">일정제목</label>
		            		<input type="text" class="form-control form-control-sm col-sm-7" name="schedule_name"  id="schedule_name">
		            	</div>
		          		<div class="form-group row">
		          			<label for="startDate" class="col-form-label col-sm-3">시작</label>
		          			<input class="date form-control form-control-sm col-sm-7" id="startDate" type="text" name="start_date">
    					</div>
    					<div class="form-group row">
		          			<label for="schedule_name" class="col-form-label col-sm-3">종료</label>
		          			<input class="date form-control form-control-sm col-sm-7" id="endDate" type="text" name="end_date">
    					</div>
		          		<div class="form-group row">
		            		<label for="schedule_content" class="col-form-label col-sm-3">메모</label>
		            		<textarea class="form-control form-control-sm col-sm-7" name="schedule_content" id="schedule_content" rows="5"></textarea>
		          		</div>
		          	</div>
	      			<div class="modal-footer">
	      				<div style="margin: 0 auto;">
		      				<button type="button" class="btn btn-primary" onclick="click_add()">일정추가</button>
		       	 			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        			</div>
	     	 		</div>
     	 		</div>
     	 	</form>
   	 	</div>
	</div>
	
    <!-- 일정 보기 팝업 -->
	<div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" style="top: 50%; margin-top: -250px; width: 370px;">
    		<div class="modal-content" >
      			<div class="modal-header">
      				<h5 class="modal-title" id="exampleModalLabel2"></h5>
      				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
      					<span aria-hidden="true">&times;</span>
      				</button>
      			</div>
      			<div class="modal-body">
        			<form style="margin:0 auto;">
		          		<div class="form-group row">
		          			<label for="startDate" class="col-form-label col-sm-3">시작</label>
		          			<input class="date form-control form-control-sm col-sm-7" id="result_startdate" type="text" name="start_date" style="width: 300px;" readonly>
    					</div>
    					<div class="form-group row">
		          			<label for="schedule_name" class="col-form-label col-sm-3">종료</label>
		          			<input class="date form-control form-control-sm col-sm-7" id="result_enddate" type="text" name="end_date" style="width: 300px;" readonly>
    					</div>
		          		<div class="form-group row">
		            		<label for="schedule_content" class="col-form-label col-sm-3">메모</label>
		            		<textarea class="form-control form-control-sm col-sm-7" name="schedule_content" id="result_memo" rows="5" style="width: 300px;" readonly></textarea>
		          		</div>
		        	</form>
      			</div>
      			<div class="modal-footer">
       	 			<button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: 0 auto;">닫기</button>
     	 		</div>
   	 		</div>
  		</div>
	</div>

	<!-- 사이드 바와 달력 -->
	<div id="wraaper">
		<div id="wrapper_inner">
			<div id="sidebar">
        		<div id="farm_info">
            		<div id="img">
            			<img src="http://localhost:8090/devD/resources/upload/s/${farminfo.THUMBNAIL_NAME }">
            		</div>
            		<div id="info">
                		<div>
                			농장이름
                			<p>${farminfo.FARM_NM }</p>
                		</div>
                		<div>텃밭이름<p>${farminfo.GARDEN_NM }</p></div>
                		<div>만료일<p>${farminfo.END_DATE }</p></div>
            		</div>
            	</div>
            	<div id="buttons">
               		<button class="btn btn-outline-dark btn-sm" onclick="window.location.href='${contextPath}/ep/ep001_d001/init.do'">농장정보<br>보러가기</button>
               		<button class="btn btn-outline-dark btn-sm">농장<br>알림사항</button>
               		<button class="btn btn-outline-dark btn-sm">내 농장<br>연장하기</button>
           		</div>
           		<div id="sidebar_category">
           			<span class="category br" onclick="category('all')">전체</span>
           			<span class="category br" onclick="category('ready')">준비</span>
           			<span class="category br" onclick="category('sowing')">파종</span>
           			<span class="category br" onclick="category('plant')">정식</span>
           			<span class="category br" onclick="category('fertilizer')">비료</span>
           			<span class="category" onclick="category('harvest')">수확</span>
           		</div>
   				
   				<!-- 캘린더 -->         		
        		<div class="card">
					<div class="card-header" style="padding: 0;">
						캘린더
						<button class="btn" id="collapse1btn" type="button" id="toggle-btn">
							<i class="fas fa-chevron-down"></i>
						</button>
					</div>
					<div id="collapse1" class="card-collapse collapse show" role="tabpanel">
						<div class="card-block">
							<ul class="list-group list-group-flush">
            					<c:forEach items="${gardens}" var="garden">
		            				<li class="list-group-item">
		            					<a href="${contextPath }/ip/ip001_d001/calendarInit.do?farm_no=${garden.farm_no}&garden_no=${garden.garden_no}"
		            						style="text-decoration: underline; color: orange;">
		                       				<c:out value="${garden.garden_nm} ${garden.garden_no }"></c:out>
		                       			</a>
		                       		</li>
                       			</c:forEach>
                       		</ul>
						</div>
					</div>
				</div>
				<!-- 다가오는 일정 -->
				<div class="card">
					<div class="card-header" style="padding: 0;">
						다가오는 일정
						<button class="btn" id="collapse2btn" type="button" id="toggle-btn">
							<i class="fas fa-chevron-down"></i>
						</button>
					</div>
					<div id="collapse2" class="card-collapse collapse" role="tabpanel">
						<div class="card-block" style="padding-top: 5px;">
							<ul class="list-group list-group-flush">
            					<c:forEach items="${comingSchedules}" var="schedule">
		            				<li class="list-group-item">
		                       			<c:out value="${schedule.START_DATE} ${schedule.SCHEDULE_NAME }"></c:out>
		                       		</li>
                       			</c:forEach>
                       		</ul>
						</div>
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
		// 사이드바 toggle 버튼
		$('#collapse1btn').click(function() {
			$('#collapse1').collapse('toggle')	
		});
		$('#collapse2btn').click(function() {
			$('#collapse2').collapse('toggle')	
		});
		
		// 왼쪽 사이드 바 카테고리
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
		
		// 일정 등록 시 카테고리 선택 시
		function categorySelected(select) {
			const subject = document.querySelector("#schedule_name");
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
        	  	const user_type = ${sessionScope.user.USER_TYPE};
        	  	const add_popup = document.querySelector("#add_popup");
        	  	/* const modal = document.querySelector(".modal"); */
        	  	if(user_type === 2) {
	          		$("#startDate").datepicker('setDate', info.dateStr);
	          		$("#endDate").datepicker('setDate', info.dateStr);
	         	 	/* add_popup.classList.remove('hidden');
	         	 	modal.style.display = "block"; */
	         	 	$('#addModal').modal('toggle');
	         	 	
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
     			 			'gray',
     			 		<%
     			 		} else if("준비".equals(category)) {
     			 		%>
     			 			'#CEB3F2',
     			 		<%
     			 		} else if("파종".equals(category)) {
     			 		%>
     			 			'#93BDF6',
     			 		<%
     			 		} else if("정식".equals(category)) {
         			 	%>
         			 		'#F2C2DC',
         			 	<%
         			 	} else if("비료".equals(category)) {
         			 	%>
         			 		'#F2DAAC',
         			 	<%
         			 	} else if("수확".equals(category)) {
         			 	%>
         			 		'#86E4C5',
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
        	 $("#infoModal").modal('toggle');
        	 
        	 const schedule_popup = document.querySelector("#infoModal");
        	 console.log(info);
        	 document.querySelector("#exampleModalLabel2").innerText = info.event.title;
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
      
      function click_add() {
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
      			$('#addModal').modal('toggle');
         	 	location.reload();
      		}
      	})
      };
	</script>
</body>
</html>