<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자:자기소개서 항목입력</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	var num = 0;
	$(document).ready(function(){
		const $coverletterAddBtn = $('#coverletterAddBtn');
		const $coverletterAelBtn = $('#coverletterAelBtn');
		
		$coverletterAddBtn.click(function(){
			num++;
			$('#fieldCoverletter').append(
				'<textarea class="coverletter form-control col-sm-5" rows="2" id="cCletterArticle" name="cCletterArticle" placeholder="자기소개서 항목을 입력해주세요"></textarea>'
			);
		});
		
		$coverletterAelBtn.on('click', function(){
			const $coverletter = $('.coverletter');
			num--;
			$coverletter.last().remove();
		});
	});
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<body>
	<div class="container">
	 <div class="jumbotron">
	 	<h2>관리자 자기소개서 항목 입력페이지</h2>
	 	<p>기업의 채용공고를 검색 후, 자기소개서 항목을 입력해주세요</p>
	 </div>
	 <div class="row">
	 	<form action="/companyJobCoverletterList" method="post">
	 		<div>
	 			<label>채용기업검색</label>
	 			<input type="text" class="typeahead form-control" id="recruitJobCd" name="recruitJobCd" >
	 		</div>
	 		<div>
	 			<label>채용직무검색</label>
	 			<input type="text" class="typeahead form-control" id="recruitJobCd" name="recruitJobCd" >
	 		</div>
	 		<div id="coverletter">
	 			<label>자기소개서 항목</label>
	 			<textarea class="form-control col-sm-5" rows="2" id="cCletterArticle" name="cCletterArticle" placeholder="자기소개서 항목을 입력해주세요"></textarea>
	 		</div>
	 		<hr>
	 		<div id="fieldCoverletter"></div>
	 		<hr>
	 		<div>
		 		<input type="button" id=coverletterAddBtn class="btn btn-primary" value="항목추가">
		 		<input type="button" id="coverletterAelBtn" class="btn btn-defualt" value="항목삭제">
	 		</div>
	 		<hr>
	 		<input type="submit" class="btn btn-primary btn" id="insertBtn" value="이력서 저장"/>
	 	</form>
	 </div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>