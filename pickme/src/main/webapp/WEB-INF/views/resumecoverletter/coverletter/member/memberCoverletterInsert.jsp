<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 자소서</title>
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
<!-- Datetimepicker -->
<script src="/js/datetimepicker/moment.js"></script>
<script src="/js/datetimepicker/transition.js"></script>
<script src="/js/datetimepicker/collapse.js"></script>
<script src="/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="/js/datetimepicker/ko.js"></script>
<link rel="stylesheet" href="/css/datetimepicker/bootstrap-datetimepicker.css"/>
<script>
	
	$(document).ready(function(){
		//내가 정한 마감일자 유효성 검사
		$('#coverletterAddBtn').click(function(){
			if($("#ddayPicker").val() ==  ""){
				$("#ddayPickerError").text("나의 마감일자를 입력하세요");
				$("#ddayPicker").focus();
				return false;
			} else {
				$("#coverletterAddBtn").submit();
			}	
		});
		
		
		
		//글자수 세기
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
            $('#ddayPicker').datetimepicker({
            	locale: 'ko',
            	format: 'L'
            });
        });
		
		var memoFlag = false;
	
		// 메모장 생성
		const $memoAddBtn = $('#memoAddBtn');
		$memoAddBtn.click(function(){
			if(memoFlag == false){
				$('#fieldMemo').append(
					'<div class="memo panel panel-info memo">'+
						'<div class="panel-heading">'+
	                   		'<strong>메모장</strong>'+
	                   	'</div>'+
	                   	'<div class="panel-body">'+
	                   		'<div>'+
	                   			'<p class="small">자기소개서 작성시 </p>'+
	                   			'<p class="small">키워드와 참조사항을 작성하는 공간으로 활용해주세요.</p>'+
	                   		'</div>'+
	                   		'<div>'+
					        	'<textarea rows="35" cols="50" class="form-control input-sm" style="resize:none" placeholder="메모내용은 저장되지 않습니다."></textarea>'+
					        '</div>'+
	                   	'</div>'+
	                '</div>'
	            );
				memoFlag = true;
			}
		});
		// 메모장 삭제
		const $memoDelBtn = $('#memoDelBtn');
		$memoDelBtn.on('click', function(){
			const $memo = $('.memo');
			$memo.last().remove();
			memoFlag = false;
		});
		
		// datetimepicker 날짜 입력UI
		$(function () {
            $('#ddayPicker').datetimepicker({
            	locale: 'ko',
            	format: 'L'
            });
        });
	});
	
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
		<form id="coverletterAddForm" action="/memberCoverletterInsert" method="post">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-lg-10">
						<h1 class="page-header">
						<c:set var="loginId" value="${sessionScope.generalId}" />
			            	<c:if test="${loginId ne null}">
			                	<h3><mark>${sessionScope.generalNick}</mark>의 새로운 자소서</h3>
			                </c:if>
			                <c:if test="${empty loginId}">
			                	<h3>P!CKME 자기소개서 페이지입니다</h3>
			                </c:if>
						
						</h1>
					</div>
					
					<div class="row">
		                <div class="col-lg-8">
		                    <div class="panel panel-primary">
		                        <div class="panel-heading">
		                        	<p><strong>P!ckMe</strong>는 자기소개서의 이름과 제출일자 편집을 제공합니다</p>
		                        	<p>사용자가 원하는 이름과 마감일자로 변경해보세요</p>
		                        	<p>서류 마감일보다 빠르고 정확한 제출이 서류합격의 지름길입니다.</p>
		                        	<p>P!ckMe자소서 페이지는 <strong style="color: yellow">인쇄하기, 맞춤법검사, 메모장, 기업정보</strong>를 제공하고 있습니다.(좌측 하단) </p>
		                        	<c:set var="loginId" value="${sessionScope.generalId}" />
			                        	<c:if test="${loginId ne null}">
			                           		<button type="submit" class="btn btn-warning btn-sm" id="coverletterAddBtn">
				                           		<i class="fa fa-save">
				                           		</i>  자소서 저장
			                           		</button>
			                           		<a href="#" data-toggle="modal" data-target="#saveRecordModal" class="btn btn-warning btn-sm">
												<i class="fa fa-list-ol fa-fw"></i> 저장기록
											</a>
			                           		<a href="#" data-toggle="modal" data-target="#importModal" class="btn btn-warning btn-sm">
			                           			<i class="fa fa-folder-open fa-fw"></i> 불러오기
			                           		</a>
											<button type="button" class="btn btn-warning btn-sm" onclick="window.printPage()">
			                           			<i class="fa fa-print fa-fw"></i> 인쇄하기
			                           		</button>
											<a href="javascript:void(0);" class="btn btn-warning btn-sm" onclick="window.open('http://164.125.7.61/speller/', 'pop01', 'top=10, left=10, width=855, height=720, status=no, menubar=no, toolbar=no, resizable=no');">
												<i class="fa fa-check-square-o fa-fw"></i> 맞춤법 검사
											</a>
											<a href="javascript:void(0);" class="btn btn-warning btn-sm" id="memoAddBtn">
												<i class="fa fa-plus-circle fa-fw"></i> 메모장 추가
											</a>
											<a href="javascript:void(0);" class="btn btn-warning btn-sm" id="memoDelBtn">
												<i class="fa fa-minus-circle fa-fw"></i> 메모장 삭제
											</a>
											<a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#passModal">
												<i class="fa fa-thumbs-o-up fa-fw"></i> 합격자소서
											</a>
										</c:if>
			                           	<c:if test="${empty loginId}">
			                           		<p><strong><a href="/memberGeneralLogin" style="color: yellow">로그인</a></strong> 또는 <strong><a href="memberGeneralInsert" style="color: yellow">회원가입</a></strong> 후에 자기소개서를 저장하실 수 있습니다.</p>
			                           	</c:if>
								</div>
		                        <div class="panel-body">
		                        <div id="print">
		                            <table class="table table-striped table-bordered table-hover table-condensed table-responsive">
		                                <thead>
		                                    <tr>
		                                        <th class="col-xs-3">자기소개서 이름</th>
												<th class="col-xs-1">서류 제출 마감시간</th>
												<th class="col-xs-1">내가 정한 마감시간</th>
											</tr>
		                                </thead>
		                                <tbody>
		                                	<tr>
												<td><input type="text" class="form-control input-sm" id="" name="mCletterName" value="${companyOneJobCletterInfo.companyName} / ${companyOneJobCletterInfo.recruitName} / ${companyOneJobCletterInfo.recruitJobJobdetail}"></td>
												<td><input type="hidden" class="form-control input-sm" name="mCletterEnddate" value="${companyOneJobCletterInfo.recruitEnddate}">${companyOneJobCletterInfo.recruitEnddate}</td>
												<td><input type="text" class="form-control input-sm" id="ddayPicker" name="mCletterDdaytime"><span id="ddayPickerError" style="color: red"></span></td>
											</tr>
										</tbody>
									</table>
									<c:set var="recruitJobCd" value="recruit_company_job_0001"/>
										<c:choose>
											<c:when test="${companyOneJobCletterInfo.recruitJobCd eq 'recruit_company_job_0001'}">
												<div id="article">
													<table class="table table-striped table-bordered table-hover table-condensed table-responsive">
							                           	<tr>
															<th class="col-sm-1">
																문항
															</th>
															<td>
																<div>
																	<textarea class="form-control" rows="2" name="coverletterMemberArticleVoList[0].cCletterArticle" style="resize:none" placeholder="자기소개서 문항을 입력해주세요"></textarea>
																</div>
															</td>
														</tr>
														<tr>
															<th class="col-sm-1">
																내용
															</th>
															<td>
																<textarea class="form-control content" rows="8" name="coverletterMemberArticleVoList[0].mCletterArticleContent" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
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
												<c:forEach var="companyOneJobArticleList" items="${companyOneJobArticleList}" varStatus="i">	
													<table class="table table-striped table-bordered table-hover">
						                            	<tr>
															<td>
																${i.count}. 문항
															</td>
															<td>
																<div>
																	<textarea class="form-control" rows="2" id="" name="coverletterMemberArticleVoList[${i.count-1}].cCletterArticle" style="resize:none">${companyOneJobArticleList.cCletterArticle}</textarea>
																</div>
																<div align="right">
																	자기소개서 문항을 반드시 확인해주세요
																	<a href="#" data-toggle="modal" data-target="#errorCoverletterModal"><i class="fa fa-check-square fa-fw"></i> 오류문항신고</a>
																</div>
															</td>
														</tr>
														<tr>
															<td>
																${i.count}.	내용
															</td>
															<td>
																<textarea class="form-control content" rows="8" id="content" name="coverletterMemberArticleVoList[${i.count-1}].mCletterArticleContent" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
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
													<button type="button" id="articleAddBtn" class="btn btn-default btn-sm"><i class="fa fa-plus-square"></i> 추가</button>
													<button type="button" id="articleDelBtn" class="btn btn-default btn-sm"><i class="fa fa-minus-square"></i> 삭제</button>
												</div>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>		
		                           	<hr>
		                           	<div style="display:none;"><input type="text" id="" name="recruitJobCd" value="${companyOneJobCletterInfo.recruitJobCd}"></div> 
		                    	</div>
		                	</div>
		            	</div>
		        	</div>
		        	<div class="col-sm-4">
			        	<div id="fieldMemo"></div>
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
	                    		<iframe src="/memberCoverletterListForModal" height="800px" width="840px" frameborder="0" framespacing="0"></iframe>
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
	                    	<div class="panel-body" align="center">
	                    		<iframe src="/memberCoverletterSaveRecordList" height="800px" width="840px" frameborder="0" framespacing="0"></iframe>
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
		<!-- 오류문항 신고 Modal -->
		<div class="modal fade" id="errorCoverletterModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">자소서 항목 오류 문장신고</h4>
			        </div>
					<div class="modal-body">
						<div class="check panel panel-default">
							<div class="panel-heading">
                        		<p>자기소개서 항목 오류 문장을 신고해주세요. </p>
                        		<p>해당기업명과 직무명을 적어주시면 확인후 관리자가 수정처리후 처리결과를 알려드리겠습니다.</p>
							</div>
	                    	<div class="panel-body" align="center">
	                    		<div>
						        	<input type="text"  class="form-control input-sm" id="sessionId" value="${sessionScope.generalId}">
						        </div>
						        <br>
						        <div>
						        	<textarea rows="6" cols="60" class="form-control input-sm" id="askContent" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
						        </div>		
	                    	</div>
                    	</div>
					</div>
			        <div class="modal-footer">
				        <span  style="color: gray;">* 전송에는 2~3초 가량 소요됩니다 </span>
				      	<button type="button" id="sendMail" class="btn btn-default">오류 신고</button>
				        <button type="button" class="btn btn-default " data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
		<!-- 오류문항 신고 Modal -->
		<!-- 합격자소서 Modal -->
		<div class="modal fade" id="passModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">합격자소서</h4>
			        </div>
					<div class="modal-body">
						<div class="check panel panel-primary">
							<div class="panel-heading">
                        		<strong>합격자소서 목록</strong>
							</div>
	                    	<div class="panel-body" align="center">
	                    		<iframe src="/passCoverletterList" height="500px" width="840px" frameborder="0" framespacing="0"></iframe>
	                    	</div>
                    	</div>
					</div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
	</div>
</body>
</html>
