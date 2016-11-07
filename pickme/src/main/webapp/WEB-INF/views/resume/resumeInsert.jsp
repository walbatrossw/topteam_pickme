<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>이력서</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
var num = 0;
	$(document).ready(function(){
		const $addBtn = $('#addBtn');
		const $delBtn = $('#delBtn');
		
		$addBtn.click(function(){
			num++;
			$('#fieldFamily').append('<table class="family table table-striped">'+
					'<tr>'+
						'<th class="col-sm-2">관계</th>'+
						'<th class="col-sm-2">이름</th>'+
						'<th class="col-sm-2">생년월일</th>'+
						'<th class="col-sm-2">학력</th>'+
						'<th class="col-sm-2">직업</th>'+
						'<th class="col-sm-2">동거여부</th>'+
					'</tr>'+
					'<tr>'+
						'<td class="col-sm-2"><input type="text" class="form-control" name="resumeFamilyVoList['+num+'].familyRelation" placeholder="ex) 부, 모, 남동생, 여동생"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" name="resumeFamilyVoList['+num+'].familyName" placeholder="이름 입력"></td>'+
						'<td class="col-sm-2"><input type="date" class="form-control" name="resumeFamilyVoList['+num+'].familyBirthdate" value="2016-11-02"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyEducation" name="resumeFamilyVoList['+num+'].familyEducation" placeholder="ex) 고졸, 대졸, 대재"></td>'+
						'<td class="col-sm-2"><input type="text" class="form-control" id="familyJob" name="resumeFamilyVoList['+num+'].familyJob" placeholder="ex) 자영업, 회사원, 가사"></td>'+
						'<td class="col-sm-2">'+
							'<select class="form-control" id="familyCohabit" name="resumeFamilyVoList['+num+'].familyCohabit">'+
								'<option value="">::선택::</option>'+
								'<option value="예">예</option>'+
								'<option value="아니요">아니요</option>'+
							'</select>'+
						'</td>'+	
					'</tr>'+
			'</table>'
			);
		});
		
		$delBtn.on('click', function(){
			const $family = $('.family');
			console.log('aa');
			num--;
			$family.last().remove();
		});
		
		
	});

	//자격증 및 어학 검색 버튼 클릭시 팝업창띄우기
	function openPop() { 
	    window.open("/resumeCertilangIndex", "CertifiLang", "top=0, left=0, width=500, height=300, scrollbars=no, resizable=no ,status=no ,toolbar=no"); 
	}
	/* 갯수제한으로 할지 아니면 입력값을 다받을 경우만 추가 버튼이 활성화될지 고민중 */
	//동적DIV : 추가항목 생성,삭제 START 
	//01_01 대학교 추가
	function addDivUniversity(){
	    num++;
	    /* $('#fieldFamily').append( */
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('university').innerHTML;
		document.getElementById('fieldUniversity').appendChild(div);
	}
	//01_02 대학교 삭제
	function removeDivUniversity(obj){
		document.getElementById('fieldUniversity').removeChild(obj.parentNode);
	}
	//02_01 가족사항 추가
	function addDivFamily(){
		
		
	}
	//02_02 가족사항 삭제
	function removeDivFamily(){
		
	}
	//03_01 자격증 추가
	function addDivCertificate(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('certificate').innerHTML;
		document.getElementById('fieldCertificate').appendChild(div);
	}
	//03_02 자격증 삭제
	function removeDivCertificate(obj){
		document.getElementById('fieldCertificate').removeChild(obj.parentNode);
	}
	//04_01 경력사항 추가
	function addDivCareer(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('career').innerHTML;
		document.getElementById('fieldCareer').appendChild(div);
	}
	//04_02 경력사항 삭제
	function removeDivCareer(obj){
		document.getElementById('fieldCareer').removeChild(obj.parentNode);
	}
	//05_01 어학 추가
	function addDivLanguage(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('language').innerHTML;
		document.getElementById('fieldLanguage').appendChild(div);
	}
	//05_02 어학 삭제
	function removeDivLanguage(obj){
		document.getElementById('fieldLanguage').removeChild(obj.parentNode);
	}
	//06_01 수상경력 추가
	function addDivAward(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('award').innerHTML;
		document.getElementById('fieldAward').appendChild(div);
	}
	//06_02 수상경력 삭제
	function removeDivAward(obj){
		document.getElementById('fieldAward').removeChild(obj.parentNode);
	}
	//07_01 국내외연수 추가
	function addDivTraining(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('training').innerHTML;
		document.getElementById('fieldTraining').appendChild(div);
	}
	//07_02 수상경력 삭제
	function removeDivTraining(obj){
		document.getElementById('fieldTraining').removeChild(obj.parentNode);
	}
	//08_01 동아리 및 대외활동 추가
	function addDivClub(){
	    var div = document.createElement('div');
		div.innerHTML = document.getElementById('club').innerHTML;
		document.getElementById('fieldClub').appendChild(div);
	}
	//08_02 수상경력 삭제
	function removeDivClub(obj){
		document.getElementById('fieldClub').removeChild(obj.parentNode);
	}
	
	//동적DIV : 추가항목 생성,삭제 END
