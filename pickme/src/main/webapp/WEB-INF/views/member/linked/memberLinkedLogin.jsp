<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/js/naverapi/naverLogin_implicit-1.0.2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<html>
  <head>
    <title>네이버로그인</title>
    <script>
    <!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	
	// 네이버 사용자 프로필 조회
	var naver_id_login = new naver_id_login("0u6HR6yd6PJIE4qoF9Rh", "http://localhost/linkedLogin");
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() {
		location.href = "/linkedLogin?linkedId="+naver_id_login.getProfileData('email')+"&linkedNick=" + naver_id_login.getProfileData('nickname');
	}
    </script>
  </head>
  <body>

  </body>
</html>