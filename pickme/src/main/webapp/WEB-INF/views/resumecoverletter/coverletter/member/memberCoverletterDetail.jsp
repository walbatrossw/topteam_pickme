<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 자소서 상세보기</title>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
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
<script>

function printPage(){
	 var initBody;
	 window.onbeforeprint = function(){
	  initBody = document.body.innerHTML;
	  document.body.innerHTML =  document.getElementById('print').innerHTML;
	 };
	 window.onafterprint = function(){
	  document.body.innerHTML = initBody;
	 };
	 window.print();
	 return false;
}
</script>

</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-10">
					<h1 class="page-header">나의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-8">
		                    <div class="panel panel-primary">
		                        <div class="panel-heading" id="noprint">
		                        	<p><strong>PickMe</strong>는 자소서 출력기능을 제공하고 있습니다</p>
		                        	<p>하단의 인쇄버튼을 클릭하시면 프린터를 출력하시거나 PDF파일을 생성하실수 있습니다.</p>
		                        	<button type="button" class="btn btn-warning btn-sm" onclick="window.printPage()"><i class="fa fa-print fa-fw"></i> 인쇄하기</button>
		                        </div>
		                        <div class="panel-body">
		                        <div>
		                       		<div id="print">
			                            <table class="table table-striped table-bordered table-hover table-responsive table-condenced" id="">
			                                <thead>
			                                    <tr>
			                                        <th class="col-xs-3">자기소개서 이름</th>
													<th class="col-xs-1">서류 제출 마감시간</th>
													<th class="col-xs-1">내가 정한 마감시간</th>
													<th class="col-xs-1">저장시간</th>
			                                	</tr>
			                                </thead>
			                                <tbody>
			                                   <tr>
													<td>${memeberCoverletterInfo.mCletterName}</td>
													<td style="color: blue;">${memeberCoverletterInfo.mCletterEnddate}</td>
													<td style="color: red;">${memeberCoverletterInfo.mCletterDdaytime}</td>
													<td>${memeberCoverletterInfo.mCletterRegdate}</td>
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
		                            <div id="noprint">
									     <a href="memberCoverletterUpdateForm?mCletterCd=${memeberCoverletterInfo.mCletterCd}" class="btn btn-default">
									     	<i class="fa fa-exchange fa-fw">
									     	</i> 수정하기
									    </a>  
									</div>
		                        </div>
		                    </div>
		            	</div>
		            </div>
				</div>
			</div>
		</div>
	<!-- 불러오기 Modal -->
		<div class="modal fade" id="importModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">불러오기</h4>
			        </div>
		
					<div class="modal-body">
						<div class="check panel panel-default">
							<div class="panel-heading">
                        		<strong>나의 자소서 리스트</strong>
							</div>
	                    	<div class="panel-body">
	                    		<iframe src="/memberCoverletterListForModal" height="720" width="840px" frameborder="0" framespacing="0"></iframe>
	                    	</div>
                    	</div>
					</div>
		
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
		<!-- 불러오기 Modal -->
		<!-- 저장기록 Modal -->
		<div class="modal fade" id="saveRecordModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">저장기록</h4>
			        </div>
					<div class="modal-body">
						<div class="check panel panel-default">
							<div class="panel-heading">
                        		<strong>내가 저장한 자소서 기록</strong>
							</div>
	                    	<div class="panel-body">
	                    		<iframe src="#" height="720" width="840px" frameborder="0" framespacing="0"></iframe>
	                    	</div>
                    	</div>
					</div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
		<!-- 저장기록 Modal -->	
	</div>
</body>
</html>
