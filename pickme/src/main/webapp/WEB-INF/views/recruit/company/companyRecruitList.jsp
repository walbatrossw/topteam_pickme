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
<!-- Custom Fonts -->
<link href="resumecoverlettersetting/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script>
$(document).ready(function(){
	
	/* 배열로 받아온 data로 checkBox checked하기  */
	//직무 체크
	var jobCheckedList = new Array();
	<c:forEach items="${jobTopIndexCd}" var="jobTopIndexCd">
		jobCheckedList.push("${jobTopIndexCd}")
	</c:forEach> 

    $(".jobTopIndexCd").each(function(){
		var jobTopIndexCd = $(this).attr("value");
		for(var i=0; i<jobCheckedList.length; i++){
		    if( jobCheckedList[i] == jobTopIndexCd ){
		        $(this).attr("checked", "checked");
		    }
		}
    });
  //채용형태 체크
	var workStatusCheckedList = new Array();
	<c:forEach items="${recruitJobWorkstatus}" var="recruitJobWorkstatus">
		workStatusCheckedList.push("${recruitJobWorkstatus}")
	</c:forEach>
     console.log("workStatusCheckedList"+workStatusCheckedList);
     
	$(".recruitJobWorkstatus").each(function(){
		var recruitJobWorkstatus = $(this).attr("value");
		for(var j=0; j<workStatusCheckedList.length; j++){
			if( workStatusCheckedList[j] == recruitJobWorkstatus ){
				$(this).attr("checked", "checked");
			}
		}
	});
   //산업군체크
   	var industryCheckedList = new Array();
	<c:forEach items="${industryTopindexCd}" var="industryTopindexCd">
		industryCheckedList.push("${industryTopindexCd}")
	</c:forEach> 

	$(".industryTopindexCd").each(function(){
	var industryTopindexCd = $(this).attr("value");
		for(var i=0; i<industryCheckedList.length; i++){
		    if( industryCheckedList[i] == industryTopindexCd ){
		        $(this).attr("checked", "checked");
			}
		}
    });
	
	
	/* 기업이름 검색 */
	$('#searchCompanyName').change(function(){
		if($('#searchCompanyName').val() != "") {
			location.href="/diary?ddayYear=${ddayYear}&ddayOption=search&ddayMonth=${ddayMonth}&searchCompanyName="+$('#searchCompanyName').val();
		}else{
			//검색시에 기본이 되는 매핑주소
			location.href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=search";
		}   
	});
	$('#companySearch').click(function(){
		if($('#searchCompanyName').val() != "") {
			location.href="/diary?ddayYear=${ddayYear}&ddayOption=search&ddayMonth=${ddayMonth}&searchCompanyName="+$('#searchCompanyName').val();
		}else{
			//검색시에 기본이 되는 매핑주소
			location.href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=search";
		}   
	});
	
	
	//체크박스 검색
	$('#checkSearchBtn').click(function(){
		/* 화면에서 받아오는 체크리스트 값 리스트 */
		var jopList = new Array(); // 직무체크를 담을 array
		var industryList = new Array();//산업군 체크를 담을 array
		var workStatusList = new Array();//채용형태를 담을 array 
		
		for(var i=0;i<$('.jobTopIndexCd:checked').length;i++){
			jopList.push($('.jobTopIndexCd:checked').eq(i).val());
		}
		for(var i=0;i<$('.industryTopindexCd:checked').length;i++){
			industryList.push($('.industryTopindexCd:checked').eq(i).val());
		}
		for(var j=0;j<$('.recruitJobWorkstatus:checked').length;j++){
			workStatusList.push($('.recruitJobWorkstatus:checked').eq(j).val());
		} 
		console.log("jopList : "+jopList);
		console.log("industryList : "+industryList)
		location.href=
			"/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=search&jobTopIndexCd="+jopList 
			+"&industryTopindexCd="+industryList
			+"&recruitJobWorkstatus="+workStatusList;
	 });
	
	//북마크 보기 
	$('#bookmark').click(function(){
		//로그인 안되어있으면 로그인 유도
		if($('#sessionId').val()==""||$('#sessionId').val()==null){
			alert('로그인후 이용가능한 기능입니다.');
			location.href="/memberGeneralLogin";
		}else{
			location.href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=search&bookmark=true";
		}	
	});
	$('.popup').click(function(){
		$('#modalIframe').html('<iframe src="/recruitDetail?recruitCompanyCd='+ $('#hiddenRecruitCd').val()+'" height="800px" width="840px" frameborder="0" framespacing="0"></iframe>')
	});
	
	
});
//추가한 함수
function recruitCompnay(name){
	$('.close').trigger("click");
	location.href = "/company/companyInfoDetail?companyName=" + name;
}
function resumeWrite(cd){
	$('.close').trigger("click");
	location.href = "/memberCoverletterInsert?recruitJobCd=" + cd;
}
</script>
<title>채용달력</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
이예은
세션 : ${sessionScope.generalId}

