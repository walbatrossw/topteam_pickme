<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companySalary.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<script>
	$(document).ready(function(){
		const $btnSuccess = $('.btn-success');
		const $btnDanger = $('.btn-danger');
		
		$btnSuccess.click(function(){
			location.href = "/salary/companySalaryAllow?salaryCd=${companySalaryDetail.salaryCd}"
								+ "&companyName=${companySalaryDetail.companyName}"
								+ "&salaryWorklevel=${companySalaryDetail.salaryWorklevel}";
		});
		$btnDanger.click(function(){
			location.href = "/salary/companySalaryDelete?salaryCd=${companySalaryDetail.salaryCd}";
		});
	});
</script>

<title>연봉정보 상세보기(관리자)</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>	
	<section id="main" class="column">
		<div class="container">
			<div class="panel detail">
				<div class="panel-heading"><h3><strong>연봉정보</strong></h3></div>
				<div class="panel-body salaryDetail">
					<div class="row">
						<div class="col-xs-2">
							<h4><label>기업명 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companySalaryDetail.companyName}</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-2">
							<h4><label>지원직무 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companySalaryDetail.jobTopIndexName}</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-2">
							<h4><label>현 직장/전 직장 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companySalaryDetail.salaryWorkstate}</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-2">
							<h4><label>고용형태 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companySalaryDetail.salaryWorkstatus}</h4>
						</div>
					</div>	
					<div class="row">
						<div class="col-xs-2">
							<h4><label>직급 :  </label></h4>
						</div>
						<div class="col-xs-3">
			        		<h4>${companySalaryDetail.salaryWorklevel}</h4>
						</div>
					</div>
		 			<div class="row">
						<div class="col-xs-2">
							<h4><label>총근무 기간 : </label></h4>
						</div>
						<div class="col-xs-3">
			        		<h4>${companySalaryDetail.salaryPeriod} 년</h4>
						</div>
					</div> 	
		 			<div class="row">
						<div class="col-xs-2">
							<h4><label>기본급(연봉) : </label></h4>
						</div>
						<div class="col-xs-3">
			        		<h4>${companySalaryDetail.salaryBasepay} 만원</h4>
						</div>
					</div> 	
		 			<div class="row">
						<div class="col-xs-2">
							<h4><label>최종연봉 : </label></h4>
						</div>
						<div class="col-xs-3">
			        		<h4>${companySalaryDetail.salarySum} 만원</h4>
						</div>
					</div> 	
		 		</div>		
				<div class="panel panel-end">
					<div class="col-xs-5">
						<button type="button" class="btn btn-primary btn-block btn-success">승인</button>
					</div>
					<div class="col-xs-5">
						<button type="button" class="btn btn-primary btn-block btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>	
	</section>
</body>
</html>