<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html lang="kr">
<meta charset="UTF-8">
	<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/memberGeneralInsert.css" type="text/css">


</head>
<body>

<section class="container">
		    <article class="half">
			        <h1>PICK ME 자  소 서 </h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">일반 회원 가입</a></span>
				            <span class="tab signup"><a href="#signup">네이버로 가입</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="/memberGeneralInsert" method="post" enctype="multipart/form-data" id="memberGeneralInsertForm">
					                <input type="hidden" name="memberGeneralCheck" value="T">
					                	<c:if test="${check == null }">
					                		<input type="email" name="generalId" id="generalId" class="inpt" required="required" placeholder="이메일">
					                	</c:if>
						                <c:if test="${check eq '아이디중복' }">
						                 	<input type="email" name="generalId" id="generalId" class="inpt" required="required" placeholder="존재하는 이메일 입니다">
						                </c:if>  
						                    <label for="generalId">이메일</label>
						  				
						                    <input type="password" name="generalPw" id="generalPw" class="inpt" required="required" placeholder="비밀번호">
                						    <label for="generalPw">비밀번호 </label>
                							                 						
                						    <input type="password" name="generalPw2" id="generalPw2" class="inpt" required="required" placeholder="비밀번호확인">
                						    <label for="generalPw2">비밀번호 </label>
                						
                						   <input type="text" name="generalNick" id="generalNick" class="inpt" required="required" placeholder="닉네임">
                						    <label for="generalNick">닉네임 </label>
                						    <h5>회원가입<a href="/terms" class="more">이용약관</a>에 동의하게 됩니다.</h5>
						                     <div class="submit-wrap">
							                        <input type="button" id="signUpBtn" value="회원가입" class="submit" >
							                 </div>
							      </form>
							     </div>
    	
    				        
    				 		        	    <div class="signup-cont cont">
              						  <form action="/memberLinkedInsert" method="post" enctype="multipart/form-data">
						                  
           						         <div id="naver_id_login"></div>
						              
        					        </form>
          					  </div>
			    	    </div>
					</article>
		    <div class="half bg"></div>
	</section>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

$('.tabs .tab').click(function(){
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
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});


<script>

$(document).ready(function() {

	$(".submit").click(function(event) {
		
		var pwd = $("#pwd").val();

		var pwd1 = $("#pwd1").val();


</script>



<script type="text/javascript">
var naver_id_login = new naver_id_login("Ecl6Zyr37OrS3ne25tZr", "http://localhost/memberGeneralInsert#signup");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 2,40);
naver_id_login.setDomain(".service.com");
naver_id_login.setState(state);
//naver_id_login.setPopup();
naver_id_login.init_naver_id_login();
</script>
<!-- //네이버아디디로로그인 초기화 Script -->

<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	// naver_id_login.getProfileData('프로필항목명');
	// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
	alert(naver_id_login.getProfileData('email'));
	alert(naver_id_login.getProfileData('nickname'));
	alert(naver_id_login.getProfileData('age'));
}

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
<script type="text/javascript">

$(document).ready(function() {
		
		$('#signUpBtn').click(function () {
			if($('#generalPw').val() != $('#generalPw2').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#generalPw').focus();
			}else if($('#generalPw').val().length < 5){
				alert("5자리 이상 비밀번호를 입력하세요.");
				$('#generalPw').focus();
			}else if($('#generalNick').val() == "") {
				alert("닉네임을 입력해주세요.")
				$('#generalNick').focus();
			}else {
				$('#memberGeneralInsertForm').submit();	
			}
		});
	});
	
	
	
	</script>
</body>
</html>
