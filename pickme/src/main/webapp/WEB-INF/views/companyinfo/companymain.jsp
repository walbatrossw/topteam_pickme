<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="head_lwrap">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(255, 255, 255, 0.01);">
				<h1><strong>기업정보</strong></h1>
					<ul>
						<li class="menu1"><a href="/review/companyReviewInsertForm">기업리뷰 등록</a></li>
						<li class="menu2"><a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a></li>
						<li class="menu3"><a href="review/companyReviewListAllow">기업리뷰 승인 목록</a></li>
						<li class="menu4"><a href="/interview/companyInterviewUnreceivedList">면접후기 비승인 목록</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //HEADER END -->
	<div id="main_wrapper">
		<!-- 비주얼 이미지 start -->
		<div class="sections" id="main_visual">
			<div class="section_cont">
				<div class="visual">
					<ul>
						<li class="list1">
							<span class="img" style="z-index:2; opacity:1;"><img src="/img/company/companymain.png"/></span><!-- 비주얼 이미지1 -->
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 비주얼 이미지 end -->
	<div class="container">
		<div class="sections2">
			<div class="toplist">
				<ul id="list10">
			    	<li class="bar"><h3>기업 평점 순위</h3></li>
			     	<li id="list10_bg">
					    <p id="listit1">순위</p>
						<p id="listit2">기업이름</p>
						<p id="listit3">기업 총 평점</p>
				 	</li>
				 	<c:forEach var="companyTotalRateList" items="${companyTotalRateList}" varStatus="i">
					<li class="list10_list">
					    <p class="list10_0">${i.count}</p>
						<p class="list10_1"><a href="${companyTotalRateList.companySite }">${companyTotalRateList.companyName }</a></p>
						<p class="list10_2">${companyTotalRateList.companyTotalRate * 1.0}</p>
					</li>
					</c:forEach>
				</ul> 
			</div>
			<ul class="quick_service">
				<li><a href="#"><img src="/img/company/companyreview.png" width="200px"><p>기업리뷰</p></a></li>
				<li><a href="#"><img alt="확인서 신청 - 쉽고 빠른 확인서 발급을 도와 드립니다." src="/images/main/main_quick2.png"></a></li>
				<li><a href="#"><img alt="발급현황 - 확인서 발급기업을 확인해보세요" src="/images/main/main_quick3.png"></a></li>
				<li><a href="#"><img alt="가입확인 - 가입담당자를 확인해보세요" src="/images/main/main_quick4.png"></a></li>  
			</ul> 
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>