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
<title>시커먼스</title>
</head>
<body>
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
<title>시커먼스</title>
</head>
<body>
<jsp>

<div class="wrapper row3">
	<div class="hoc container clear">
		<jsp>
		
		<div class="content three_quarter">
		<h1>회원탈퇴</h1><hr>
			<form id="userDeleteForm" action="/userStateUpdate"  class="form-horizontal" method="post">
				
				<!-- session에 저장된 userPw,userCode값 꺼내서 value에 넣기 -->
				<input type="hidden" id="sessionUserPw" value="${userInfo.userPw}"> <!-- ${ssesionKeyValue.userPw} -->				
				<input type="hidden" name="userCode" value="${userInfo.userCode}"> <!-- ${ssesionKeyValue.userCode} -->
				<fieldset>
									
					<div class="form-group">
						<ul>
							<li>회원탈퇴시 회원님의 본 사이트에 입력한 회원님의 모든 정보가 자동삭제 됩니다.</li>
							<br>
							<li>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에
								의거하여 표시 및 광고에 관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급
								등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
						</ul>
					</div>
					
					<div style="background-color: #ffdcdc" class="form-group">
						<ul>
							<li>본인 확인을 위해 비밀번호를 입력한 후, “탈퇴확인” 버튼을 눌러주세요.<br>
							(회원 탈퇴시 나의계정의 <strong style="color: red;">모든 정보와 DB가 자동 삭제되며,<br>
							재가입하신 이후에도 사이트 이용에도 제한이 적용</strong>되오니 신중하게 탈퇴신청을 해주세요.)<br>
						</li>
						</ul>						
						<div class="form-group">							
							<label class="col-md-4 control-label">비밀번호</label>
							<div class="col-md-4">
								<input name="userPw" id="userPw" type="password" class="form-control">
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
<title>시커먼스</title>
</head>
<body>
<jsp>

<div class="wrapper row3">
	<div class="hoc container clear">
		<jsp>
		
		<div class="content three_quarter">
		<h1>회원탈퇴</h1><hr>
			<form id="userDeleteForm" action="/userStateUpdate"  class="form-horizontal" method="post">
				
				<!-- session에 저장된 userPw,userCode값 꺼내서 value에 넣기 -->
				<input type="hidden" id="sessionUserPw" value="${userInfo.userPw}"> <!-- ${ssesionKeyValue.userPw} -->				
				<input type="hidden" name="userCode" value="${userInfo.userCode}"> <!-- ${ssesionKeyValue.userCode} -->
				<fieldset>
									
					<div class="form-group">
						<ul>
							<li>회원탈퇴시 회원님의 본 사이트에 입력한 회원님의 모든 정보가 자동삭제 됩니다.</li>
							<br>
							<li>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에
								의거하여 표시 및 광고에 관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급
								등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
						</ul>
					</div>
					
					<div style="background-color: #ffdcdc" class="form-group">
						<ul>
							<li>본인 확인을 위해 비밀번호를 입력한 후, “탈퇴확인” 버튼을 눌러주세요.<br>
							(회원 탈퇴시 나의계정의 <strong style="color: red;">모든 정보와 DB가 자동 삭제되며,<br>
							재가입하신 이후에도 사이트 이용에도 제한이 적용</strong>되오니 신중하게 탈퇴신청을 해주세요.)<br>
						</li>
						</ul>						
						<div class="form-group">							
							<label class="col-md-4 control-label">비밀번호</label>
							<div class="col-md-4">
								<input name="userPw" id="userPw" type="password" class="form-control">
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

<jsp>
</body>
</html>
</body>
</html>

<div class="wrapper row3">
	<div class="hoc container clear">
		<jsp>
		
		<div class="content three_quarter">
		<h1>회원탈퇴</h1><hr>
			<form id="userDeleteForm" action="/userStateUpdate"  class="form-horizontal" method="post">
				
				<!-- session에 저장된 userPw,userCode값 꺼내서 value에 넣기 -->
				<input type="hidden" id="sessionUserPw" value="${userInfo.userPw}"> <!-- ${ssesionKeyValue.userPw} -->				
				<input type="hidden" name="userCode" value="${userInfo.userCode}"> <!-- ${ssesionKeyValue.userCode} -->
				<fieldset>
									
					<div class="form-group">
						<ul>
							<li>회원탈퇴시 회원님의 본 사이트에 입력한 회원님의 모든 정보가 자동삭제 됩니다.</li>
							<br>
							<li>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에
								의거하여 표시 및 광고에 관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급
								등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</li>
						</ul>
					</div>
					
					<div style="background-color: #ffdcdc" class="form-group">
						<ul>
							<li>본인 확인을 위해 비밀번호를 입력한 후, “탈퇴확인” 버튼을 눌러주세요.<br>
							(회원 탈퇴시 나의계정의 <strong style="color: red;">모든 정보와 DB가 자동 삭제되며,<br>
							재가입하신 이후에도 사이트 이용에도 제한이 적용</strong>되오니 신중하게 탈퇴신청을 해주세요.)<br>
						</li>
						</ul>						
						<div class="form-group">							
							<label class="col-md-4 control-label">비밀번호</label>
							<div class="col-md-4">
								<input name="userPw" id="userPw" type="password" class="form-control">
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

<jsp>
</body>
</html>