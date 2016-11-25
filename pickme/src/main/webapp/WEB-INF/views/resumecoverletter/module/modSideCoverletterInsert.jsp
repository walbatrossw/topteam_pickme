<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script>
	function go_time(){
		 var now = new Date();
		 var year = now.getFullYear(); //년
		 var month = now.getMonth(); //월
		 var day = now.getDay();  //일
		 var hour = now.getHours();  //시
		 var min = now.getMinutes();  //분
		 var sec = now.getSeconds();  //초
		 
		 document.getElementById("clock").innerHTML 
		 = year+"년 "+ month+"월 "+day+"일 "+hour+":"+min+":"+sec
		 //id가 clock인 html에 현재시각을 넣음
		 setTimeout("go_time()", 1000);
		 //1초마다 해당 펑션을 실행함.
	}
</script>
</head>
<body onload="go_time()">
	<!-- Page Whole START-->
	<div id="wrapper">
		<!-- Side Navigation Whole : START-->
		<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<p align="center"><strong><i class="fa fa-thumbs-o-up"></i>  P!ckMe</strong>는 당신을 응원합니다!</p>
					<hr>
					<p align="center"><strong>세상에는 서류 탈락한 회사보다</strong></p>
					<p align="center"><strong>자소서를 써야할 회사가 더 많다</strong></p>
					<p align="right"><strong>By DoubleS</strong> &nbsp &nbsp &nbsp</p>
					<hr>
					<p align="center" style="color: navy;">오늘도 활기찬 하루를 시작해요!!!</p>
					<div id="clock" align="center" style="color: navy;"></div>
					<ul class="nav" id="side-menu">
						
						<!-- Side Search Form : START -->
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
						<!-- Side Search Form : END -->
						
						<!-- Side MENU : START -->
						<li>
							<a href="/resumeCoverletterIndex"><i class="fa fa-sitemap fa-fw"></i> 이력서 & 자기소개서</a>
						</li>
						<li>
							<a href="/resumeCoverletterInfo"><i class="fa fa-info-circle fa-fw"></i> 나의 정보</a>
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
						<li>
							<a href="/companyJobCoverletterList"><i class="fa fa-list-ul fa-fw"></i> 채용기업 리스트</a>
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
								<li>
									<a href="javascript:void(0);" onclick="window.open('/coverletterPrint', 'pop01', 'top=10, left=10, width=855, height=720, status=no, menubar=no, toolbar=no, resizable=no');">
										<i class="fa fa-print fa-fw">
										</i> 인쇄하기
									</a>
								</li> <!-- /coverletterPrint -->
								<li>
									<a href="javascript:void(0);" onclick="window.open('/coverletterExport', 'pop01', 'top=10, left=10, width=855, height=720, status=no, menubar=no, toolbar=no, resizable=no');">
										<i class="fa fa-mail-forward fa-fw">
										</i> 내보내기
									</a>
								</li> <!-- /coverletterExport -->
								<li>
									<a href="javascript:void(0);" onclick="window.open('http://164.125.7.61/speller/', 'pop01', 'top=10, left=10, width=855, height=720, status=no, menubar=no, toolbar=no, resizable=no');">
										<i class="fa fa-check-square-o fa-fw">
										</i> 맞춤법 검사
									</a>
								</li>
								<li>
									<a href="javascript:void(0);">
										<i class="fa fa-pencil-square fa-fw">
										</i> 메모장<span class="fa arrow"></span>
									</a>
									<ul class="nav nav-third-level">
										<li>
											<a href="javascript:void(0);" id="memoAddBtn">
												<i class="fa fa-plus-circle fa-fw">
												</i> 메모장 추가
											</a>	
										</li>
										<li>
											<a href="javascript:void(0);" id="memoDelBtn">
												<i class="fa fa-minus-circle fa-fw">
												</i> 메모장 삭제
											</a>
										</li>
									</ul>
								</li> <!-- /memberCoverletterMemo -->
								<li>
									<a href="javascript:void(0);" onclick="window.open('/passCoverlettrList', 'pop01', 'top=10, left=10, width=855, height=720, status=no, menubar=no, toolbar=no, resizable=no');">
										<i class="fa fa-thumbs-o-up fa-fw">
										</i> 합격자소서
									</a>
								</li> <!-- /passCoverlettrList -->
							</ul>
						</li>
						<!-- Side MENU : MENU -->
					
					</ul>
				</div>
			</div>
		<!-- /Side Navigation Whole END-->
		
	</div>
	<!-- /Page Whole END-->
</body>
</html>
