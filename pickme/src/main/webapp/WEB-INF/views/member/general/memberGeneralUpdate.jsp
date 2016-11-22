<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- google chrome CDN Jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>회원정보보기</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<!-- 헤더 -->
		<%@ include file="/WEB-INF/views/common/module/modHeader.jsp" %>
		<h3>회원정보보기</h3>
		<form class="/memberGeneralUpdate" action="/member/general/memberGeneralUpdateForm" method="post">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${sessionScope.generalId}</td>
					
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="generalPw"  value="${MemberGeneralVo.generalPw}"></td>
					
					
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="generalNick"  value="${MemberGeneralVo.generalNick}"></td>
				</tr>
				
			</tbody>
		</table>
		<input type="button" value="내정보수정">
		
		<!-- 풋터 -->
		</form>
	</body>
</html>