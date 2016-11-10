<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자기소개서</title>
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
		 	<h2>자기소개서</h2>
			 	<p>여러분이 원하시는 기업의 채용공고를 검색하시거나, 선택하시려면 채용기업검색을 눌러주세요!!!</p>
			 	<p>만약 자신만의 자기소개서를 원하신다면 직접 작성을 눌러주세요!!!</p>
			 	<a class="btn btn-primary btn-lg" href="/companyJobCoverletterList" role="button">채용기업 검색하러가기(처리상태)</a>
			 	<a class="btn btn-primary btn-lg" href="/memberCoverletterInsert" role="button">직접 작성하러가기(미처리 상태)</a>
		</div>
		<div>
			<h3>내가 작성한 자기소개서(미처리 상태)</h3>
			<table class="table table-striped">
				<tr>
					<th>번호</th>
					<th>자소서이름</th>
					<th>아이디</th>
					<th>자소서등록시간</th>
					<th>자소서수정시간</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="memberCoverletterList" items="${memberCoverletterList}" varStatus="i">
				<tr>
					<td>${i.count}</td>
					<td><a href="/memberCoverletterArticleDetail?mCletterCd=${memberCoverletterList.mCletterCd}">${memberCoverletterList.mCletterName}</a></td>
					<td>${memberCoverletterList.loginId}</td>
					<td>${memberCoverletterList.mCletterRegdate}</td>
					<td>${memberCoverletterList.mCletterModidate}</td>
					<td class="rowlink-skip"><a href="/memberCoverletterArticleUpdate?mCletterCd=?${memberCoverletterList.mCletterCd}">수정</a></td>
					<td class="rowlink-skip"><a href="/memberCoverletterArticleDetail?mCletterCd=?${memberCoverletterList.mCletterCd}">삭제</a></td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>