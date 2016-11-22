<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 자소서 리스트</title>
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
		<!-- 본문 전체 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-8">
					<h1 class="page-header">${memberCoverletterList[0].loginId}님의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-10">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                        	<h4>나의 자기소개서</h4>
		                        </div>
		                        <div class="panel-body">
		                        <div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		                                <thead>
		                                    <tr>
		                                        <th>번호</th>
												<th>자소서이름</th>
												<th>자소서등록시간</th>
												<th>자소서수정시간</th>
												<th>삭제</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                   	<c:forEach var="memberCoverletterList" items="${memberCoverletterList}" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td><a href="/memberCoverletterDetail?mCletterCd=${memberCoverletterList.mCletterCd}">${memberCoverletterList.mCletterName}</a></td>
												<td>${memberCoverletterList.mCletterRegdate}</td>
												<td>${memberCoverletterList.mCletterModidate}</td>
												<td class="rowlink-skip"><a href="/memberCoverletterArticleDetail?mCletterCd=?${memberCoverletterList.mCletterCd}">삭제</a></td>
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
		<!-- 본문 전체 -->
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>
