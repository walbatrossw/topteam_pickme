<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 자소서 리스트</title>
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
</html>
