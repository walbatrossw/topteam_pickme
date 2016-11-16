<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
 .row.content {
	height: 1500px
} 

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}
/* On small screens, set height to 'auto' for sidenav and grid */
 @media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	} 
}
</style>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
<br>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>자유게시판</h4>
				<ul class="nav nav-pills nav-stacked">
					<li class="active">
					<a href="#">전체글보기</a></li>
					<li><a href="#">잡담</a></li>
					<li><a href="#">근무환경</a></li>
					<li><a href="#">자소서</a></li>
					<li><a href="#">인적성</a></li>
					<li><a href="#">자격증</a></li>
					<li><a href="#">어학</a></li>
				</ul>
				<br>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="글제목으로 검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
			<div class="col-sm-9">
				<hr>
				<form role="form">
					<table>
						<tr>
							<td>		
								<select class="form-control">
									<option>카테고리선택</option>
									<option>잡담</option>
									<option>근무환경</option>
									<option>자소서</option>
									<option>인적성</option>
									<option>자격증</option>
									<option>어학</option>
								</select>
							</td>
							<td width="80%">
								<input type="text" placeholder="제목입력" class="form-control" rows="1" required >
							</td>
						<tr>
					</table>
				<br>
				<textarea placeholder="내용입력" class="form-control" rows="3" required ></textarea>
				<br>
				<button type="submit" class="btn btn-default">게시하기</button>
				</form>
				<br>
				<hr>
			</div>
			<div class="col-sm-9">
				<hr>
				<h3>글제목</h3>
				<h5>
					<span class="glyphicon glyphicon-time"></span> 작성자 작성일
				</h5>
				<h5>
					<span class="label label-success">카테고리</span>
				</h5>
				<br>
				<p>내용</p>
				<hr>

				<form role="form">
					<div class="form-group">
						<textarea placeholder="댓글 입력" class="form-control" rows="3" required ></textarea>
					</div>
					<button type="submit" class="btn btn-success">등록</button>
				</form>
				<br>
				<hr>
				<div class="row">
					<div class="col-sm-10">
						<span>
							댓글아이디   <small>댓글시간</small>
						</span>
						<p>댓글</p>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>

