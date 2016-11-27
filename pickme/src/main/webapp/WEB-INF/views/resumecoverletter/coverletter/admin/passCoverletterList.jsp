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
				<h2>합격자기소개서 리스트</h2>
			</div>
			<div class="form-group" id="the-basics">
				<table class="table table-bordered table-hover table-responsive">
					<tr>
						<th class="col-sm-1">번호</th>
						<th class="col-sm-3">합격 자기소개서 이름</th>
						<th class="col-sm-2">채용기업</th>
						<th class="col-sm-1">채용 상세직무</th>
						<th class="col-sm-1">수정</th>
						<th class="col-sm-1">삭제</th>
					</tr>
					<tr>
						<td class="col-sm-1">
						1
						</td>
						<td class="col-sm-3">
						2014년 상반기 삼성전자 대졸 공채
						</td>
						<td class="col-sm-2">
						삼성전자
						</td>
						<td class="col-sm-1">
						영업관리
						</td>
						<td class="col-sm-1">
						수정
						</td>
						<td class="col-sm-1">
						삭제
						</td>
					</tr>
					<tr>
						<td class="col-sm-1">
						2
						</td>
						<td class="col-sm-3">
						2014년 상반기 삼성전자 대졸 공채
						</td>
						<td class="col-sm-2">
						삼성전자
						</td>
						<td class="col-sm-1">
						연구개발
						</td>
						<td class="col-sm-1">
						수정
						</td>
						<td class="col-sm-1">
						삭제
						</td>
					</tr>
					<tr>
						<td class="col-sm-1">
						3
						</td>
						<td class="col-sm-3">
						2014년 상반기 삼성전자 대졸 공채
						</td>
						<td class="col-sm-2">
						삼성전자
						</td>
						<td class="col-sm-1">
						생산관리
						</td>
						<td class="col-sm-1">
						수정
						</td>
						<td class="col-sm-1">
						삭제
						</td>
					</tr>
					<tr>
						<td class="col-sm-1">
						4
						</td>
						<td class="col-sm-3">
						2015년 하반기 현대자동차 대졸 공채
						</td>
						<td class="col-sm-2">
						현대자동차
						</td>
						<td class="col-sm-1">
						마케팅부문
						</td>
						<td class="col-sm-1">
						수정
						</td>
						<td class="col-sm-1">
						삭제
						</td>
					</tr>
				</table>
			</div>
		</div>
	</section>	
</body>
</html>
