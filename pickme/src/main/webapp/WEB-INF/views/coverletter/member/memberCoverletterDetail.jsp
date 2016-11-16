<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 자소서 상세보기</title>
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

</script>
</head>
<body>
	<div id="wrapper">
	<form id="coverletterAddForm" action="/memberCoverletterInsert" method="post">
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
							<a href="/coverletterIndex"><i class="fa fa-dashboard fa-fw"></i> 이력서 및 자소서 메인</a>
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
								<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 스펙통계(서비스준비중)</a></li>
								<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 나의 지원분야(서비스준비중)</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-edit fa-fw"></i> 나의 자소서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/memberCoverletterInsert?recruitJobCd=recruit_company_job_0001"><i class="fa fa-file-o fa-fw"></i> 새 자소서 쓰기</a></li>
								<li><a href="/memberCoverletterList"><i class="fa fa-file fa-fw"></i> 내가 쓴 자소서</a></li>
								<li><a href="/companyJobCoverletterList"><i class="fa fa-list-ul fa-fw"></i> 채용기업 리스트</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-save fa-fw"></i> 저장<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/memberCoverletterSave"><i class="fa fa-folder fa-fw"></i> 저장하기</a></li>
								<li><a href="/memberCoverletterList"><i class="fa fa-folder-open fa-fw"></i> 불러오기</a></li>
								<li><a href="/memberCoverletterSaveRecord"><i class="fa fa-list-ol fa-fw"></i> 저장기록</a></li>
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 기능<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/coverletterPrint"><i class="fa fa-print fa-fw"></i> 인쇄하기</a></li>
								<li><a href="/coverletterExport"><i class="fa fa-mail-forward fa-fw"></i> 내보내기</a></li>
								<li><a href="/coverletterCheck"><i class="fa fa-check-square-o fa-fw"></i>맞춤법검사</a></li>
								<li><a href="/memberCoverletterMemo"><i class="fa fa-pencil-square fa-fw"></i>메모장</a></li>
								<li><a href="/passCoverlettrList"><i class="fa fa-file-pdf-o fa-fw"></i>합격자소서</a></li>
							</ul>
						</li>
						<!-- 사이드 메뉴항목 -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- 사이드메뉴 전체 -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">나의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-12">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                        	<p><strong>PickMe</strong>는 자기소개서의 이름과 제출일자 편집을 제공합니다</p>
		                        	<p>사용자가 원하는 이름과 마감일자로 변경해보세요</p>
		                        	<p>빠르고 정확한 제출이 서류합격의 지름길입니다.</p>
		                        	<p>맞춤법검사, 메모장, 공채핵심자료를 제공하고 있습니다.(좌측 하단) </p>
		                        </div>
		                        <div class="panel-body">
		                        <div class="table-responsive">
		                            <table class="table table-striped table-bordered table-hover" id="">
		                                <thead>
		                                    <tr>
		                                        <th class="col-sm-4">자기소개서 이름</th>
												<th class="col-sm-2">D-DAY</th>
												<th class="col-sm-2">마감시간</th>
												<th class="col-sm-2">저장시간</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                   <tr>
												<td>${memeberCoverletterInfo.mCletterName}</td>
												<td>D-DAY추가예정</td>
												<td>${memeberCoverletterInfo.mCletterEnddate}</td>
												<td>${memeberCoverletterArticleSaveRecord.mCletterRecordDate}</td>
											</tr>
										</tbody>
									</table>
									<c:forEach var="memeberCoverletterArticleList" items="${memeberCoverletterArticleList}" varStatus="i">	
									<table class="table table-striped table-bordered table-hover" id="">
		                            	<tr>
											<td class="col-sm-1">
												${i.count}. 문항
											</td>
											<td class="col-sm-8">
												${memeberCoverletterArticleList.cCletterArticle}
											</td>
										</tr>
										<tr>
											<td class="col-sm-1">
												${i.count}.	내용
											</td>
											<td class="col-sm-8">
												${memeberCoverletterArticleList.mCletterArticleContent}
											</td>
										</tr>
										<tr>
											<td class="col-sm-1">
												글자수
											</td>
											<td class="col-sm-8">
												<div>
													<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백포함) : 구현중
												</div>
												<div>
													<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백미포함) : 구현중
												</div>
											</td>
										</tr>
		                            </table>
		                            </c:forEach>
		                        </div>
		                	</div>
		            	</div>
		        	</div>
				</div>
			</div>
		</div>
	</form>	
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>
