<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 이력서</title>
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
		const $articleDelBtn = $('#articleDelBtn');
		$articleDelBtn.on('click', function(){
			const $article = $('.article');
			articleNum--;
			$article.last().remove();
		});
		
		const $cletterCheckBtn = $('#cletterCheckBtn');
		$cletterCheckBtn.click(function(){
			$('#fieldcoverletterCheck').append(
				'<div class="check panel panel-default">'+
					'<div class="panel-heading">'+
                        	'<strong>맞춤법 검사</strong>'+
					'</div>'+
                    '<div class="panel-body">'+
                    	'<iframe src="http://164.125.7.61/speller/" height="720" width="855px" frameborder="0" framespacing="0"></iframe>'+
                    '</div>'+
                    '<div class="panel-footer">'+
                    '<button type="button" id="cletterCheckRemove" class="btn btn-default btn-sm"><i class="fa fa-times "></i> 닫기</button>'+
                   '</div>'+
                '</div>'
			);
		});
		const $cletterCheckRemove = $('#cletterCheckRemove');
		$cletterCheckRemove.on('click', function(){
			const $check = $('.check');
			$check.remove();
		});
		
	});
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
								<li><a href="#"><i class="fa fa-folder fa-fw"></i> 저장하기</a></li> <!-- /memberCoverletterSave -->
								<li><a href="#" data-toggle="modal" data-target="#importModal"><i class="fa fa-folder-open fa-fw"></i> 불러오기</a></li> <!-- /memberCoverletterList -->
								<li><a href="#" data-toggle="modal" data-target="#saveRecordModal"><i class="fa fa-list-ol fa-fw"></i> 저장기록</a></li> <!-- /memberCoverletterSaveRecord -->
								
							</ul>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 기능<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#"><i class="fa fa-print fa-fw"></i> 인쇄하기</a></li> <!-- /coverletterPrint -->
								<li><a href="#"><i class="fa fa-mail-forward fa-fw"></i> 내보내기</a></li> <!-- /coverletterExport -->
								<li id="cletterCheckBtn"><a href="#"><i class="fa fa-check-square-o fa-fw"></i>맞춤법검사</a></li> <!-- /coverletterCheck -->
								<li><a href="#"><i class="fa fa-pencil-square fa-fw"></i>메모장</a></li> <!-- /memberCoverletterMemo -->
								<li><a href="#"><i class="fa fa-file-pdf-o fa-fw"></i>합격자소서</a></li> <!-- /passCoverlettrList -->
							</ul>
						</li>
						<!-- 사이드 메뉴항목 -->
					</ul>
				</div>
			</div>
		</nav>
		<!-- 사이드메뉴 전체 END-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">나의 자소서</h1>
				</div>
					<div class="row">
		                <div class="col-lg-6">
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
												<th class="col-sm-1">D-DAY</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                   <tr>
												<td><input type="text" class="form-control"  id="" name="mCletterName" value="${companyOneJobCletterInfo.companyName} / ${companyOneJobCletterInfo.recruitName} / ${companyOneJobCletterInfo.recruitJobJobdetail}"></td>
												<td><input type="text" class="form-control" id="" name="mCletterEnddate" value="${companyOneJobCletterInfo.recruitEnddate}"></td>
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
																	<a class="btn btn-default btn-xs" href="javascript:errorCoverletterPopupOpen()" role="button">오류문항신고</a>
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
					<div class="div-responsive col-lg-5" id="fieldcoverletterCheck" align="center">
						
					</div>
				</div>
			</div>
		</div>
	</form>
		<!-- Modal -->
		<div class="modal fade" id="importModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">내가 쓴 자소서 리스트</h4>
			        </div>
		
					<div class="modal-body">
						<!-- <iframe src="" height="" width="1600px"></iframe> -->
					</div>
		
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
		<div class="modal fade" id="saveRecordModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
			          	<h4 class="modal-title">나의 저장기록 리스트</h4>
			        </div>
		
					<div class="modal-body">
						<!-- <iframe src="" height="" width="1600px"></iframe> -->
					</div>
		
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
		    </div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>
