<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자기소개서</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	//글자수 세기
	$(function() {
	    $('#content').keyup(function (e){
	        var content = $(this).val();
	        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	        $('#counter').html(content.length + '/500');
	    });
	    $('#content').keyup();
	});

	//날짜 UI
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
	//새자소서 
	function newCoverletterPopupOpen(){
		var popUrl = "/companyJobCoverletterList";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//불러오기
	function openCoverletterPopupOpen(){
		var popUrl = "/memberCoverletterList";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//저장하기
	function saveCoverletterPopupOpen(){
		var popUrl = "/saveCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//내보내기
	function exportCoverletterPopupOpen(){
		var popUrl = "/saveCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//인쇄하기
	function printCoverletterPopupOpen(){
		var popUrl = "/printCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//기업정보 검색
	function companyInfoPopupOpen(){
		var popUrl = "/company/info";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//맞춤법 검사
	function spellCheckCoverletterPopupOpen(){
		var popUrl = "/spellCheckCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//메모
	function memoCoverletterPopupOpen(){
		var popUrl = "/memoCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//저장기록
	function saveRecodeCoverletterPopupOpen(){
		var popUrl = "/saveRecodeCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//합격자소서 
	function passCoverletterPopupOpen(){
		var popUrl = "/passCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=1200, height=900, resizable=yes, scrollbars=yes, status=yes;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}
	//오류문항신고
	function errorCoverletterPopupOpen(){
		var popUrl = "/passCoverletter";	//팝업창에 출력될 페이지 URL
		var popOption = "width=700, height=900, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
			window.open(popUrl,"",popOption);
	}

</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<body>
	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<h2>나의 자기소개서!</h2>
			</div>
		</div>
		<div class="row">
    		<ul class="nav navbar-nav navbar-left">
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:newCoverletterPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 새자소서
    				</a>
    			</li>
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:openCoverletterPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span> 불러오기
    				</a>
    			</li>
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:saveCoverletterPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-save" aria-hidden="true"></span> 저장하기
    				</a>
    			</li>
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:exportCoverletterPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-export" aria-hidden="true"></span> 내보내기
    				</a>
    			</li>
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:printCoverletterPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-print" aria-hidden="true"></span> 인쇄하기
    				</a>
    			</li>
    			<li>
    				<a class="btn btn-default navbar-btn" href="javascript:companyInfoPopupOpen()" role="button">
    					<span class="glyphicon glyphicon-modal-window" aria-hidden="true"></span> 기업정보
    				</a>
    			</li>
      			<li>
      				<a class="btn btn-default navbar-btn" href="javascript:spellCheckPopupOpen()" role="button">
      					<span class="glyphicon glyphicon-search" aria-hidden="true"></span> 맞춤법
      				</a>	
      			</li>
      			<li>
      				<a class="btn btn-default navbar-btn" href="javascript:memoCoverletterPopupOpen()" role="button">
      					<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> 메모장
      				</a>	
      			</li>
      			<li>
      				<a class="btn btn-default navbar-btn" href="javascript:saveRecodeCoverletterPopupOpen()" role="button">
      					<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> 저장기록
      				</a>
      			</li>
      			<li>
      				<a class="btn btn-default navbar-btn" href="javascript:passCoverletterPopupOpen()" role="button">
      					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 합격자소서
      				</a>
      			</li>
      		</ul>
  		</div>
		<hr>
		<form id="memberCoverletterInsert" action="/memberCoverletterInsert" method="post">
			<div class="row col-sm-12">
				<div class="row col-sm-12">
					<div class="row col-sm-6">
						자소서이름:<input type="text" class="form-control"  id="" name="" value="나의 자소서 : 회사명/직무">
					</div>
					<div class="row col-sm-3">
						마감일자:<input type="text" class="form-control" id="datepicker" name="">
					</div>
				</div>
					<hr>
				<div>
					<textarea class="form-control" rows="2" id="" name="" style="resize:none">자기소개서 항목 : </textarea>
				</div>
				<div align="right">
					자기소개서 문항을 반드시 확인해주세요
					<a class="btn btn-default btn-xs" href="javascript:errorCoverletterPopupOpen()" role="button">오류문항신고</a>
				</div>
				<div>
					<div>
						<textarea class="form-control" rows="10" id="content" name="" style="resize:none" placeholder="내용을 입력해주세요"></textarea>
					</div>
					<hr>
				</div>
				<div>
					<div>
						글자수 세기:<span id="counter">###</span>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp"/>
</html>