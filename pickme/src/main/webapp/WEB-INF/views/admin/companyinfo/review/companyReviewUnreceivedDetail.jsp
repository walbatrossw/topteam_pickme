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
<script>
	$(document).ready(function(){
		const $btnSuccess = $('.btn-success');
		const $btnDanger = $('.btn-danger');
		
		$btnSuccess.click(function(){
			location.href = "/review/companyReviewAllow?companyReviewCd=${reviewDetail.companyReviewCd}";
		});
		$btnDanger.click(function(){
			location.href = "/review/companyReviewDelete?companyReviewCd=${reviewDetail.companyReviewCd}";
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
<title>Insert title here</title>
</head>
<body>
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
				<h1>기업리뷰 상세보기(관리자)</h1>
			</div>
			<div class="companyReviewDetail">	
				<div class="row">
					<div id="reviewRate" class="col-xs-5">
						<h1>기업총평점</h1>
						<h2>${reviewDetail.reviewRate * 1.0}</h2>
						<span class="star-rating">
							<span style="width:${reviewDetail.reviewRate * 20}%"></span>
						</span>
					</div>
					
					<div id="etc">
						<div class="col-xs-3">
							<label>승진기회 가능성</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewPromotion}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewPromotion * 20}%">
							   		 ${reviewDetail.reviewPromotion * 1.0} / 5.0
								</div>
							</div>
						</div>	 
						<div class="col-xs-3">
							<label>복지 및 급여</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewWelfare}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewWelfare * 20}%">
							   		 ${reviewDetail.reviewWelfare * 1.0} / 5.0
								</div>
							</div>
						</div>	
						<div class="col-xs-3">
							<label>사내문화</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCulture}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCulture * 20}%">
							   		 ${reviewDetail.reviewCulture * 1.0} / 5.0
								</div>
							</div>
						</div>	
						<div class="col-xs-3">
							<label>업무와 삶의균형</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewBalance}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewBalance * 20}%">
							   		 ${reviewDetail.reviewBalance * 1.0} / 5.0
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<label>경영진</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCeorate}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCeorate * 20}%">
							   		 ${reviewDetail.reviewCeorate * 1.0} / 5.0
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<label>CEO에대한견해</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCeosupport}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCeosupport * 20}%">
							   		 ${reviewDetail.reviewCeosupport * 1.0} / 5.0
								</div>
							</div>
						</div>		
					</div>	<!-- etc -->	
				</div>	<!-- row -->	
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-defult">
							<div class="panel-heading">
								<label>닉네임 : </label>
								<c:if test="${reviewDetail.generalNick != null}">
									${reviewDetail.generalNick } |
								</c:if>
								<c:if test="${reviewDetail.linkedNick != null}">
									${reviewDetail.linkedNick }	|
								</c:if>
								<label>근무기간 : </label>
									${reviewDetail.reviewWorkYear } |
								<label>등록일 : </label>
									${reviewDetail.reviewRegDate }
							</div>
						</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-info">
	      					<div class="panel-heading"><label>한줄평 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewComment }"</div>
	    				</div>
					</div>
				</div><!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-success">
	      					<div class="panel-heading"><label>기업의 장점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewStrength }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->	
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-danger">
	      					<div class="panel-heading"><label>기업의 단점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewWeak }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-primary">
	      					<div class="panel-heading"><label>경영진에게 바라는점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewWish }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-6">
						<button type="button" class="btn btn-primary btn-block btn-success">승인</button>
					</div>
					<div class="col-xs-6">
						<button type="button" class="btn btn-primary btn-block btn-danger">삭제</button>
					</div>
				</div>	<!-- row -->		
			</div><!-- companyReviewDetail -->
		</div>
	</section>
</body>
</html>