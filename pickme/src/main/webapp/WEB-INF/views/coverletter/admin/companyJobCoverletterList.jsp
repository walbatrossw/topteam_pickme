<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용공고리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<body>
	<div class="container">
		<div class="jumbotron">
		 	<h2><strong>채용공고리스트</strong></h2>
			 	<p>만약 자신만의 자기소개서를 원하신다면 직접 작성을 눌러주세요!!!</p>
			 	<a class="btn btn-primary btn-lg" href="/memberCoverletterInsert" role="button">직접작성</a>
		</div>
		<div>
			<h3><strong>채용공고 선택하기</strong></h3>
			<div>
				<table class="table table-striped">
					<tr>
						<th>체크</th>
						<th>번호</th>
						<th>회사명</th>
						<th>직무대분류</th>
						<th>상세직무</th>
						<th>채용마감일</th>
						<th>채용형태</th>
						<th>문항</th>
						<th>공고</th>
					</tr>
					<c:forEach var="companyJobCoverletterList" items="${companyJobCoverletterList}" varStatus="i">
					<tr>
						<td><input type="checkbox"></td>
						<td>${i.count}</td>
						<td><a href="/memberCoverletterInsert?=recruitJobCd=${companyJobCoverletterList.recruitJobCd}">${companyJobCoverletterList.companyName}</a></td>
						<td>${companyJobCoverletterList.midindexName}</td>
						<td>${companyJobCoverletterList.recruitJobDetail}</td>
						<td>${companyJobCoverletterList.recruitEnddate}</td>
						<td>${companyJobCoverletterList.recruitJobWorkstatus}</td>
						<td><a href="/#">문항상세</a></td>
						<td><a href="/#">채용상세</a></td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>