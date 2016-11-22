<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채용기업리스트</title>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resumecoverlettersetting/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Social Buttons CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resumecoverlettersetting/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="resumecoverlettersetting/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="resumecoverlettersetting/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/raphael/raphael.min.js"></script>
<script src="resumecoverlettersetting/vendor/morrisjs/morris.min.js"></script>
<script src="resumecoverlettersetting/data/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- Flot Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/flot/excanvas.min.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.pie.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.resize.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.time.js"></script>
<script src="resumecoverlettersetting/vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- DataTables JavaScript -->
<script src="resumecoverlettersetting/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- Page-Level Demo Scripts - Notifications - Use for reference -->
<script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo
    $("[data-toggle=popover]")
        .popover()
</script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(function() {
	$('#dataTables-example').DataTable({
    	responsive: true
        });
    });
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-10">
					<h1 class="page-header">채용기업 리스트</h1>
				</div>
					<div class="row">
		                <div class="col-lg-10">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                        	<p><strong>PickMe</strong>는 기업 직무별 자기소개서 문항을 제공하고 있습니다.</p>
		                        	<p>하단의 리스트에 채용명을 검색(우측상단), 클릭하시면 해당 기업의 자기소개서 작성페이지로 이동합니다.</p>
		                        	<p>기본 자기소개서 양식을 제공합니다. 만약 원하시는 기업이 없거나, 나만의 자기소개서 작성을 원하신다면 기본 자기소개서를 클릭하시면 됩니다</p>
		                        </div>
		                        <div class="panel-body">
		                        <div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		                                <thead>
		                                    <tr>
		                                        <th>번호</th>
												<th>채용명</th>
												<th>회사명</th>
												<th>직무대분류</th>
												<th>상세직무</th>
												<th class="col-sm-1">채용형태</th>
												<th>마감일</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                	<c:forEach var="companyJobCoverletterList" items="${companyJobCoverletterList}" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td><a href="/memberCoverletterInsert?recruitJobCd=${companyJobCoverletterList.recruitJobCd}">${companyJobCoverletterList.recruitName}</a></td>
												<td>${companyJobCoverletterList.companyName}</td>
												<td>${companyJobCoverletterList.jobMidindexName}</td>
												<td>${companyJobCoverletterList.recruitJobJobdetail}</td>
												<td>${companyJobCoverletterList.recruitJobWorkstatus}</td>
												<td>${companyJobCoverletterList.recruitEnddate}</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
		                    	</div>
		                	</div>
		            	</div>
		        	</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
