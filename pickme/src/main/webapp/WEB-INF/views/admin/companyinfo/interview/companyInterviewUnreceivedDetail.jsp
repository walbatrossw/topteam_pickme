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
<link rel="stylesheet" href="/css/company/companyInterview.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<script>
	$(document).ready(function(){
		//면접경험, 면접레벨 값얻어와 해당 하는 태그에 css적용
		const $interviewExperience = $(".interviewExperience");
		const $interviewLeve = $(".interviewLevel");
		$interviewExperience.eq('${companyInterviewDetail.interviewExperience - 1}').addClass("active");
		$interviewLeve.eq('${companyInterviewDetail.interviewLevel - 1}').addClass("active");
		
		//승인, 삭제버튼
		const $btnSuccess = $('.btn-success');
		const $btnDanger = $('.btn-danger');
		
		$btnSuccess.click(function(){
			location.href = "/interview/companyInterviewAllow?interviewCd=${companyInterviewDetail.interviewCd}";
		});
		$btnDanger.click(function(){
			location.href = "/interview/companyInterviewDelete?interviewCd=${companyInterviewDetail.interviewCd}";
		});
	});
	
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

<title>면접후기 상세보기(관리자)</title>
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
			<div class="panel form">
				<div class="panel-heading"><h3><strong>면접후기</strong></h3></div>
				<div class="panel-body interviewDetail">
					<div class="row">
						<div class="col-xs-2">
							<h4><label for="companyName">기업명 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companyInterviewDetail.companyName}</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-2">
							<h4><label for="companyName">지원직무 : </label></h4>
						</div>
						<div class="col-xs-3">
							<h4>${companyInterviewDetail.jobTopIndexName}</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-2">
							<h4><label>면접경험 : </label></h4>
						</div>
						<div class="col-xs-5">
							<ol class="levelbar">
								<li class="interviewExperience" data-step="1">긍정</li>
							  	<li class="interviewExperience" data-step="2">보통</li>
							  	<li class="interviewExperience" data-step="3">부정적</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="form-grop">
							<div class="col-xs-8">
								<h4><label>면접/채용 과정요약 : </label></h4>
								<p><strong>${companyInterviewDetail.interviewSummary}</strong><p>
							</div>
						</div>
						<div class="form-grop">
							<div class="col-xs-8">
								<h4><label>면접질문 : </label></h4>
								<p><strong>${companyInterviewDetail.interviewSummary}</strong><p>
							</div>
						</div>
						<div class="form-grop">
							<div class="col-xs-8">
								<h4><label>면접답변 : </label></h4>
								<p><strong>${companyInterviewDetail.interviewSummary}</strong><p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-grop">
							<div class="col-xs-10">
								<h4><label>면접 난이도 :</label></h4>
								<ol class="levelbar">
									<li class="interviewLevel" data-step="1">매우 쉬움</li>
								  	<li class="interviewLevel" data-step="2">쉬움</li>
								  	<li class="interviewLevel" data-step="3">보통</li>
								  	<li class="interviewLevel" data-step="4">어려움</li>
								  	<li class="interviewLevel" data-step="5">매우어려움</li>
								</ol>
							</div>
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