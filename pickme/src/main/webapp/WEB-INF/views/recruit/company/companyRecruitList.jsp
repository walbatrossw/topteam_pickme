<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//기업이름로 검색
	$('#companySearch').click(function(){
		if($('#searchCompanyName').val() != "") {
			location.href="/diary?ddayYear=${ddayYear}&ddayOption=search&ddayMonth=${ddayMonth}&searchCompanyName="+$('#searchCompanyName').val();
		}else{
			location.href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=search";
		}   
	});
/* 	
	const $jobTopIndex = $('#jobTopIndex');
	$jobTopIndex.val("${jobTopIndexCd}").attr("selected","selected");
	$jobTopIndex.change(function(){
		if($jobTopIndex.val() != "") {
			location.href="/review/companyReviewListAllow?jobTopIndexCd="+$jobTopIndex.val();
		}else{
			location.href="/review/companyReviewListAllow";
		}    
    }); 
*/
});
</script>
<title>Insert title here</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
이예은
<div id="wrapper">
	<div class="container">
	<!-- Sidebar -->
	        <div id="sidebar-wrapper">
	            <ul class="sidebar-nav">
	            	<li>
		                <h3>채용형태</h3>
		            </li>
		            <li>
		                <input type="radio" name = "recruitJobWorkstatus" value="신입">신입
		                <input type="radio" name = "recruitJobWorkstatus" value="경력">경력
		                <input type="radio" name = "recruitJobWorkstatus" value="인턴">인턴
		                <input type="radio" name = "recruitJobWorkstatus" value="계약직">계약직                        
	            	</li>
	            	<li>
	                	<h3>직무선택</h3>
	                </li>
	               
					<c:forEach var="jobTopIndex" items="${jobTopIndex}">
						<li>
							<input type="checkbox" value="${jobTopIndex.jobTopIndexCd}">${jobTopIndex.jobTopIndexName}
						</li>
					</c:forEach>
					
	           		<li>
		               <h3>산업군</h3>
		            </li>
		           
	               	<c:forEach var="topIndustry" items="${topIndustry}">
		                <li>
							<input type="checkbox" value="${topIndustry.industryTopindexCd}">${topIndustry.industryTopindexName}
						</li>
					</c:forEach>
					<br/>
<%-- 		               <div>
		               		 <center><a href="#" class="btn btn-warning btn-sm">맞춤채용정보 등록하기</a> </center>
		               </div> --%>
					<br/>
		               <div >
		               		<center><a href="#" class="btn btn-warning btn-sm">내 채용공고보기</a></center>
		               </div>

	            	
	            </ul>
	        </div>
	        <!-- /#sidebar-wrapper -->
		<h3 align="center">
			<small><a href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=prev"class="btn btn-default">[PREV]</a></small>
			${ddayYear}년${ddayMonth+1}월
			<small><a href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=next"class="btn btn-default">[NEXT]</a></small>
		</h3>
  
	        <input type="text" name="searchCompanyName" id="searchCompanyName" placeholder="기업이름으로 검색">
	        <input type="button" id="companySearch" value="검색" class="btn btn-default">
	        <a href="/recruit" style="float:right" class="btn btn-default">채용등록</a>
	        
		<table class="calendar-table table table-condensed table-tight" >
			<thead>
				<tr>
					<th class="col-sm-1">일</th>
					<th class="col-sm-1">월</th>
					<th class="col-sm-1">화</th>
					<th class="col-sm-1">수</th>
					<th class="col-sm-1">목</th>
					<th class="col-sm-1">금</th>
					<th class="col-sm-1">토</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 오늘날짜  -->
					<c:forEach var="oneDay" items="${oneDayList}" varStatus="i" >	
	 				<c:if test="${oneDay.day!=today.day}">  
						<td> 
					</c:if>
					<!--  년과 월이 오늘과 다른 게 안먹음 --> 
					<c:if test="${oneDay.day==today.day && oneDay.month!=today.month}">   
						<td> 
					</c:if>
					<c:if test="${oneDay.day==today.day && oneDay.year!=today.year &&oneDay.month==today.month}">   
						<td> 
					</c:if>
					<c:if test="${oneDay.day==today.day && oneDay.month==today.month && oneDay.year==today.year}">
						<td style="background-color:#edeaea"> 
					</c:if> 
					
							<c:if test="${oneDay.scheduleList == null}">
								<div style="color:#BDBDBD">${oneDay.day}</div>	
							</c:if>	
							<c:if test="${oneDay.scheduleList != null}">
							<%-- 	<a href ="/diary/scheduleList?scheduleDday=${oneDay.year}-${oneDay.month}-${oneDay.day}"> --%>
									<c:if test="${oneDay.scheduleList.size()==0}">
									<!-- 일요일 -->
										<c:if test="${i.count%7==1}">
											<div style="color:#ea360e">${oneDay.day}</div>	
										</c:if>
									<!-- 토요일 -->
										<c:if test="${i.count%7==0}">
											<div style="color:#02aef2">${oneDay.day}</div>	
										</c:if>
									<!-- 평일 -->
										<c:if test="${i.count%7 > 1}">
											<div style="color:#000000">${oneDay.day}</div>	
										</c:if>
									</c:if>
									<c:if test="${oneDay.scheduleList.size()>0}">
									
									<!-- 일요일 -->
										<c:if test="${i.count%7==1}">
											<div style="color:#ea360e;font-weight:bold;">${oneDay.day}</div>
										</c:if>
									<!-- 토요일 -->
										<c:if test="${i.count%7==0}">
											<div style="color:#02aef2;font-weight:bold;">${oneDay.day}</div>
										</c:if>
									<!-- 평일 -->
										<c:if test="${i.count%7 > 1}">
											<div style="color:#000000;font-weight:bold;">${oneDay.day}</div>
										</c:if>
									<!-- 공고명  -->
										<c:forEach var="s" items="${oneDay.scheduleList}">
											<div>
												<c:if test="${s.begin=='begin'}">
													<!-- <img src="/img/recruit/1478507737_Play01.png"> -->
													<span style="color:orange;font-weight:bold;">시</span>
												</c:if>
												<c:if test="${s.end=='end'}">
													<span style="color:gray;font-weight:bold;">끝</span>
												</c:if>
												<c:if test="${s.recruitName.length()<=9}">
													<a href="/recruitDetail?recruitCompanyCd=${s.recruitCompanyCd}">${s.recruitName}</a>
												</c:if>
												<c:if test="${s.recruitName.length()>9}">
													<a href="/recruitDetail?recruitCompanyCd=${s.recruitCompanyCd}">${fn:substring(s.recruitName,0,9)}</a>
												</c:if>
											</div>
										</c:forEach>
									</c:if>
							</c:if>	
						</td>
							<c:if test="${i.count%7==0}">
								</tr><tr>
							</c:if>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>	
</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>