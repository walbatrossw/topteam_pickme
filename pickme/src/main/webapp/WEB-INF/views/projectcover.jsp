<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PickMe Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/projectcover.css">
<script>
	
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">

	<div class="container">
		<div class="row">
			<nav class="col-sm-3" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#section1">채용 공고</a></li>
					<li><a href="#section2">이력서 & 자소서</a></li>
					<li><a href="#section3">기업정보</a></li>
					<li><a href="#section4">ERD</a></li>
				</ul>
			</nav>
			<div class="col-sm-9">
				<div id="section1">
					<h1>채용달력</h1>
					<p><!-- <img src="/img/recruit/begin_end.PNG"> -->
					채용공고의 시작과 끝을 한눈에 확인할 수 있습니다.<br>
					기업명, 채용형태, 직무, 산업군까지 다양한 검색으로 원하는 정보찾기가 편리합니다.<br>
					상세보기에서 북마크를 등록하고, 북마크한 채용만 확인할 수 있습니다. <br>
					해당 기업의 정보페이지, 해당 직무의 자기소개서쓰기 화면으로 바로 연결해줍니다.
					</p>
				</div>
				<div id="section2">
					<h1>이력서 & 자소서</h1>
					<p>이력서 매번 새로 작성해야되는 나의 이력서 이젠 빠르고 정확하게 복붙하세요!</p>
					<p>기업 채용직무별 자소서 항목과 나의 새로운 자소서를 작성 및 편집기능을 제공합니다.</p>
				</div>
				<div id="section3">
					<h1>기업정보</h1>
					<p>
						기업정보 기능에서는 기업리스트 및 기업들의 기본정보를 확인 할 수있습니다. <br>또한 연봉정보에서 직급별로
						연봉통계를 확인할수 있고 직접 연봉정보를 입력 할 수있습니다. <br>면접후기 기능에서 직접 면접를 보고
						후기를 작성하고 사용자들간에 면접후기를 공유 할 수있습니다. <br>기업리뷰에서는 해당 기업에 근무 하였거나
						근무 중인 사용자들이 작성한 리뷰를 확인 할 수 있습니다.
					</p>
				</div>
				<div id="section4">
					<h1>ERD</h1>
					<p>
						<img src="/img/erd/ERD_LOGIC_VERTICAL.jpg" style="width: 100%; height: auto;">
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
