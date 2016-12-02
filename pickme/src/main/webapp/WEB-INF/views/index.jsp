<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PickMe Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="/js/jquery.js"></script> -->
<!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		/* $('.carousel').carousel({
			interval : 5000
		//changes the speed
		}); */
		console.log("${generalId}");
		gnb_menu();				
	});
	function gnb_menu() {
		$(".menu").mouseenter(function() {
			$("#head_lwrap").addClass("on");
		});

		$(".menu").mouseleave(function() {
			$("#head_lwrap").removeClass("on");
		});
	}
</script>
</head>

<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="head_lwrap">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(0, 0, 0, 0.2);">
					<h1>
						<a class="companyInfoMain" href="/"><img
							src="/img/main/pickme_logo.png" width="200px;"></a>
					</h1>
					<h1 class="adminPage">
						<a class="companyInfoMain" href="/admin"><strong>관리자
								PAGE</strong></a>
					</h1>
					<ul class="menu">
						<li><a href="/diary">채용공고</a>
							<div class="depth2">
								<ul>
									<li><a href="/diary">채용달력</a></li>
								</ul>
							</div></li>
						<li><a href="/resumeCoverletterIndex">이력서 & 자소서</a>
							<div class="depth2">
								<ul>
									<li><a href="/resumeInsert">이력서 </a></li>
									<li><a href="/memberCoverletterList">자기소개서 </a></li>
								</ul>
							</div></li>
						<li><a href="/freeboardList">자유게시판 </a>
							<div class="depth2">
								<ul>
									<li><a href="/freeboardList?cate=1">잡담</a></li>
									<li><a href="/freeboardList?cate=2">근무환경</a></li>
									<li><a href="/freeboardList?cate=3">자소서 </a></li>
									<li><a href="/freeboardList?cate=4">인적성 </a></li>
									<li><a href="/freeboardList?cate=5">자격증 </a></li>
									<li><a href="/freeboardList?cate=6">어학 </a></li>
								</ul>
							</div></li>
						<li><a href="/companyInfo">기업정보</a>
							<div class="depth2">
								<ul>
									<li><a href="/company/companyInfoList">기업정보 </a></li>
									<li><a href="/review/companyReviewListAllow">기업리뷰 </a></li>
									<li><a href="/interview/companyInterviewListAllow">연봉정보</a></li>
									<li><a href="/companyInfo">면접후기</a></li>
								</ul>
							</div></li>
					</ul>
				</div>
			</div>
			<span class="bg_submenu"></span>
		</div>
	</div>
	<!-- //HEADER END -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div id="section1" class="container-fluid">
					<div class="comment">
						<p>
							<strong>채용달력</strong> <br>실시간 채용정보는 물론<br>나에게 딱 맞는 공고도
							<br>추천받을 수 있어요!		
						</p>
						<p class="button">
							<button type="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal"><h1>프로젝트 소개</h1></button>
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<div id="section2" class="container-fluid">
					<div class="comment">
						<p>
							<strong>이력서</strong> <br>매번 새로 작성해야되는 나의 이력서 <br>이젠 빠르고
							정확하게 복붙하세요!
						</p>
					</div>
				</div>
			</div>
			<div class="item">
				<div id="section3" class="container-fluid">
					<div class="comment">
						<p>
							<strong>자기소개서</strong> <br>자기소개서 문항 찾으러 헤매지 마세요!!!<br>빠르고
							정확하게 알려드릴게요~
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>
	<!-- 비주얼 이미지 end -->

	<div class="content">
		<div class="tab-content">
			<ul class="nav nav-pills">
				<li class="active"><a data-toggle="pill" href="#home">채용공고</a></li>
				<li><a data-toggle="pill" href="#menu1">이력서 & 자소서</a></li>
				<li><a data-toggle="pill" href="#menu2">기업정보</a></li>
				<li><a data-toggle="pill" href="#menu3">자유게시판</a></li>
			</ul>

			<div id="home" class="tab-pane fade in active">
				<div class="jumbotron">
					<h1>
						<strong>채용공고</strong>
					</h1>
				</div>
				<p>채용달력 실시간 채용정보는 물론 나에게 딱 맞는 공고도 추천받을 수 있어요!</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<div class="jumbotron">
					<h1>
						<strong>이력서 & 자소서</strong>
					</h1>
				</div>
				<p>이력서 매번 새로 작성해야되는 나의 이력서 이젠 빠르고 정확하게 복붙하세요!</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<div class="jumbotron">
					<h1>
						<strong>기업정보</strong>
					</h1>
				</div>
				<p>
					기업정보 기능에서는 기업리스트 및 기업들의 기본정보를 확인 할 수있습니다. <br>또한 연봉정보에서 직급별로
					연봉통계를 확인할수 있고 직접 연봉정보를 입력 할 수있습니다. <br>면접후기 기능에서 직접 면접를 보고 후기를
					작성하고 사용자들간에 면접후기를 공유 할 수있습니다. <br>기업리뷰에서는 해당 기업에 근무 하였거나 근무 중인
					사용자들이 작성한 리뷰를 확인 할 수 있습니다.
				</p>
			</div>
			<div id="menu3" class="tab-pane fade">
				<h3>자유게시판</h3>
				<p>내용 입력란</p>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	   <div class="modal-dialog modal-lg">
	     <div class="modal-content">
	       <div class="modal-header">
	         <button type="button" class="close" data-dismiss="modal">&times;</button>
	         <h4 class="modal-title">프로젝트 소개</h4>
	       </div>
	       <div class="modal-body">
	         <iframe class="projectcovermodal" src="/projectcover"></iframe>
	       </div>
	       <div class="modal-footer">
	         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	       </div>
	     </div>
	   </div>
	 </div>
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</body>
</html>
