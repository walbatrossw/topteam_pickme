<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>합격자소서 리스트</title>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- DataTables JavaScript -->
<script src="resumecoverlettersetting/vendor/datatables/js/jquery.dataTables.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(function() {
	$('#dataTables-example').DataTable({
    	responsive: true
        });
    });
</script>

</head>
<body>
	<div class="container">
			<table width="100%" class="table table-striped table-bordered table-hover table-responsive" id="dataTables-example">
				<thead>	
					<tr>
						<th class="col-sm-1">번호</th>
						<th class="col-sm-3">합격 자기소개서 이름</th>
						<th class="col-sm-2">채용기업</th>
						<th class="col-sm-1">채용 상세직무</th>
					</tr>
				</thead>
				<tbody>	
					<tr>
						<td class="col-sm-1">1</td>
						<td class="col-sm-3">2014년 상반기 삼성전자 대졸 공채</td>
						<td class="col-sm-2">삼성전자</td>
						<td class="col-sm-1">영업관리</td>
					</tr>
					<tr>
						<td class="col-sm-1">2</td>
						<td class="col-sm-3">2014년 상반기 삼성전자 대졸 공채</td>
						<td class="col-sm-2">삼성전자</td>
						<td class="col-sm-1">연구개발</td>
					</tr>
					<tr>
						<td class="col-sm-1">3</td>
						<td class="col-sm-3">2014년 상반기 삼성전자 대졸 공채</td>
						<td class="col-sm-2">삼성전자</td>
						<td class="col-sm-1">마케팅</td>
					</tr>
					<tr>
						<td class="col-sm-1">4</td>
						<td class="col-sm-3">2014년 상반기 삼성전자 대졸 공채</td>
						<td class="col-sm-2">삼성전자</td>
						<td class="col-sm-1">생산관리</td>
					</tr>
				</tbody>
			</table>
	</div>
</body>
</html>
