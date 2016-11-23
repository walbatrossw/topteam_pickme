<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8"/>
<title>관리자 페이지</title>	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/admin/style.css">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>
	<section id="main" class="column">
		<div class="container">
			<div class="row title">
				<i class="fa fa-file-text"><strong>미승인 게시판</strong></i>
			</div>
			<div class="contens">
				<div class="row">
					<div class="col-xs-4">
						<div class="allowCheck">
							<div>
								<i class="fa fa-clipboard"></i><span class="badge">5</span>
							</div>
							<h3><a href="/review/companyReviewUnreceivedList"><strong>기</strong>업리뷰 미승인</a></h3>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="allowCheck">
							<div>
								<i class="fa fa-clipboard"></i><span class="badge">5</span>
							</div>
							<h3><a href="/interview/companyInterviewUnreceivedList"><strong>면</strong>접후기 미승인</a></h3>
						</div>
					</div>
					<div class="col-xs-4">
						<div class="allowCheck">
							<div>
								<i class="fa fa-clipboard"></i><span class="badge">5</span>
							</div>
							<h3><a href="/salary/companySalarywUnreceivedList"><strong>연</strong>봉정보 미승인</a></h3>
						</div>
					</div>
				</div>
			</div>	
			<!-- 관리자 페이지 추가할 내용은 이페이지를 복사해서 이안에 내용 삽입하시길 -->
		</div>
	</section>
</body>
</html>