<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/style.css">
<title>Insert title here</title>

</head>
<body>
	<div class="container">
		<section class="mainmenu">
			<nav class="navbar navbar-inverse navbar-fixed-top">
  				<div class="container-fluid">
    				<div class="navbar-header">
      					<a class="navbar-brand" href="/"><img src="/img/main/pickme_logo_small.png" width="120px;"></a>
    				</div>
    				<ul class="nav navbar-nav navbar-right">
    					<li><a href="/diary">채용공고</a></li>
      					<li><a href="/resumeCoverletterIndex">이력서 & 자기소개서</a></li>
      					<li><a href="/freeboardList">자유게시판</a></li>
      					<li><a href="/companyInfo">기업정보</a></li>
      					
      					
      					<li class="hiddenNavWrap">
      			    <c:if test="${empty sessionScope.generalId}">
      					<li><a href="/memberGeneralInsert">회원가입</a>
      				</c:if>
      				 <c:if test="${empty sessionScope.generalId}">
      					<li><a href="/memberGeneralLogin">로그인</a>
      				</c:if>	
      				<c:if test="${not empty sessionScope.generalId}">
      					<li><a href="/memberGeneralUpdate">내 정보</a></li>
      					<li><a href="/memberGeneralLogout">로그아웃</a></li>
      				     				
      				</c:if>	
      				</ul>
  				</div>
			</nav>
		</section>
	</div>
</body>
</html>