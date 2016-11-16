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
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="margin-bottom: 0">
			<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
			<div class="navbar-default navbar-static-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav" id="side-menu">
						<!-- 왼쪽상단 검색폼 -->
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="빠른 채용검색">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</li>
						<!-- 왼쪽상단 검색폼 -->
						<!-- 사이드 메뉴항목 -->
						<li>
							<a href="/coverletterIndex"><i class="fa fa-dashboard fa-fw"></i> 이력서 & 자소서 Main</a>
						</li>
						<li>
							<a href="#"><i class="fa fa-table fa-fw"></i> 나의 이력서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/resumeList"><i class="fa fa-th-list fa-fw"></i> 나의 이력서 리스트</a></li>
								<li><a href="/resumeInsert"><i class="fa fa-pencil fa-fw"></i> 이력서 새로 쓰기</a></li>
							</ul>
						</li>	
						<li>
							<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 지원자분석<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#"> 스펙통계(서비스준비중)</a></li>
								<li><a href="#"> 나의 지원분야(서비스준비중)</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-edit fa-fw"></i> 나의 자소서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/memberCoverletterInsert?recruitJobCd=recruit_company_job_0001"><i class="fa fa-file-o fa-fw"></i> 새 자소서 쓰기</a></li>
								<li><a href="/memberCoverletterList"><i class="fa fa-file fa-fw"></i> 내가 쓴 자소서</a></li>
								<li><a href="/companyJobCoverletterList"><i class="fa fa-list-ul fa-fw"></i> 채용기업 리스트</a></li>
							</ul>
						</li>
						<!-- 사이드 메뉴항목 -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- 사이드메뉴 전체 -->
		<!-- 본문 전체 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">${memberCoverletterList[0].loginId}님의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-8">
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
												<th>아이디</th>
												<th>자소서등록시간</th>
												<th>자소서수정시간</th>
												<th>수정</th>
												<th>삭제</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                   	<c:forEach var="memberCoverletterList" items="${memberCoverletterList}" varStatus="i">
											<tr>
												<td>${i.count}</td>
												<td><a href="/memberCoverletterDetail?mCletterCd=${memberCoverletterList.mCletterCd}">${memberCoverletterList.mCletterName}</a></td>
												<td>${memberCoverletterList.loginId}</td>
												<td>${memberCoverletterList.mCletterRegdate}</td>
												<td>${memberCoverletterList.mCletterModidate}</td>
												<td class="rowlink-skip"><a href="/memberCoverletterArticleUpdate?mCletterCd=?${memberCoverletterList.mCletterCd}">수정</a></td>
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
