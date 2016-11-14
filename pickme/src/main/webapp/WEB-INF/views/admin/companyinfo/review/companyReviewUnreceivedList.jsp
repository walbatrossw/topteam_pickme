<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/admin/layout.css" type="text/css" media="screen" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--[if lt IE 9]>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="/js/admin/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="/js/admin/hideshow.js" type="text/javascript"></script>
<script src="/js/admin/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/admin/jquery.equalHeight.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companyReview.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<!-- <script>
	$(document).ready(function(){
		const $tablehover = $('.tablehover');
		$tablehover.click(function(){
			location.href = 
		});
	});
</script> -->
<script>
	$(document).ready(function(){ 
  	  	$(".tablesorter").tablesorter(); 
	});
	$(document).ready(function() {
	
		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content
	
		//On Click Event
		$("ul.tabs li").click(function() {
	
			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
	
			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});
	
	});
</script>
<script type="text/javascript">
	$(function(){
		$('.column').equalHeight();
	});
</script>
<title>관리자 승인페이지(기업리뷰)</title>
</head>
<body>
<!-- HEADER START -->
	<header id="header">
		<hgroup>
			<h1 class="site_title"><a href="/admin">관리자 페이지</a></h1>
			<h2 class="section_title">Dashboard</h2><div class="btn_view_site"><a href="/">Pick Me</a></div>
		</hgroup>
	</header> <!-- end of header bar -->
	
	<section id="secondary_bar">
		<div class="user">
			<p>관리자 (<a href="#">3 Messages</a>)</p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs"><a href="/admin">관리자 페이지</a> <div class="breadcrumb_divider"></div> <a class="current">Dashboard</a></article>
		</div>
	</section><!-- end of secondary bar -->
	
	<aside id="sidebar" class="column">
		<form class="quick_search">
			<input type="text" value="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr/>
		<h3>기업관련</h3>
		<ul class="toggle">
			<li class="fa fa-arrow-circle-right"><a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a></li>
			<li class="fa fa-arrow-circle-right"><a href="/interview/companyInterviewUnreceivedList">면접후기 미승인 목록</a></li>
			
		</ul>
		<h3>Users</h3>
		<ul class="toggle">
			
		</ul>
		<h3>Media</h3>
		<ul class="toggle">
			
		</ul>
		<h3>Admin</h3>
		<ul class="toggle">
			
		</ul>
		
		<footer>
			<hr />
			<p><strong>Copyright &copy; 2011 Website Admin</strong></p>
			<p>Theme by <a href="http://www.medialoot.com">MediaLoot</a></p>
		</footer>
	</aside><!-- end of sidebar -->
	
	<section id="main" class="column">
		<div class="container">
			<div class="jumbotron text-center">
				<h1>기업리뷰 미승인 리스트</h1>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th>기업코드</th>
							<th>작성자</th>
							<th>기업한줄평</th>
							<th>등록일</th>
							<th>승인상태</th>
						<tr>
					</thead>
					<tbody>
						<c:forEach var="companyReviewList" items="${reviewUnreceivedMap.reviewListUnreceived}" varStatus="i">
							<tr class="tablehover" onClick="location.href='/review/companyReviewUnreceivedDetail?companyReviewCd=${companyReviewList.companyReviewCd}'">
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
					<li class="previous"><a href="/review/companyReviewUnreceivedList?page=${page-1}">이전</a><li>
					<c:forEach var="i" begin="${reviewUnreceivedMap.startPage }" end="${reviewUnreceivedMap.endPage }">
						<c:if test="${page == i}">
							<li class="active"><a href="/review/companyReviewUnreceivedList?page=${i }">${i }</a><li>
						</c:if>
						<c:if test="${page != i}">
							<li><a href="/review/companyReviewUnreceivedList?page=${i }">${i }</a></li>
						</c:if>
					</c:forEach>
					<li class="next"><a href="/review/companyReviewUnreceivedList?page=${page+1}">다음</a></li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>