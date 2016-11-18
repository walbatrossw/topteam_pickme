<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8"/>
	<title>Dashboard I Admin Panel</title>
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/company/companyCommon.css">
	<link rel="stylesheet" href="/css/company/companyInterview.css">
	<link rel="stylesheet" href="/css/company/companyinfo.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>
	<section id="main" class="column">
		<div class="container">
			<div class="jumbotron text-center">
				<h1>관리자 페이지 메인 </h1>
			</div>	
			<!-- 관리자 페이지 추가할 내용은 이페이지를 복사해서 이안에 내용 삽입하시길 -->
		</div>
	</section>
</body>
</html>