<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8"/>
<title>관리자 페이지</title>	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/admin/style.css">
<script>
	$(document).ready(function(){
		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1);
	    var day = now.getDate();
	              
	    var chan_val = year + '-' + mon + '-' + day;
	    $('.today').text(chan_val);
	    
	    google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawBackgroundColor);
		function drawBackgroundColor() {
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'X');
			data.addColumn('number', '방문자수');

			data.addRows([ 
				<c:forEach var="regDateVisitantCountList" items="${regDateVisitantCountList}" varStatus="i">
					[ '${regDateVisitantCountList.visitantRegdate}',  ${regDateVisitantCountList.visitantTodayCount}],
			    </c:forEach>         
				]);
			var options = {
				pointSize : 5,
				hAxis : {
					title : '방문자수'
				},
				vAxis : {
				},
				backgroundColor : '#ffffff'
			};
			var chart = new google.visualization.LineChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
		$.fn.urlLink = function(url) {
			window.open(url);
		};
	});
</script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>
	<section id="main" class="column">
		<div class="container">
			<div class="maincontens">
				<div class="tab">
					<div class="row title"><!-- 미승인 게시글 수 -->
						<i class="fa fa-file-text"><strong>미승인 게시판</strong></i>
					</div>
					<div class="row">
						<div class="col-xs-4">
							<div class="content allowCheck">
								<div>
									<i class="fa fa-clipboard"></i><span class="badge">${unreceivedListCount.reviewCount}</span>
								</div>
								<h3><a href="/review/companyReviewUnreceivedList"><strong>기</strong>업리뷰 미승인</a></h3>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="content allowCheck">
								<div>
									<i class="fa fa-clipboard"></i><span class="badge">${unreceivedListCount.interviewCount}</span>
								</div>
								<h3><a href="/interview/companyInterviewUnreceivedList"><strong>면</strong>접후기 미승인</a></h3>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="content allowCheck">
								<div>
									<i class="fa fa-clipboard"></i><span class="badge">${unreceivedListCount.salaryCount}</span>
								</div>
								<h3><a href="/salary/companySalarywUnreceivedList"><strong>연</strong>봉정보 미승인</a></h3>
							</div>
						</div>
					</div><!-- 미승인 게시글 수 끝 -->
				</div>
				
				<div class="tab">
					<div class="row title"><!-- 채용공고 등록 퀵 -->
						<i class="fa fa-calendar"><strong>채용 공고</strong></i>
					</div>
					
					<div class="row">
						<div class="col-xs-4">
							<div class="content recruit">
								<div>
									<i class="fa fa-address-card-o"> <a href="/recruit">채용공고 등록</a></i><i class="fa fa-arrow-circle-right"></i>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="recruitBanner">
								<div>
									<a onClick="$(this).urlLink('https://www.jobplanet.co.kr/');" href="#"><img class="img-rounded" src="/img/company/banner/jobplanetBanner.jpg"></a>
								</div>
							</div>
						</div>
						<div class="col-xs-4">
							<div class="recruitBanner">
								<div>
									<a onClick="$(this).urlLink('http://www.saramin.co.kr/');" href="#"><img class="img-rounded" src="/img/company/banner/saraminBanner.png"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row title"><!-- 방문자 수 -->
					<i class="fa fa-home"><strong>방문자 수</strong></i>
				</div>
				<div class="row visitant">
					<div class="col-xs-4">
						<div class="content visitantCount">
							<div class="row">
								<div class="today"></div>
							</div>
							<div class="row">
								<div class="visitantString">TODAY</div>
								<div class="visitantInteger">${visitantCount.visitantTodayCount}</div>
							</div>
							<div class="row">
								<div class="visitantString">TOTAL</div>
								<div class="visitantInteger">${visitantCount.visitantTotalCount}</div>
							</div>
						</div>
					</div>
					<div class="col-xs-8">
						<div class="content visitantCount">
							<div class="chart_title">방문자 일별통계</div>
							<div id="chart_div"></div>
						</div>
					</div>
				</div><!-- 방문자 끝 -->	
			</div>
			<!-- 관리자 페이지 추가할 내용은 이페이지를 복사해서 이안에 내용 삽입하시길 -->
		</div>
	</section>
</body>
</html>