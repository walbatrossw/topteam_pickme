<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 이력서 리스트</title>
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
				<div class="col-lg-12">
					<h3 class="page-header">이력서 리스트</h3>
				</div>
					<div class="row">
		                <div class="col-lg-8">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                        	<h4>${resumeList[0].loginId}님의 이력서</h4>
		                        	<p><strong>P!ckME</strong>는 지원자스펙분석 서비스를 지원할 예정입니다</p>
		                        	<p>나의 이력서를 작성하시면 같은 기업, 같은 직무의 지원자들의 <strong>스펙을 분석해드립니다</strong></p>
		                        </div>
		                        <div class="panel-body">
		                        <div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
		                                <thead>
		                                    <tr>
		                                        <th>번호</th>
												<th>이력서이름</th>
												<th>등록일</th>
												<th>수정일</th>
												<th>수정</th>
												<th>삭제</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                   	<c:forEach var="resumeList" items="${resumeList}" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td><a href="/resumeDetail?resumeCd=${resumeList.resumeCd}">${resumeList.resumeName}</a></td>
												<td>${resumeList.resumeRegdate}</td>
												<td>${resumeList.resumeModidate}</td>
												<td class="rowlink-skip"><a href="#">수정</a></td>
												<td class="rowlink-skip"><a href="#">삭제</a></td>
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
