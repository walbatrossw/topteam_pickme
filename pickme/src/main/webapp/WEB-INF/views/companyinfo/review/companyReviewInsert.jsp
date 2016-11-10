<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/star-rating.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/star-rating.css" media="all" type="text/css"/>
<link rel="stylesheet" href="/css/theme-krajee-svg.css" media="all" type="text/css"/>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/companyinfo.css">

<script>
	$(document).ready(function(){
		//자동완성기능 관련
		var availableTags = [];
		<c:forEach var="companyInfoList" items="${companyInfoList}" >
			availableTags.push("${companyInfoList.companyName}");
		</c:forEach>
		$('#companyName').autocomplete({
		      source: availableTags,
		      minLength : 1,
		      focus: function( event, ui ) {
				return false; 
		    	event.preventDefault();
		      }     
		}).autocomplete("widget").addClass("fixed-height");
		
		//별점관련
		$('.kv-svg').rating({
	            theme: 'krajee-svg',
	            filledStar: '<span class="krajee-icon krajee-icon-star"></span>',
	            emptyStar: '<span class="krajee-icon krajee-icon-star"></span>'
		});
		$('.kv-svg').on('change', function () {
	    	console.log('Rating selected: ' + $(this).val());
		});
		
		//등록버튼클릭 이벤트
		$('#companyReviewInsertBtn').click(function(){
			$('#reviewWorkYear').val($('#reviewWorkYear1').val()+'~'+$('#reviewWorkYear2').val())
			console.log($('#reviewWorkYear').val());
			$('#companyReviewInsertForm').submit();
		});
	});
</script>
<title>기업리뷰 등록페이지</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="companyInfoList">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(255, 255, 255, 0.01);">
					<h1>
						<a class="companyInfoMain" href="/companyInfo"><strong>기업정보</strong></a>
					</h1>
					<ul>
						<li class="menu1">
							<a href="/review/companyReviewInsertForm">기업리뷰</a>
						</li>
						<li class="menu2">
							<a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a>
						</li>
						<li class="menu3">
							<a href="/review/companyReviewListAllow">기업리뷰 승인 목록</a>
						</li>
						<li class="menu4">
							<a href="/interview/companyInterviewUnreceivedList">면접후기 비승인 목록</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //HEADER END -->
	<div id="companyInfoList_wrapper">
		<!-- 비주얼 이미지 start -->
		<div class="sections" id="main_visual">
			<div class="section_cont">
				<div class="visual">
					<ul>
						<li class="list1"><span class="img"
							style="z-index: 2; opacity: 1;"><img
								src="/img/company/companymain.png" /></span>
						<!-- 비주얼 이미지1 --></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 비주얼 이미지 end -->
	<div class="container">
		<div class="panel form">
			<div class="panel-heading"><h3><strong>기업 리뷰등록</strong></h3></div>
			<div class="panel-body">
				<form action="/review/companyReviewInsert" id="companyReviewInsertForm" method="post">
					<div class="form-group">
						<div class="row">
							<div class="col-xs-2">
								<label for="companyName">기업명 : </label> 
							</div>
							<div class="col-xs-3">
								<input class="form-control" type="text" id="companyName" name="companyName" autocomplete="on"/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-xs-2">
								<label for="jobTopIndex">직무분류 : </label>
							</div>
							<div class="col-xs-3">
								 <select class="form-control" id="jobTopIndex" name="jobTopIndexCd">
								 	<c:forEach var="jobTopIndexList" items="${jobTopIndexList}" >
								 		<option value="${jobTopIndexList.jobTopIndexCd }">${jobTopIndexList.jobTopIndexName }</option>
								 	</c:forEach>
								 </select>
							</div>
						 </div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-xs-2">
								<label for="companyName"> 근무기간 : </label> 
							</div>
							<div class="col-xs-3">
								<input class="form-control" type="month" id="reviewWorkYear1"/>
							</div>
							
							<div class="col-xs-3">
								<input class="form-control" type="month" id="reviewWorkYear2"/>
							</div>
								<input type="hidden" id="reviewWorkYear" name="reviewWorkYear">
						</div>
					</div>
					<div class="form-group">  
						<label for="companyName"> 기업총 평점 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewRate" title="">
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 기업 한줄평 : </label>
			 			<input type="text" class="form-control" name="reviewComment"> 
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 기업 장점 : </label>
			 			<textarea class="form-control" name="reviewStrength"></textarea> 
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 기업 단점 : </label>
			 			<textarea class="form-control" name="reviewWeak"></textarea> 
			 		</div>
			 		<div class="form-group">
			 			<label for="companyName"> 경영진에게 바라는점 : </label>
			 			<textarea class="form-control" name="reviewWish"></textarea> 
			 		</div>
			 		<div class="form-group">  
						<label for="companyName"> 승진기회가능성 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewPromotion" title="">
			 		</div>
			 		<div class="form-group">  
						<label for="companyName"> 복지및급여 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewWelfare" title="">
			 		</div>
			 		<div class="form-group">  
						<label for="companyName"> 사내문화 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewCulture" title="">
			 		</div>
			 		<div class="form-group">  
						<label for="companyName"> 업무와삶의균형 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewBalance" title="">
			 		</div>
			 		<div class="form-group">  
						<label for="companyName"> 경영진 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewCeorate" title="">
			 		</div>
			 		<div class="form-group">
						<label for="companyName"> CEO에대한견해 : </label> 
			        	<input type="text" class="kv-svg rating-loading" value="1" data-size="xs" name="reviewCeosupport" title="">
			 		</div>
				</form>
			</div>
			<div class="panel panel-end">
					<input type="button" id="companyReviewInsertBtn" class="btn btn-primary btn-block" value="등록">
			</div>
		</div>
	</div>	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>