<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companyinfo.css">
<script>
	$(document).ready(function() {
		gnb_menu();
	});
	function gnb_menu() {
		$(".menu1").mouseenter(function() {
			$("#head_lwrap").addClass("on");
			$(".menu1").addClass("on");
		});
		
		$(".menu1").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
			$(".menu1").removeClass("on");
		});
		
		$(".menu2").mouseenter(function() {
			$("#head_lwrap").addClass("on");
			$(".menu2").addClass("on");
		});
		
		$(".menu2").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
			$(".menu2").removeClass("on");
		});
		
		$(".menu3").mouseenter(function() {
			$("#head_lwrap").addClass("on");
			$(".menu3").addClass("on");
		});
		
		$(".menu3").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
			$(".menu3").removeClass("on");
		});
		
		$(".menu4").mouseenter(function() {
			$("#head_lwrap").addClass("on");
			$(".menu4").addClass("on");
		});
		
		$(".menu4").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
			$(".menu4").removeClass("on");
		});
		
		$(".menu5").mouseenter(function() {
			$("#head_lwrap").addClass("on");
			$(".menu5").addClass("on");
		});
		
		$(".menu5").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
			$(".menu5").removeClass("on");
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="head_lwrap">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(255, 255, 255, 0.01);">
				<h1><a class="companyInfoMain" href="/companyInfo"><strong>기업정보</strong></a></h1>
					<ul>
						<li class="menu1">
							<a href="/company/companyInfoList">기업정보</a>
							<div class="depth2">
								<ul>
									<li><a href="/company/companyInfoList">기업 리스트</a></li>
								</ul>
							</div>
						</li>
						<li class="menu2">
							<a href="/review/companyReviewListAllow">기업리뷰</a>
							<div class="depth2">
								<ul>
									<li><a href="/review/companyReviewInsertForm">기업리뷰 등록</a></li>
									<li><a href="/review/companyReviewListAllow">기업리뷰 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="menu3">
							<a href="/salary/companySalaryListAllow">연봉정보 </a>
							<div class="depth2">
								<ul>
									<li><a href="/salary/companySalaryInsertForm">연봉정보 등록</a></li>
									<li><a href="/salary/companySalaryListAllow">연봉정보 승인목록</a></li>
								</ul>
							</div>
						</li>
						<li class="menu4">
							<a href="/interview/companyInsertForm">면접후기</a>
							<div class="depth2">
								<ul>
									<li><a href="/interview/companyInterviewInsertForm">면접후기 등록</a></li>
									<li><a href="/interview/companyInterviewListAllow">면접후기 목록</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<span class="bg_submenu"></span>
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
			<div class="row">
				<div class="col-xs-8 quick">
					<div class="row">
						<a class="col-xs-6" href="/company/companyInfoList"><img src="/img/company/companyinfologo.png" alt="기업정보 로고 이미지" width="200px"><p>기업정보</p></a>
						<a class="col-xs-6" href="#"><img src="/img/company/reviewlogo.png" alt="기업리뷰 로고 이미지" width="200px"><p>기업리뷰</p></a>
					</div>
					<div class="row">
						<a class="col-xs-6" href="#"><img src="/img/company/salarylogo.png" alt="기업연봉 로고 이미지" width="200px"><p>기업연봉</p></a>
						<a class="col-xs-6" href="#"><img src="/img/company/interviewlogo.png" alt="면접후기 로고 이미지" width="200px"><p>면접후기</p></a>
					</div>
				</div> 
				<div class="col-xs-6 toplist">
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
			</div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>