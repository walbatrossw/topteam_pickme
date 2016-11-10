<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=effda133d3bb5a8e9a0cfd6d830f5b2a&libraries=services"></script>
<script>
	$(document).ready(function() {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addr2coord('${companyInfoDetail.companyAddr }', function(status, result) {
	
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
	
		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	
	        	// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
	
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${companyInfoDetail.companyName }</div>'
		        });
	        	infowindow.open(map, marker);
	
	        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	       		map.setCenter(coords);
		    } 
		});    
	});
</script>
<link rel="stylesheet" href="/css/companyinfo.css">
<title>Insert title here</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
	<!-- HEADER START -->
	<div class="headers">
		<div id="companyInfoList">
			<div class="header_cont">
				<div class="gnb" style="background: rgba(255, 255, 255, 0.01);">
					<h1>
						<a class="companyInfoMain" href="/companyInfo"><strong>기업정보</strong></a>
					</h1>
					<ul>
						<li class="menu1">
							<a href="/review/companyReviewInsertForm">기업리뷰</a>
						</li>
						<li class="menu2">
							<a href="/review/companyReviewUnreceivedList">기업리뷰 미승인 목록</a>
						</li>
						<li class="menu3">
							<a href="/review/companyReviewListAllow">기업리뷰 승인 목록</a>
						</li>
						<li class="menu4">
							<a href="/interview/companyInterviewUnreceivedList">면접후기 비승인 목록</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //HEADER END -->
	<div id="companyInfoList_wrapper">
		<!-- 비주얼 이미지 start -->
		<div class="sections" id="main_visual">
			<div class="section_cont">
				<div class="visual">
					<ul>
						<li class="list1"><span class="img"
							style="z-index: 2; opacity: 1;"><img
								src="/img/company/companymain.png" /></span>
						<!-- 비주얼 이미지1 --></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 비주얼 이미지 end -->
	<div id="content_cominfo">
		<!-- main body start -->
		<div id="company_view" class="pop_company_view">
			<!-- company_info_header -->
			<div class="company_info_header">
				<div class="top_cont">
					<h2 class="corp_logo">
						<strong class="ci_name">${companyInfoDetail.companyName }</strong>
					</h2>
					<div class="ci_url">
						<a href="${companyInfoDetail.companySite }" target="_blank">${companyInfoDetail.companySite }</a>
					</div>
				</div>
				<!-- 기업형태 5개 -->
				<div class="corp_summary">
					<ul class="type_col5">
						<li class="col1">
							<div class="item1">
								<i>업종</i>
								<p>${companyInfoDetail.industryTopIndexName }</p>
							</div>
						</li>
						<li class="col2">
							<div class="item2">
								<i>매출액</i>
								<p>
									${companyInfoDetail.companySales }
								</p>
							</div>
						</li>
						<li class="col3">
							<div class="item3">
								<i>기업형태</i>
								<p>${companyInfoDetail.companyTypeName }</p>
							</div>
						</li>
						<li class="col4">
							<div class="item4">
								<i>설립일</i>
								<p>
									${companyInfoDetail.companyBirthdate }
								</p>
							</div>
						</li>
						<li class="col5">
							<div class="item5">
								<i>평점</i>
								<p>${companyInfoDetail.companyTotalRate *1.0}점</p>
							</div>
						</li>
					</ul>
				</div>
			<!-- //기업형태 5개 -->
			</div>
			<!-- //company_info_header -->
			<!-- company_info_content -->
			<div class="company_info_content">
				<!-- company_info_section1:기본정보 -->
				<div id="company_info_section1" class="company_info_section1">
					<h3 class="btit">기본정보</h3>
					<!-- folding -->
					<div class="folding on">
						<!-- sec1 -->
						<div class="sec1">
							<div class="table_col_type1">
								<table summary="기본정보">
									<caption>기업명, 소속그룹, 업종, 사업내용, 기업형태, 사원수, 자본금, 설립일,
										대표전화, 홈페이지, 주소</caption>
									<colgroup>
										<col class="col1">
										<col class="col2">
										<col class="col3">
										<col class="col4">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">기업명</th>
											<td>${companyInfoDetail.companyName }</td>
											<th scope="row">대표자명</th>
											<td>${companyInfoDetail.companyCeo }</td>
										</tr>
										<tr>
											<th scope="row">업종</th>
											<td colspan="3">${companyInfoDetail.industryTopIndexName }</td>
										</tr>
										<tr>
											<th scope="row">기업형태</th>
											<td colspan="3" class="position1">${companyInfoDetail.companyTypeName }</td>
										</tr>
										<tr>
											<th scope="row">설립일</th>
											<td class="position2">${companyInfoDetail.companyBirthdate }</td>
											<th scope="row">채용현황</th>
											<td><a
												href="javascript:scrollTo({'target':'#company_info_section5','speed':'100'});"
												class="link_job_view">채용 진행중 <strong class="point">1건</strong></a></td>
										</tr>
										<tr>
											<th scope="row">사원수</th>
											<td class="position3">525명 <span class="standard_year">(2015년기준)</span>
											</td>
											<th scope="row">매출액</th>
											<td class="position4">
												<fmt:formatNumber value="${companyInfoDetail.companySales }" pattern="\#,억###.##"/>원
												<span class="standard_year">(2015년 기준)</span> 
											</td>
										</tr>
										<tr>
											<th scope="row">자본금</th>
											<td>135억 7,500만원 <span class="standard_year">(2015년
													기준)</span></td>
											<th scope="row">당기순이익</th>
											<td>131억 1,484만원 <span class="standard_year">(2015년
													기준)</span>
											</td>
										</tr>
										<tr>
											<th scope="row">대표전화</th>
											<td>${companyInfoDetail.companyPhone }</td>
											<th scope="row">FAX</th>
											<td>${companyInfoDetail.companyPhone }</td>
										</tr>
										<tr>
											<th scope="row">홈페이지</th>
											<td colspan="3">
												<a href="${companyInfoDetail.companySite }" class="link_site" target="_blank">${companyInfoDetail.companySite }</a>
											</td>
										</tr>
										<tr>
											<th scope="row">기업주소</th>
											<td colspan="3">${companyInfoDetail.companyAddr }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			
				<div id="company_info_section3" class="company_info_section3">   
		        <!-- sec4 -->
		        <div class="sec4">
		        	<h4 class="stit">회사위치</h4>
				        <div class="corp_map">
				            <div class="adr_wrap">
				                <p class="adr_txt">${companyInfoDetail.companyAddr }</p>
				                <span class="tel">대표전화: ${companyInfoDetail.companyPhone }</span><span class="fax">/ FAX : ${companyInfoDetail.companyPhone }</span>
							</div>
				            <div class="api_wrap">
				    			<div id="map" style="width:100%;height:400px;"></div>
				            </div>
				        </div>
				    </div>
	    			<!-- sec4 -->
    			</div>
			</div>
		</div>
		<!-- 기업정보뷰 end -->
	</div>
	<!-- main body end -->
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>