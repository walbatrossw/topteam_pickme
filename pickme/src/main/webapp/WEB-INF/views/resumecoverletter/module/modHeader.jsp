<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

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
	    				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					    </button>
	   					<a class="navbar-brand" href="/"><img src="/img/main/pickme_logo_small.png" width="120px;"></a>
    				</div>
    				<div class="collapse navbar-collapse" id="myNavbar">
	    				<ul class="nav navbar-nav navbar-right">
	    					<li><a href="/diary">채용공고</a></li>
	      					<li><a class="dropdown-toggle" data-toggle="dropdown" href="/resumeCoverletterIndex">이력서 & 자기소개서 <span class="caret"></span></a>
	      						<ul class="dropdown-menu">
	      							<li><a href="/resumeCoverletterInfo">나의 정보</a></li>
						            <li><a href="/resumeList">나의 이력서 리스트</a></li>
						            <li><a href="/resumeInsert">이력서 새로 쓰기</a></li>
						            <li><a href="/memberCoverletterInsert?recruitJobCd=recruit_company_job_0001">새 자소서 쓰기</a></li>
						            <li><a href="/memberCoverletterList">내가 쓴 자소서</a></li>
						            <li><a href="/companyJobCoverletterList">채용기업 리스트</a></li>
						        </ul>
						    </li>
						    <li><a href="/freeboardList">자유게시판</a></li>
	      					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">기업정보 <span class="caret"></span></a>
	      						<ul class="dropdown-menu">
	      							<li><a href="/company/companyInfoList">기업정보</a></li>
						            <li><a href="/review/companyReviewListAllow">기업리뷰</a></li>
						            <li><a href="/salary/companySalaryListAllow">연봉정보</a></li>
						            <li><a href="/interview/companyInterviewListAllow">면접후기</a></li>
						        </ul>
	      					</li>	
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
  				</div>
			</nav>
		</section>
	</div>
</body>
</html>