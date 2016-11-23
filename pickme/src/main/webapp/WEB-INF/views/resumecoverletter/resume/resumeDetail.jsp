<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 이력서 상세보기</title>
<!-- 사진 및 파일 입력폼 CSS, JS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
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
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">${resumeDetailInfo.loginId} 님의 이력서</h3>
					
					<div class="row">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<th>이력서 이름</th>
								<th>저장시간</th>
								<th>수정시간</th>
							</tr>
							<tr>
								<td>${resumeDetailInfo.resumeName}</td>
								<td>${resumeDetailInfo.resumeRegdate}</td>
								<td>${resumeDetailInfo.resumeModidate}</td>
							</tr>
						</table>
					</div>
					<div>
						<button type="button" class="btn btn-default">
							<a href="resumeUpdateForm?resumeCd=${resumeDetailInfo.resumeCd}">
								<i class="fa fa-exchange fa-fw"></i> 이력서 수정하기
							</a>
						</button>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-2">
							<h4 align="center">증명사진</h4>
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th class="col-sm-2">
										<div align="center">
											<img style= " width: 117px; height: 162px; display: block;" src="/upload/resumefile/photo/${resumePersonal.personalPhotoName}"/>
										</div>
									</th>
								</tr>
								
							</table>
						</div>
						<div class="col-sm-10">
									<h4>개인신상정보</h4>
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<th class="col-sm-3">한글이름</th>
											<th class="col-sm-3">영문이름</th>
											<th class="col-sm-3">성별</th>
											<th class="col-sm-3">생년월일</th>
										</tr>
										<tr>
											<td class="col-sm-3">${resumePersonal.personalKorname}</td>
											<td class="col-sm-3">${resumePersonal.personalEngname}</td>
											<td class="col-sm-3">${resumePersonal.personalGender}</td>
											<td class="col-sm-3">${resumePersonal.personalBirthdate}</td>
										</tr>
										<tr>
											<th class="col-sm-3">일반전화</th>
											<th class="col-sm-3">휴대전화</th>
											<th class="col-sm-3">이메일</th>
											<th class="col-sm-3">SNS</th>
										</tr>
										<tr>
											<td class="col-sm-3">${resumePersonal.personalPhone}</td>
											<td class="col-sm-3">${resumePersonal.personalCellphone}</td>
											<td class="col-sm-3">${resumePersonal.personalEmail}</td>
											<td class="col-sm-3">${resumePersonal.personalSns}</td>
										</tr>
										<tr>
											<th colspan="12">주소</th>
										</tr>
										<tr>
											<td colspan="12">${resumePersonal.personalAddr}</td>
										</tr>
									</table>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>고등학교</h4>
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-3">학교명</th>
												<th class="col-sm-3">분류</th>
												<th class="col-sm-3">입학일자</th>
												<th class="col-sm-3">졸업일자</th>
											</tr>
											<tr>
												<td class="col-sm-3">${resumeHighschool.highschoolName}</td>
												<td class="col-sm-3">${resumeHighschool.highschoolCategory}</td>
												<td class="col-sm-3">${resumeHighschool.highschoolBegindate}</td>
												<td class="col-sm-3">${resumeHighschool.highschoolEnddate}</td>
											</tr>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>대학교</h4>
										<div id="university">
										<c:forEach var="resumeUniveristy" items="${resumeUniveristy}" varStatus="i">
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-3">분류</th>
													<th class="col-sm-3">학교명</th>
													<th class="col-sm-3">입학일자</th>
													<th class="col-sm-3">졸업일자</th>
												</tr>
												<tr>
													<td class="col-sm-3">${resumeUniveristy.universityCategory}</td>
													<td class="col-sm-3">${resumeUniveristy.universityName}</td>
													<td class="col-sm-3">${resumeUniveristy.universityBegindate}</td>
													<td class="col-sm-3">${resumeUniveristy.universityEnddate}</td>
												</tr>
												<tr>
													<th class="col-sm-3">주전공</th>
													<th class="col-sm-3">복수부전공</th>
													<th class="col-sm-3">복수부전공명</th>
													<th class="col-sm-3">학점</th>
												</tr>
												<tr>
													<td class="col-sm-3">${resumeUniveristy.universityMajor}</td>
													<td class="col-sm-3">${resumeUniveristy.universityDmajorminor}</td>
													<td class="col-sm-3">${resumeUniveristy.universityDmajorminorName}</td>
													<td class="col-sm-3">${resumeUniveristy.universityCredit}</td>
												</tr>
											</table>
										</c:forEach>	
										</div>
									</div>
								</div>
								<div class="row" >
									<div class="col-sm-12">
									<h4>가족사항</h4>
										<div id="family">
											<table class="table table-striped table-bordered table-hover">
													<tr>
														<th class="col-sm-2">관계</th>
														<th class="col-sm-2">이름</th>
														<th class="col-sm-2">생년월일</th>
														<th class="col-sm-2">학력</th>
														<th class="col-sm-2">직업</th>
														<th class="col-sm-2">동거여부</th>
													</tr>
													<c:forEach var="resumeFamily" items="${resumeFamily}" varStatus="i">
													<tr>
														<td class="col-sm-2">${resumeFamily.familyRelation}</td>
														<td class="col-sm-2">${resumeFamily.familyName}</td>
														<td class="col-sm-2">${resumeFamily.familyBirthdate}</td>
														<td class="col-sm-2">${resumeFamily.familyEducation}</td>
														<td class="col-sm-2">${resumeFamily.familyJob}</td>
														<td class="col-sm-2">${resumeFamily.familyCohabit}</td>	
													</tr>
													</c:forEach>
											</table>
										</div>
										<hr>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>병역사항</h4>
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-1">병역구분</th>
												<th class="col-sm-1">군별</th>
												<th class="col-sm-1">계급</th>
												<th class="col-sm-1">병과</th>
												<th class="col-sm-1">입영일자</th>
												<th class="col-sm-1">전역일자</th>
											</tr>
											<tr>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceState}</td>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceGroup}</td>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceLevel}</td>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceBranch}</td>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceBegindate}</td>
												<td class="col-sm-2">${resumeMilitaryservice.militaryserviceEnddate}</td>
											</tr>	
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>자격증</h4>
										<div id="certificate">
										<c:forEach var="resumeCertificate" items="${resumeCertificate}" varStatus="i">
											<table class="table table-striped table-bordered table-hover">
													<tr>
														<th class="col-sm-2">자격증명</th>
														<th class="col-sm-2">등급</th>
														<th class="col-sm-2">등록번호</th>
														<th class="col-sm-2">발행기관</th>
														<th class="col-sm-2">취득일자</th>
														<th class="col-sm-2">만료일자</th>
													</tr>
													<tr>
														<td class="col-sm-2">${resumeCertificate.certificateName}</td>
														<td class="col-sm-2">${resumeCertificate.certificateGrade}</td>
														<td class="col-sm-2">${resumeCertificate.certificateRegnum}</td>
														<td class="col-sm-2">${resumeCertificate.certificateHost}</td>
														<td class="col-sm-2">${resumeCertificate.certificateBegindate}</td>
														<td class="col-sm-2">${resumeCertificate.certificateEnddate}</td>
													</tr>	
											</table>
										</c:forEach>	
										</div>
										<hr>
									</div>
								</div><div class="row">
									<div class="col-sm-12">
										<h4>경력사항</h4>
										<div id="career">
											<c:forEach var="resumeCareer" items="${resumeCareer}" varStatus="i">
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-2">회사명</th>
													<th class="col-sm-2">직급</th>
													<th class="col-sm-2">부서</th>
													<th class="col-sm-2">입사일자</th>
													<th class="col-sm-2">퇴사일자</th>
													<th class="col-sm-2">근무기간</th>
												</tr>
												<tr>
													<td class="col-sm-2">${resumeCareer.careerCompany}</td>
													<td class="col-sm-2">${resumeCareer.careerLevel}</td>
													<td class="col-sm-2">${resumeCareer.careerDepartment}</td>
													<td class="col-sm-2">${resumeCareer.careerBegindate}</td>
													<td class="col-sm-2">${resumeCareer.careerEnddate}</td>
													<td class="col-sm-2">${resumeCareer.careerPeriod}</td>
												</tr>
												<tr>
													<th colspan="2">퇴사사유</th>
													<th colspan="10">담당업무</th>
												</tr>
												<tr>	
													<td colspan="2">${resumeCareer.careerResign}</td>
													<td colspan="10">${resumeCareer.careerTask}</td>
												</tr>
											</table>
											</c:forEach>
										</div>
										<hr>
									</div>
								</div>	
								<div class="row">
									<div class="col-sm-12">
										<h4>어학능력</h4>
										<div id="language">	
										<c:forEach var="resumeLanguage" items="${resumeLanguage}" varStatus="i">
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-3">외국어명</th>
													<th class="col-sm-3">회화구사수준</th>
													<th class="col-sm-3">시험명</th>
													<th class="col-sm-3">공인점수</th>
												</tr>
												<tr>
													<td class="col-sm-3">${resumeLanguage.languageName}</td>
													<td class="col-sm-3">${resumeLanguage.languageLevel}</td>	
													<td class="col-sm-3">${resumeLanguage.languageTest}</td>	
													<td class="col-sm-3">${resumeLanguage.languageGrade}</td>
												</tr>
												<tr>
													<th class="col-sm-3">취득일자</th>
													<th class="col-sm-3">만료일자</th>
													<th class="col-sm-3">시행기관</th>
													<th class="col-sm-3">등록번호</th>
												</tr>
												<tr>
													<td class="col-sm-3">${resumeLanguage.languageBegindate}</td>
													<td class="col-sm-3">${resumeLanguage.languageEnddate}</td>
													<td class="col-sm-3">${resumeLanguage.languageHost}</td>	
													<td class="col-sm-3">${resumeLanguage.languageRegnum}</td>
												</tr>
											</table>
										</c:forEach>	
										</div>
										<hr>	
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>수상경력</h4>
										<div id="award">
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-3">수상명</th>
													<th class="col-sm-4">수상내용</th>
													<th class="col-sm-3">수여기관</th>
													<th class="col-sm-2">수상일자</th>
												</tr>
												<c:forEach var="resumeAward" items="${resumeAward}" varStatus="i">
												<tr>
													<td class="col-sm-3">${resumeAward.awardName}</td>
													<td class="col-sm-4">${resumeAward.awardContent}</td>
													<td class="col-sm-3">${resumeAward.awardHost}</td>
													<td class="col-sm-2">${resumeAward.awardDate}</td>
												</tr>
												</c:forEach>
											</table>
										</div>
										<hr>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>국내외 연수 및 교육</h4>
										<div id="training">
											<c:forEach var="resumeTraining" items="${resumeTraining}" varStatus="i">	
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-3">국가</th>
													<th class="col-sm-3">기관/단체</th>
													<th class="col-sm-3">시작일자</th>
													<th class="col-sm-3">수료일자</th>
												</tr>
												<tr>
													<td class="col-sm-3">${resumeTraining.trainingCountry}</td>	
													<td class="col-sm-3">${resumeTraining.trainingAcademy}</td>
													<td class="col-sm-3">${resumeTraining.trainingBegindate}</td>
													<td class="col-sm-3">${resumeTraining.trainingEnddate}</td>
												</tr>
												<tr>
													<th colspan="12">연수내용</th>
												<tr>
													<td colspan="12">${resumeTraining.trainingContent}</td>
												</tr>
											</table>
											</c:forEach>
										</div>
										<hr>	
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>동아리(동호회) 및 대외활동</h4>
										<div id="club">	
											<c:forEach var="resumeClub" items="${resumeClub}" varStatus="i">	
											<table class="table table-striped table-bordered table-hover">
												<tr>
													<th class="col-sm-1">활동명</th>
													<th class="col-sm-1">주관기관</th>
													<th class="col-sm-1">시작일자</th>
													<th class="col-sm-1">종료일자</th>
												</tr>
												<tr>
													<td class="col-sm-2">${resumeClub.clubName}</td>	
													<td class="col-sm-2">${resumeClub.clubHost}</td>
													<td class="col-sm-2">${resumeClub.clubBegindate}</td>
													<td class="col-sm-2">${resumeClub.clubEnddate}</td>
												</tr>
												<tr>
													<th colspan="8">활동내용</th>
												</tr>
												<tr>
													<td colspan="8">${resumeClub.clubContent}</td>
												</tr>
											</table>
											</c:forEach>	
										</div>
										<hr>	
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<h4>기타 및 포트폴리오</h4>
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-3">포트폴리오 및 기타사항</th>
												<th class="col-sm-1">시작일자</th>
												<th class="col-sm-1">종료일자</th>
												<th class="col-sm-7">내용</th>
											</tr>
											<tr>
												<td class="col-sm-3">${resumeEtc.etcTitle}</td>
												<td class="col-sm-1">${resumeEtc.etcBegindate}</td>
												<td class="col-sm-1">${resumeEtc.etcEnddate}</td>
												<td class="col-sm-7">${resumeEtc.etcContent}</td>
											</tr>
											<tr>
												<th class="col-sm-3">첨부파일</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<a href="/resumeDetail/download?etcFileName=${resumeEtc.etcFileName}">${resumeEtc.etcFileName}</a>
												</td>
											</tr>
										</table>
									</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
