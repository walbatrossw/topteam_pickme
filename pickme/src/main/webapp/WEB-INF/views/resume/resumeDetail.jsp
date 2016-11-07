<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PICKME 이력서 상세보기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../common/module/modHeader.jsp"/>
	<div class="container">
		<div class="jumbotron">
		<h1>나의 이력서</h1>
			<p><strong>Pick Me</strong>는 절대 사용자 동의 없이 입력하신 정보를 외부로 유출,공개하지 않습니다.</p>
			<p>작성하신 이력서를 편집하여 PDF로 저장하시거나, 출력하실 수 있습니다.</p>
			<a class="btn btn-primary btn-lg" href="/resumePdf" role="button">PDF</a>
			<a class="btn btn-primary btn-lg" href="/resumePrint" role="button">프린트하러가기</a>
		</div>	
		<div>
			<p>이력서 상세보기 서비스는 현재 준비중에 있습니다</p>
			<p>불편을 드려 죄송합니다.</p>
			<p>시일내 빠른 서비스로 뵙겠습니다.</p>
		</div>
	</div>		
</body>
</html>
