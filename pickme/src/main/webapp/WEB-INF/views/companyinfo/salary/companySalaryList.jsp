<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/companyinfo/module/companyInfoHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companySalary.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<script>
	$(document).ready(function() {
		const $searchBtn = $('#searchBtn');
		const $searchCompanyName = $('#searchCompanyName');
		const $salaryDetailBtn = $('.salaryDetailBtn');
		const $companyName = $('.companyName');
		//기업명 검색
		$searchBtn.click(function() {
			if ($searchCompanyName.val() != "") {
				location.href = "/salary/companySalaryListAllow?searchCompanyName=" + $searchCompanyName.val();
			} else {
				location.href = "/salary/companySalaryListAllow";
			}
		});
		$salaryDetailBtn.click(function(){
			let index = $salaryDetailBtn.index(this);
			location.href = '/salary/companySalaryDetail?companyName=' + $companyName.eq(index).val();
		});
		//
	});
</script>
<title>기업 연봉 리스트</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
		    <h1><strong>S</strong>alary</h1>
			<!-- <img alt="기업리뷰 리스트 로고" src="/img/company/logo/reviewListLogo.jpg"> -->	
		</div>
		<div class="companySalaryList">
			
			<div id="mainContents" class="jpcont_lft">
				<div class="row searchbar">
					<div class="col-xs-4">
						<input type="text" class="form-control" id="searchCompanyName"
							name="searchCompanyName" placeholder="기업명" />
					</div>
					<div class="col-xs-2">
						<button class="btn .btn-default" id="searchBtn">
							<span class="glyphicon glyphicon-search"></span>검색
						</button>
					</div>
					<div class="col-xs-3 insertBtn">
						<a href="/salary/companySalaryInsertForm" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span>연봉정보 쓰러가기</a>
					</div>
				</div>
				<article id="listCompanies" class="list_companies">
					<c:forEach var="companyInfoList" items="${companyInfoList }">
						<div class="section_wrap">
							<!--</hgroup>-->
							<div class="section_group">
								<!-- repeat-->
								<section class="company content_ty3">
									<div class="ty3_wrap">
										<div class="content_wrap">
											<div class="content_col2_2">
												<a
													href="/company/companyInfoDetail?companyName=${companyInfoList.companyName }"
													class="logo"> <img src="/img/company/company.png">
												</a>
											</div>
											<div class="col-xs-5 content_col2_3 cominfo">
												<p class="us_titb_l3">
													<a href="/company/companyInfoDetail?companyName=${companyInfoList.companyName }"><strong>${companyInfoList.companyName }</strong></a>
													<!-- <button class="btn_heart1 btn_follow" data-company_id="30139">following</button> -->
												</p>
												<p>
													<span class="us_stxt_1">${companyInfoList.industryTopIndexName }</span>
													<span class="vbar">|</span> <span class="us_stxt_1">${companyInfoList.companyAddr }</span><br>
												</p>
											</div>
											<div class="col-xs-3 content_col2_4">
												<strong>연봉 정보 수 ${companyInfoList.salaryCount}</strong>
											</div>
											<div class="col-xs-3 content_col2_4">
												<p>
													<button class="btn btn-info salaryDetailBtn"><span class="glyphicon glyphicon-share-alt"></span>연봉정보 보러가기</button>
													<input type="hidden" class="companyName" value="${companyInfoList.companyName }"/>
												</p>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</c:forEach>
					<!-- //repeat-->
					<!-- 페이징 -->
					<div class="text-center">
						<ul class="pager">
							<li class="previous"><a href="/salary/companySalaryListAllow?searchCompanyName=${searchCompanyName }&page=${page-1}">이전</a></li>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${page == i}">
										<li class="active"><a href="/salary/companySalaryListAllow?searchCompanyName=${searchCompanyName }&page=${i}">${i }</a></li>
									</c:if>
									<c:if test="${page != i}">
										<li><a href="/salary/companySalaryListAllow?searchCompanyName=${searchCompanyName }&page=${i}">${i }</a></li>
									</c:if>
							</c:forEach>
							<li class="next"><a href="/salary/companySalaryListAllow?searchCompanyName=${searchCompanyName }&page=${page+1}">다음</a></li>
						</ul>
					</div>
				</article>
			</div>
			<div class="sidebanner">
				<div class="row">
					<a href="http://xcurs0.cafe24.com"><img class="banner" src="/img/company/banner/DANIM.png"></a>
				</div>
				<div class="row">
					<a href="http://www.saramin.co.kr/"><img class="banner" src="/img/company/banner/saraminBanner.png"></a>
				</div>
			</div>
		</div>		
	</div>
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>