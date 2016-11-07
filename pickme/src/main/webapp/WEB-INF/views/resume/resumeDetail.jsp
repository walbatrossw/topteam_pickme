<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PICKME 이력서 상세보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../common/module/modHeader.jsp"/>
	<div class="container">
		<div class="jumbotron">
		<h1>나의 이력서</h1>
			<p><strong>Pick Me</strong>는 절대 사용자 동의 없이 입력하신 정보를 외부로 유출,공개하지 않습니다.</p>
			<p>작성하신 이력서를 편집하여 PDF로 저장하시거나, 출력하실 수 있습니다.</p>
			<a class="btn btn-primary btn-lg" href="/resumePdf" role="button">PDF</a>
			<a class="btn btn-primary btn-lg" href="/resumePrint" role="button">프린트하러가기</a>
		</div>	
		<div class="row">
			<div class="row col-sm-5">
				<div><h3>나의 이력서</h3></div>
				<div><a href="/resumeList">목록보기</a></div>
				<div><a href="/resumeUpdate">수정하기</a></div>
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
						<td class="col-sm-3">${resumeDetail.personalKorname}</td>
						<td class="col-sm-3">${resumeDetail.personalEngname}</td>
						<td class="col-sm-3">${resumeDetail.personalGender}</td>
						<td class="col-sm-3">${resumeDetail.personalBirthdate}</td>
					</tr>
					<tr>
						<th class="col-sm-3">일반전화</th>
						<th class="col-sm-3">휴대전화</th>
						<th class="col-sm-3">이메일</th>
						<th class="col-sm-3">SNS</th>
					</tr>
					<tr>
						<td class="col-sm-3">${resumeDetail.personalPhone}</td>
						<td class="col-sm-3">${resumeDetail.personalCellphone}</td>
						<td class="col-sm-3">${resumeDetail.personalEmail}</td>
						<td class="col-sm-3">${resumeDetail.personalSns}</td>
					</tr>
					<tr>
						<th colspan="12">주소</th>
					</tr>
					<tr>
						<td colspan="12">${resumeDetail.personalAddr}</td>
					</tr>
				</table>
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
							<td class="col-sm-3">${resumeDetail.universityName}</td>
							<td class="col-sm-3">${resumeDetail.universityCategory}</td>
							<td class="col-sm-3">${resumeDetail.universityBegindate}</td>
							<td class="col-sm-3">${resumeDetail.universityEnddate}</td>
						</tr>	
					</table>
				</div>
			</div>
		</div>
	</div>		
	<jsp:include page="../common/module/modFooter.jsp"/>
</body>
</html>
