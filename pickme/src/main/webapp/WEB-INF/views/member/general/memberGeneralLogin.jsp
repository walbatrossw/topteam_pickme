<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!doctype html>
<html lang="kr">
<head>
<script type="text/javascript"
	src="/js/naverapi/naverLogin_implicit-1.0.2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/memberGeneralInsert.css"
	type="text/css">
</head>
<body>
	<section class="container">
		<article class="half">
			<h1>PICK ME 자 소 서</h1>
			<div class="tabs">
				<span class="tab signin active"><a href="#signin">로그인</a></span>
			</div>
			<div class="content">
				<div class="signin-cont cont">
					<form action="/memberGeneralLogin" method="post"
						enctype="multipart/form-data">
						<input type="email" name="generalId" id="generalId" class="inpt" required="required" placeholder="이메일"> <label for="email">이메일</label>
						<input type="password" name="generalPw" id="generalPw" class="inpt" required="required" placeholder="비밀번호"> 
						<label for="generalPw">비밀번호</label> 
						<input type="checkbox" id="remember" class="checkbox" checked> 
						<label for="remember">비밀번호 확인</label> 
						<input type="checkbox" id="remember" class="checkbox" checked> 
						<label for="remember">자동 로그인</label>

						<div class="submit-wrap">
							<input type="submit" value="일반로그인" class="submit">
							<div id="naver_id_login"></div>
							<script>
							<!-- 네이버아디디로로그인 초기화 Script -->
								var naver_id_login = new naver_id_login(
										"0u6HR6yd6PJIE4qoF9Rh",
										"http://localhost/linkedLogin");
								var state = naver_id_login.getUniqState();
								naver_id_login.setButton("green", 3, 40);
								naver_id_login.setDomain(".service.com");
								naver_id_login.setState(state);
								naver_id_login.init_naver_id_login();
								<!--
							//네이버아디디로로그인 초기화 Script -->
							</script>
						</div>
					</form>
				</div>



			</div>

		</article>
		<div class="half bg"></div>

	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$('.tabs .tab').click(function() {
			if ($(this).hasClass('signin')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signin-cont').show();
			}
			if ($(this).hasClass('signup')) {
				$('.tabs .tab').removeClass('active');
				$(this).addClass('active');
				$('.cont').hide();
				$('.signup-cont').show();
			}
		});
		$('.container .bg').mousemove(
				function(e) {
					var amountMovedX = (e.pageX * -1 / 30);
					var amountMovedY = (e.pageY * -1 / 9);
					$(this).css('background-position',
							amountMovedX + 'px ' + amountMovedY + 'px');
				});
	</script>
</body>
</html>
