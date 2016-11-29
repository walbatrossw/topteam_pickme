<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

</script>
<title>회원정보</title>
</head>
<body height:600px>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
	<div class="wrapper row5">
		<div class="hoc container clear">
			<div class="content three_quarter">
				<form id="memberGeneralUpdateForm" class="form-horizontal" action="/" method="post">
		<fieldset>
		<input name="passwordinput" type="hidden" value="학생">
		<legend>내 정보</legend>
		<div class="form-group">
		  <label class="col-md-4 control-label">아이디</label>  
		  <div class="col-md-4">
		  	<p class="form-control-static">${sessionScope.generalId}</p>
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">비밀번호</label>  
		  <div class="col-md-4">
		  	  <input type=password name=pwd value="${MemberGeneralVo.generalPw}">
		  </div>
		</div>	
		<div class="form-group">
		  <label class="col-md-4 control-label">비밀번호 확인</label>  
		  <div class="col-md-4">
		  	  <input type=password name=pwd">
		  </div>
		</div>
		<div class="form-group">
		  <label class="col-md-4 control-label">닉네임</label>
		  <div class="col-md-4">
		  <input type=text name=text value="${MemberGeneralVo.generalNick}">
		  </div>
		</div>	
		
		</fieldset>
		</div>	
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="signup_recruiter"></label>
		  <div class="col-md-4">
		   <a href="/memberGeneralUpdateForm">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
				</div>
			</div>	
				
			<legend>탈퇴 하기</legend>
			
		  </div>
	</div>
		
			
		
</body>
</html>