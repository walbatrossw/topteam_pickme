<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채용기업리스트</title>
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
	<div id="wrapper">
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp"/>
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>
