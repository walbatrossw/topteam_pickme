<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 & 자기소개서 Main</title>
<link href="css/coverletter/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/coverletter/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
<link href="css/coverletter/plugins/timeline/timeline.css" rel="stylesheet">
<link href="css/coverletter/sb-admin.css" rel="stylesheet">
<script src="js/coverletter/jquery-1.10.2.js"></script>
<script src="js/coverletter/bootstrap.min.js"></script>
<script src="js/coverletter/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/coverletter/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="js/coverletter/plugins/morris/morris.js"></script>
<script src="js/coverletter/sb-admin.js"></script>
<script src="js/coverletter/demo/dashboard-demo.js"></script>
<script>
</script>
</head>
<body>  
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
			<div class="navbar-default navbar-static-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<!-- 왼쪽상단 검색폼 -->
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="빠른 채용검색">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</li>
						<!-- 왼쪽상단 검색폼 -->
						<!-- 사이드 메뉴항목 -->
						<li>
							<a href="/coverletterIndex"><i class="fa fa-dashboard fa-fw"></i> 이력서 & 자기소개서 Main</a>
						</li>
						<li>
							<a href="#"><i class="fa fa-table fa-fw"></i> 나의 이력서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/resumeList"> 나의 이력서 리스트</a></li>
								<li><a href="/resumeInsert"> 이력서 새로 쓰기</a></li>
							</ul>
						</li>	
						<li>
							<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 지원자분석<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#"> 스펙통계(서비스준비중)</a></li>
								<li><a href="#"> 나의 지원분야(서비스준비중)</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-edit fa-fw"></i> 나의 자소서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/memberCoverletterInsert?recruitJobCd=recruit_company_job_0001"><i class="fa fa-file-o fa-fw"></i> 새 자소서 쓰기</a></li>
								<li><a href="/memberCoverletterList"><i class="fa fa-file fa-fw"></i> 내가 쓴 자소서</a></li>
								<li><a href="/companyJobCoverletterList"><i class="fa fa-list-ul fa-fw"></i> 채용기업 리스트</a></li>
							</ul>
						</li>
						<!-- 사이드 메뉴항목 -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- 사이드메뉴 전체 END-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">나의 이력서 및 자소서(나의 정보페이지)</h1>
					나의 지원현황/채용마감임박리스트 10/게시판 답글등등 보여주기 구현예정
				</div>
			</div>
		</div>
	</div>
</body>
</html>
