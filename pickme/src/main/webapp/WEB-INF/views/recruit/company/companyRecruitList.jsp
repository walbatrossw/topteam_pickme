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
<link rel="stylesheet" href="recruitList.css" />
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
                    <li class="sidebar-brand">
                        <a href="#home"><span class="fa fa-home solo">Home</span></a>
                    </li>
                    <li>
                        <a href="#anch1" data-scroll>
                            <span class="fa fa-anchor solo">Anchor 1</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch2" data-scroll>
                            <span class="fa fa-anchor solo">Anchor 2</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch3" data-scroll>
                            <span class="fa fa-anchor solo">Anchor 3</span>
                        </a>
                    </li>
                    <li>
                        <a href="#anch4" data-scroll>
                            <span class="fa fa-anchor solo">Anchor 4</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        
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