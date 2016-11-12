<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>PickMe Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="/css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="/js/jquery.js"></script> -->
    <!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		 $('.carousel').carousel({
		        interval: 5000 //changes the speed
		 }); 
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
</head>

<body>
<!-- HEADER START -->
	<div class="headers">
		<div id="head_lwrap">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(0, 0, 0, 0.2);">
				<h1><a class="companyInfoMain" href="/"><strong>PickMe</strong></a></h1>
					<ul>
						<li class="menu1">
							<a href="/diary">채용공고</a>
							<div class="depth2">
								<ul>
									<li><a href="/diary">채용달력</a></li>
								</ul>
							</div>
						</li>
						<li class="menu2">
							<a href="/memberCoverletterList">자기소개서</a>
							<div class="depth2">
								<ul>
									<li><a href="/memberCoverletterList">자기소개서 </a></li>
									<li><a href="/resumeList">이력서 </a></li>
								</ul>
							</div>
						</li>
						<li class="menu3">
							<a href="/freeboardInsert">자유게시판 </a>
							<div class="depth2">
								<ul>
									<li><a href="/freeboardInsert">자유게시판1</a></li>
									<li><a href="/freeboardInsert">자유게시판2</a></li>
									<li><a href="/freeboardInsert">자유게시판3 </a></li>
								</ul>
							</div>
						</li>
						<li class="menu4">
							<a href="/companyInfo">기업정보</a>
							<div class="depth2">
								<ul>
									<li><a href="/companyInfo">기업정보 </a></li>
									<li><a href="/companyInfo">기업리뷰 </a></li>
									<li><a href="/companyInfo">연봉정보</a></li>
									<li><a href="/companyInfo">면접후기</a></li>
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
							<strong>채용달력</strong>
							<br>실시간 채용정보는 물론<br>나에게 딱 맞는 공고도 <br>추천받을 수 있어요! 
						</p>
					</div>
				</div>
            </div>
            <div class="item">
            	<div id="section2" class="container-fluid">
            		<div class="comment">		
						 <p>
							<strong>이력서</strong>
							<br>매번 새로 작성해야되는 나의 이력서 <br>이젠 빠르고 정확하게 복붙하세요!
						 </p>
					</div>
				</div>
            </div>
            <div class="item">
            	<div id="section3" class="container-fluid">
            		<div class="comment">
				  		<p>
							<strong>자기소개서</strong>
							<br>자기소개서 문항 찾으러 헤매지 마세요!!!<br>빠르고 정확하게 알려드릴게요~ 
						</p>
					</div>
				</div>
        	</div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>
	<!-- 비주얼 이미지 end -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</body>
</html>
