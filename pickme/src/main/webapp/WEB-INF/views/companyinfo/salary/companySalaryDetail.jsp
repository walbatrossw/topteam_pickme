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
	 google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
	    	['사원', 6500, 7000, 8000, 9000],
	    	['대리', ${companySalaryDetail.companyStatisticsSalaryDr }, 7000, 8000, 9000],
	    	['과장', 50, 55, 77, 80],
	    	['부장', 77, 77, 66, 50],
	    	['차장', 68, 66, 22, 15]
	    // Treat first row as data as well.
	  ], true);
	
	  var options = {
	    legend:'none'
	  };
	
	  var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));
	
	  chart.draw(data, options);
	}
});
</script>
<title>기업 연봉정보</title>
</head>
<body>
<div class="container">
	<div class="panel form">
		<div class="panel-heading"><h3><strong>기업 연봉정보</strong></h3></div>
		<div class="panel-body">
			<div class="form-group">
				<div class="row">
					<div class="col-xs-3">
						<label for="companyName">기업명 : </label> 
					</div>
					<div class="col-xs-5">
						${companySalaryDetail.companyName }
					</div>
				</div>
			</div>
			
			<div id="chart_div" style="width: 900px; height: 500px;">
			</div>
	 		<div class="form-group">
	 			<div class="row">
					<div class="col-xs-3">
						<label>고용형태 :  </label>
					</div>
					<div class="col-xs-5">
		        		
					</div>
				</div>
	 		</div>
	 		<div class="form-group">
	 			<div class="row">
					<div class="col-xs-3">
						<label>직급 :  </label>
					</div>
					<div class="col-xs-5">
		        		
					</div>
				</div> 
	 		</div>
	 		<div class="form-group">
	 			<div class="row">
					
				</div> 	
	 		</div>
	 		<div class="form-group">
	 			<div class="row">
					
				</div> 	
	 		</div>
	 		<div class="form-group">
	 			<div class="row">
					
				</div> 	
	 		</div>
	 		<div class="form-group">
	 			
	 		</div>
			<div class="sidebanner">
				<a href="#"><img class="banner" src="/img/company/banner/banner1.jpg">
				banner img test</a>
				<a href="#"><img class="banner" src="/img/company/banner/banner2.jpg">
				banner img test</a>
			</div>
		</div>
	</div>
</div>	
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>