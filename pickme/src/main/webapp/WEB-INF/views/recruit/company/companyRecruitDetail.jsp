<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
<div class="container">

	<h3>기업정보</h3> 
	<table class="table table-striped">
		<thead>
			<tr>
				<td>
					채용기업
				</td>
				<td>
					채용기간
				</td>
				<td>
					홈페이지
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<label>${recruitCompanyInfoForDetail[0].companyName}</label>
				</td>
				<td>
					${fn:substring(recruitCompanyInfoForDetail[0].recruitBegindate,0,10)}~
					${fn:substring(recruitCompanyInfoForDetail[0].recruitEnddate,0,10)}
				</td>
				<td>
					<a href="${recruitCompanyInfoForDetail[0].companySite}">홈페이지바로가기 </a>
				</td>
			</tr>
		</tbody>	
	</table>

	<h3>상세직무</h3> 
	<table class="table table-striped">
		<thead>
			<tr>
				<td>
					채용직무
				</td>
				<td>
					채용형태
				</td>
				<td>
					자기소개서
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					${recruitCompanyInfoForDetail[0].jobDetail}
				</td>
				<td>
					${recruitCompanyInfoForDetail[0].workStatus}
				</td>
				<td>
					<a href="#">자기소개서쓰기</a>
				</td>
			</tr>
		</tbody>	
	</table>
	<div>
		<h3>채용공고</h3> 
		<img style="margin-left: auto; margin-right: auto; display: block;" src="/upload/recruitimg/${recruitCompanyInfoForDetail[0].recruitImgName}"/>
	</div>
</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>