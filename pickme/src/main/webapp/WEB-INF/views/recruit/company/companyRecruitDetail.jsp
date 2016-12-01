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
<!-- Custom Fonts -->
<link href="resumecoverlettersetting/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function(){
	$('#modalBookmark').change(function(){
		console.log("세션아이디 $('#sessionId').val()"+$('#sessionId').val());
		if($('#sessionId').val()==""||$('#sessionId').val()==null){
			alert("로그인시에만 이용가능한 기능입니다")
			location.href="/memberGeneralLogin";
		}else{
			if ($('#modalBookmark').is(':checked')) {
				location.href="/recruitDetail?checked=checked&recruitCompanyCd="+$('#recruitCompanyCd').val();
				console.log($('#recruitCompanyCd').val());
	        }
	        else {
	        	location.href="/recruitDetail?checked=unchecked&recruitCompanyCd="+$('#recruitCompanyCd').val();
	        }
		}
	});
	
	//부모 함수호출
	$('#recruitCompnay').click(function(){
		parent.recruitCompnay($('#recruitCompnay').val());
	});
	$('#resumeWrite').click(function(){
		parent.resumeWrite($('#resumeWrite').val());
	});
});
</script>
<title>채용상세보기</title>
</head>
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" /> --%>
<body>
<!-- <div class="container"> -->
<div id="wrapper">
<br>
<!-- <div style="float: right; width: 330px;"><button type="button"class="btn btn-default " data-dismiss="modal"><i class="fa fa-times"></i></button></div> -->
	<h3 style="color: orange">기업정보</h3>
	<input type="hidden" id = "sessionId" value="${sessionScope.generalId}">
	<table class="table table-striped" style="width: 850px">
		<thead style="background-color: #afafaf;font-weight: bolder;font-size: large;text-align:center;" >
			<tr>
				<td class="col-sm-3" >
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
		<tbody style=text-align:center;">
			<tr>
				<td class="col-sm-3"><input type="hidden" id="recruitCompanyCd" value="${recruitCompanyInfoForDetail.recruitList[0].recruitCompanyCd}">
				<input type="hidden" id="companyHidden" value="${recruitCompanyInfoForDetail.recruitList[0].companyName}">
				
				<%-- <label><a class="btn btn-default" href="/company/companyInfoDetail?companyName=${recruitCompanyInfoForDetail.recruitList[0].companyName}">${recruitCompanyInfoForDetail.recruitList[0].companyName}</a></label> --%>
				<label><button id="recruitCompnay" class="btn btn-default" value="${recruitCompanyInfoForDetail.recruitList[0].companyName}">${recruitCompanyInfoForDetail.recruitList[0].companyName}</button></label>
				</td>
				<td class="col-sm-3" width="30%">
					${fn:substring(recruitCompanyInfoForDetail.recruitList[0].recruitBegindate,0,10)}~
					${fn:substring(recruitCompanyInfoForDetail.recruitList[0].recruitEnddate,0,16)}
				</td>
				<td class="col-sm-3">
					<a href="${recruitCompanyInfoForDetail.recruitList[0].companySite}" target="_blank" class="btn btn-default">홈페이지바로가기 </a>
				</td>
				<td class="col-sm-3">
					<c:if test="${checkBookmark=='checkBookmark'}">
						<input type ="checkbox" id="modalBookmark" name="bookmark" checked="checked">
					</c:if>
					<c:if test="${checkBookmark==null}">
						<input type ="checkbox" id="modalBookmark" name="bookmark">
					</c:if>
					<span id="sessionIdCheck"></span>
				</td>
			</tr>
		</tbody>	
	</table>

	<h3 style="color: orange">상세직무</h3> 
	<table class="table table-striped" style="width: 850px">
		<thead style="background-color: #afafaf;font-weight: bolder;font-size: large; text-align:center;">
			<tr>
				<td >
					채용직무
				</td>
				<td >
					채용형태
				</td>
				<td >
					학력
				</td>
				<td >
					자기소개서
				</td>
				<td >
					작성수
				</td>
			</tr>
		</thead>
		<tbody style=text-align:center;">
			<c:forEach items="${recruitCompanyInfoForDetail.recruitList}" var="Detail">
				<tr>
					<td >
						${Detail.jobDetail}
					</td>
					<td >
						${Detail.workStatus}
					</td>
					<td >
						${Detail.edu}
					</td>
					<td >
						<%-- <a class="btn btn-default" href="/memberCoverletterInsert?recruitJobCd=${Detail.recruitJobCd}">자기소개서쓰기</a> --%>
						<button id="resumeWrite" class="btn btn-default" value="${Detail.recruitJobCd}">자기소개서쓰기</button>
					</td>
					<td >
						${Detail.cletterCount}
					</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
	<div>
		<h3 style="color: orange">채용공고</h3> 
		<img style="width: 850px" src="/upload/recruitimg/${recruitCompanyInfoForDetail.recruitList[0].recruitImgName}"/>
	</div>
	<br>
</div>
</body>
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" /> --%>
</html>