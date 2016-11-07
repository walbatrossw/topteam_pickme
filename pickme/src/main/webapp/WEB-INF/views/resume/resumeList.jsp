<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head><title>이력서</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<title>이력서 리스트</title>
</head>
<body>
	<jsp:include page="../common/module/modHeader.jsp"/>
	<div class="container">
		<div class="jumbotron">
		<h1>나의 이력서</h1>
			<p><strong>Pick Me</strong>는 절대 사용자 동의 없이 입력하신 정보를 외부로 유출,공개하지 않습니다.</p>
			<p>언제 어디서나 작성한 나의 이력서를 확인하고, 새로 작성하실 수 있습니다.</p>
			<a class="btn btn-primary btn-lg" href="/resumeInsert" role="button">이력서 작성하러가기</a>
		</div>
		<div class="table">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-sm-1">번호</th>
						<th class="col-sm-3">이력서이름</th>
						<th class="col-sm-2">작성자</th>
						<th class="col-sm-2">등록일</th>
						<th class="col-sm-2">수정일</th>
						<th class="col-sm-1">수정</th>
						<th class="col-sm-1">삭제</th>
					<tr>
				</thead>
				<tbody>
					<c:forEach var="resumeList" items="${resumeList}" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td><a href="/resumeDetail?resumeCd=${resumeList.resumeCd}">${resumeList.resumeName}</a></td>
							<td>${resumeList.loginId}</td>
							<td>${resumeList.resumeRegdate}</td>
							<td>${resumeList.resumeModidate}</td>
							<td class="rowlink-skip"><a href="#">수정</a></td>
							<td class="rowlink-skip"><a href="#">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>