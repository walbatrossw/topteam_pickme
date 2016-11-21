<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/companyinfo/module/companyInfoHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/star-rating.js" type="text/javascript"></script>
<link rel="stylesheet" href="/css/company/companyinfo.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companySalary.css">
<script>
$(document).ready(function(){
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawMaterial);

	function drawMaterial() {
	      var data = google.visualization.arrayToDataTable([
	        ['연봉평균', '전체 기업', '${companySalaryDetail.companyName}'],
	        ['사원', ${companySalaryDetail.companyAllStatisticsSalarySw}, ${companySalaryDetail.companyStatisticsSalarySw}],
	        ['대리', ${companySalaryDetail.companyAllStatisticsSalaryDr}, ${companySalaryDetail.companyStatisticsSalaryDr}],
	        ['과장', ${companySalaryDetail.companyAllStatisticsSalaryGj}, ${companySalaryDetail.companyStatisticsSalaryGj}],
	        ['차장', ${companySalaryDetail.companyAllStatisticsSalaryCj}, ${companySalaryDetail.companyStatisticsSalaryCj}],
	        ['부장', ${companySalaryDetail.companyAllStatisticsSalaryBj}, ${companySalaryDetail.companyStatisticsSalaryBj}]
	      ]);

	      var options = {
			height: 500,
	    	chart: {
	          title: '연봉 차트'
	        },
	        hAxis: {
	        	title: '단위(:만원)',
	        	minValue: 0
	        },
	        vAxis: {
	          	minValue: 0
	        },
	        bars: 'horizontal'
	      };
	      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	}
}); 
</script>
<title>연봉정보</title>
</head>
<body>
<div class="container">
	<div class="panel form">
		<div class="panel-heading"><h2><strong>연봉정보</strong></h2></div>
		<div class="panel-body">
			<section class="content">
				<div class="row">
					<div class="col-xs-5">
						<h3>${companySalaryDetail.companyName }</h3>
					</div>
					<div class="col-xs-5">
						<h3>기업 연봉순위 : (준비중)</h3>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-5">
						<h3>연봉정보 통계</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div id="chart_div">
						</div>
					</div>
				</div>
			</section>
			<div class="sidebanner">
				<div class="row">
					<a href="#"><img class="banner" src="/img/company/banner/DANIM.png"></a>
				</div>
				<div class="row">
					<a href="#"><img class="banner" src="/img/company/banner/banner2.jpg">
					banner img test</a>
				</div>
			</div>	
		</div>
	</div>
</div>	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>