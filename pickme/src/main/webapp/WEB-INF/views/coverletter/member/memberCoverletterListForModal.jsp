<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/coverletter/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="css/coverletter/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="css/coverletter/sb-admin.css" rel="stylesheet">
<script src="js/coverletter/jquery-1.10.2.js"></script>
<script src="js/coverletter/bootstrap.min.js"></script>
<script src="js/coverletter/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/coverletter/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/coverletter/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="js/coverletter/sb-admin.js"></script>
<script>
$(document).ready(function() {
    $('#dataTables-example').dataTable();
});
</script>
</head>
<body>
	<div class="container">
	
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover" id="dataTables-example">
				<thead>	
					<tr>
						<th>체크</th>
						<th>번호</th>
						<th>자소서이름</th>
						<th>자소서등록시간</th>
						<th>자소서수정시간</th>
					</tr>
				</thead>
				<tbody>	
				<c:forEach var="memberCoverletterListForModal" items="${memberCoverletterListForModal}" varStatus="i">
					<tr>
						<td><input type="checkbox" value="/memberCoverletterDetail?mCletterCd=${memberCoverletterListForModal.mCletterCd}"></td>
						<td>${i.count}</td>
						<td>${memberCoverletterListForModal.mCletterName}</td>
						<td>${memberCoverletterListForModal.mCletterRegdate}</td>
						<td>${memberCoverletterListForModal.mCletterModidate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div>
				<button type="button" id="coverletterImportBtn" class="btn btn-success btn-sm"><i class="fa fa-folder-open-o"></i> 불러오기</button>
			</div>
		</div>
	</div>
</body>
</html>