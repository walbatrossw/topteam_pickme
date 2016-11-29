<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
<%
    String clientId = "PI5oHtZhS4UHhoIXWnRS";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/memberGeneralLogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
 


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/memberGeneralInsert.css" type="text/css">


</head>
<body>

<section class="container">
		    <article class="half">
			        <h1>PICK ME 자  소 서 </h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">일반로그인</a></span>
				            <span class="tab signup"><a href="#signup">네이버로 로그인</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="/memberGeneralLogin" method="post" enctype="multipart/form-data">
						                    <input type="email" name="generalId" id="generalId" class="inpt" required="required" placeholder="이메일">
						                    <label for="email">이메일</label>
						                    <input type="password" name="generalPw" id="generalPw" class="inpt" required="required" placeholder="비밀번호">
                						    <label for="generalPw">비밀번호 </label>
                						   	
                						     <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">비밀번호 확인</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
   											 <label for="remember">자동 로그인</label>
						                    
						                      <div class="submit-wrap">
						                      
							                        <input type="submit" value="일반로그인" class="submit">
							                        
						                    </div>
        					      	  </form>
    				      		  </div>
    				        	        <div class="signup-cont cont">
              					  <form action="/memberLinkedLogin" method="post" enctype="multipart/form-data">
						                  
                    
						               <a href="<%=apiURL%>"><img element.style width=100% height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
        					        </form>
          					  </div>
			    	    </div>
					</article>
		    <div class="half bg"></div>
		    
	</section>
	


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
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
</script>
</body>
</html>
