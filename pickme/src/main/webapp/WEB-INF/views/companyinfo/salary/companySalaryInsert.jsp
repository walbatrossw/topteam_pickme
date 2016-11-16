<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/companyinfo/module/companyInfoHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/star-rating.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/company/companyinfo.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companySalary.css">
<script>
$(document).ready(function(){
	const $salaryInsertBtn = $('#companySalaryInsertBtn');
	
	//자동완성기능 관련
	var availableTags = [];
	<c:forEach var="companyInfoList" items="${companyInfoList}" >
		availableTags.push("${companyInfoList.companyName}");
	</c:forEach> 
	$('#companyName').autocomplete({
	      source: availableTags,
	      minLength : 1,
	      focus: function( event, ui ) {
			return false; 
	    	event.preventDefault();
	      }     
	}).autocomplete("widget").addClass("fixed-height");
	
	//등록버튼클릭 이벤트
	$salaryInsertBtn.click(function(){
		$('#companySalaryInsertForm').submit();
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="panel form">
		<div class="panel-heading"><h3><strong>기업 연봉정보 등록</strong></h3></div>
		<div class="panel-body">
			<form action="/salary/companySalaryInsert" id="companySalaryInsertForm" method="post">
				<div class="form-group">
					<div class="row">
						<div class="col-xs-3">
							<label for="companyName">기업명 : </label> 
						</div>
						<div class="col-xs-5">
							<input class="form-control" type="text" id="companyName" name="companyName" autocomplete="on"/>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-xs-3">
							<label for="jobTopIndex">직무분류 : </label>
						</div>
						<div class="col-xs-5">
							 <select class="form-control" id="jobTopIndex" name="jobTopIndexCd">
							 	<c:forEach var="jobTopIndexList" items="${jobTopIndexList}" >
							 		<option value="${jobTopIndexList.jobTopIndexCd }">${jobTopIndexList.jobTopIndexName }</option>
							 	</c:forEach>
							 </select>
						</div>
					 </div>
				</div>
				<div class="form-group">  
					<div class="row">
						<div class="col-xs-3">
							<label> 현 직장/전 직장 : </label>
						</div>
						<div class="col-xs-5">
			        		<select class="form-control" name="salaryWorkstate">
							    <option value="">현 직장/전 직장</option>
							    <option value="현직장">현 직장</option>
							    <option value="전직장">전 직장</option>
							 </select>
						</div>
					</div>
		 		</div>
		 		<div class="form-group">
		 			<div class="row">
						<div class="col-xs-3">
							<label>고용형태 :  </label>
						</div>
						<div class="col-xs-5">
			        		<select class="form-control" name="salaryWorkstatus">
							    <option value="">고용형태</option>
							    <option value="인턴직">인턴직</option>
							    <option value="아르바이트">아르바이트</option>
							    <option value="정규직">정규직</option>
							    <option value="계약직">계약직</option>
							    <option value="기타">기타</option>
							 </select>
						</div>
					</div>
		 		</div>
		 		<div class="form-group">
		 			<div class="row">
						<div class="col-xs-3">
							<label>직급 :  </label>
						</div>
						<div class="col-xs-5">
			        		<select class="form-control" name="salaryWorklevel">
							    <option value="">직급</option>
							    <option value="사원">사원</option>
							    <option value="대리">대리</option>
							    <option value="과장">과장</option>
							    <option value="차장">차장</option>
							    <option value="부장">부장</option>
							 </select>
						</div>
					</div> 
		 		</div>
		 		<div class="form-group">
		 			<div class="row">
						<div class="col-xs-3">
							<label>총근무 기간 : </label>
						</div>
						<div class="col-xs-5">
			        		<input type="number" class="form-control" name="salaryPeriod" placeholder="년단위로 입력">
						</div>
						<div class="col-xs-1"><label>년</label></div>
					</div> 	
		 		</div>
		 		<div class="form-group">
		 			<div class="row">
						<div class="col-xs-3">
							<label>기본급(연봉) : </label>
						</div>
						<div class="col-xs-5">
			        		<input type="number" class="form-control" name="salaryBasepay" placeholder="">
						</div>
						<div class="col-xs-1"><label>만원</label></div>
					</div> 	
		 		</div>
		 		<div class="form-group">
		 			<div class="row">
						<div class="col-xs-3">
							<label>최종연봉 : </label>
						</div>
						<div class="col-xs-5">
			        		<input type="number" class="form-control" name="salarySum" placeholder="">
						</div>
						<div class="col-xs-1"><label>만원</label></div>
					</div> 	
		 		</div>
		 		<div class="form-group">
		 			<div class="row">		
			        	<input type="button" id="companySalaryInsertBtn" class="btn btn-primary btn-block" value="등록">		
					</div> 	
		 		</div>
		 			 		
			</form>
			<div class="sidebanner">
				<a href="#"><img class="banner" src="/img/company/banner/banner1.jpg">
				banner img test</a>
				<a href="#"><img class="banner" src="/img/company/banner/banner2.jpg">
				banner img test</a>
			</div>
		</div>
	</div>
</div>	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>