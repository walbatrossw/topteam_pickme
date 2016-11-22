<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#sendMail').click(function(){
		alert("$('#askContent').val() : " + $('#askContent').val())
		if($('#sessionId').val()==""||$('#sessionId').val()==null){
			alert("로그인후 이용가능합니다.")
			location.href="/memberGeneralLogin";
		}else{
			location.href="/mail?askContent="+encodeURIComponent($('#askContent').val())
			+"&sessionId="+$('#sessionId').val();
		}

	})
})
</script>
</head>
<body>
<div class="container footer">
	<section>
		<div class="text-center">
	    	<a href="http://blog.anchoreer.com/220470732604" target="_blank">회사소개</a> 
	    	| <!-- <a href="" ng-click="inquiry()">문의하기</a>  -->
	    	<a data-toggle="modal" data-target="#myModal">문의하기</a>
	    	| <a href="/personalPolicy">개인정보취급방침</a> 
	    	| <a href="" ng-click="partnership()">제휴/광고</a>
	    	<div>
	      		<span>(주)PICK ME(대표: 더블에스)</span> |
	      		<span>개인정보보호관리자: 더블에스</span>
	    	</div>
	    	<div>
	      		<span>전북 전주시 덕진구 기린대로 446</span> |
	      		<span>전화번호: 063-717-1008</span>
	    	</div>
	    	<div>
	      		<span>사업자등록 : 000-0000-00000</span> |
	      		<span>직업정보제공사업 : J1200020160017</span> | 
	      		<span>통신판매업 : 2016-서울강남-00784</span>
	    	</div>
	    	<div>
	     		<span>Copyright T.O.P Co., Inc. All rights reserved.</span>
	    	</div>
	    </div>
	</section>
	
	  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">문의사항</h4>
        </div>
        <div class="modal-body">
        <div>
        <input type="text"  class="form-control" id="sessionId" value="${sessionScope.generalId}">
        </div>
        <br>
        <div>
        <textarea rows="10" cols="120" class="form-control" id="askContent"></textarea>
        </div>
        </div>
        <div class="modal-footer">
       		 <span  style="color: gray;">* 전송에는 2~3초 가량 소요됩니다 </span>
      	 	 <button type="button" id="sendMail" class="btn btn-default">완료</button>
        	 <button type="button" class="btn btn-default " data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>