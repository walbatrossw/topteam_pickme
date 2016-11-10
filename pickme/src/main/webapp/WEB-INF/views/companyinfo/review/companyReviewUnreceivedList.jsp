<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/companyinfo.css">
<!-- <script>
	$(document).ready(function(){
		const $tablehover = $('.tablehover');
		$tablehover.click(function(){
			location.href = 
		});
	});
</script> -->
<title>관리자 승인페이지(기업리뷰)</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
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
		<div class="jumbotron text-center">
			<h1>기업리뷰 미승인 리스트</h1>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead class="text-center">
					<tr>
						<th>승인대기번호</th>
						<th>기업코드</th>
						<th>작성자</th>
						<th>기업한줄평</th>
						<th>등록일</th>
						<th>승인상태</th>
					<tr>
				</thead>
				<tbody>
					<c:forEach var="companyReviewList" items="${reviewUnreceivedMap.reviewListUnreceived}" varStatus="i">
						<tr class="tablehover" onClick="location.href='/review/companyReviewDetail?companyReviewCd=${companyReviewList.companyReviewCd}'">
							<c:if test="${page > 1}">
								<td>${i.count + (page-1) * 5}</td>
							</c:if>
							<c:if test="${page <= 1}">
								<td>${i.count}</td>
							</c:if>
							<td>${companyReviewList.companyCd }</td>
							<td>${companyReviewList.loginId }</td>
							<td>${companyReviewList.reviewComment }</td>
							<td>${companyReviewList.reviewRegDate }</td>
							<td>미승인</td>
						</tr>				
					</c:forEach>
				</tbody>
			</table>	
		</div>
		<!-- 페이징 -->
		<div>
			<ul class="pager">
				<c:if test="${page > 1}">
					<li class="previous"><a href="/review/companyReviewUnreceivedList?page=${page-1}">이전</a><li>
				</c:if>
				<c:forEach var="i" begin="${reviewUnreceivedMap.startPage }" end="${reviewUnreceivedMap.endPage }">
					<c:if test="${page == i}">
						<li><a href="/review/companyReviewUnreceivedList?page=${i }">${i }</a><li>
					</c:if>
					<c:if test="${page != i}">
						<li><a href="/review/companyReviewUnreceivedList?page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${page < reviewUnreceivedMap.endPage}">
					<li class="next"><a href="/review/companyReviewUnreceivedList?page=${page+1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>