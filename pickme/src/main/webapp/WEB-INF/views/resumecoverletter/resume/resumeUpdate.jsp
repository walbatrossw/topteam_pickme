<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이력서 수정페이지</title>
<!-- Bootstrap Core CSS -->
<link href="resumecoverlettersetting/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="resumecoverlettersetting/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="resumecoverlettersetting/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="resumecoverlettersetting/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="resumecoverlettersetting/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="resumecoverlettersetting/dist/js/sb-admin-2.js"></script>
<!-- 사진 및 파일 입력폼 CSS, JS -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>



<script type="text/javascript">
//자격증 및 어학 검색 버튼 클릭시 팝업창띄우기
function openPop() { 
    window.open("/resumeCertilangIndex", "CertifiLang", "top=0, left=0, width=500, height=300, scrollbars=no, resizable=no ,status=no ,toolbar=no"); 
}
</script>
<script>
	
	$(document).ready(function(){
		//유효성 검사(이력서 이름만, 나머지는 null허용)
		$('#resumeAddBtn').click(function(){
			if($("#resumeName").val() ==  ""){
				$("#resumeNameError").text("이력서 이름은 반드시 입력해야 합니다");
				$("#resumeName").focus();
				return false;
			} else {
				$("#resumeAddForm").submit();
			}	
		});
		
		var univerNum = ($(".university").size())-1;
		var familyNum = ($(".family").size())-1;
		var certifiNum = ($(".family").size())-1;
		var careerNum = ($(".career").size())-1;
		var langNum = ($(".language").size())-1;
		var certifiNum = ($(".certificate").size())-1;
		var awardNum = ($(".award").size())-1;
		var trainingNum = ($(".training").size())-1;
		var clubNum = ($(".club").size())-1;
		
		//select된 값 가져오기
		// 신상정보:성별
		$("#personlGender").val("${resumePersonal.personalGender}").attr("selected", "selected");
		// 고등학교:분류
		$("#highschoolCategory").val("${resumeHighschool.highschoolCategory}").attr("selected", "selected");
		// 병역사항:병역구분
		$("#militaryserviceState").val("${resumeMilitaryservice.militaryserviceState}").attr("selected", "selected");
		// 병역사항:군별
		$("#militaryserviceGroup").val("${resumeMilitaryservice.militaryserviceGroup}").attr("selected", "selected");
		// 병역사항:계급
		$("#militaryserviceLevel").val("${resumeMilitaryservice.militaryserviceLevel}").attr("selected", "selected");
		
		// 대학교:구분
		<c:forEach var="resumeUniveristy" items="${resumeUniveristy}" varStatus="i">
			console.log("${resumeUniveristy.universityCategory}");
			$(".universityCategory").eq("${i.count-1}").val("${resumeUniveristy.universityCategory}").attr("selected", "selected");
		</c:forEach>
		
		// 대학교:복수, 부전공 유무
		<c:forEach var="resumeUniveristy" items="${resumeUniveristy}" varStatus="i">
			console.log("${resumeUniveristy.universityDmajorminor}");
			$(".universityDmajorminor").eq("${i.count-1}").val("${resumeUniveristy.universityDmajorminor}").attr("selected", "selected");
		</c:forEach>
		
		// 가족: 동거여부
		<c:forEach var="resumeFamily" items="${resumeFamily}" varStatus="i">
			console.log("${resumeFamily.familyCohabit}");
			$(".familyCohabit").eq("${i.count-1}").val("${resumeFamily.familyCohabit}").attr("selected", "selected");
		</c:forEach>
		
		// 어학: 회화구사수준
		<c:forEach var="resumeLanguage" items="${resumeLanguage}" varStatus="i">
			console.log("${resumeLanguage.languageLevel}");
			$(".languageLevel").eq("${i.count-1}").val("${resumeLanguage.languageLevel}").attr("selected", "selected");
		</c:forEach>
		
		// 리스트값들을 어떻게 가져올것인지 고민(대학교구분,복수전공유무/가족동거여부/어학회화수준)
		
		// 01 대학교 추가 및 삭제 start
		const $universityAddBtn = $('#universityAddBtn');
		$universityAddBtn.click(function(){
			univerNum++;
			$('#fieldUniversity').append(
				'<table class="university table table-striped table-bordered table-hover table-condensed">'+
					'<tr>'+
						'<th class="col-sm-3">분류</th>'+
						'<th class="col-sm-3">학교명</th>'+
						'<th class="col-sm-3">입학일자</th>'+
						'<th class="col-sm-3">졸업일자</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-3">'+
							'<select class="form-control universityCategory" name="resumeUniversityVoList['+univerNum+'].universityCategory">'+
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
							'<select class="form-control universityDmajorminor" name="resumeUniversityVoList['+univerNum+'].universityDmajorminor">'+
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
				if(univerNum > 0){
					univerNum--;
					$university.last().remove();	
				}
			
		});
		// 01 대학교 추가 및 삭제 end
		
		// 02 가족사항 추가 및 삭제 start
		const $familyAddBtn = $('#familyAddBtn');
		$familyAddBtn.click(function(){
			familyNum++;
			$('#fieldFamily').append(
				'<table class="family table table-striped table-bordered table-hover table-condensed">'+
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
							'<select class="form-control familyCohabit" name="resumeFamilyVoList['+familyNum+'].familyCohabit">'+
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
				if(familyNum > 0){
					familyNum--;
					$family.last().remove();	
				}
		});
		// 02 가족사항 추가 및 삭제 end
		
		// 03 자격증 추가 및 삭제 start
		const $certificateAddBtn = $('#certificateAddBtn');
		$certificateAddBtn.click(function(){
			certifiNum++;
			$('#fieldCertificate').append(
				'<table class="certificate table table-striped table-bordered table-hover table-condensed">'+
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
				if(certifiNum > 0){
					certifiNum--;
					$certificate.last().remove();
				}	
		});
		// 03 자격증 추가 및 삭제 end
		
		// 04 경력사항 추가 및 삭제 start
		const $careerAddBtn = $('#careerAddBtn');
		$careerAddBtn.click(function(){
			careerNum++;
			$('#fieldCareer').append(
				'<table class="career table table-striped table-bordered table-hover table-condensed">'+
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
				if(careerNum > 0){
					careerNum--;
					$career.last().remove();
				}
		});
		// 04 경력사항 추가 및 삭제 end
		
		// 05 어학능력 추가 및 삭제 start
		const $languageAddBtn = $('#languageAddBtn');
			$languageAddBtn.click(function(){
				langNum++;
				$('#fieldLanguage').append(
					'<table class="language table table-striped table-bordered table-hover table-condensed">'+
						'<tr>'+
							'<th class="col-sm-3">외국어명</th>'+
							'<th class="col-sm-3">회화구사수준</th>'+
							'<th class="col-sm-3">시험명</th>'+
							'<th class="col-sm-3">공인점수</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="languageName" name="resumeLanguageVoList['+langNum+'].languageName" placeholder="ex)영어, 중국어, 일본어"></td>'+
							'<td class="col-sm-3">'+
								'<select class="form-control languageLevel" name="resumeLanguageVoList['+langNum+'].languageLevel">'+
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
				if(langNum > 0){
					langNum--;
					$language.last().remove();
				}
		});
		// 05 어학능력 추가 및 삭제 end
		
		// 06 수상경력 추가 및 삭제 start
		const $awardAddBtn = $('#awardAddBtn');
			$awardAddBtn.click(function(){
				awardNum++;
				$('#fieldAward').append(
					'<table class="award table table-striped table-bordered table-hover table-condensed">'+
						'<tr>'+
							'<th class="col-sm-4">수상명</th>'+
							'<th class="col-sm-4">수상내용</th>'+
							'<th class="col-sm-3">수여기관</th>'+
							'<th class="col-sm-1">수상일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-4">'+
								'<input type="text" class="form-control" id="awardName" name="resumeAwardVoList['+awardNum+'].awardName" placeholder="수상명 입력">'+
							'</td>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="awardContent" name="resumeAwardVoList['+awardNum+'].awardContent" placeholder="수상내용 입력"></td>'+
							'<td class="col-sm-3"><input type="text" class="form-control" id="awardHost" name="resumeAwardVoList['+awardNum+'].awardHost" placeholder="수여기관 입력"></td>'+
							'<td class="col-sm-1"><input type="date" class="form-control" id="awardDate" name="resumeAwardVoList['+awardNum+'].awardDate" value="2016-11-02"></td>'+
						'</tr>'+
					'</table>'
				);
			});
		const $awardDelBtn = $('#awardDelBtn');
			$awardDelBtn.on('click', function(){
			const $award = $('.award');
				if(awardNum > 0){
					awardNum--;
					$award.last().remove();
				}
			});
		// 06 수상경력 추가 및 삭제 end
		
		// 07 국내외연수 추가 및 삭제 start
		const $trainingAddBtn = $('#trainingAddBtn');
			$trainingAddBtn.click(function(){
				trainingNum++;
				$('#fieldTraining').append(
					'<table class="training table table-striped table-bordered table-hover table-condensed">'+
						'<tr>'+
							'<th class="col-sm-4">국가</th>'+
							'<th class="col-sm-4">기관/단체</th>'+
							'<th class="col-sm-1">시작일자</th>'+
							'<th class="col-sm-1">수료일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="trainingCountry" name="resumeTrainingVoList['+trainingNum+'].trainingCountry" placeholder="ex) 대한민국, 중국, 미국"></td>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="trainingAcademy" name="resumeTrainingVoList['+trainingNum+'].trainingAcademy" placeholder="연수기관 입력"></td>'+
							'<td class="col-sm-1">'+
								'<input type="date" class="form-control" id="trainingBegindate" name="resumeTrainingVoList['+trainingNum+'].trainingBegindate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-1">'+
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
				if(trainingNum > 0){
					trainingNum--;
					$training.last().remove();
				}
			});
		// 07 국내외연수 추가 및 삭제 end
		
		// 08 동아리/동호회 추가 및 삭제 start
		const $clubAddBtn = $('#clubAddBtn');
			$clubAddBtn.click(function(){
				clubNum++;
				$('#fieldClub').append(
					'<table class="club table table-striped table-bordered table-hover table-condensed">'+
						'<tr>'+
							'<th class="col-sm-4">활동명</th>'+
							'<th class="col-sm-4">주관기관</th>'+
							'<th class="col-sm-1">시작일자</th>'+
							'<th class="col-sm-1">종료일자</th>'+
						'</tr>'+
						'<tr>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="clubName" name="resumeClubVoList['+clubNum+'].clubName" placeholder="동아리/활동명 입력"></td>'+
							'<td class="col-sm-4"><input type="text" class="form-control" id="clubHost" name="resumeClubVoList['+clubNum+'].clubHost" placeholder="주관기관 입력"></td>'+
							'<td class="col-sm-1">'+
								'<input type="date" class="form-control" id="clubBegindate" name="resumeClubVoList['+clubNum+'].clubBegindate" value="2016-11-02">'+
							'</td>'+
							'<td class="col-sm-1">'+
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
				if(clubNum > 0){
					clubNum--;
					$club.last().remove();
				}
			});
		// 08 동아리/동호회 추가 및 삭제 end
	
	});
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modHeader.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/resumecoverletter/module/modSideCommon.jsp" />
<body>
	<div id="wrapper">
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-10">
					<h1 class="page-header">${sessionScope.generalNick}의 이력서</h1>
					<form id="resumeAddForm" action="/resumeInsert" method="post" enctype="multipart/form-data">	
							<div class="row">
								<div class="col-sm-5">
									<p>이력서 이름을 반드시 입력해주세요</p>
									<input type="text" class="form-control" id="resumeName" name="resumeName" value="${resumeDetailInfo.resumeName}">
									<span id="resumeNameError" style="color: red"></span>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-2">
									<h4 align="center"><strong>증명사진</strong></h4>
									<table class="table table-striped table-bordered table-hover">
										<tr align="center">
											<td>
												<div class="fileinput fileinput-new" data-provides="fileinput">
								  					<div class="fileinput-preview thumbnail" id="personalPhotoName" data-trigger="fileinput" style=" width: 117px; height: 162px;">
								  					<span class="fileinput-filename"></span>
								  					</div>
								  					<div class="well well-sm">
								  						<i class="glyphicon glyphicon-picture fileinput-exists"></i>
								  						<span class="fileinput-filename"></span>
								  					</div>
								  					<div align="center">
								    					<span class="btn btn-default btn-file">
								    						<span class="fileinput-new">사진선택</span>
									    					<span class="fileinput-exists">변경</span>
								    					<input type="file" name="personalPhotoFile" value="${resumePersonal.personalPhotoName}"></span>
								    					<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">삭제</a>
								  					</div>
								  				</div>
											</td>
										</tr>
									</table>
								</div>
								<div class="col-sm-10">
									<h4><strong>개인신상정보</strong></h4>
									<table class="table table-striped table-bordered table-hover">
										<tr>
											<th class="col-sm-3">한글이름</th>
											<th class="col-sm-3">영문이름</th>
											<th class="col-sm-3">성별</th>
											<th class="col-sm-3">생년월일</th>
										</tr>
										<tr>
											<td class="col-sm-3"><input type="text" class="form-control" id="personalKorName" name="personalKorname" value="${resumePersonal.personalKorname}"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personalEngName" name="personalEngname" value="${resumePersonal.personalEngname}"></td>
											<td class="col-sm-3">
												<select class="form-control" id="personlGender" name="personalGender" value="${resumePersonal.personalGender}">
													<option value="">선택</option>
													<option value="남자">남자</option>
													<option value="여자">여자</option>
												</select>
											</td>
											<td class="col-sm-3"><input type="date" class="form-control" id="personlBirthdate" name="personalBirthdate" value="${resumePersonal.personalBirthdate}"></td>
										</tr>
										<tr>
											<th class="col-sm-3">일반전화</th>
											<th class="col-sm-3">휴대전화</th>
											<th class="col-sm-3">이메일</th>
											<th class="col-sm-3">SNS</th>
										</tr>
										<tr>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlPhone" name="personalPhone" data-mask="999-9999-9999" value="${resumePersonal.personalPhone}"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlCellphone" name="personalCellphone" data-mask="999-9999-9999" value="${resumePersonal.personalCellphone}"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlEmail" name="personalEmail" value="${resumePersonal.personalEmail}"></td>
											<td class="col-sm-3"><input type="text" class="form-control" id="personlSns" name="personalSns" value="${resumePersonal.personalSns}"></td>
										</tr>
										<tr>
											<th colspan="12">주소</th>
										</tr>
										<tr>
											<td colspan="12"><input type="text" class="form-control" id="personlAddr" name="personalAddr" value="${resumePersonal.personalAddr}"></td>
										</tr>
									</table>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>고등학교</strong></h4>
									<table class="table table-striped table-bordered table-hover table-condensed">
										<tr>
											<th class="col-sm-3">학교명</th>
											<th class="col-sm-3">분류</th>
											<th class="col-sm-3">입학일자</th>
											<th class="col-sm-3">졸업일자</th>
										</tr>
										<tr>
											<td class="col-sm-3"><input type="text" class="form-control" id="highschoolName" name="highschoolName" value="${resumeHighschool.highschoolName}"></td>
											<td class="col-sm-3">
												<select class="form-control" class="form-control" id="highschoolCategory" name="highschoolCategory" value="${resumeHighschool.highschoolCategory}">
													<option value="">::선택::</option>
													<option value="문과">문과</option>
													<option value="이과">이과</option>
													<option value="전문(실업)계">전문(실업)계</option>
													<option value="예체능">예체능</option>
												</select>
											</td>
											<td class="col-sm-3"><input type="date" class="form-control" id="highschoolBegindate" name="highschoolBegindate" value="${resumeHighschool.highschoolBegindate}"></td>
											<td class="col-sm-3"><input type="date" class="form-control" id="highschoolEnddate" name="highschoolEnddate" value="${resumeHighschool.highschoolEnddate}"></td>
										</tr>	
									</table>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>대학교</strong></h4>
									<c:forEach var="resumeUniveristy" items="${resumeUniveristy}" varStatus="i">
									<div class="university">
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-3">분류</th>
												<th class="col-sm-3">학교명</th>
												<th class="col-sm-3">입학일자</th>
												<th class="col-sm-3">졸업일자</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<select class="form-control universityCategory" name="resumeUniversityVoList[${i.count-1}].universityCategory" value="${resumeUniveristy.universityCategory}">
														<option value="">선택</option>
														<option value="2년제">2년제</option>
														<option value="3년제">3년제</option>
														<option value="4년제">4년제</option>
														<option value="대학원">대학원</option>
													</select>
												</td>
												<td class="col-sm-3"><input type="text" class="form-control" id="universityName" name="resumeUniversityVoList[${i.count-1}].universityName" value="${resumeUniveristy.universityName}"></td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="universityBegindate" name="resumeUniversityVoList[${i.count-1}].universityBegindate" value="${resumeUniveristy.universityBegindate}">
												</td>
												<td class="col-sm-3">	
													<input type="date" class="form-control" id="universityEnddate" name="resumeUniversityVoList[${i.count-1}].universityEnddate" value="${resumeUniveristy.universityEnddate}">
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
													<input type="text" class="form-control" id="universityMajor" name="resumeUniversityVoList[${i.count-1}].universityMajor" value="${resumeUniveristy.universityMajor}">
												</td>
												<td class="col-sm-3">
													<select class="form-control universityDmajorminor" name="resumeUniversityVoList[${i.count-1}].universityDmajorminor" value="${resumeUniveristy.universityDmajorminor}">
														<option value="">선택</option>
														<option value="해당없음">해당없음</option>
														<option value="복수전공">복수전공</option>
														<option value="부전공">부전공</option>
													</select>
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="universityDmajorminorName" name="resumeUniversityVoList[${i.count-1}].universityDmajorminorName" value="${resumeUniveristy.universityDmajorminorName}">
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="universityCredit" name="resumeUniversityVoList[${i.count-1}].universityCredit" value="${resumeUniveristy.universityCredit}">
												</td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldUniversity"></div>
									<div class="btn-group" role="group">
										<button type="button" id="universityAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="universityDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>	
								</div>
							</div>
							<hr>
							<div class="row" >
								<div class="col-sm-12">
								<h4><strong>가족사항</strong></h4>
									<c:forEach var="resumeFamily" items="${resumeFamily}" varStatus="i">
									<div class="family">
										<table class="table table-striped table-bordered table-hover table-condensed">
												<tr>
													<th class="col-sm-2">관계</th>
													<th class="col-sm-2">이름</th>
													<th class="col-sm-2">생년월일</th>
													<th class="col-sm-2">학력</th>
													<th class="col-sm-2">직업</th>
													<th class="col-sm-2">동거여부</th>
												</tr>
												<tr>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyRelation" name="resumeFamilyVoList[${i.count-1}].familyRelation" value="${resumeFamily.familyRelation}"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyName" name="resumeFamilyVoList[${i.count-1}].familyName" value="${resumeFamily.familyName}"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="familyBirthdate" name="resumeFamilyVoList[${i.count-1}].familyBirthdate" value="${resumeFamily.familyBirthdate}"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyEducation" name="resumeFamilyVoList[${i.count-1}].familyEducation" value="${resumeFamily.familyEducation}"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="familyJob" name="resumeFamilyVoList[${i.count-1}].familyJob" value="${resumeFamily.familyJob}"></td>
													<td class="col-sm-2">
														<select class="form-control familyCohabit" name="resumeFamilyVoList[${i.count-1}].familyCohabit" value="${resumeFamily.familyCohabit}">
															<option value="">::선택::</option>
															<option value="예">예</option>
															<option value="아니요">아니요</option>
														</select>
													</td>	
												</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldFamily"></div>
									<div class="btn-group" role="group">
										<button type="button" id="familyAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="familyDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>	
								</div>
							</div>
							<hr>	
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>병역사항</strong></h4>
									<table class="table table-striped table-bordered table-hover table-condensed">
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
												<select class="form-control" id="militaryserviceState" name="militaryserviceState" value="${resumeMilitaryservice.militaryserviceState}">
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
												<select class="form-control" id="militaryserviceGroup" name="militaryserviceGroup" value="${resumeMilitaryservice.militaryserviceGroup}">
													<option value="">::선택::</option>
													<option value="육군">육군</option>
													<option value="공군">공군</option>
													<option value="해군">해군</option>
													<option value="기타">기타</option>
												</select>
											</td>
											<td class="col-sm-2">
												<select class="form-control" id="militaryserviceLevel" name="militaryserviceLevel" value="${resumeMilitaryservice.militaryserviceLevel}">
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
												<input type="text" class="form-control" id="militaryserviceBranch" name="militaryserviceBranch" value="${resumeMilitaryservice.militaryserviceBranch}">
											</td>
											<td class="col-sm-2"><input type="date" class="form-control" id="militaryserviceBegindate" name="militaryserviceBegindate" value="${resumeMilitaryservice.militaryserviceBegindate}"></td>
											<td class="col-sm-2"><input type="date" class="form-control" id="militaryserviceEnddate" name="militaryserviceEnddate" value="${resumeMilitaryservice.militaryserviceEnddate}"></td>
										</tr>	
									</table>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>자격증</strong></h4>
									<c:forEach var="resumeCertificate" items="${resumeCertificate}" varStatus="i">
									<div class="certificate">
										<table class="table table-striped table-bordered table-hover table-condensed">
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
														<input type="text" class="form-control" id="certificateName" name="resumeCertificateVoList[${i.count-1}].certificateName" value="${resumeCertificate.certificateName}">
														<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
													</td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateGrade" name="resumeCertificateVoList[${i.count-1}].certificateGrade" value="${resumeCertificate.certificateName}"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateRegnum" name="resumeCertificateVoList[${i.count-1}].certificateRegnum" value="${resumeCertificate.certificateRegnum}"></td>
													<td class="col-sm-2"><input type="text" class="form-control" id="certificateHost" name="resumeCertificateVoList[${i.count-1}].certificateHost" value="${resumeCertificate.certificateHost}"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="certificateBegindate" name="resumeCertificateVoList[${i.count-1}].certificateBegindate" value="${resumeCertificate.certificateBegindate}"></td>
													<td class="col-sm-2"><input type="date" class="form-control" id="certificateEnddate" name="resumeCertificateVoList[${i.count-1}].certificateEnddate" value="${resumeCertificate.certificateEnddate}"></td>
												</tr>	
										</table>
									</div>
									</c:forEach>
									<div id="fieldCertificate"></div>
									<div class="btn-group" role="group">
										<button type="button" id="certificateAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="certificateDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>	
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>경력사항</strong></h4>
									<c:forEach var="resumeCareer" items="${resumeCareer}" varStatus="i">
									<div class="career">
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-2">회사명</th>
												<th class="col-sm-2">직급</th>
												<th class="col-sm-2">부서</th>
												<th class="col-sm-2">입사일자</th>
												<th class="col-sm-2">퇴사일자</th>
												<th class="col-sm-2">근무기간</th>
											</tr>
											<tr>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerCompany" name="resumeCareerVoList[${i.count-1}].careerCompany" value="${resumeCareer.careerCompany}"></td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerLevel" name="resumeCareerVoList[${i.count-1}].careerLevel" value="${resumeCareer.careerLevel}"></td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerDepartment" name="resumeCareerVoList[${i.count-1}].careerDepartment" value="${resumeCareer.careerDepartment}"></td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="careerBegindate" name="resumeCareerVoList[${i.count-1}].careerBegindate" value="${resumeCareer.careerBegindate}">
												</td>
												<td class="col-sm-2">
													<input type="date" class="form-control" id="careerEnddate" name="resumeCareerVoList[${i.count-1}].careerEnddate" value="${resumeCareer.careerEnddate}">
												</td>
												<td class="col-sm-2"><input type="text" class="form-control" id="careerPeriod" name="resumeCareerVoList[${i.count-1}].careerPeriod" value="${resumeCareer.careerPeriod}"></td>
											</tr>
											<tr>
												<th colspan="2">퇴사사유</th>
												<th colspan="10">담당업무</th>
											</tr>
											<tr>	
												<td colspan="2"><input type="text" class="form-control" id="careerResign" name="resumeCareerVoList[${i.count-1}].careerResign" value="${resumeCareer.careerResign}"></td>
												<td colspan="10"><textarea class="form-control col-sm-5" rows="3" id="careerTask" name="resumeCareerVoList[${i.count-1}].careerTask" style="resize:none">${resumeCareer.careerTask}</textarea></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldCareer"></div>	
									<div class="btn-group" role="group">
										<button type="button" id="careerAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="careerDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>	
									<hr>
								</div>
							</div>	
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>어학능력</strong></h4>
									<c:forEach var="resumeLanguage" items="${resumeLanguage}" varStatus="i">
									<div class="language">
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-3">외국어명</th>
												<th class="col-sm-3">회화구사수준</th>
												<th class="col-sm-3">시험명</th>
												<th class="col-sm-3">공인점수</th>
											</tr>
											<tr>
												<td class="col-sm-3"><input type="text" class="form-control" id="languageName" name="resumeLanguageVoList[${i.count-1}].languageName" value="${resumeLanguage.languageName}"></td>
												<td class="col-sm-3">
													<select class="form-control languageLevel" name="resumeLanguageVoList[${i.count-1}].languageLevel" value="${resumeLanguage.languageLevel}">
														<option value="">::선택::</option>
														<option value="기초회화">기초회화</option>
														<option value="일상회화">일상회화</option>
														<option value="비지니스회화">비지니스회화</option>
														<option value="원어민수준">원어민수준</option>
													</select>
												</td>	
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageTest" name="resumeLanguageVoList[${i.count-1}].languageTest" value="${resumeLanguage.languageTest}">
													<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
												</td>	
												<td class="col-sm-3"><input type="text" class="form-control" id="languageGrade" name="resumeLanguageVoList[${i.count-1}].languageGrade" value="${resumeLanguage.languageGrade}"></td>
											</tr>
											<tr>
												<th class="col-sm-3">취득일자</th>
												<th class="col-sm-3">만료일자</th>
												<th class="col-sm-3">시행기관</th>
												<th class="col-sm-3">등록번호</th>
											</tr>
											<tr>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="languageBegindate" name="resumeLanguageVoList[${i.count-1}].languageBegindate" value="${resumeLanguage.languageBegindate}">
												</td>
												<td class="col-sm-3">
													<input type="date" class="form-control" id="languageEnddate" name="resumeLanguageVoList[${i.count-1}].languageEnddate" value="${resumeLanguage.languageEnddate}">
												</td>
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageHost" name="resumeLanguageVoList[${i.count-1}].languageHost" value="${resumeLanguage.languageHost}">
												</td>	
												<td class="col-sm-3">
													<input type="text" class="form-control" id="languageRegnum" name="resumeLanguageVoList[${i.count-1}].languageRegnum" value="${resumeLanguage.languageRegnum}">
												</td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldLanguage"></div>
									<div class="btn-group" role="group">
										<button type="button" id="languageAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="languageDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>
									<hr>	
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>수상경력</strong></h4>
									<c:forEach var="resumeAward" items="${resumeAward}" varStatus="i">
									<div class="award">
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-4">수상명</th>
												<th class="col-sm-4">수상내용</th>
												<th class="col-sm-3">수여기관</th>
												<th class="col-sm-1">수상일자</th>
											</tr>
											<tr>
												<td class="col-sm-4">
													<input type="text" class="form-control" id="awardName" name="resumeAwardVoList[${i.count-1}].awardName" value="${resumeAward.awardName}">
												</td>
												<td class="col-sm-4"><input type="text" class="form-control" id="awardContent" name="resumeAwardVoList[${i.count-1}].awardContent" value="${resumeAward.awardContent}"></td>
												<td class="col-sm-3"><input type="text" class="form-control" id="awardHost" name="resumeAwardVoList[${i.count-1}].awardHost" value="${resumeAward.awardHost}"></td>
												<td class="col-sm-1"><input type="date" class="form-control" id="awardDate" name="resumeAwardVoList[${i.count-1}].awardDate" value="${resumeAward.awardDate}"></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldAward"></div>
									<div class="btn-group" role="group">
										<button type="button" id="awardAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="awardDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>
									<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>국내외 연수 및 교육</strong></h4>
									<c:forEach var="resumeTraining" items="${resumeTraining}" varStatus="i">	
									<div class="training">	
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-4">국가</th>
												<th class="col-sm-4">기관/단체</th>
												<th class="col-sm-1">시작일자</th>
												<th class="col-sm-1">수료일자</th>
											</tr>
											<tr>
												<td class="col-sm-4"><input type="text" class="form-control" id="trainingCountry" name="resumeTrainingVoList[${i.count-1}].trainingCountry" value="${resumeTraining.trainingCountry}"></td>	
												<td class="col-sm-4"><input type="text" class="form-control" id="trainingAcademy" name="resumeTrainingVoList[${i.count-1}].trainingAcademy" value="${resumeTraining.trainingAcademy}"></td>
												<td class="col-sm-1">
													<input type="date" class="form-control" id="trainingBegindate" name="resumeTrainingVoList[${i.count-1}].trainingBegindate" value="${resumeTraining.trainingBegindate}">
												</td>
												<td class="col-sm-1">
													<input type="date" class="form-control" id="trainingEnddate" name="resumeTrainingVoList[${i.count-1}].trainingEnddate" value="${resumeTraining.trainingEnddate}">
												</td>
											</tr>
											<tr>
												<th colspan="12">연수내용</th>
											<tr>
												<td colspan="12"><textarea class="form-control col-sm-5" rows="2" id="trainingContent" name="resumeTrainingVoList[${i.count-1}].trainingContent" style="resize:none" placeholder="연수사항에 대한 간략한 설명">${resumeTraining.trainingContent}</textarea></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldTraining"></div>
									<div class="btn-group" role="group">
										<button type="button" id="trainingAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="trainingDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>
									<hr>	
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>동아리(동호회) 및 대외활동</strong></h4>
									<c:forEach var="resumeClub" items="${resumeClub}" varStatus="i">
									<div class="club">	
										<table class="table table-striped table-bordered table-hover table-condensed">
											<tr>
												<th class="col-sm-5">활동명</th>
												<th class="col-sm-5">주관기관</th>
												<th class="col-sm-1">시작일자</th>
												<th class="col-sm-1">종료일자</th>
											</tr>
											<tr>
												<td class="col-sm-5"><input type="text" class="form-control" id="clubName" name="resumeClubVoList[${i.count-1}].clubName" placeholder="동아리/활동명 입력" value="${resumeClub.clubName}"></td>	
												<td class="col-sm-5"><input type="text" class="form-control" id="clubHost" name="resumeClubVoList[${i.count-1}].clubHost" placeholder="주관기관 입력" value="${resumeClub.clubHost}"></td>
												<td class="col-sm-1">
													<input type="date" class="form-control" id="clubBegindate" name="resumeClubVoList[${i.count-1}].clubBegindate" value="${resumeClub.clubBegindate}">
												</td>
												<td class="col-sm-1">
													<input type="date" class="form-control" id="clubEnddate" name="resumeClubVoList[${i.count-1}].clubEnddate" value="${resumeClub.clubEnddate}">
												</td>
											</tr>
											<tr>
												<th colspan="8">활동내용</th>
											</tr>
											<tr>
												<td colspan="8"><textarea class="form-control col-sm-5" rows="2" id="clubContent" name="resumeClubVoList[${i.count-1}].clubContent" style="resize:none" placeholder="활동내용 대한 간략한 설명">${resumeClub.clubContent}</textarea></td>
											</tr>
										</table>
									</div>
									</c:forEach>
									<div id="fieldClub"></div>
									<div class="btn-group" role="group">
										<button type="button" id="clubAddBtn" class="btn btn-primary btn-xs"><i class="fa fa-plus"> 추가</i></button>
										<button type="button" id="clubDelBtn" class="btn btn-default btn-xs"><i class="fa fa-minus"> 삭제</i></button>
									</div>
									<hr>	
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<h4><strong>기타 및 포트폴리오</strong></h4>
									<table class="table table-striped table-bordered table-hover table-condensed">
										<tr>
											<th class="col-sm-4">포트폴리오 및 기타사항</th>
											<th class="col-sm-1">시작일자</th>
											<th class="col-sm-1">종료일자</th>
											<th class="col-sm-6">내용</th>
										</tr>
										<tr>
											<td class="col-sm-4"><input type="text" class="form-control" id="etcTitle" name="etcTitle" placeholder="기타 및 포트폴리오명 입력" value="${resumeEtc.etcTitle}"></td>
											<td class="col-sm-1">
												<input type="date" class="form-control" id="etcBegindate" name="etcBegindate" value="${resumeEtc.etcBegindate}">
											</td>
											<td class="col-sm-1">
												<input type="date" class="form-control" id="etcEnddate" name="etcEnddate" value="${resumeEtc.etcEnddate}">
											</td>
											<td class="col-sm-6"><textarea class="form-control col-sm-5" rows="2" id="etcContent" name="etcContent" style="resize:none" placeholder="포트폴리오를 첨부 하실 분은 간략한 설명한 설명 입력해주세요">${resumeEtc.etcContent}</textarea></td>
										</tr>
										<tr>
											
											<th colspan="8">첨부파일</th>
										</tr>
										<tr>
											<td colspan="8">
												<div class="col-sm-7 fileinput fileinput-new input-group" data-provides="fileinput">
			  										<div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> 
			  											<span class="fileinput-filename"></span>
			  										</div>
				  										<span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">파일선택</span>
				  										<span class="fileinput-exists">변경</span>
				  										<input type="file" name="etcFile">
				  										</span>
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
