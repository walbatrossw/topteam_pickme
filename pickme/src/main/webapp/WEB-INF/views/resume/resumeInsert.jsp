<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 입력페이지</title>
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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<script>
	//유효성 검사(이력서 이름만, 나머지는 null허용)
	$(document).ready(function(){
		$('#resumeAddBtn').click(function(){
			if($("#resumeName").val() ==  ""){
				$("#error").text("이력서 이름을 입력해주세요");
				$("#resumeName").focus();
			} else {
				$("#resumeAddForm").submit();
			}	
		});
	

	//자격증 및 어학 검색 버튼 클릭시 팝업창띄우기
	function openPop() { 
	    window.open("/resumeCertilangIndex", "CertifiLang", "top=0, left=0, width=500, height=300, scrollbars=no, resizable=no ,status=no ,toolbar=no"); 
	}
	
	var univerNum = 0;
	var familyNum = 0;
	var certifiNum = 0;
	var careerNum = 0;
	var langNum = 0;
	var awardNum = 0;
	var trainingNum = 0;
	var clubNum = 0;
	
	// 01 대학교 추가 및 삭제 start
	
		const $universityAddBtn = $('#universityAddBtn');
		$universityAddBtn.click(function(){
			univerNum++;
			$('#fieldUniversity').append(
				'<table class="university table table-striped table-bordered table-hover">'+
					'<tr>'+
						'<th class="col-sm-3">분류</th>'+
						'<th class="col-sm-3">학교명</th>'+
						'<th class="col-sm-3">입학일자</th>'+
						'<th class="col-sm-3">졸업일자</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-3">'+
							'<select class="form-control" id="universityCategory" name="resumeUniversityVoList['+univerNum+'].universityCategory">'+
								'<option value="">선택</option>'+
								'<option value="2년제">2년제</option>'+
								'<option value="3년제">3년제</option>'+
								'<option value="4년제">4년제</option>'+
								'<option value="대학원">대학원</option>'+
							'</select>'+
						'</td>'+
						'<td class="col-sm-3"><input type="text" class="form-control" id="universityName" name="resumeUniversityVoList['+univerNum+'].universityName" placeholder="ex)서울대학교"></td>'+
						'<td class="col-sm-3">'+
							'<input type="date" class="form-control" id="universityBegindate" name="resumeUniversityVoList['+univerNum+'].universityBegindate" value="2016-11-02">'+
						'</td>'+
						'<td class="col-sm-3">'+
							'<input type="date" class="form-control" id="universityEnddate" name="resumeUniversityVoList['+univerNum+'].universityEnddate" value="2016-11-02">'+
						'</td>'+
					'</tr>'+
					'<tr>'+
						'<th class="col-sm-3">주전공</th>'+
						'<th class="col-sm-3">복수부전공</th>'+
						'<th class="col-sm-3">복수부전공명</th>'+
						'<th class="col-sm-3">학점</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-3">'+
							'<input type="text" class="form-control" id="universityMajor" name="resumeUniversityVoList['+univerNum+'].universityMajor" placeholder="ex)영어영문학과">'+
						'</td>'+
						'<td class="col-sm-3">'+
							'<select class="form-control" id="universityDmajorminor" name="resumeUniversityVoList['+univerNum+'].universityDmajorminor">'+
								'<option value="">선택</option>'+
								'<option value="해당없음">해당없음</option>'+
								'<option value="복수전공">복수전공</option>'+
								'<option value="부전공">부전공</option>'+
							'</select>'+
						'</td>'+
						'<td class="col-sm-3">'+
							'<input type="text" class="form-control" id="universityDmajorminorName" name="resumeUniversityVoList['+univerNum+'].universityDmajorminorName" placeholder="ex)경영학과">'+
						'</td>'+
						'<td class="col-sm-3">'+
							'<input type="text" class="form-control" id="universityCredit" name="resumeUniversityVoList['+univerNum+'].universityCredit" placeholder="ex) 3.1/4.5">'+
						'</td>'+
					'</tr>'+
				'</table>'
			);
		});
		const $universityDelBtn = $('#universityDelBtn');
		$universityDelBtn.on('click', function(){
			const $university = $('.university');
			univerNum--;
			$university.last().remove();
		});
		// 01 대학교 추가 및 삭제 end
		
		// 02 가족사항 추가 및 삭제 start
		const $familyAddBtn = $('#familyAddBtn');
		$familyAddBtn.click(function(){
			familyNum++;
			$('#fieldFamily').append(
				'<table class="family table table-striped table-bordered table-hover">'+
					'<tr>'+
						'<th class="col-sm-2">관계</th>'+
						'<th class="col-sm-2">이름</th>'+
						'<th class="col-sm-2">생년월일</th>'+
						'<th class="col-sm-2">학력</th>'+
						'<th class="col-sm-2">직업</th>'+
						'<th class="col-sm-2">동거여부</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyRelation" name="resumeFamilyVoList['+familyNum+'].familyRelation" placeholder="ex) 부, 모, 남동생, 여동생"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyName" name="resumeFamilyVoList['+familyNum+'].familyName" placeholder="이름 입력"></td>'+
						'<td class="col-sm-2"><input type="date" class="form-control" id="familyBirthdate" name="resumeFamilyVoList['+familyNum+'].familyBirthdate" value="2016-11-02"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyEducation" name="resumeFamilyVoList['+familyNum+'].familyEducation" placeholder="ex) 고졸, 대졸, 대재"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyJob" name="resumeFamilyVoList['+familyNum+'].familyJob" placeholder="ex) 자영업, 회사원, 가사"></td>'+
						'<td class="col-sm-2">'+
							'<select class="form-control" id="familyCohabit" name="resumeFamilyVoList['+familyNum+'].familyCohabit">'+
								'<option value="">::선택::</option>'+
								'<option value="예">예</option>'+
								'<option value="아니요">아니요</option>'+
							'</select>'+
						'</td>'+	
					'</tr>'+
				'</table>'
			);
		});
		
		const $familyDelBtn = $('#familyDelBtn');
		$familyDelBtn.on('click', function(){
			const $family = $('.family');
			familyNum--;
			$family.last().remove();
		});
		// 02 가족사항 추가 및 삭제 end
		
		// 03 자격증 추가 및 삭제 start
		const $certificateAddBtn = $('#certificateAddBtn');
		$certificateAddBtn.click(function(){
			certifiNum++;
			$('#fieldCertificate').append(
				'<table class="certificate table table-striped table-bordered table-hover">'+
					'<tr>'+
						'<th class="col-sm-2">자격증명</th>'+
						'<th class="col-sm-2">등급</th>'+
						'<th class="col-sm-2">등록번호</th>'+
						'<th class="col-sm-2">발행기관</th>'+
						'<th class="col-sm-2">취득일자</th>'+
						'<th class="col-sm-2">만료일자</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-2">'+
							'<input type="text" class="form-control" id="certificateName" name="resumeCertificateVoList['+certifiNum+'].certificateName" placeholder="ex)정보처리기사">'+
							'<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>'+
						'</td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="certificateGrade" name="resumeCertificateVoList['+certifiNum+'].certificateGrade" placeholder="ex)1급, 1종, 최종합격"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="certificateRegnum" name="resumeCertificateVoList['+certifiNum+'].certificateRegnum" placeholder="등록번호 또는 자격번호 입력"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="certificateHost" name="resumeCertificateVoList['+certifiNum+'].certificateHost" placeholder="ex)한국산업인력공단"></td>'+
						'<td class="col-sm-2"><input type="date" class="form-control" id="certificateBegindate" name="resumeCertificateVoList['+certifiNum+'].certificateBegindate" value="2016-11-02"></td>'+
						'<td class="col-sm-2"><input type="date" class="form-control" id="certificateEnddate" name="resumeCertificateVoList['+certifiNum+'].certificateEnddate" value="2016-11-02"></td>'+
					'</tr>'+
				'</table>'
						
			);
		});
		const $certificateDelBtn = $('#certificateDelBtn');
		$certificateDelBtn.on('click', function(){
			const $certificate = $('.certificate');
			certifiNum--;
			$certificate.last().remove();
		});
		// 03 자격증 추가 및 삭제 end
		
		// 04 경력사항 추가 및 삭제 start
		const $careerAddBtn = $('#careerAddBtn');
		$careerAddBtn.click(function(){
			careerNum++;
			$('#fieldCareer').append(
				'<table class="career table table-striped table-bordered table-hover">'+
					'<tr>'+
						'<th class="col-sm-2">회사명</th>'+
						'<th class="col-sm-2">직급</th>'+
						'<th class="col-sm-2">부서</th>'+
						'<th class="col-sm-2">입사일자</th>'+
						'<th class="col-sm-2">퇴사일자</th>'+
						'<th class="col-sm-2">근무기간</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="careerCompany" name="resumeCareerVoList['+careerNum+'].careerCompany" placeholder="회사 또는 근무처 입력"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="careerLevel" name="resumeCareerVoList['+careerNum+'].careerLevel" placeholder="ex) 대리, 인턴, 아르바이트 사원"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="careerDepartment" name="resumeCareerVoList['+careerNum+'].careerDepartment" placeholder="ex) 영업, 생산, 품질관리"></td>'+
						'<td class="col-sm-2">'+
							'<input type="date" class="form-control" id="careerBegindate" name="resumeCareerVoList['+careerNum+'].careerBegindate" value="2016-11-02">'+
						'</td>'+
						'<td class="col-sm-2">'+
							'<input type="date" class="form-control" id="careerEnddate" name="resumeCareerVoList['+careerNum+'].careerEnddate" value="2016-11-02">'+
						'</td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="careerPeriod" name="resumeCareerVoList['+careerNum+'].careerPeriod" placeholder="근무기간"></td>'+
					'</tr>'+
					'<tr>'+
						'<th colspan="2">퇴사사유</th>'+
						'<th colspan="10">담당업무</th>'+
					'</tr>'+
					'<tr>'+
						'<td colspan="2"><input type="text" class="form-control" id="careerResign" name="resumeCareerVoList['+careerNum+'].careerResign" placeholder="퇴사사유 입력"></td>'+
						'<td colspan="10"><textarea class="form-control col-sm-5" rows="3" id="careerTask" name="resumeCareerVoList['+careerNum+'].careerTask" style="resize:none" placeholder="담당업무에 대한 간략한 설명"></textarea></td>'+
					'</tr>'+
				'</table>'
				);
			});
		const $careerDelBtn = $('#careerDelBtn');	
		$careerDelBtn.on('click', function(){
			const $career = $('.career');
			careerNum--;
			$career.last().remove();
		});
		// 04 경력사항 추가 및 삭제 end
		
		// 05 어학능력 추가 및 삭제 start
		const $languageAddBtn = $('#languageAddBtn');
			$languageAddBtn.click(function(){
				langNum++;
				$('#fieldLanguage').append(
					'<table class="language table table-striped table-bordered table-hover">'+
						'<tr>'+
							'<th class="col-sm-3">외국어명</th>'+
							'<th class="col-sm-3">회화구사수준</th>'+
							'<th class="col-sm-3">시험명</th>'+
							'<th class="col-sm-3">공인점수</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="languageName" name="resumeLanguageVoList['+langNum+'].languageName" placeholder="ex)영어, 중국어, 일본어"></td>'+
							'<td class="col-sm-3">'+
								'<select class="form-control" id="languageLevel" name="resumeLanguageVoList['+langNum+'].languageLevel">'+
									'<option value="">::선택::</option>'+
									'<option value="기초회화">기초회화</option>'+
									'<option value="일상회화">일상회화</option>'+
									'<option value="비지니스회화">비지니스회화</option>'+
									'<option value="원어민수준">원어민수준</option>'+
								'</select>'+
							'</td>'+
							'<td class="col-sm-3">'+
								'<input type="text" class="form-control" id="languageTest" name="resumeLanguageVoList['+langNum+'].languageTest" placeholder="ex) TOEIC, HSK, JLPT">'+
								'<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>'+
							'</td>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="languageGrade" name="resumeLanguageVoList['+langNum+'].languageGrade" placeholder="ex) 990, 3급, AL"></td>'+
						'</tr>'+
						'<tr>'+
							'<th class="col-sm-3">취득일자</th>'+
							'<th class="col-sm-3">만료일자</th>'+
							'<th class="col-sm-3">시행기관</th>'+
							'<th class="col-sm-3">등록번호</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-3">'+
								'<input type="date" class="form-control" id="languageBegindate" name="resumeLanguageVoList['+langNum+'].languageBegindate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-3">'+
								'<input type="date" class="form-control" id="languageEnddate" name="resumeLanguageVoList['+langNum+'].languageEnddate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-3">'+
								'<input type="text" class="form-control" id="languageHost" name="resumeLanguageVoList['+langNum+'].languageHost" placeholder="ex) 한국토익위원회">'+
							'</td>'+
							'<td class="col-sm-3">'+
								'<input type="text" class="form-control" id="languageRegnum" name="resumeLanguageVoList['+langNum+'].languageRegnum" placeholder="등록번호 입력">'+
							'</td>'+
						'</tr>'+
					'</table>'			
				);
			});
		const $languageDelBtn = $('#languageDelBtn');
			$languageDelBtn.on('click', function(){
				const $language = $('.language');
				langNum--;
				$language.last().remove();
			});
		// 05 어학능력 추가 및 삭제 end
		
		// 06 수상경력 추가 및 삭제 start
		const $awardAddBtn = $('#awardAddBtn');
			$awardAddBtn.click(function(){
				awardNum++;
				$('#fieldAward').append(
					'<table class="award table table-striped table-bordered table-hover">'+
						'<tr>'+
							'<th class="col-sm-3">수상명</th>'+
							'<th class="col-sm-4">수상내용</th>'+
							'<th class="col-sm-3">수여기관</th>'+
							'<th class="col-sm-2">수상일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-3">'+
								'<input type="text" class="form-control" id="awardName" name="resumeAwardVoList['+awardNum+'].awardName" placeholder="수상명 입력">'+
							'</td>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="awardContent" name="resumeAwardVoList['+awardNum+'].awardContent" placeholder="수상내용 입력"></td>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="awardHost" name="resumeAwardVoList['+awardNum+'].awardHost" placeholder="수여기관 입력"></td>'+
							'<td class="col-sm-2"><input type="date" class="form-control" id="awardDate" name="resumeAwardVoList['+awardNum+'].awardDate" value="2016-11-02"></td>'+
						'</tr>'+
					'</table>'
				);
			});
		const $awardDelBtn = $('#awardDelBtn');
			$awardDelBtn.on('click', function(){
				const $award = $('.award');
				awardNum--;
				$award.last().remove();
			});
		// 06 수상경력 추가 및 삭제 end
		
		// 07 국내외연수 추가 및 삭제 start
		const $trainingAddBtn = $('#trainingAddBtn');
			$trainingAddBtn.click(function(){
				trainingNum++;
				$('#fieldTraining').append(
					'<table class="training table table-striped table-bordered table-hover">'+
						'<tr>'+
							'<th class="col-sm-3">국가</th>'+
							'<th class="col-sm-3">기관/단체</th>'+
							'<th class="col-sm-3">시작일자</th>'+
							'<th class="col-sm-3">수료일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="trainingCountry" name="resumeTrainingVoList['+trainingNum+'].trainingCountry" placeholder="ex) 대한민국, 중국, 미국"></td>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="trainingAcademy" name="resumeTrainingVoList['+trainingNum+'].trainingAcademy" placeholder="연수기관 입력"></td>'+
							'<td class="col-sm-3">'+
								'<input type="date" class="form-control" id="trainingBegindate" name="resumeTrainingVoList['+trainingNum+'].trainingBegindate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-3">'+
								'<input type="date" class="form-control" id="trainingEnddate" name="resumeTrainingVoList['+trainingNum+'].trainingEnddate" value="2016-11-02">'+
							'</td>'+
						'</tr>'+
						'<tr>'+
							'<th colspan="12">연수내용</th>'+
						'<tr>'+
							'<td colspan="12"><textarea class="form-control col-sm-5" rows="2" id="trainingContent" name="resumeTrainingVoList['+trainingNum+'].trainingContent" style="resize:none" placeholder="연수사항에 대한 간략한 설명"></textarea></td>'+
						'</tr>'+
					'</table>'
				);
			});
		const $trainingDelBtn = $('#trainingDelBtn');
			$trainingDelBtn.on('click', function(){
				const $training = $('.training');
				trainingNum--;
				$training.last().remove();
			});
		// 07 국내외연수 추가 및 삭제 end
		
		// 08 동아리/동호회 추가 및 삭제 start
		const $clubAddBtn = $('#clubAddBtn');
			$clubAddBtn.click(function(){
				clubNum++;
				$('#fieldClub').append(
					'<table class="club table table-striped table-bordered table-hover">'+
						'<tr>'+
							'<th class="col-sm-1">활동명</th>'+
							'<th class="col-sm-1">주관기관</th>'+
							'<th class="col-sm-1">시작일자</th>'+
							'<th class="col-sm-1">종료일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-2"><input type="text" class="form-control" id="clubName" name="resumeClubVoList['+clubNum+'].clubName" placeholder="동아리/활동명 입력"></td>'+
							'<td class="col-sm-2"><input type="text" class="form-control" id="clubHost" name="resumeClubVoList['+clubNum+'].clubHost" placeholder="주관기관 입력"></td>'+
							'<td class="col-sm-2">'+
								'<input type="date" class="form-control" id="clubBegindate" name="resumeClubVoList['+clubNum+'].clubBegindate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-2">'+
								'<input type="date" class="form-control" id="clubEnddate" name="resumeClubVoList['+clubNum+'].clubEnddate" value="2016-11-02">'+
							'</td>'+
						'</tr>'+
						'<tr>'+
							'<th colspan="8">활동내용</th>'+
						'</tr>'+
						'<tr>'+
							'<td colspan="8"><textarea class="form-control col-sm-5" rows="2" id="clubContent" name="resumeClubVoList['+clubNum+'].clubContent" style="resize:none" placeholder="활동내용 대한 간략한 설명"></textarea></td>'+
						'</tr>'+
					'</table>'
				);
			});
		const $clubDelBtn = $('#clubDelBtn');
			$clubDelBtn.on('click', function(){
				const $club = $('.club');
				clubNum--;
				$club.last().remove();
			});
		// 08 동아리/동호회 추가 및 삭제 end
	
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
							<a href="/coverletterIndex"><i class="fa fa-dashboard fa-fw"></i> 이력서 & 자기소개서 Main</a>
						</li>
						<li>
							<a href="#"><i class="fa fa-table fa-fw"></i> 나의 이력서<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/resumeList"> 나의 이력서 리스트</a></li>
								<li><a href="/resumeInsert"> 이력서 새로 쓰기</a></li>
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
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">이력서</h1>
					<form id="resumeAddForm" action="/resumeInsert" method="post" enctype="multipart/form-data">	
							<div class="row">
								<div class="col-sm-5">
									<p>이력서 이름을 반드시 입력해주세요</p>
									<input type="text" class="form-control" id="resumeName" name="resumeName" placeholder="이력서 이름을 입력해주세요">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-2">
									<h4 align="center">증명사진</h4>
									<table class="table table-striped table-bordered table-hover">
										<tr align="center">
											<td>
												<div class="fileinput fileinput-new" data-provides="fileinput">
								  					<div class="fileinput-preview thumbnail" id="personalPhoto" data-trigger="fileinput" style="width: 160px; height: 220px;"></div>
								  					<div align="center">
								    					<span class="btn btn-default btn-file"><span class="fileinput-new">사진선택</span>
								    					<span class="fileinput-exists">변경</span>
								    					<input type="file" name="personalPhoto"></span>
								    					<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
								  					</div>
												</div>
											</td>
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
											<td class="col-sm-3"><input type="text" class="form-control" id="personalKorName" name="personalKorname" placeholder="한글이름 입력"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personalEngName" name="personalEngname" placeholder="영문이름 입력"></td>
											<td class="col-sm-3">
												<select class="form-control" id="personlGender" name="personalGender">
													<option value="">선택</option>
													<option value="남자">남자</option>
													<option value="여자">여자</option>
												</select>
											</td>
											<td class="col-sm-3"><input type="date" class="form-control" id="personlBirthdate" name="personalBirthdate" value="2016-11-02"></td>
										</tr>
										<tr>
											<th class="col-sm-3">일반전화</th>
											<th class="col-sm-3">휴대전화</th>
											<th class="col-sm-3">이메일</th>
											<th class="col-sm-3">SNS</th>
										</tr>
										<tr>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlPhone" name="personalPhone" data-mask="999-9999-9999" value="010-1234-1234"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlCellphone" name="personalCellphone" data-mask="999-9999-9999" value="010-1234-1234"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlEmail" name="personalEmail" placeholder="이메일주소 입력"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlSns" name="personalSns" placeholder="sns계정 또는 url 입력"></td>
										</tr>
										<tr>
											<th colspan="12">주소</th>
										</tr>
										<tr>
											<td colspan="12"><input type="text" class="form-control" id="personlAddr" name="personalAddr" placeholder="주소 입력"></td>
										</tr>
									</table>
								</div>
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
											<td class="col-sm-3"><input type="text" class="form-control" id="highschoolName" name="highschoolName" placeholder="ex)서울고등학교"></td>
											<td class="col-sm-3">
												<select class="form-control" class="form-control" id="highschoolCategory" name="highschoolCategory">
													<option value="">::선택::</option>
													<option value="문과">문과</option>
													<option value="이과">이과</option>
													<option value="전문(실업)계">전문(실업)계</option>
													<option value="예체능">예체능</option>
												</select>
											</td>
											<td class="col-sm-3"><input type="date" class="form-control" id="highschoolBegindate" name="highschoolBegindate" value="2016-11-02"></td>
											<td class="col-sm-3"><input type="date" class="form-control" id="highschoolEnddate" name="highschoolEnddate" value="2016-11-02"></td>
										</tr>	
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4>대학교</h4>
									<div id="university">
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-3">분류</th>
												<th class="col-sm-3">학교명</th>
												<th class="col-sm-3">입학일자</th>
												<th class="col-sm-3">졸업일자</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<select class="form-control" id="universityCategory" name="resumeUniversityVoList[0].universityCategory">
														<option value="">선택</option>
														<option value="2년제">2년제</option>
														<option value="3년제">3년제</option>
														<option value="4년제">4년제</option>
														<option value="대학원">대학원</option>
													</select>
												</td>
												<td class="col-sm-3"><input type="text" class="form-control" id="universityName" name="resumeUniversityVoList[0].universityName" placeholder="ex)서울대학교"></td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="universityBegindate" name="resumeUniversityVoList[0].universityBegindate" value="2016-11-02">
												</td>
												<td class="col-sm-3">	
													<input type="date" class="form-control" id="universityEnddate" name="resumeUniversityVoList[0].universityEnddate" value="2016-11-02">
												</td>
											</tr>
											<tr>
												<th class="col-sm-3">주전공</th>
												<th class="col-sm-3">복수부전공</th>
												<th class="col-sm-3">복수부전공명</th>
												<th class="col-sm-3">학점</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="universityMajor" name="resumeUniversityVoList[0].universityMajor" placeholder="ex)영어영문학과">
												</td>
												<td class="col-sm-3">
													<select class="form-control" id="universityDmajorminor" name="resumeUniversityVoList[0].universityDmajorminor">
														<option value="">선택</option>
														<option value="해당없음">해당없음</option>
														<option value="복수전공">복수전공</option>
														<option value="부전공">부전공</option>
													</select>
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="universityDmajorminorName" name="resumeUniversityVoList[0].universityDmajorminorName" placeholder="ex)경영학과">
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="universityCredit" name="resumeUniversityVoList[0].universityCredit" placeholder="ex) 3.1/4.5">
												</td>
											</tr>
										</table>
									</div>
									<div id="fieldUniversity"></div>
									<div>
										<input type="button" id="universityAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="universityDelBtn" class="btn btn-default btn-xs" value="삭제">
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
												<tr>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyRelation" name="resumeFamilyVoList[0].familyRelation" placeholder="ex) 부, 모, 남동생, 여동생"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyName" name="resumeFamilyVoList[0].familyName" placeholder="이름 입력"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="familyBirthdate" name="resumeFamilyVoList[0].familyBirthdate" value="2016-11-02"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyEducation" name="resumeFamilyVoList[0].familyEducation" placeholder="ex) 고졸, 대졸, 대재"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyJob" name="resumeFamilyVoList[0].familyJob" placeholder="ex) 자영업, 회사원, 가사"></td>
													<td class="col-sm-2">
														<select class="form-control" id="familyCohabit" name="resumeFamilyVoList[0].familyCohabit">
															<option value="">::선택::</option>
															<option value="예">예</option>
															<option value="아니요">아니요</option>
														</select>
													</td>	
												</tr>
										</table>
									</div>
									<div id="fieldFamily"></div>
									<div>
										<input type="button" id="familyAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="familyDelBtn" class="btn btn-default btn-xs" value="삭제">	
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
											<td class="col-sm-2">
												<select class="form-control" id="militaryserviceState" name="militaryserviceState">
													<option value="">::선택::</option>
													<option value="현역">현역</option>
													<option value="예비역">예비역</option>
													<option value="보충역">보충역</option>
													<option value="제1국민역">제1국민역</option>
													<option value="제2국민역">제2국민역</option>
													<option value="해당없음">해당없음</option>
												</select>
											</td>
											<td class="col-sm-2">
												<select class="form-control" id="militaryserviceGroup" name="militaryserviceGroup">
													<option value="">::선택::</option>
													<option value="육군">육군</option>
													<option value="공군">공군</option>
													<option value="해군">해군</option>
													<option value="기타">기타</option>
												</select>
											</td>
											<td class="col-sm-2">
												<select class="form-control" id="militaryserviceLevel" name="militaryserviceLevel">
													<option value="">::선택::</option>
													<option value="이병">이병</option>
													<option value="일병">일병</option>
													<option value="상병">상병</option>
													<option value="병장">병장</option>
													<option value="하사">하사</option>
													<option value="중사">중사</option>
													<option value="상사">상사</option>
													<option value="원사">원사</option>
													<option value="준위">준위</option>
													<option value="소위">소위</option>
													<option value="중위">중위</option>
													<option value="대위">대위</option>
													<option value="소령">소령</option>
													<option value="중령">중령</option>
													<option value="대령">대령</option>
												</select>
											</td>
											<td class="col-sm-2">
												<input type="text" class="form-control" id="militaryserviceBranch" name="militaryserviceBranch" placeholder="ex) 소총수, 공병, 통신병">
											</td>
											<td class="col-sm-2"><input type="date" class="form-control" id="militaryserviceBegindate" name="militaryserviceBegindate" value="2016-11-02"></td>
											<td class="col-sm-2"><input type="date" class="form-control" id="militaryserviceEnddate" name="militaryserviceEnddate" value="2016-11-02"></td>
										</tr>	
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4>자격증</h4>
									<div id="certificate">
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
													<td class="col-sm-2">
														<input type="text" class="form-control" id="certificateName" name="resumeCertificateVoList[0].certificateName" placeholder="ex)정보처리기사">
														<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
													</td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateGrade" name="resumeCertificateVoList[0].certificateGrade" placeholder="ex)1급, 1종, 최종합격"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateRegnum" name="resumeCertificateVoList[0].certificateRegnum" placeholder="등록번호 또는 자격번호 입력"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateHost" name="resumeCertificateVoList[0].certificateHost" placeholder="ex)한국산업인력공단"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="certificateBegindate" name="resumeCertificateVoList[0].certificateBegindate" value="2016-11-02"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="certificateEnddate" name="resumeCertificateVoList[0].certificateEnddate" value="2016-11-02"></td>
												</tr>	
										</table>
									</div>
									<div id="fieldCertificate"></div>
									<div>
										<input type="button" id="certificateAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="certificateDelBtn" class="btn btn-default btn-xs" value="삭제">
									</div>
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4>경력사항</h4>
									<div id="career">
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
												<td class="col-sm-2"><input type="text" class="form-control" id="careerCompany" name="resumeCareerVoList[0].careerCompany" placeholder="회사 또는 근무처 입력"></td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerLevel" name="resumeCareerVoList[0].careerLevel" placeholder="ex) 대리, 인턴, 아르바이트 사원"></td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerDepartment" name="resumeCareerVoList[0].careerDepartment" placeholder="ex) 영업, 생산, 품질관리"></td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="careerBegindate" name="resumeCareerVoList[0].careerBegindate" value="2016-11-02">
												</td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="careerEnddate" name="resumeCareerVoList[0].careerEnddate" value="2016-11-02">
												</td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerPeriod" name="resumeCareerVoList[0].careerPeriod" placeholder="근무기간"></td>
											</tr>
											<tr>
												<th colspan="2">퇴사사유</th>
												<th colspan="10">담당업무</th>
											</tr>
											<tr>	
												<td colspan="2"><input type="text" class="form-control" id="careerResign" name="resumeCareerVoList[0].careerResign" placeholder="퇴사사유 입력"></td>
												<td colspan="10"><textarea class="form-control col-sm-5" rows="3" id="careerTask" name="resumeCareerVoList[0].careerTask" style="resize:none" placeholder="담당업무에 대한 간략한 설명"></textarea></td>
											</tr>
										</table>
									</div>
									<div id="fieldCareer"></div>	
									<div>
										<input type="button" id="careerAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="careerDelBtn" class="btn btn-default btn-xs" value="삭제">
									</div>	
									<hr>
								</div>
							</div>	
							<div class="row">
								<div class="col-sm-12">
									<h4>어학능력</h4>
									<div id="language">	
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-3">외국어명</th>
												<th class="col-sm-3">회화구사수준</th>
												<th class="col-sm-3">시험명</th>
												<th class="col-sm-3">공인점수</th>
											</tr>
											<tr>
												<td class="col-sm-3"><input type="text" class="form-control" id="languageName" name="resumeLanguageVoList[0].languageName" placeholder="ex)영어, 중국어, 일본어"></td>
												<td class="col-sm-3">
													<select class="form-control" id="languageLevel" name="resumeLanguageVoList[0].languageLevel">
														<option value="">::선택::</option>
														<option value="기초회화">기초회화</option>
														<option value="일상회화">일상회화</option>
														<option value="비지니스회화">비지니스회화</option>
														<option value="원어민수준">원어민수준</option>
													</select>
												</td>	
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageTest" name="resumeLanguageVoList[0].languageTest" placeholder="ex) TOEIC, HSK, JLPT">
													<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
												</td>	
												<td class="col-sm-3"><input type="text" class="form-control" id="languageGrade" name="resumeLanguageVoList[0].languageGrade" placeholder="ex) 990, 3급, AL"></td>
											</tr>
											<tr>
												<th class="col-sm-3">취득일자</th>
												<th class="col-sm-3">만료일자</th>
												<th class="col-sm-3">시행기관</th>
												<th class="col-sm-3">등록번호</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="languageBegindate" name="resumeLanguageVoList[0].languageBegindate" value="2016-11-02">
												</td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="languageEnddate" name="resumeLanguageVoList[0].languageEnddate" value="2016-11-02">
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageHost" name="resumeLanguageVoList[0].languageHost" placeholder="ex) 한국토익위원회">
												</td>	
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageRegnum" name="resumeLanguageVoList[0].languageRegnum" placeholder="등록번호 입력">
												</td>
											</tr>
										</table>
									</div>
									<div id="fieldLanguage"></div>
									<div>
										<input type="button" id="languageAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="languageDelBtn" class="btn btn-default btn-xs" value="삭제">
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
											<tr>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="awardName" name="resumeAwardVoList[0].awardName" placeholder="수상명 입력">
												</td>
												<td class="col-sm-4"><input type="text" class="form-control" id="awardContent" name="resumeAwardVoList[0].awardContent" placeholder="수상내용 입력"></td>
												<td class="col-sm-3"><input type="text" class="form-control" id="awardHost" name="resumeAwardVoList[0].awardHost" placeholder="수여기관 입력"></td>
												<td class="col-sm-2"><input type="date" class="form-control" id="awardDate" name="resumeAwardVoList[0].awardDate" value="2016-11-02"></td>
											</tr>
										</table>
									</div>
									<div id="fieldAward"></div>
									<div>
										<input type="button" id="awardAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="awardDelBtn" class="btn btn-default btn-xs" value="삭제">
									</div>
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4>국내외 연수 및 교육</h4>
									<div id="training">	
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-3">국가</th>
												<th class="col-sm-3">기관/단체</th>
												<th class="col-sm-3">시작일자</th>
												<th class="col-sm-3">수료일자</th>
											</tr>
											<tr>
												<td class="col-sm-3"><input type="text" class="form-control" id="trainingCountry" name="resumeTrainingVoList[0].trainingCountry" placeholder="ex) 대한민국, 중국, 미국"></td>	
												<td class="col-sm-3"><input type="text" class="form-control" id="trainingAcademy" name="resumeTrainingVoList[0].trainingAcademy" placeholder="연수기관 입력"></td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="trainingBegindate" name="resumeTrainingVoList[0].trainingBegindate" value="2016-11-02">
												</td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="trainingEnddate" name="resumeTrainingVoList[0].trainingEnddate" value="2016-11-02">
												</td>
											</tr>
											<tr>
												<th colspan="12">연수내용</th>
											<tr>
												<td colspan="12"><textarea class="form-control col-sm-5" rows="2" id="trainingContent" name="resumeTrainingVoList[0].trainingContent" style="resize:none" placeholder="연수사항에 대한 간략한 설명"></textarea></td>
											</tr>
										</table>
									</div>
									<div id="fieldTraining"></div>
									<div>
										<input type="button" id="trainingAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="trainingDelBtn" class="btn btn-default btn-xs" value="삭제">
									</div>
									<hr>	
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4>동아리(동호회) 및 대외활동</h4>
									<div id="club">	
										<table class="table table-striped table-bordered table-hover">
											<tr>
												<th class="col-sm-1">활동명</th>
												<th class="col-sm-1">주관기관</th>
												<th class="col-sm-1">시작일자</th>
												<th class="col-sm-1">종료일자</th>
											</tr>
											<tr>
												<td class="col-sm-2"><input type="text" class="form-control" id="clubName" name="resumeClubVoList[0].clubName" placeholder="동아리/활동명 입력"></td>	
												<td class="col-sm-2"><input type="text" class="form-control" id="clubHost" name="resumeClubVoList[0].clubHost" placeholder="주관기관 입력"></td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="clubBegindate" name="resumeClubVoList[0].clubBegindate" value="2016-11-02">
												</td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="clubEnddate" name="resumeClubVoList[0].clubEnddate" value="2016-11-02">
												</td>
											</tr>
											<tr>
												<th colspan="8">활동내용</th>
											</tr>
											<tr>
												<td colspan="8"><textarea class="form-control col-sm-5" rows="2" id="clubContent" name="resumeClubVoList[0].clubContent" style="resize:none" placeholder="활동내용 대한 간략한 설명"></textarea></td>
											</tr>
										</table>
									</div>
									<div id="fieldClub"></div>
									<div>
										<input type="button" id="clubAddBtn" class="btn btn-primary btn-xs" value="추가">
										<input type="button" id="clubDelBtn" class="btn btn-default btn-xs" value="삭제">
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
											<td class="col-sm-3"><input type="text" class="form-control" id="etcTitle" name="etcTitle" placeholder="기타 및 포트폴리오명 입력"></td>
											<td class="col-sm-1">
												<input type="date" class="form-control" id="etcBegindate" name="etcBegindate" value="2016-11-02">
											</td>
											<td class="col-sm-1">
												<input type="date" class="form-control" id="etcEnddate" name="etcEnddate" value="2016-11-02">
											</td>
											<td class="col-sm-7"><textarea class="form-control col-sm-5" rows="2" id="etcContent" name="etcContent" style="resize:none" placeholder="포트폴리오를 첨부 하실 분은 간략한 설명한 설명 입력해주세요"></textarea></td>
										</tr>
										<tr>
											
											<th class="col-sm-3">첨부파일</th>
										</tr>
										<tr>
											<td class="col-sm-3">
												<div class="fileinput fileinput-new input-group" data-provides="fileinput">
			  										<div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> 
			  											<span class="fileinput-filename"></span>
			  										</div>
				  										<span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">파일선택</span>
				  										<span class="fileinput-exists">변경</span>
				  										<input type="file" name="etcFile"></span>
				  										<a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						<input type="submit" class="btn btn-primary btn" id="resumeAddBtn" value="이력서 저장"/>
						<hr>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
