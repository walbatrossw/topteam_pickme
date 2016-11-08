<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/css/companyinfo.css">
<title>Insert title here</title>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
	<div id="content_cominfo">
		<!-- main body start -->
		<div id="company_view" class="pop_company_view">
			<!-- company_info_header -->
			<div class="company_info_header">
				<div class="top_cont">
					<h2 class="corp_logo">
						<img id="경동제약㈜" alt="경동제약㈜"
							src="http://webpds.saramin.co.kr/pds/united_company/logo/2046_.gif"
							width="138" height="68"> <strong class="ci_name">경동제약㈜</strong>
					</h2>
					<div class="ci_url">
						<a href="http://www.kdpharma.co.kr" target="_blank">http://www.kdpharma.co.kr</a>
					</div>
					<div class="ci_desc">
						<p class="txt">1975년 9월 9일에 설립된 제약·보건·바이오 업종의 양약,혈압강하제(디로핀지속정)
							제조,수출/부동산 임대 사업을 하는 코스닥기업이며, 자본금은 135억 7,500만원 매출액은 1,518억
							9,333만원 사원수는 525명입니다.</p>
					</div>
				</div>
				<!-- 기업형태 5개 -->
				<div class="corp_summary">
					<ul class="type_col5">
						<li class="col1">
							<div class="item1">
								<i>업종</i>
								<p>제약·보건·바이오</p>
							</div>
						</li>
						<li class="col2">
							<div class="item2">
								<i>매출액</i>
								<p>
									1,518억<br> 9,333만원
								</p>
							</div>
						</li>
						<li class="col3">
							<div class="item3">
								<i>기업형태</i>
								<p>코스닥</p>
							</div>
						</li>
						<li class="col4">
							<div class="item4">
								<i>설립일</i>
								<p>
									1975년<br>(업력 41년)
								</p>
							</div>
						</li>
						<li class="col5">
							<div class="item5">
								<i>사원수</i>
								<p>525명</p>
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
											<td>경동제약㈜</td>
											<th scope="row">대표자명</th>
											<td>류기성</td>
										</tr>
										<tr>
											<th scope="row">업종</th>
											<td colspan="3">제약·보건·바이오</td>
										</tr>
										<tr>
											<th scope="row">사업내용</th>
											<td colspan="3">양약,혈압강하제(디로핀지속정) 제조,수출/부동산 임대</td>
										</tr>
										<tr>
											<th scope="row">기업형태</th>
											<td colspan="3" class="position1">코스닥, 중견기업, 외국인 투자기업,
												주식회사, 외부감사법인, 수출입 기업, 법인사업체 <a href="#none" class="ico_wrap">
													<i class="ico_kosdaq"><img
														src="//www.saraminimage.co.kr/ui/company_info/ico_kosdaq.png"
														alt="코스닥"></i>
													<div class="ly_wrap">
														<div class="ly_cont">
															<div class="tit_wrap">
																<p class="tit">
																	<strong>상장기업 등급기준</strong>
																</p>
																<span class="btn_close"><i>닫기</i></span>
															</div>
															<div class="cont_wrap">
																<p class="txt">
																	상장여부는 <strong class="point">기업의 외부평가</strong>를 가늠하는 척도가
																	됩니다.
																</p>
																<ul class="list_cont">
																	<li><i class="ico_kospi"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_kosp.png"
																			alt="코스피"></i><span class="txt">유가증권시장 상장법인</span></li>
																	<li><i class="ico_kosdaq"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_kosdaq.png"
																			alt="코스닥"></i><span class="txt">코스닥시장 상장법인</span></li>
																	<li><i class="ico_konex"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_konex.png"
																			alt="코넥스"></i><span class="txt">코넥스시장 상장법인</span></li>
																</ul>
															</div>
														</div>
													</div>
											</a>
											</td>
										</tr>
										<tr>
											<th scope="row">설립일</th>
											<td class="position2">1975년 9월 9일 (업력 41년) <a
												href="#none" class="ico_wrap"> <i class="ico_a3"><img
														src="//www.saraminimage.co.kr/ui/company_info/ico_a3.png"
														alt="AAA"></i>
													<div class="ly_wrap">
														<div class="ly_cont">
															<div class="tit_wrap">
																<p class="tit">
																	<strong>기업 나이(업력)등급기준</strong>
																</p>
																<span class="btn_close"><i>닫기</i></span>
															</div>
															<div class="cont_wrap">
																<p class="txt">
																	기업의 업력은 <strong class="point">기업의 안정도</strong>를 가늠하는
																	척도가 됩니다.
																</p>
																<ul class="list_cont">
																	<li><i class="ico_a4"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a4.png"
																			alt="A+"></i><span class="txt">설립한 지 50년 이상
																			장수기업</span></li>
																	<li><i class="ico_a3"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a3.png"
																			alt="AAA"></i><span class="txt">설립한 지 30년 이상
																			중견기업</span></li>
																	<li><i class="ico_a2"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a2.png"
																			alt="AA"></i><span class="txt">설립한 지 20년 이상
																			도약기업</span></li>
																	<li><i class="ico_a1"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a1.png"
																			alt="A"></i><span class="txt">설립한 지 10년 이상
																			비상기업</span></li>
																</ul>
															</div>
														</div>
													</div>
											</a>
											</td>
											<th scope="row">채용현황</th>
											<td><a
												href="javascript:scrollTo({'target':'#company_info_section5','speed':'100'});"
												class="link_job_view">채용 진행중 <strong class="point">1건</strong></a></td>
										</tr>
										<tr>
											<th scope="row">사원수</th>
											<td class="position3">525명 <span class="standard_year">(2015년
													기준)</span> <a href="#none" class="ico_wrap"> <i class="ico_a2"><img
														src="//www.saraminimage.co.kr/ui/company_info/ico_a2.png"
														alt="AA"></i>
													<div class="ly_wrap">
														<div class="ly_cont">
															<div class="tit_wrap">
																<p class="tit">
																	<strong>사원수 등급기준</strong>
																</p>
																<span class="btn_close"><i>닫기</i></span>
															</div>
															<div class="cont_wrap">
																<p class="txt">
																	기업의 사원수는 <strong class="point">기업의 규모</strong>를 가늠하는
																	척도가 됩니다.
																</p>
																<ul class="list_cont">
																	<li><i class="ico_a4"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a4.png"
																			alt="A+"></i><span class="txt">사원수 1만명 이상</span></li>
																	<li><i class="ico_a3"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a3.png"
																			alt="AAA"></i><span class="txt">사원수 1000명 이상</span></li>
																	<li><i class="ico_a2"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a2.png"
																			alt="AA"></i><span class="txt">사원수 300명~999명
																			이상</span></li>
																	<li><i class="ico_a1"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a1.png"
																			alt="A"></i><span class="txt">사원수 100명~299명
																			이상</span></li>
																</ul>
															</div>
														</div>
													</div>
											</a> <i class="ico_employ"><img
													src="//www.saraminimage.co.kr/ui/company_info/ico_employ.png"
													alt="고용증가"></i>
											</td>
											<th scope="row">매출액</th>
											<td class="position4">1,518억 9,333만원 <span
												class="standard_year">(2015년 기준)</span> <a href="#none"
												class="ico_wrap"> <i class="ico_a2"><img
														src="//www.saraminimage.co.kr/ui/company_info/ico_a2.png"
														alt="AA"></i>
													<div class="ly_wrap">
														<div class="ly_cont">
															<div class="tit_wrap">
																<p class="tit">
																	<strong>매출액 등급기준</strong>
																</p>
																<span class="btn_close"><i>닫기</i></span>
															</div>
															<div class="cont_wrap">
																<p class="txt">
																	기업의 매출액은 <strong class="point">기업의 영업력</strong>을 가늠하는
																	척도가 됩니다.
																</p>
																<ul class="list_cont">
																	<li><i class="ico_a4"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a4.png"
																			alt="A+"></i><span class="txt">매출액 1조 이상</span></li>
																	<li><i class="ico_a3"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a3.png"
																			alt="AAA"></i><span class="txt">매출액 5000억 이상</span></li>
																	<li><i class="ico_a2"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a2.png"
																			alt="AA"></i><span class="txt">매출액 1000억 이상</span></li>
																	<li><i class="ico_a1"><img
																			src="//www.saraminimage.co.kr/ui/company_info/ico_a1.png"
																			alt="A"></i><span class="txt">매출액 100억 이상</span></li>
																</ul>
															</div>
														</div>
													</div>
											</a>
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
											<td>02-576-6121</td>
											<th scope="row">FAX</th>
											<td>02-577-5195</td>
										</tr>
										<tr>
											<th scope="row">홈페이지</th>
											<td colspan="3"><a href="http://www.kdpharma.co.kr"
												class="link_site" target="_blank">http://www.kdpharma.co.kr</a></td>
										</tr>
										<tr>
											<th scope="row">기업주소</th>
											<td colspan="3">서울 관악구 인헌동 1659-5 경동제약빌딩</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 기업정보뷰 end -->
		<!-- main body end -->
	</div>
</body>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>