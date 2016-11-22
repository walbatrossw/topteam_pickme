<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 이력서</title>
<!-- Datetimepicker JS -->
<script src="/js/datetimepicker/moment.js"></script>
<script src="/js/datetimepicker/transition.js"></script>
<script src="/js/datetimepicker/collapse.js"></script>
<script src="/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/js/datetimepicker/ko.js"></script>
<link rel="stylesheet" href="/css/datetimepicker/bootstrap-datetimepicker.css"/>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="resumecoverlettersetting/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Social Buttons CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap-social/bootstrap-social.css" rel="stylesheet">
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
<!-- Morris Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/raphael/raphael.min.js"></script>
<script src="resumecoverlettersetting/vendor/morrisjs/morris.min.js"></script>
<script src="resumecoverlettersetting/data/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- Flot Charts JavaScript -->
<script src="resumecoverlettersetting/vendor/flot/excanvas.min.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.pie.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.resize.js"></script>
<script src="resumecoverlettersetting/vendor/flot/jquery.flot.time.js"></script>
<script src="resumecoverlettersetting/vendor/flot-tooltip/jquery.flot.tooltip.min.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- DataTables JavaScript -->
<script src="resumecoverlettersetting/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="resumecoverlettersetting/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="resumecoverlettersetting/data/flot-data.js"></script>
<!-- Page-Level Demo Scripts - Notifications - Use for reference -->
<script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo
    $("[data-toggle=popover]")
        .popover()
</script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(function() {
	$('#dataTables-example').DataTable({
    	responsive: true
        });
    });
