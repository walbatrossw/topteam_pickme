<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/style.css">
<script>
$(document).ready(function(){
	$loginModal = $('#loginModal');
	$btnInsert = $('.btn-insert');
	$btnLogin = $('.btn-login');
	$close = $('.close');
	
	$loginModal.modal("show");
	
	$close.click(function(){
		location.href = "/memberGeneralLogin";
	});
	$btnLogin.click(function(){
		location.href = "/memberGeneralLogin";
	});
	$btnInsert.click(function(){
		location.href = "/memberGeneralInsert";
	});
	
});
</script>
<title>로그인 확인</title>
</head>
<body>
	<div class="container">
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog modal-sm">
	 			<div class="modal-content">
	   		 		<div class="modal-header">
	      				<button type="button" class="close" data-dismiss="modal">&times;</button>
	      				<h4 class="modal-title">로그인 확인</h4>
	    			</div>
	   				<div class="modal-body">
	      				<p>로그인이 필요한 정보입니다.</p>
	    			</div>
	    			<div class="modal-footer">
	    				<button type="button" class="btn btn-insert" data-dismiss="modal">회원가입</button>
	      				<button type="button" class="btn btn-login" data-dismiss="modal">확인</button>
	    			</div>
	  			</div>
			</div>
		</div>
	</div>
</body>
</html>