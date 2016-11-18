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
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp"/>
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
		                            <div>
									     <button type="button" class="btn btn-default">
									     	<a href="memberCoverletterUpdateForm?mCletterCd=${memeberCoverletterInfo.mCletterCd}">
									     		<i class="fa fa-exchange fa-fw">
									     		</i> 수정하기
									     	</a>  
									     </button>
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>
