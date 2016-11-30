<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companySalary.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<!-- <script>
	$(document).ready(function(){
		const $tablehover = $('.tablehover');
		$tablehover.click(function(){
			location.href = 
		});
	});
</script> -->
<title>관리자 승인페이지(기업리뷰)</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>
	<section id="main" class="column">
		<div class="container">
			<div class="jumbotron text-center">
				<h1>연봉정보 미승인 리스트</h1>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered tablesorter">
					<thead>
						<tr>
							<th>번호</th>
							<th>기업이름</th>
							<th>작성자</th>
							<th>직급</th>
							<th>연봉</th>
							<th>등록일</th>
							<th>승인상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="companySalaryList" items="${salaryUnreceivedMap.interviewListUnreceived}" varStatus="i">
							<tr class="tablehover" onClick="location.href='/salary/companySalaryUnreceivedDetail?salaryCd=${companySalaryList.salaryCd}'">
								<c:if test="${page > 1}">
									<td>${i.count + (page-1) * 5}</td>
								</c:if>
								<c:if test="${page <= 1}">
									<td>${i.count}</td>
								</c:if>
								<td>${companySalaryList.companyName }</td>
								<td>${companySalaryList.loginId }</td>
								<td>${companySalaryList.salaryWorklevel }</td>
								<td>${companySalaryList.salaryBasepay } 만원</td>
								<td>${companySalaryList.salaryRegDate }</td>
								<td>미승인</td>
							</tr>				
						</c:forEach>
					</tbody>
				</table>	
			</div>
			<!-- 페이징 -->
			<div>
				<ul class="pager">
					<li class="previous"><a href="/salary/companySalarywUnreceivedList?page=${page-1}">이전</a><li>
					<c:forEach var="i" begin="${salaryUnreceivedMap.startPage }" end="${salaryUnreceivedMap.endPage }">
						<c:if test="${page == i}">
							<li class="active"><a href="/salary/companySalarywUnreceivedList?page=${i }">${i }</a><li>
						</c:if>
						<c:if test="${page != i}">
							<li><a href="/salary/companySalarywUnreceivedList?page=${i }">${i }</a></li>
						</c:if>
					</c:forEach>
					<li class="next"><a href="/salary/companySalarywUnreceivedList?page=${page+1}">다음</a></li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>