<input type="hidden" id="workStatus" value="${recruitJobWorkstatus}" />
<input type="hidden" id = "sessionId" value="${sessionScope.generalId}">
<div id="wrapper">
	<!-- <div class="container"> -->
	<!-- Sidebar -->
	        <div id="sidebar-wrapper">
	            <ul class="sidebar-nav">
	            	<br>
	            	<li>
		                <p style="font-weight: bold;font-size: large; color: #635d5d">
		                <i class="fa fa-cubes"></i>
		                	채용형태
		                </p>
		            </li>
		            <li>
		            <c:forEach var="workStatueArray" items="${workStatueArray}">
		            	<input type="checkbox" class="recruitJobWorkstatus checkboxes" name = "recruitJobWorkstatus" value="${workStatueArray}">${workStatueArray}
		            </c:forEach>	
	            	</li>
	            	<br>
	            	<li>
	            		
	                	<p style="font-weight: bold;font-size: large; color: #635d5d">
	                	<i class="fa fa-rocket"></i> 
		                	직무선택
	                	</p>
	                </li>
					 
					<c:forEach var="jobTopIndex" items="${jobTopIndex}">
							<li>
							<input class="jobTopIndexCd checkboxes" type="checkbox" value="${jobTopIndex.jobTopIndexCd}">${jobTopIndex.jobTopIndexName}
							</li>
					</c:forEach> 
					<br>
	           		<li>
		               <p style="font-weight: bold;font-size: large; color: #635d5d">
		               <i class="fa fa-flask"></i> 
			               산업군
		               </p>
		            </li>
		           
	               	<c:forEach var="topIndustry" items="${topIndustry}">
		                <li>
							<input class="industryTopindexCd checkboxes" type="checkbox" value="${topIndustry.industryTopindexCd}">${topIndustry.industryTopindexName}
						</li>
					</c:forEach>
					<br>
					<li>
						<div class="btn-group btn-group-xs">
						  <button type="button" id="checkSearchBtn"class="btn btn-warning">검색조건으로 보기</button>
						  <button type="button" id="bookmark"class="btn btn-warning">내 북마크보기</button>
						</div>
					</li>	
	            </ul>
	        </div>
	        <!-- /#sidebar-wrapper -->
		<h3 align="center">
			<small><a href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=prev"class="btn btn-default">
			<span class="glyphicon glyphicon-chevron-left"></span></a></small>
			&nbsp; ${ddayYear}년${ddayMonth+1}월 &nbsp;
			<small><a href="/diary?ddayYear=${ddayYear}&ddayMonth=${ddayMonth}&ddayOption=next"class="btn btn-default">
			<span class="glyphicon glyphicon-chevron-right"></span></a></small>
		</h3>
		<div >
  			<div class="input-group" style="width:25%;float: right;">
				<input type="text" name="searchCompanyName" id="searchCompanyName" class="form-control" placeholder="기업이름으로 검색해보세요!">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="companySearch">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
				&nbsp;
			</div>
		</div>
	        
		<table class="calendar-table table table-condensed table-tight" style="width: 1330px">
			<thead>
				<tr>
					<th class="col-sm-1" style="text-align: center;color: orange;">SUN</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">MON</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">TUE</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">WED</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">THR</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">FRI</th>
					<th class="col-sm-1" style="text-align: center;color: orange;">SAT</th>
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
											<div style="color:#02aef2; " >${oneDay.day}</div>	
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
										<input type="hidden" id="hiddenRecruitCd" value="${s.recruitCompanyCd}">
											<div>
												<c:if test="${s.begin=='begin'}">
													<!-- <img src="/img/recruit/1478507737_Play01.png"> -->
													<span style="color:orange;font-weight:bold;">시</span>
												</c:if>
												<c:if test="${s.end=='end'}">
													<span style="color:gray;font-weight:bold;">끝</span>
												</c:if>
												<c:if test="${s.recruitName.length()<=9}">
													<a class="popup" href="#" data-toggle="modal" data-target="#datailModal">${s.recruitName}</a>
													
												</c:if>
												<c:if test="${s.recruitName.length()>9}">
													<a class="popup" href="#" data-toggle="modal" data-target="#datailModal">${fn:substring(s.recruitName,0,9)}</a>
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
</div>


	<div class="modal fade" id="datailModal" role="dialog">
		<div class="modal-dialog modal-lg">
		<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="check panel panel-default">
	             <div class="panel-body" id="modalIframe"></div> 
	 		</div> 
	    </div>
	</div>

  
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>