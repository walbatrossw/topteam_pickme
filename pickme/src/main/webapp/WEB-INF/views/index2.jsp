<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>PickMe Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/modern-business.css" rel="stylesheet">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="/js/jquery.js"></script> -->
    <!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		 $('.carousel').carousel({
		        interval: 5000 //changes the speed
		 });
	});
   
    </script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader2.jsp"/>
<body>
<div class="container main">
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
					<div align="center">
						<div class="topName">
							<strong>Pick</strong>ME
						</div>
						<h1>채용달력</h1>
						<p>실시간 채용정보는 물론<br>나에게 딱 맞는 공고도 <br> 추천받을 수 있어요! </p>
					</div>
				</div>
            </div>
            <div class="item">
            	<div id="section2" class="container-fluid">
					<h1>이력서</h1>
						<p>매번 새로 작성해야되는 나의 이력서 <br> 이젠 빠르고 정확하게 복붙하세요! </p>
				</div>
            </div>
            <div class="item">
            	<div id="section3" class="container-fluid">
				  	<h1>자기소개서</h1>
						<p>자기소개서 문항 찾으러 헤매지 마세요!!!<br> 빠르고 정확하게 알려드릴게요~ </p>
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
	<hr>
</div>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</body>
</html>
