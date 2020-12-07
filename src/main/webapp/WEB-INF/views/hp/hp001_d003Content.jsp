<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>


<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-
q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>


<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-
GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>분양문의 게시판</title>
</head>
<body>
<article>
		<div class="container" role="main" align="left">
			<h4>분양문의 상세페이지</h4>
			<div class="bg-white rounded shadow-sm">
			
			
				<div class="board_article_nm">
					<c:out value="${hp001_d003Content.article_nm}" />
				</div>
				
				<div class="board_info_box">
					<span class="board_author"><c:out value="${hp001_d003Content.writer_id}" />,</span>
					<span class="board_date"><c:out value="${hp001_d003Content.reg_date}" /></span>
					
					<span class="board_phone"><c:out value="${hp001_d003Content.phone}"/></span>
					<span class="board_email"><c:out value="${hp001_d003Content.email}"/></span>
					
					
				</div>
				<div class="board_article_content">${hp001_d003Content.article_content}</div>
			   </div>
		
			<div style="margin-top: 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			
			<!-- Reply Form {s} --> 
 			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px"> 
 				<form:form name="form" id="form" role="form" modelAttribute="reply3VO" method="post"> 
				<form:hidden path="bid" id="bid"/> 
 				<div class="row"> 
 					<div class="col-sm-10"> 
						<form:textarea path="board_content" id="board_content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea> 
					</div> 
					<div class="col-sm-2"> 
						<form:input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></form:input> 
						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>
 					</div>
				</div> 
 				</form:form> 
			</div> 
				<!-- Reply Form {e} --> 

 				<!-- Reply List {s}--> 
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
				<div id="replyList"></div>
			</div> 
			<!-- Reply List {e}--> 
		</div>
	</article>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	// 목록으로 이동 이벤트
	$(document).on('click', '#btnList', function(){
		location.href ="${pageContext.request.contextPath}/hp/hp001_d003";
	});
	
	// 삭제 버튼 클릭 이벤트
	$(document).on('click','#btnDelete', function(){
		var url = "${pageContext.request.contextPath}/hp/deleteBoard3";
		url = url + "?article_no=" + ${hp001_d003Content.article_no};
		location.href = url;
	});
	// 수정 버튼 클릭 이벤트  
	$(document).on('click', '#btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/hp/editForm3";
		url = url + "?article_no="+${hp001_d003Content.article_no};
		url = url + "&mode=edit";
		location.href = url;
	});
	// 댓글 저장 버튼 클릭 이벤트
	$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#board_content').val();
		var replyReg_id = $('#reg_id').val();
		var paramData = JSON.stringify({"board_content": replyContent
				, "reg_id": replyReg_id
				, "bid":'${hp001_d003Content.bid}'
		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard3/saveReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
				$('#board_content').val('');
				$('#reg_id').val('');
			}
			, error: function(error,data){
				console.log("에러 : " + error);
			}
		});
	});
	
	// 댓글 수정 폼 이벤트 추가
	function fn_editReply(rid, reg_id, board_content){
		var htmls = "";
		htmls += '<div class="media text-muted pt-3" id="rid' + rid + '">';
		htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		htmls += '<title>Placeholder</title>';
		htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		htmls += '</svg>';
		htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		htmls += '<span class="d-block">';
		htmls += '<strong class="text-gray-dark">' + reg_id + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + rid + ', \'' + reg_id + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
		htmls += '</span>';
		htmls += '</span>';		
		htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
		htmls += board_content;
		htmls += '</textarea>';
		htmls += '</p>';
		htmls += '</div>';
		$('#rid' + rid).replaceWith(htmls);
		$('#rid' + rid + ' #editContent').focus();
	}
	
	// 댓글 수정 내용 저장하기
	function fn_updateReply(rid, reg_id){
		var replyEditContent = $('#editContent').val();
		var paramData = JSON.stringify({"board_content": replyEditContent
				, "rid": rid
		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard3/updateReply"
			, headers : headers
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
                                console.log(result);
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	// 댓글 삭제 이벤트 추가
	function fn_deleteReply(rid){
		var paramData = {"rid": rid};
		$.ajax({
			url: "${pageContext.request.contextPath}/restBoard3/deleteReply"
			, data : paramData
			, type : 'POST'
			, dataType : 'text'
			, success: function(result){
				showReplyList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
	
	
	// 댓글리스트 조회
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/restBoard3/getReplyList";
		var paramData = {"bid" : "${hp001_d003Content.bid}"};
		console.log('=======================>'+paramData.bid);
		$.ajax({
            type: 'POST',
            url: url,
            data: paramData,
            dataType: 'json',
            success: function(result) {
               	var htmls = "";
			if(result.length < 1){
				htmls.push("등록된 댓글이 없습니다.");
			} else {
	                    $(result).each(function(){
	                     htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>Placeholder</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.reg_id + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.board_content + '\' )" style="padding-right:5px">수정</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.board_content;
	                     htmls += '</p>';
	                     htmls += '</div>';
	                     
	                     
	                });	//each end
			}
			$("#replyList").html(htmls);
            }	   // Ajax success end
            
		, error: function(error, data){
			console.log("에러 : " + error);
		}
            
		});	// Ajax end
	}
	
	// 게시글 읽기 페이지가 열리면 자동으로 showReplyList() 함수호출 이벤트
	$(function(){
		showReplyList();
	});
</script>
	
</body>
</html>