<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/companyinfo/module/companyInfoHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companyinfo.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<script>
	$(document).ready(function() {
		const $searchBtn = $('#searchBtn');
		const $searchCompanyName = $('#searchCompanyName');
		//기업명 검색
		$searchBtn.click(function() {
			if ($searchCompanyName.val() != "") {
				location.href = "/company/companyInfoList?searchCompanyName=" + $searchCompanyName.val();
			} else {
				location.href = "/company/companyInfoList";
			}
		});
	});
</script>
<title>기업리스트</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
		    <h1><strong>I</strong>nfo</h1>
			<!-- <img alt="기업리뷰 리스트 로고" src="/img/company/logo/reviewListLogo.jpg"> -->	
		</div>
		<div class="companyInfoList">
			<div id="mainContents" class="jpcont_lft">
				<article id="listCompanies" class="list_companies">
					<div class="row">
						<div class="col-xs-3">
							<input type="text" class="form-control" id="searchCompanyName"
								name="searchCompanyName" placeholder="기업명" />
						</div>
						<div class="col-xs-2">
							<button class="btn .btn-default" id="searchBtn">
								<span class="glyphicon glyphicon-search"></span>검색
							</button>
						</div>
					</div>
					<c:forEach var="companyInfoList" items="${companyInfoList }">
						<div class="section_wrap">
							<!--<hgroup>-->
							<!--<h2 class="tit">기업리뷰 많은 기업  </h2>-->
							<!--<h3 class="sub_tit">필터, 정렬로 선택하시면 다른 리스트를 볼 수 있습니다.</h3>-->
							<!--</hgroup>-->
							<div class="section_group">
								<!-- repeat-->
								<section class="company content_ty3">
									<div class="ty3_wrap">
										<div class="content_wrap">
											<div class="content_col2_2">
												<a
													href="/companies/30139/info/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90?"
													class="llogo"> <img src="/img/company/company.png">
												</a>
											</div>
											<div class="col-xs-7 content_col2_3 cominfo">
												<p class="us_titb_l3">
													<a href="/company/companyInfoDetail?companyName=${companyInfoList.companyName }"><strong>${companyInfoList.companyName }</strong></a>
													<!-- <button class="btn_heart1 btn_follow" data-company_id="30139">following</button> -->
												</p>
												<p>
													<span class="us_stxt_1">${companyInfoList.industryTopIndexName }</span>
													<span class="vbar">|</span> <span class="us_stxt_1">${companyInfoList.companyAddr }</span><br>
												</p>
												<p class="row_end">
													<a
														href="/companies/30139/reviews/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90?"
														class="us_stxt_1">${companyInfoList.reviewCount } 기업리뷰</a>
													<span class="vbar">|</span> <a
														href="/companies/30139/salaries/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90?"
														class="us_stxt_1">${companyInfoList.salaryCount } 연봉정보</a>
													<span class="vbar">|</span> <a
														href="/companies/30139/interviews/%EC%82%BC%EC%84%B1%EC%A0%84%EC%9E%90?"
														class="us_stxt_1">${companyInfoList.interviewCount }
														면접정보</a>
												</p>
											</div>
											<div class="col-xs-4 content_col2_4">
												<p>
													<strong>기업 총 평점</strong>
												</p>
												<p>
													<strong>${companyInfoList.companyTotalRate * 1.0 }</strong>
												</p>
												<div class="star">
													<span class="starrating"> <img
														src="/img/company/starrating.png"
														style="transform: translate(0%, -${companyInfoList.companyTotalRate * 17}%);">
													</span>
												</div>
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</c:forEach>
					<!-- //repeat-->
				</article>
			</div>
			<!-- 페이징 -->
			<div class="text-center">
				<ul class="pager">
					<li class="previous"><a href="/company/companyInfoList?searchCompanyName=${searchCompanyName }&page=${page-1}">이전</a></li>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${page == i}">
								<li class="active"><a href="/company/companyInfoList?searchCompanyName=${searchCompanyName }&page=${i}">${i }</a></li>
							</c:if>
							<c:if test="${page != i}">
								<li><a href="/company/companyInfoList?searchCompanyName=${searchCompanyName }&page=${i}">${i }</a></li>
							</c:if>
					</c:forEach>
					<li class="next"><a href="/company/companyInfoList?searchCompanyName=${searchCompanyName }&page=${page+1}">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>