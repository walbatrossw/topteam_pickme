<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
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
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- DataTables JavaScript -->
<script src="resumecoverlettersetting/vendor/datatables/js/jquery.dataTables.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script>
$(document).ready(function() {
    $('#dataTables-example').dataTable();
});
</script>
</head>
<body>
	<div class="container">
			<table width="100%" class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
				<thead>	
					<tr>
						<th>번호</th>
						<th>자소서이름</th>
						<th>자소서등록시간</th>
						<th>자소서수정시간</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach var="memberCoverletterListForModal" items="${memberCoverletterListForModal}" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td id="importCoverletter">
						<a href="javascript:void(0);" onclick="window.open('/memberCoverletterDetail?mCletterCd=${memberCoverletterListForModal.mCletterCd}');">
						${memberCoverletterListForModal.mCletterName}</a></td>
						
						<td>${memberCoverletterListForModal.mCletterRegdate}</td>
						<td>${memberCoverletterListForModal.mCletterModidate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
</body>
</html>