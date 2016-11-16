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
$(document).ready(function(){
	$('#bookmark').change(function(){
		console.log("세션아이디 $('#sessionId').val()"+$('#sessionId').val());
		if($('#sessionId').val()==""||$('#sessionId').val()==null){
			location.href="/memberGeneralLogin";
			$('#sessionIdCheck').text('로그인시에만 이용가능한 기능입니다');
		}else{
			if ($('#bookmark').is(':checked')) {
				location.href="/recruitDetail?checked=checked&recruitCompanyCd="+$('#recruitCompanyCd').val();
				console.log($('#recruitCompanyCd').val());
	        }
	        else {
	        	location.href="/recruitDetail?checked=unchecked&recruitCompanyCd="+$('#recruitCompanyCd').val();
	        }
		}
	});
});
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
이예은
<div class="container">
 <a href="/recruitUpdateForm?recruitCompanyCd=${recruitCompanyInfoForDetail.recruitList[0].recruitCompanyCd}">수정</a>
	<h3>기업정보</h3> 
	세션 : ${sessionScope.id}
	<input type="hidden" id = "sessionId" value="${sessionScope.id}">
	<table class="table table-striped">
		<thead style="background-color: #7c9af9;font-weight: bolder;font-size: large;">
			<tr>
				<td class="col-sm-3">
					채용기업
				</td>
				<td class="col-sm-3">
					채용기간
				</td>
				<td class="col-sm-3">
					홈페이지
				</td>
				<td class="col-sm-3">
					북마크 등록
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="col-sm-3"><input type="hidden" id="recruitCompanyCd" value="${recruitCompanyInfoForDetail.recruitList[0].recruitCompanyCd}">
					<label>${recruitCompanyInfoForDetail.recruitList[0].companyName}</label>
				</td>
				<td class="col-sm-3">
					${fn:substring(recruitCompanyInfoForDetail.recruitList[0].recruitBegindate,0,10)}~
					${fn:substring(recruitCompanyInfoForDetail.recruitList[0].recruitEnddate,0,10)}
				</td>
				<td class="col-sm-3">
					<a href="${recruitCompanyInfoForDetail.recruitList[0].companySite}">홈페이지바로가기 </a>
				</td>
				<td class="col-sm-3">
					<c:if test="${checkBookmark=='checkBookmark'}">
						<input type ="checkbox" id="bookmark" name="bookmark" checked="checked">
					</c:if>
					<c:if test="${checkBookmark==null}">
						<input type ="checkbox" id="bookmark" name="bookmark">
					</c:if>
					<span id="sessionIdCheck"></span>
				</td>
			</tr>
		</tbody>	
	</table>

	<h3>상세직무</h3> 
	<table class="table table-striped">
		<thead style="background-color: #7c9af9;font-weight: bolder;font-size: large;">
			<tr>
				<td class="col-sm-3">
					채용직무
				</td>
				<td class="col-sm-3">
					채용형태
				</td>
				<td class="col-sm-3">
					자기소개서
				</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${recruitCompanyInfoForDetail.recruitList}" var="Detail">
				<tr>
					<td class="col-sm-3">
						${Detail.jobDetail}
					</td>
					<td class="col-sm-3">
						${Detail.workStatus}
					</td>
					<td class="col-sm-3">
						<a href="/memberCoverletterInsert?recruitJobCd=${Detail.recruitJobCd}">자기소개서쓰기</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
	<div>
		<h3>채용공고</h3> 
		<img style="margin-left: auto; margin-right: auto; display: block;" src="/upload/recruitimg/${recruitCompanyInfoForDetail.recruitList[0].recruitImgName}"/>
	</div>
</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>