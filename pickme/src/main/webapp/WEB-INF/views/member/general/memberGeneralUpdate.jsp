<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function () {
		
		$('#updateBtn').click(function () {
			$('#memberGeneralUpdateForm').submit();
		});
		
	});

</script>
	<title>회원정보</title>
</head>
<body>
<br>
<br>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
	<div class="wrapper row5">
		<div class="hoc container clear">
			<div class="content three_quarter">
				<form id="memberGeneralUpdateForm" class="form-horizontal" action="/memberGeneralUpdate" method="post">
			
			<fieldset>
				<legend>내정보 수정</legend>
 	  				
 	  				<input hidden="generalId" name="generalId" value="${sessionScope.generalId}">
 	  				<div class="form-group">
 						 <label class="col-md-4 control-label">아이디</label> 
 						 	<div class="col-md-4"> 
 								<p class="form-control-static">${sessionScope.generalId}</p>
					</div>		
						</div>
					<div class="form-group">		
						<label class="col-md-4 control-label">현재 비밀번호</label>  
					<div class="col-md-4">
						<input type=password name=generalPw1>
 					</div>	
 						</div>			
					<div class="form-group">		
						<label class="col-md-4 control-label">비밀번호</label>  
					<div class="col-md-4">
						<input type=password name=generalPw>
 					</div>	
 						</div>		
 					<div class="form-group">
 						<label class="col-md-4 control-label">비밀번호 확인</label>
 					<div class="col-md-4">
 						<input type=password name="generalPw3">
 					</div>
 						</div>
 					<div class="form-group">
 						<label class="col-md-4 control-label">닉네임</label>
 							<div class="col-md-4">
 								 <input type=text name="generalNick">
					 </div>
						</div> 						
 							</fieldset>
 				</form>
 						</div>
 							
 							<!-- Button -->
 							<div class="form-group">
 								<label class="col-md-4 control-label" for="signup_recruiter"></label>
 							<div class="col-md-4">
 								<input type="button" value="수정" id="updateBtn">
 									<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
 							</div>
 						</div>		
 						
 						<legend>탈퇴 하기</legend>
 								
 					</div>
 				</div>
 			</body>
 		</html>	 															