</script>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
	<div class="container">
		<div class="jumbotron">
			<h2>이력서</h2>
			<p><strong>Pick Me</strong>는 절대 사용자 동의 없이 입력하신 정보를 외부로 유출,공개하지 않습니다.</p>
		</div>
			<form id="resumeInsert" action="/resumeInsert" method="post" enctype="multipart/form-data">	
				<div class="row">
					<div class="col-sm-5">
						<h3>나의 이력서</h3>
						<input type="text" class="form-control" id="resumeName" name="resumeName" placeholder="이력서 이름을 입력해주세요">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-2">
						<h4 align="center">증명사진</h4>
						<table class="table table-striped">
							<tr>
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
						<table class="table table-striped">
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
						<table class="table table-striped">
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
						<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivUniversity()">
						<div id="university">
							<table class="table table-striped">
								<tr>
									<th class="col-sm-3">분류</th>
									<th class="col-sm-3">학교명</th>
									<th class="col-sm-3">입학일자</th>
									<th class="col-sm-3">졸업일자</th>
								</tr>
								<tr id="university">
									<td class="col-sm-3">
										<select class="form-control" id="universityCategory" name="universityCategory">
											<option value="">선택</option>
											<option value="2년제">2년제</option>
											<option value="3년제">3년제</option>
											<option value="4년제">4년제</option>
											<option value="대학원">대학원</option>
										</select>
									</td>
									<td class="col-sm-3"><input type="text" class="form-control" id="universityName" name="universityName" placeholder="ex)서울대학교"></td>
									<td class="col-sm-3">
										<input type="date" class="form-control" id="universityBegindate" name="universityBegindate" value="2016-11-02">
									</td>
									<td class="col-sm-3">	
										<input type="date" class="form-control" id="universityEnddate" name="universityEnddate" value="2016-11-02">
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
										<input type="text" class="form-control" id="universityMajor" name="universityMajor" placeholder="ex)영어영문학과">
									</td>
									<td class="col-sm-3">
										<select class="form-control" id="universityDmajorminor" name="universityDmajorminor">
											<option value="">선택</option>
											<option value="해당없음">해당없음</option>
											<option value="복수전공">복수전공</option>
											<option value="부전공">부전공</option>
										</select>
									</td>
									<td class="col-sm-3">
										<input type="text" class="form-control" id="universityDmajorminorName" name="universityDmajorminorName" placeholder="ex)경영학과">
									</td>
									<td class="col-sm-3">
										<input type="text" class="form-control" id="universityCredit" name="universityCredit" placeholder="ex) 3.1/4.5">
									</td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivUniversity(this)">
						</div>
						<div id="fieldUniversity"></div>
						<hr>	
					</div>
				</div>
				<div class="row" >
					<div class="col-sm-12">
					<h4>가족사항</h4>
					<input type="button" id="addBtn" class="btn btn-primary btn-xs" value="추가">
						<div id="family">
							<table class="table table-striped">
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
						<input type="button" id="delBtn" class="btn btn-defualt btn-xs" value="삭제">	
						<hr>
					</div>
				</div>	
				<div class="row">
					<div class="col-sm-12">
						<h4>병역사항</h4>
						<table class="table table-striped">
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
							<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivCertificate()">
						<div id="certificate">
							<table class="table table-striped">
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
											<input type="text" class="form-control" id="certificateName" name="certificateName" placeholder="ex)정보처리기사">
											<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
										</td>
										<td class="col-sm-2"><input type="text" class="form-control" id="certificateGrade" name="certificateGrade" placeholder="ex)1급, 1종, 최종합격"></td>
										<td class="col-sm-2"><input type="text" class="form-control" id="certificateRegnum" name="certificateRegnum" placeholder="등록번호 또는 자격번호 입력"></td>
										<td class="col-sm-2"><input type="text" class="form-control" id="certificateHost" name="certificateHost" placeholder="ex)한국산업인력공단"></td>
										<td class="col-sm-2"><input type="date" class="form-control" id="certificateBegindate" name="certificateBegindate" value="2016-11-02"></td>
										<td class="col-sm-2"><input type="date" class="form-control" id="certificateEnddate" name="certificateEnddate" value="2016-11-02"></td>
									</tr>	
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivCertificate(this)">
						</div>
						<div id="fieldCertificate"></div>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4>경력사항</h4>
							<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivCareer()">
						<div id="career">
							<table class="table table-striped">
								<tr>
									<th class="col-sm-2">회사명</th>
									<th class="col-sm-2">직급</th>
									<th class="col-sm-2">부서</th>
									<th class="col-sm-2">입사일자</th>
									<th class="col-sm-2">퇴사일자</th>
									<th class="col-sm-2">근무기간</th>
								</tr>
								<tr>
									<td class="col-sm-2"><input type="text" class="form-control" id="careerCompany" name="careerCompany" placeholder="회사 또는 근무처 입력"></td>
									<td class="col-sm-2"><input type="text" class="form-control" id="careerLevel" name="careerLevel" placeholder="ex) 대리, 인턴, 아르바이트 사원"></td>
									<td class="col-sm-2"><input type="text" class="form-control" id="careerDepartment" name="careerDepartment" placeholder="ex) 영업, 생산, 품질관리"></td>
									<td class="col-sm-2">
										<input type="date" class="form-control" id="careerBegindate" name="careerBegindate" value="2016-11-02">
									</td>
									<td class="col-sm-2">
										<input type="date" class="form-control" id="careerEnddate" name="careerEnddate" value="2016-11-02">
									</td>
									<td class="col-sm-2"><input type="text" class="form-control" id="careerPeriod" name="careerPeriod" placeholder="근무기간"></td>
								</tr>
								<tr>
									<th colspan="2">퇴사사유</th>
									<th colspan="10">담당업무</th>
								</tr>
								<tr>	
									<td colspan="2"><input type="text" class="form-control" id="careerResign" name="careerResign" placeholder="퇴사사유 입력"></td>
									<td colspan="10"><textarea class="form-control col-sm-5" rows="3" id="careerTask" name="careerTask" placeholder="담당업무에 대한 간략한 설명"></textarea></td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivCareer(this)">
						</div>
						<div id="fieldCareer"></div>
						<hr>
					</div>
				</div>	
				<div class="row">
					<div class="col-sm-12">
						<h4>어학능력</h4>
							<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivLanguage()">
						<div id="language">	
							<table class="table table-striped">
								<tr>
									<th class="col-sm-3">외국어명</th>
									<th class="col-sm-3">회화구사수준</th>
									<th class="col-sm-3">시험명</th>
									<th class="col-sm-3">공인점수</th>
								</tr>
								<tr>
									<td class="col-sm-3"><input type="text" class="form-control" id="languageName" name="languageName" placeholder="ex)영어, 중국어, 일본어"></td>
									<td class="col-sm-3">
										<select class="form-control" id="languageLevel" name="languageLevel">
											<option value="">::선택::</option>
											<option value="기초회화">기초회화</option>
											<option value="일상회화">일상회화</option>
											<option value="비지니스회화">비지니스회화</option>
											<option value="원어민수준">원어민수준</option>
										</select>
									</td>	
									<td class="col-sm-3">
										<input type="text" class="form-control" id="languageTest" name="languageTest" placeholder="ex) TOEIC, HSK, JLPT">
										<a class="btn btn-default btn-xs" href="javascript:openPop()" role="button">검색</a>
									</td>	
									<td class="col-sm-3"><input type="text" class="form-control" id="languageGrade" name="languageGrade" placeholder="ex) 990, 3급, AL"></td>
								</tr>
								<tr>
									<th class="col-sm-3">취득일자</th>
									<th class="col-sm-3">만료일자</th>
									<th class="col-sm-3">시행기관</th>
									<th class="col-sm-3">등록번호</th>
								</tr>
								<tr>
									<td class="col-sm-3">
										<input type="date" class="form-control" id="languageBegindate" name="languageBegindate" value="2016-11-02">
									</td>
									<td class="col-sm-3">
										<input type="date" class="form-control" id="languageEnddate" name="languageEnddate" value="2016-11-02">
									</td>
									<td class="col-sm-3">
										<input type="text" class="form-control" id="languageHost" name="languageHost" placeholder="ex) 한국토익위원회">
									</td>	
									<td class="col-sm-3">
										<input type="text" class="form-control" id="languageRegnum" name="languageRegnum" placeholder="등록번호 입력">
									</td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivLanguage(this)">
						</div>
						<div id="fieldLanguage"></div>
						<hr>	
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4>수상경력</h4>
							<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivAward()">
						<div id="award">
							<table class="table table-striped">
								<tr>
									<th class="col-sm-3">수상명</th>
									<th class="col-sm-4">수상내용</th>
									<th class="col-sm-3">수여기관</th>
									<th class="col-sm-2">수상일자</th>
								</tr>
								<tr>
									<td class="col-sm-3">
										<input type="text" class="form-control" id="awardName" name="awardName" placeholder="수상명 입력">
									</td>
									<td class="col-sm-4"><input type="text" class="form-control" id="awardContent" name="awardContent" placeholder="수상내용 입력"></td>
									<td class="col-sm-3"><input type="text" class="form-control" id="awardHost" name="awardHost" placeholder="수여기관 입력"></td>
									<td class="col-sm-2"><input type="date" class="form-control" id="awardDate" name="awardDate" value="2016-11-02"></td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivAward(this)">
						</div>
						<div id="fieldAward"></div>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4>국내외 연수 및 교육</h4>
							<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivTraining()">
						<div id="training">	
							<table class="table table-striped">
								<tr>
									<th class="col-sm-3">국가</th>
									<th class="col-sm-3">기관/단체</th>
									<th class="col-sm-3">시작일자</th>
									<th class="col-sm-3">수료일자</th>
								</tr>
								<tr>
									<td class="col-sm-3"><input type="text" class="form-control" id="trainingCountry" name="trainingCountry" placeholder="ex) 대한민국, 중국, 미국"></td>	
									<td class="col-sm-3"><input type="text" class="form-control" id="trainingAcademy" name="trainingAcademy" placeholder="연수기관 입력"></td>
									<td class="col-sm-3">
										<input type="date" class="form-control" id="trainingBegindate" name="trainingBegindate" value="2016-11-02">
									</td>
									<td class="col-sm-3">
										<input type="date" class="form-control" id="trainingEnddate" name="trainingEnddate" value="2016-11-02">
									</td>
								</tr>
								<tr>
									<th colspan="12">연수내용</th>
								<tr>
									<td colspan="12"><textarea class="form-control col-sm-5" rows="2" id="trainingContent" name="trainingContent" placeholder="연수사항에 대한 간략한 설명"></textarea></td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivTraining(this)">
						</div>
						<div id="fieldTraining"></div>
						<hr>	
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4>동아리(동호회) 및 대외활동</h4>
						<input type="button" class="btn btn-primary btn-xs" value="추가" onclick="addDivClub()">
						<div id="club">	
							<table class="table table-striped">
								<tr>
									<td class="col-sm-1">활동명</td>
									<td class="col-sm-2"><input type="text" class="form-control" id="clubName" name="clubName" placeholder="동아리/활동명 입력"></td>	
									<td class="col-sm-1">주관기관</td>
									<td class="col-sm-2"><input type="text" class="form-control" id="clubHost" name="clubHost" placeholder="주관기관 입력"></td>
									<td class="col-sm-1">시작일자</td>
									<td class="col-sm-2">
										<input type="date" class="form-control" id="clubBegindate" name="clubBegindate" value="2016-11-02">
									</td>
									<td class="col-sm-1">종료일자</td>
									<td class="col-sm-2">
										<input type="date" class="form-control" id="clubEnddate" name="clubEnddate" value="2016-11-02">
									</td>
								</tr>
								<tr>
									<td class="col-sm-1">활동내용</td>
									<td colspan="8"><textarea class="form-control col-sm-5" rows="2" id="clubContent" name="clubContent" placeholder="활동내용 대한 간략한 설명"></textarea></td>
								</tr>
							</table>
							<input type="button" class="btn btn-defualt btn-xs" value="삭제" onclick="removeDivClub(this)">
						</div>
						<div id="fieldClub"></div>
						<hr>	
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4>기타 및 포트폴리오</h4>
						<table class="table table-striped">
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
								<td class="col-sm-7"><textarea class="form-control col-sm-5" rows="2" id="etcContent" name="etcContent" placeholder="포트폴리오를 첨부 하실 분은 간략한 설명한 설명 입력해주세요"></textarea></td>
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
			<input type="submit" class="btn btn-primary btn" id="insertBtn" value="이력서 저장"/>
		</form>	
	</div>
	<jsp:include page="../common/module/modFooter.jsp"/>
</body>
</html>

