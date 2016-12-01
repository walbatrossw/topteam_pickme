<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
			
		$("#userDeleteBtn").click(function(){

			if($("#userPw").val() == $("#sessionUserPw").val()) {
				alert("탈퇴 되었습니다."); //경고창 사용여부 논의 후 수정
				$("#userDeleteForm").submit();
			}else {
				alert("비밀번호를 확인해주세요.") //경고창 사용여부 논의 후 수정
			};
		});
		
	});
</script>
<title>Pick Me</title>
</head>
<body>


<div class="wrapper row3">
	<div class="hoc container clear">
		
		
		<div class="content three_quarter">
		<h1>회원탈퇴</h1><hr>
			<form id="memberGeneralUpdateForm" action="/memberGeneralDelete"  class="form-horizontal" method="post">
				
				<!-- session에 저장된 userPw,userCode값 꺼내서 value에 넣기 -->
				<input type="hidden" id="sessionUserPw" value="${userInfo.userPw}"> <!-- ${ssesionKeyValue.userPw} -->				
				<input type="hidden" name="userCode" value="${userInfo.userCode}"> <!-- ${ssesionKeyValue.userCode} -->
						<div class="form-group">							
							<label class="col-md-4 control-label">비밀번호</label>
							<div class="col-md-4">
								<input name="generalPw" id="generalPw" type="password" class="form-control">
								<!-- ENTER 자동 submit 막기 위한 크기가없는 input 박스 -->
								<input style="VISIBILITY: hidden; WIDTH: 0px">
							</div>						
							<div class="form-group">								
								<label class="col-md-4 control-label"></label>
								<div class="col-md-4">
									<input type="button" id="userDeleteBtn" class="btn btn-default" value="탈퇴확인">
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>


</body>
</html>