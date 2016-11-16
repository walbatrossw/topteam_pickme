<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/companyinfo/module/companyInfoHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companyInterview.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<script>
	$(document).ready(function(){
		const $searchBtn = $('#searchBtn');
		const $searchCompanyName = $('#searchCompanyName');
		const $searchjobTopIndex = $('#searchjobTopIndex');
		const $insertBtn = $('#insertBtn');
	
		$searchjobTopIndex.val("${jobTopIndexCd}").attr("selected","selected");
		$searchCompanyName.val("${searchCompnayName}");
		$searchjobTopIndex.change(function(){
			console.log('test1');
			if($searchjobTopIndex.val() != "") {
				location.href="/interview/companyInterviewListAllow?jobTopIndexCd="+$searchjobTopIndex.val();
			}else{
				location.href="/interview/companyInterviewListAllow";
			}    
	    });
		
		$searchCompanyName.click(function(){
			$searchCompanyName.val("");
		});
		
		//기업명 검색
		$searchBtn.click(function(){
			if($searchCompanyName.val() != "" || $searchjobTopIndex.val() != "") {
				location.href="/interview/companyInterviewListAllow?searchCompanyName="+$searchCompanyName.val()+"&jobTopIndexCd="+$searchjobTopIndex.val();
			}else{
				location.href="/interview/companyInterviewListAllow";
			}    
		});
		//면접후기쓰러가기
		$insertBtn.click(function(){
			location.href="/interview/companyInterviewInsertForm";
		});
		
	});
</script>
<title>면접후기 리스트</title>
</head>
<body>
	<div class="container">
		<div class="container">
			<div class="jumbotron text-center">
				<h1>면접후기 리스트</h1>
			</div>
			<div class="companyInterviewList">
				<div class="row">
					<div class="col-xs-3">
						 <select class="form-control" id="searchjobTopIndex" name="jobTopIndexCd">
						 	<option value="">직무분류</option>
						 	<c:forEach var="jobTopIndexList" items="${jobTopIndexList}" >
						 		<option value="${jobTopIndexList.jobTopIndexCd }">${jobTopIndexList.jobTopIndexName }</option>
						 	</c:forEach>
						 </select>
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" id="searchCompanyName" name="searchCompanyName" placeholder="기업명"/>
					</div>
					<div class="col-xs-2">			
						<button class="btn .btn-default" id="searchBtn"><span class="glyphicon glyphicon-search"></span>검색</button>
					</div>
					<div class="col-xs-6">
						<button class="btn .btn-default" id="insertBtn">면접후기 쓰러가기</button>
					</div>
				</div>
				<c:forEach var="interviewListAllow" items="${interviewListAllow}">
					<div class="interview">
						<div class="row">
							<div class="media">
								<div class="media-left">
									<img src="/img/company/company.png" class="media-object" style="width:60px">
								</div>
								<div class="media-body">
									<h4 class="media-heading">${interviewListAllow.companyName } | ${interviewListAllow.jobTopIndexName } </h4>
									<p>${interviewListAllow.interviewRegDate }</p>
									<div class="us_levbl_s">
										<div class="bl_score" style="width: ${interviewListAllow.interviewLevel * 20}%">평점</div>
									</div>
									<div class="levelTxt">
										<c:if test="${interviewListAllow.interviewLevel == 1}">
											<span class="level1">매우쉬움</span>
										</c:if>
										<c:if test="${interviewListAllow.interviewLevel == 2}">
											<span class="level2">쉬움</span>
										</c:if>
										<c:if test="${interviewListAllow.interviewLevel == 3}">
											<span class="level3">보통</span>
										</c:if>
										<c:if test="${interviewListAllow.interviewLevel == 4}">
											<span class="level4">어려움</span>
										</c:if>
										<c:if test="${interviewListAllow.interviewLevel == 5}">
											<span class="level5">매우어려움</span>
										</c:if>
									</div>
								</div>
								
							</div>					
						</div>
						<div id="interviewSummary" class="row">
							<div class="media">
								<div class="media-left">
									<span><img src="/img/company/people.png" class="media-object"></span>
								</div>
								<div class="media-body">
									<h4 class="media-heading">
										<a href="/interview/companyInterviewDetail?interviewCd=${interviewListAllow.interviewCd}">
											"${interviewListAllow.interviewSummary }"
										</a>
									</h4>
								</div>
							</div>
						</div>
						<div id="reviewStrength" class="row">
							<div class="panel panel-success">
								<div class="panel-heading">면접질문</div>
	      						<div class="panel-body">${interviewListAllow.interviewQuestion }</div>		
							</div>
						</div>
					</div>
				</c:forEach>		
			</div>
			<!-- 페이징 -->
			<div class="text-center">
				<ul class="pager">
					<li class="previous"><a href="/interview/companyInterviewListAllow?searchCompanyName=${searchCompanyName }&jobTopIndexCd=${jobTopIndexCd}&page=${page-1}">이전</a><li>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${page == i}">
							<li class="active"><a href="/interview/companyInterviewListAllow?searchCompanyName=${searchCompanyName }&jobTopIndexCd=${jobTopIndexCd}&page=${i }">${i }</a><li>
						</c:if>
						<c:if test="${page != i}">
							<li><a href="/interview/companyInterviewListAllow?searchCompanyName=${searchCompanyName }&jobTopIndexCd=${jobTopIndexCd}&page=${i }">${i }</a></li>
						</c:if>
					</c:forEach>
					<li class="next"><a href="/interview/companyInterviewListAllow?searchCompanyName=${searchCompanyName }&jobTopIndexCd=${jobTopIndexCd}&page=${page+1}">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>