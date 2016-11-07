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
						<li class="list1"><!-- 관리자가 비주얼 등록한 갯수만큼 그냥 루프 -->
							<span class="img" style="z-index:2; opacity:1;"><img src="/img/company/companymain.png" alt="한강앞의 빌딩숲 사진" /></span><!-- 비주얼 이미지1 -->
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 비주얼 이미지 end -->
	<div class="sections2">
		<div class="container">
			<h1>기업 총 평점 TOP10</h1>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="text-center">
						<tr>
							<th>순위</th>
							<th>기업이름</th>
							<th>기업홈페이지</th>
							<th>기업 총 평점</th>
						<tr>
					</thead>
					<tbody>
						<c:forEach var="companyTotalRateList" items="${companyTotalRateList}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${companyTotalRateList.companyName }</td>
								<td>${companyTotalRateList.companySite }</td>
								<td>${companyTotalRateList.companyTotalRate }</td>
							</tr>				
						</c:forEach>
					</tbody>
				</table>	
			</div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>