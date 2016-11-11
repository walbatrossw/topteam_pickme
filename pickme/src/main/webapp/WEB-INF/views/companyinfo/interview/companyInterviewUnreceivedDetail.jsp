<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
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
<link rel="stylesheet" href="/css/company/companyInterview.css">
<script>
	$(document).ready(function(){
		
	});
</script>
<title>면접후기 상세보기(관리자)</title>
</head>
<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="companyInfoList">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(255, 255, 255, 0.01);">
					<h1>
						<a class="companyInfoMain" href="/companyInfo"><strong>기업정보</strong></a>
					</h1>
					<ul>
						<li class="menu1">
							<a href="/review/companyReviewInsertForm">기업리뷰</a>
						</li>
						<li class="menu2">
							<a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a>
						</li>
						<li class="menu3">
							<a href="/review/companyReviewListAllow">기업리뷰 승인 목록</a>
						</li>
						<li class="menu4">
							<a href="/interview/companyInterviewUnreceivedList">면접후기 비승인 목록</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //HEADER END -->
	<div id="companyInfoList_wrapper">
		<!-- 비주얼 이미지 start -->
		<div class="sections" id="main_visual">
			<div class="section_cont">
				<div class="visual">
					<ul>
						<li class="list1"><span class="img"
							style="z-index: 2; opacity: 1;"><img
								src="/img/company/companymain.png" /></span>
						<!-- 비주얼 이미지1 --></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 비주얼 이미지 end -->
	<div class="container">
		<div class="panel form">
			<div class="panel-heading"><h3><strong>면접후기</strong></h3></div>
			<div class="panel-body">
				<form action="/interview/companyInterviewAllow" id="companyInterviewInsertForm" class="insertForm" method="post">
					<div class="form-group">
						<div class="row">
							<div class="col-xs-1">
								<label for="companyName">기업명 : </label> 
							</div>
							<div class="col-xs-3">
								<input class="form-control" type="text" id="companyName" name="companyName" autocomplete="on"/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-xs-1">
								<label for="jobTopIndex">직무분류 : </label>
							</div>
							<div class="col-xs-3">
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
							<div class="col-xs-1">
								<label for="companyName"> 면접 경험 : </label>
							</div>
							<div class="col-xs-4"> 
				        		<label class="radio-inline"><input type="radio" name="interviewExperience" value="1">긍정</label>
								<label class="radio-inline"><input type="radio" name="interviewExperience" value="2">보통</label>
								<label class="radio-inline"><input type="radio" name="interviewExperience" value="3">부정적</label>
							</div>
						</div>
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 면접/채용과정요약 : </label>
			 			<textarea class="form-control" name="interviewSummary"></textarea> 
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 면접질문 : </label>
			 			<textarea class="form-control" name="interviewQuestion"></textarea> 
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 면접답변 : </label>
			 			<textarea class="form-control" name="interviewAnsewer"></textarea> 
			 		</div>
			 		<div class="form-group">
			 			<div class="row">
			 				<div class="col-xs-1">
			 					<label for="companyName"> 면접난이도 : </label>
			 				</div>
			 				<div class="col-xs-4">
					 			<select class="form-control" name="interviewLevel">
								    <option value="1">매우 쉬움</option>
								    <option value="2">쉬움</option>
								    <option value="3">보통</option>
								    <option value="4">어려움</option>
								    <option value="5">매우 어려움</option>
								 </select>
							</div>
						</div>
			 		</div>
			 		<div class="form-group">
			 			<div class="row">
			 				<div class="col-xs-1">
			 					<label for="companyName"> 합격여부 : </label>
			 				</div>
			 				<div class="col-xs-4">
					 			<select class="form-control" name="interviewPasscheck">
								    <option value="1">네, 합격하고 입사하였습니다.</option>
								    <option value="2">면접에는 합격하였지만 입사하지않았습니다.</option>
								    <option value="3">아니요, 합격하지 못하였습니다.</option>
								    <option value="4">결과를 기다리는중입니다.</option>
								 </select>
							</div>
						</div>
			 		</div>		 		
				</form>
			</div>
			<div class="panel panel-end">
					<input type="button" id="companyInterviewInsertBtn" class="btn btn-primary btn-block" value="등록">
			</div>
		</div>
	</div>	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>