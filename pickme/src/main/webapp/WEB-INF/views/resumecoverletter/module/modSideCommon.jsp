<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>
	<!-- Page Whole START-->
	<div id="wrapper">
		<!-- Side Navigation Whole : START-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<p align="center"><strong><i class="fa fa-thumbs-o-up"></i>  P!ckMe</strong>는 당신을 응원합니다!</p>
					<hr>
					<p align="center"><strong>세상에는 서류 탈락한 회사보다</strong></p>
					<p align="center"><strong>자소서를 써야할 회사가 더 많다</strong></p>
					<p align="right"><strong>By DoubleS</strong> &nbsp &nbsp &nbsp</p>
					<hr>
					<p align="center">오늘도 활기찬 하루를 시작해요!!!</p>
					<p align="center">밥은 먹고 씁시다!!!</p>
					<p align="center">오늘 하루도 고생하셨습니다!!!</p>
					<p align="center" style="color: red">if문으로 시간대별로 </p>
					<p align="center" style="color: red">문구 달라지게 하기!!!</p>
					<ul class="nav" id="side-menu">
						<!-- Side Search Form : START -->
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
						<!-- Side Search Form : END -->
						
						<!-- Side MENU : START -->
						<li>
							<a href="/resumeCoverletterIndex"><i class="fa fa-sitemap fa-fw"></i> 이력서 & 자기소개서</a>
						</li>
						<li>
							<a href="/resumeCoverletterInfo"><i class="fa fa-info-circle fa-fw"></i> 나의 정보</a>
						</li>
						<li>
							<a href="#"><i class="fa fa-table fa-fw"></i> 나의 이력서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/resumeList"><i class="fa fa-th-list fa-fw"></i> 나의 이력서 리스트</a></li>
								<li><a href="/resumeInsert"><i class="fa fa-pencil fa-fw"></i> 이력서 새로 쓰기</a></li>
							</ul>
						</li>	
						<li>
							<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 지원자분석<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 스펙통계(서비스준비중)</a></li>
								<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 나의 지원분야(서비스준비중)</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-edit fa-fw"></i> 나의 자소서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/memberCoverletterInsert?recruitJobCd=recruit_company_job_0001"><i class="fa fa-file-o fa-fw"></i> 새 자소서 쓰기</a></li>
								<li><a href="/memberCoverletterList"><i class="fa fa-file fa-fw"></i> 내가 쓴 자소서</a></li>
								<li><a href="/companyJobCoverletterList"><i class="fa fa-list-ul fa-fw"></i> 채용기업 리스트</a></li>
							</ul>
						</li>
						<!-- Side MENU : MENU -->
					
					</ul>
				</div>
			</div>
		
		<!-- /Side Navigation Whole END-->
		
	</div>
	<!-- /Page Whole END-->
</body>
</html>
