<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/admin/layout.css" type="text/css"
	media="screen" />
<!--[if lt IE 9]>
<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="/js/admin/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="/js/admin/hideshow.js" type="text/javascript"></script>
<script src="/js/admin/jquery.tablesorter.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/admin/jquery.equalHeight.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
	$(function() {
		$('.column').equalHeight();
	});
</script>
<title>관리자 페이지</title>
</head>
<body>
	<header id="header">
		<hgroup>
			<h1 class="site_title">
				<a href="/admin">관리자 페이지</a>
			</h1>
			<h2 class="section_title">Dashboard</h2>
			<div class="btn_view_site">
				<a href="/">Pick Me</a>
			</div>
		</hgroup>
	</header>
	<!-- end of header bar -->

	<section id="secondary_bar">
		<div class="user">
			<p>
				관리자 (<a href="#">3 Messages</a>)
			</p>
			<!-- <a class="logout_user" href="#" title="Logout">Logout</a> -->
		</div>
		<div class="breadcrumbs_container">
			<article class="breadcrumbs">
				<a href="/admin">관리자 페이지</a>
				<div class="breadcrumb_divider"></div>
				<a class="current">Dashboard</a>
			</article>
		</div>
	</section>
	<!-- end of secondary bar -->

	<aside id="sidebar" class="column">
		<form class="quick_search">
			<input type="text" value="Quick Search"
				onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr />
		<h3>기업관련</h3>
		<ul class="toggle">
			<li class="fa fa-arrow-circle-right"><a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a></li>
			<li class="fa fa-arrow-circle-right"><a href="/interview/companyInterviewUnreceivedList">면접후기 미승인 목록</a></li>
			<li class="fa fa-arrow-circle-right"><a href="/salary/companySalarywUnreceivedList">연봉정보 미승인 목록</a></li>
		</ul>
		<h3>채용관련</h3>
		<ul class="toggle">
			<li class="fa fa-arrow-circle-right"><a href="/recruit">채용입력</a></li>
		</ul>
		<h3>Media</h3>
		<ul class="toggle">
		</ul>
		<h3>Admin</h3>
		<ul class="toggle">
		</ul>
		<footer>
			<hr />
			<p>
				<strong>Copyright &copy; 2011 Website Admin</strong>
			</p>
			<p>
				Theme by <a href="http://www.medialoot.com">MediaLoot</a>
			</p>
		</footer>
	</aside>
	<!-- end of sidebar -->
</body>
</html>