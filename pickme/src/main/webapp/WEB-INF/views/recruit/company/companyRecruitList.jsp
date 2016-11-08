<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	//기업이름로 검색
	$('#companySearch').click(function(){
		if($('#companyName').val() != "") {
			location.href="/diary?companyName="+$('#companyName').val();
		}else{
			location.href="/diary";
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
<div class="container">
	<h3 align="center">
		<small><a href="/diary/index?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=prev"class="btn btn-default">[PREV]</a></small>
		${ddayYear}년${ddayMonth+1}월
		<small><a href="/diary/index?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=next"class="btn btn-default">[NEXT]</a></small>
	</h3>
	
 <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <nav id="spy">
                <ul class="sidebar-nav nav">
                    <li>
                        <label>채용형태</label>
                        <input type="radio" name = "recruitJobWorkstatus" value="신입">신입
                        <input type="radio" name = "recruitJobWorkstatus" value="경력">경력
                        <input type="radio" name = "recruitJobWorkstatus" value="인턴">인턴
                        <input type="radio" name = "recruitJobWorkstatus" value="계약직">계약직                        
                    </li>
                    <li>
                        <label>직무선택</label>
						<c:forEach var="jobTopIndex" items="${jobTopIndex}">
							<input type="checkbox" value="${jobTopIndex.jobTopIndexCd}">${jobTopIndex.jobTopIndexName}
						</c:forEach>
                    </li>
                    <li>
                       <label> 산업군</label>
                       <c:forEach var="topIndustry" items="${topIndustry}">
							<input type="checkbox" value="${topIndustry.industryTopindexCd}">${topIndustry.industryTopindexName}
						</c:forEach>
                    </li>
                </ul>
            </nav>
        </div>
        
        <input type="text" name="companyName" id="companyName" placeholder="기업이름으로 검색">
        <input type="button" id="companySearch" value="검색">
        
	<table class="table table-responsive" >
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
				<c:forEach var="oneDay" items="${oneDayList}" varStatus="i" >	
				<c:if test="${oneDay.day!=today.day}">  
					<td> 
				</c:if>
				<c:if test="${oneDay.day==today.day && oneDay.month!=today.month &&oneDay.year!=today.year }">  
					<td> 
				</c:if>
				<c:if test="${oneDay.day==today.day && oneDay.month==today.month&&oneDay.year==today.year}">
					<td style="background-color:#fef2ff"> 
				</c:if>
						<c:if test="${oneDay.scheduleList == null}">
							<div style="color:#BDBDBD">${oneDay.day}</div>	
						</c:if>	
						<c:if test="${oneDay.scheduleList != null}">
							<a href ="/diary/scheduleList?scheduleDday=${oneDay.year}-${oneDay.month}-${oneDay.day}">
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
												<img src="/img/recruit/1478507737_Play01.png">
											</c:if>
											<c:if test="${s.end=='end'}">
												<img src="/img/recruit/1478507788_black_4_audio_stop.png">
											</c:if>
											<c:if test="${s.recruitName.length()<6}">
												${s.recruitName}
											</c:if>
											<c:if test="${s.recruitName.length()>5}">
												<%-- ${fn:substring(s.recruitName,0,5)} ..  --%>
												${s.recruitName}
											</c:if>
										</div>
									</c:forEach>
								</c:if>
							</a>
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
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>