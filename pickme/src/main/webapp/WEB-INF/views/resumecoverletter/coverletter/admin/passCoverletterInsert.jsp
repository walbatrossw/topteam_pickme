<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>채용기업리스트</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/admin/style.css">

</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp" />
<body>
	<section id="main" class="column">
		<div class="container">
			<div class="jumbotron">
				<h2>합격자기소개서 입력</h2>
				<p>합격 자기소개서명, 채용 기업, 채용 상세직무를 정확히 기입해주세요</p>
			</div>
			<form id="passCoverletterInsertForm" action="/passCoverletterInsert"  method="post">
			<div class="form-group" id="the-basics">
				<table class="table table-bordered table-hover table-responsive">
					<tr>
						<th class="col-sm-3">합격 자기소개서 이름</th>
						<th class="col-sm-3">채용기업</th>
						<th class="col-sm-3">채용 상세직무</th>
					</tr>
					<tr>
						<td class="col-sm-3">
							<input type="text" class="form-control" name="passCletterName" id="passCletterName" placeholder="합격 자기소개서 이름">
						</td>
						<td class="col-sm-3">
							<input type="text" class="form-control" name="companyName" id="companyName" placeholder="채용기업 입력">
						</td>
						<td class="col-sm-3">
							<input type="text" class="form-control" name="companyName" id="companyName" placeholder="채용 상세직무 입력">
						</td>
					</tr>
				</table>
				<table class="table table-bordered table-hover table-responsive">
					<tr>
						<th>합격 자기소개서 내용</th>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" rows="25" cols="16" name="passCletterContent" placeholder="합격 자기소개서 내용을 입력해주세요"></textarea>
						</td>
					</tr>
				</table>
			</div>
			<button type="submit" class="btn btn-primary btn-sm" id="passCoverletterAddBtn"><i class="fa fa-save"></i>  합격자소서 입력</button>
			</form>
		</div>
	</section>	
</body>
</html>
