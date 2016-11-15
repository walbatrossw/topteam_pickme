<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/company/companyCommon.css">
<link rel="stylesheet" href="/css/company/companyReview.css">
<link rel="stylesheet" href="/css/company/companyinfo.css">
<script>
	$(document).ready(function(){
		const $btnSuccess = $('.btn-success');
		const $btnDanger = $('.btn-danger');
		
		$btnSuccess.click(function(){
			location.href = "/review/companyReviewAllow?companyReviewCd=${reviewDetail.companyReviewCd}";
		});
		$btnDanger.click(function(){
			location.href = "/review/companyReviewDelete?companyReviewCd=${reviewDetail.companyReviewCd}";
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/admin/module/adminHeader.jsp"/>
	<section id="main" class="column">
		<div class="container">
			<div class="jumbotron text-center">
				<h1>기업리뷰 상세보기(관리자)</h1>
			</div>
			<div class="companyReviewDetail">	
				<div class="row">
					<div id="reviewRate" class="col-xs-5">
						<h1>기업총평점</h1>
						<h2>${reviewDetail.reviewRate * 1.0}</h2>
						<span class="star-rating">
							<span style="width:${reviewDetail.reviewRate * 20}%"></span>
						</span>
					</div>
					
					<div id="etc">
						<div class="col-xs-3">
							<label>승진기회 가능성</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewPromotion}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewPromotion * 20}%">
							   		 ${reviewDetail.reviewPromotion * 1.0} / 5.0
								</div>
							</div>
						</div>	 
						<div class="col-xs-3">
							<label>복지 및 급여</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewWelfare}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewWelfare * 20}%">
							   		 ${reviewDetail.reviewWelfare * 1.0} / 5.0
								</div>
							</div>
						</div>	
						<div class="col-xs-3">
							<label>사내문화</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCulture}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCulture * 20}%">
							   		 ${reviewDetail.reviewCulture * 1.0} / 5.0
								</div>
							</div>
						</div>	
						<div class="col-xs-3">
							<label>업무와 삶의균형</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewBalance}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewBalance * 20}%">
							   		 ${reviewDetail.reviewBalance * 1.0} / 5.0
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<label>경영진</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCeorate}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCeorate * 20}%">
							   		 ${reviewDetail.reviewCeorate * 1.0} / 5.0
								</div>
							</div>
						</div>
						<div class="col-xs-3">
							<label>CEO에대한견해</label>
						</div>
						<div class="col-xs-3">
							<div class="progress">	
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${reviewDetail.reviewCeosupport}"
							 		 aria-valuemin="0" aria-valuemax="5" style="width:${reviewDetail.reviewCeosupport * 20}%">
							   		 ${reviewDetail.reviewCeosupport * 1.0} / 5.0
								</div>
							</div>
						</div>		
					</div>	<!-- etc -->	
				</div>	<!-- row -->	
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-defult">
							<div class="panel-heading">
								<label>닉네임 : </label>
								<c:if test="${reviewDetail.generalNick != null}">
									${reviewDetail.generalNick } |
								</c:if>
								<c:if test="${reviewDetail.linkedNick != null}">
									${reviewDetail.linkedNick }	|
								</c:if>
								<label>근무기간 : </label>
									${reviewDetail.reviewWorkYear } |
								<label>등록일 : </label>
									${reviewDetail.reviewRegDate }
							</div>
						</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-info">
	      					<div class="panel-heading"><label>한줄평 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewComment }"</div>
	    				</div>
					</div>
				</div><!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-success">
	      					<div class="panel-heading"><label>기업의 장점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewStrength }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->	
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-danger">
	      					<div class="panel-heading"><label>기업의 단점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewWeak }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-primary">
	      					<div class="panel-heading"><label>경영진에게 바라는점 :</label></div>
	      					<div class="panel-body">"${reviewDetail.reviewWish }"</div>
	    				</div>
					</div>
				</div>	<!-- row -->
				<div class="row">
					<div class="col-xs-6">
						<button type="button" class="btn btn-primary btn-block btn-success">승인</button>
					</div>
					<div class="col-xs-6">
						<button type="button" class="btn btn-primary btn-block btn-danger">삭제</button>
					</div>
				</div>	<!-- row -->		
			</div><!-- companyReviewDetail -->
		</div>
	</section>
</body>
</html>