</script>
<script>
		//글자수 세기
	$(document).ready(function(){
		$(function(){
			$('textarea.content').keyup(function(){
			bytesHandler(this);
			});
		});
		
		function getTextLength(str) {
			var len = 0;
			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length == 6) {
					len++;
				}
				len++;
			}
			return len;
		}
	
		function bytesHandler(obj){
			var text = $(obj).val();
			$('span.bytes').text(getTextLength(text));
		}
		/* 항목 추가 및 삭제 */
		// 항목추가하기
		var articleNum = 0; 
		const $articleAddBtn = $('#articleAddBtn');
		$articleAddBtn.click(function(){
			articleNum++;
			$('#fieldArticle').append(
				'<table class="article table table-striped table-bordered table-hover">'+
	               	'<tr>'+
						'<th class="col-sm-1">'+
							'문항'+
						'</th>'+
						'<td>'+
							'<div>'+
								'<textarea class="form-control" rows="2" name="coverletterMemberArticleVoList['+articleNum+'].cCletterArticle" style="resize:none" placeholder="자기소개서 문항을 입력해주세요"></textarea>'+
							'</div>'+
						'</td>'+
					'</tr>'+
					'<tr>'+
						'<th class="col-sm-1">'+
							'내용'+
						'</th>'+
						'<td>'+
							'<textarea class="form-control content" rows="8" name="coverletterMemberArticleVoList['+articleNum+'].mCletterArticleContent" style="resize:none" placeholder="내용을 입력해주세요"></textarea>'+
						'</td>'+
					'</tr>'+
					'<tr>'+
						'<th class="col-sm-1">'+
							'글자수'+
						'</th>'+
						'<td>'+
							'<div>'+
								'<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백포함) : 구현중'+
							'</div>'+
							'<div>'+
								'<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백미포함) : 구현중'+
							'</div>'+
						'</td>'+
					'</tr>'+
	           '</table>'
			);
		});
		// 항목 삭제하기
		const $articleDelBtn = $('#articleDelBtn');
		$articleDelBtn.on('click', function(){
			const $article = $('.article');
			articleNum--;
			$article.last().remove();
		});
		$(function () {
            $('#mCletterEnddate').datetimepicker({
            	locale: 'ko',
            	format: 'LLL'
            });
        });
		
		$(function () {
            $('#ddayPicker').datetimepicker({
            	locale: 'ko',
            	format: 'LLL'
            });
        });
   });
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
	<form id="coverletterAddForm" action="/memberCoverletterInsert" method="post">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">나의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-8">
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
		                                        <th class="col-sm-2">자기소개서 이름</th>
												<th class="col-sm-2">마감시간</th>
												<th class="col-sm-2">자소서 제출 마감시간</th>
												<th class="col-sm-2">D-DAY</th>
											</tr>
		                                </thead>
		                                <tbody>
		                                	<tr>
												<td><input type="text" class="form-control" id="" name="mCletterName" value="${memeberCoverletterInfo.mCletterName}"></td>
												<td><input type="text" class="form-control" id="" name="mCletterEnddate" value="${memeberCoverletterInfo.mCletterEnddate}"></td>
												<td><input type="text" class="form-control" id="" name="mCletterRecordDate" value="${memeberCoverletterArticleSaveRecord.mCletterRecordDate}"></td>
												<td>D-DAY추가예정</td>
											</tr>
										</tbody>
									</table>
									<c:set var="recruitJobCd" value="recruit_company_job_0001"/>
										<c:choose>
											<c:when test="${companyOneJobCletterInfo.recruitJobCd eq 'recruit_company_job_0001'}">
												<div id="article">
													<table class="table table-striped table-bordered table-hover">
							                           	<tr>
															<th class="col-sm-1">
																문항
															</th>
															<td>
																<div>
																	<textarea class="form-control" rows="2" name="coverletterMemberArticleVoList[0].cCletterArticle" style="resize:none">${memeberCoverletterArticleList.cCletterArticle}</textarea>
																</div>
															</td>
														</tr>
														<tr>
															<th class="col-sm-1">
																내용
															</th>
															<td>
																<textarea class="form-control content" rows="8" name="coverletterMemberArticleVoList[0].mCletterArticleContent" style="resize:none">${memeberCoverletterArticleList.mCletterArticleContent}</textarea>
															</td>
														</tr>
														<tr>
															<th class="col-sm-1">
																글자수
															</th>
															<td>
																<div>
																	<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백포함) : 구현중
																</div>
																<div>
																	<span class="bytes">0</span>byte / <span class="bytes">0</span>자 : (공백미포함) : 구현중
																</div>
															</td>
														</tr>
							                        </table>
						                        </div>
						                        <div id="fieldArticle"></div>
					                        </c:when>
				                            <c:when test="${companyOneJobCletterInfo.recruitJobCd ne 'recruit_company_job_0001'}">
												<c:forEach var="memeberCoverletterArticleList" items="${memeberCoverletterArticleList}" varStatus="i">
													<table class="table table-striped table-bordered table-hover">
						                            	<tr>
															<td>
																${i.count}. 문항
															</td>
															<td>
																<div>
																	<textarea class="form-control" rows="2" id="" name="coverletterMemberArticleVoList[${i.count-1}].cCletterArticle" style="resize:none">${memeberCoverletterArticleList.cCletterArticle}</textarea>
																</div>
																<div align="right">
																	자기소개서 문항을 반드시 확인해주세요
																	<a class="btn btn-default btn-xs" href="javascript:errorCoverletterPopupOpen()" role="button">오류문항신고</a>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																${i.count}.	내용
															</td>
															<td>
																<textarea class="form-control content" rows="8" id="content" name="coverletterMemberArticleVoList[${i.count-1}].mCletterArticleContent" style="resize:none">${memeberCoverletterArticleList.mCletterArticleContent}</textarea>
															</td>
														</tr>
														<tr>
															<td>
																글자수
															</td>
															<td>
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
				                            </c:when>
										</c:choose>	
										<c:choose>
											<c:when test="${companyOneJobCletterInfo.recruitJobCd eq 'recruit_company_job_0001'}">
											    <div class="btn-group" role="group">
													<button type="button" id="articleAddBtn" class="btn btn-default btn-sm"><i class="fa fa-plus-square "></i> 추가</button>
													<button type="button" id="articleDelBtn" class="btn btn-default btn-sm"><i class="fa fa-minus-square "></i> 삭제</button>
												</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>		
		                           	<hr>
		                           	<div>
		                           		<input type="submit" class="btn btn-primary btn" id="coverletterAddBtn" value="자기소개서 저장"/>
		                           	</div>
		                           	<div style="display:none;"><input type="text" id="" name="recruitJobCd" value="${companyOneJobCletterInfo.recruitJobCd}"></div> 
		                    	</div>
		                	</div>
		            	</div>
		        	</div>
				</div>
			</div>
		</div>
	</form>
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
	                    		<iframe src="/memberCoverletterSaveRecordList" height="720" width="840px" frameborder="0" framespacing="0"></iframe>
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
