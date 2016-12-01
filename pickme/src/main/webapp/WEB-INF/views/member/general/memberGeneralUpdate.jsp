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
		
		var loginGeneralPw = $('#loginGeneralPw').val();		
		
		/* 수정버튼 클릭시 vallidation check 후 Form 데이터 전송 */
		$('#updateBtn').click(function () {
			
			var originGeneralPw = $('#originGeneralPw').val();
			var newGeneralPw = $('#newGeneralPw').val();
			var newGeneralPwCheck = $('#newGeneralPwCheck').val();
					
			if(loginGeneralPw != originGeneralPw) {
				alert("입력한 현재 비밀번호가 옳바르지 않습니다.")
				$('#originGeneralPw').focus();
			}else if(newGeneralPw != newGeneralPwCheck) {
				alert("새로입력한 비밀번호가 일치하지 않습니다.")
				$('#newGeneralPw').focus();
			}else if(newGeneralPw == "" || newGeneralPwCheck=="") {
				alert("변경할 비밀번호를 입력하세요.")
				$('#newGeneralPw').focus();
			}else {
				$('#memberGeneralUpdateForm').submit();	
			}
		});
		
		/* 삭제버튼 클릭시 vallidation check 후 Form 데이터 전송 */
		$('#deleteBtn').click(function () {
			var deleteGeneralPw = $('#deleteGeneralPw').val();
			var result = confirm("정말탈퇴하시겠습니까?")
			
			if(loginGeneralPw != deleteGeneralPw) {
				alert("옳바른 비밀번호를 입력해주세요.")
			}else if(result){
				alert("탈퇴되었습니다.")
				$('#memberGeneralDelteForm').submit();		
			}		
		});		
		
		/* 뒤로가기 버튼 */
		$('#returnBtn1').click(function () {
			history.go(-1);
		});
		$('#returnBtn2').click(function () {
			history.go(-1);
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
 	  				
 	  				<!-- Hidden -->
 	  				<input type="hidden" id="loginGeneralPw" value="${memberGeneralInfo.generalPw }">
 	  				<input type="hidden" id="loginGeneralId" name="generalId" value="${memberGeneralInfo.generalId}">
 	  				
 	  				<div class="form-group">
 						 <label class="col-md-4 control-label">아이디</label> 
 						 	<div class="col-md-4"> 
 								<p class="form-control-static">${sessionScope.generalId}</p>
					</div>		
						</div>
					<div class="form-group">		
						<label class="col-md-4 control-label">현재 비밀번호</label>  
					<div class="col-md-4">
						<input type=password id="originGeneralPw">
 					</div>	
 						</div>			
					<div class="form-group">		
						<label class="col-md-4 control-label">비밀번호</label>  
					<div class="col-md-4">
						<input type=password id="newGeneralPw" name=generalPw>
 					</div>	
 						</div>		
 					<div class="form-group">
 						<label class="col-md-4 control-label">비밀번호 확인</label>
 					<div class="col-md-4">
 						<input type=password id="newGeneralPwCheck">
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
 								<input type="button" value="뒤로가기" id="returnBtn1">&nbsp;&nbsp;
 							</div>
 						</div>		
 						
 						<legend>회원 탈퇴</legend>
 						<form id="memberGeneralDelteForm" class="form-horizontal" action="/memberGeneralDelete" method="post">
 						
 						<!-- Hidden -->
 						<input type="hidden" id="loginGeneralPw" value="${memberGeneralInfo.generalPw }">
 	  					<input type="hidden" id="loginGeneralId" name="generalId" value="${memberGeneralInfo.generalId}">
 							
 						<div class="form-group">
	 						<label class="col-md-4 control-label">회원탈퇴</label>
	 						<div class="col-md-4">
	 							<!-- Enter키 막기 -->
	 							<input style="VISIBILITY: hidden; WIDTH: 0px">
	 							<input type="password" id="deleteGeneralPw" name="generalPw" placeholder="비밀번호 입력">
						 	</div>
						</div>
 						</form>	
 							
 						<div class="form-group">
 							<label class="col-md-4 control-label" for="signup_recruiter"></label>
 							<div class="col-md-4">
 								<input type="button" value="탈퇴" id="deleteBtn">
 								<input type="button" value="뒤로가기" id="returnBtn2">&nbsp;&nbsp;
 							</div>
 						</div>	
 					</div>
 				</div>
 			</body>
 		</html>	 															