<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/company/companyinfo.css">
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
 .row.content {height:1500px} 

/* Set gray background color and 100% height */
.sidenav {
	width : 20%;
	background-color: #f1f1f1;
	height: 100%; 
	position: fixed;
}
.body{

	margin-left : 25%;
}
/* On small screens, set height to 'auto' for sidenav and grid */
 @media screen and (max-width: 767px) {
	.sidenav {
		width : 20%;
		height: auto;
		padding: 15px;
		position: fixed;
	}
	.row.content {
		height: auto;
	} 
}
</style>
<script>
$(document).ready(function(){
	//게시글 등록
	$('#submitBtn').click(function(){
		//유효성검사
		console.log("카테고디"+$('#freeboardCateCd > option:selected').val());
		if($('#sessionId').val()==""||$('#sessionId').val()==null){
			location.href="/memberGeneralLogin";
		}else if($('#freeboardContent').val()==""){
			$('#freeboardContent').focus();
		}else if($('#freeboardTitle').val()==""){
			$('#freeboardTitle').focus();
		}else if($('#freeboardCateCd > option:selected').val()==""){
			$('#freeboardCateCd').focus();
			$('#insertError').text(' * 카테고리를 선택하세요 ');
		}else{
			$('#boardInsertForm').submit();
		}
		
	});
	//검색어  
	$('#searchBoardBtn').click(function(){
		if($('#cateFromServer').val()==""){
			location.href="/freeboardList?boardSearch="+$('#boardSearchKeyword').val();
		}else if($('#cateFromServer').val()!=""){
			location.href="/freeboardList?boardSearch="+$('#boardSearchKeyword').val()
					+"&cate="+$('#cateFromServer').val();
		}		
	});
	$('#boardSearchKeyword').change(function(){
		
		if($('#cateFromServer').val()==""){
			location.href="/freeboardList?boardSearch="+$('#boardSearchKeyword').val();
		}else if($('#cateFromServer').val()!=""){
			location.href="/freeboardList?boardSearch="+$('#boardSearchKeyword').val()
					+"&cate="+$('#cateFromServer').val();
		}		
	});
	
	//리플 
	$('.replyBtn').click(function(){
		
		var order = $('.replyBtn').index(this)
		console.log("order : "+order)
		$('.replyContent').eq(order).val().replace(/\n/g, "<br>")
 		if($('#sessionId').val()==""||$('#sessionId').val()==null){
 			location.href="/memberGeneralLogin";
 			console.log("1번")
		}else if($('.replyContent').eq(order).val()==""){
			$('.replyContent').eq(order).focus();
			console.log("2번")
		}else{
			location.href="/freeboardReply?freeboardCd="+$('.replyHidden').eq(order).val()
					+"&replyContent="+$('.replyContent').eq(order).val();
			console.log("3번")
		}
	});
	//수정 
	$('.updateReply').click(function(){
		$('.reply').html("<input type ='text' value='${replyMap.replyContent}' id='updating'>")
	})
	
});
</script>
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp" />
<body>
<input type="hidden" id="cateFromServer" value="${freeboardCate}">
<input type="hidden" id="sessionId" value="${sessionScope.generalId}">
<br>
<div class="container-fluid">
	<div class="row content">
	
		<!-- 사이드바 -->
		<div class="sidenav">
			<h3><a href="/freeboardList">자유게시판${sessionScope.generalId}</a></h3>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="/freeboardList">전체글보기</a></li>
				<c:forEach items="${cateForView}" var="cateForView">
					<c:if test="${freeboardCate==cateForView.freeboardCateCd}">
						<li class="active">
							<a href="/freeboardList?cate=${cateForView.freeboardCateCd}">${cateForView.categoryKeyword}</a>
						</li>
					</c:if>
					<c:if test="${freeboardCate!=cateForView.freeboardCateCd}">
						<li>
							<a href="/freeboardList?cate=${cateForView.freeboardCateCd}">${cateForView.categoryKeyword}</a>
						</li>
					</c:if>
					
				</c:forEach>
			</ul>
			<br>
			
			<div class="input-group">
				<input type="text" id="boardSearchKeyword" class="form-control" placeholder="검색어 입력">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" id="searchBoardBtn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<!-- 사이드바 -->
		

		<!-- 게시글입력 -->
		<div class="body">
		<div class="col-sm-9">
			<hr>
			<form role="form" id="boardInsertForm" action="/freeboardInsert">
				<table>
					<tr>
						<td>		
							<select class="form-control" name="freeboardCateCd" id="freeboardCateCd">
								<option value="">카테고리선택</option>
								<option value="1">잡담</option>
								<option value="2">근무환경</option>
								<option value="3">자소서</option>
								<option value="4">인적성</option>
								<option value="5">자격증</option>
								<option value="6">어학</option>
							</select>
						</td>
						<td width="80%" colspan="2">
							<input type="text" name="freeboardTitle" id="freeboardTitle" placeholder="제목입력" class="form-control" rows="1" required >
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<br>
							<textarea name="freeboardContent" id="freeboardContent" class="form-control" rows="3"
							placeholder="이곳은 소통을 위한공간입니다. 서비스문의및 건의사항은 사이트 하단의 문의하기를 이용해 주세요"  required ></textarea>
							<br>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<button type="button" id="submitBtn" class="btn btn-default">게시하기</button>
							<span id="insertError"></span>
						</td>
					</tr>
				</table>
				<hr>
			</form>
		
		<!-- 게시글리스트 -->
		<c:forEach items="${freeList}" var="freeList">
		<input type="hidden" class="replyHidden" value="${freeList.freeboardCd}">
				<table>
					<tr>
						<td>
							<h4>
								<span class="label label-success">
									<c:if test="${freeList.freeboardCateCd=='1'}">
										잡담
									</c:if>
									<c:if test="${freeList.freeboardCateCd=='2'}">
										근무환경
									</c:if>
									<c:if test="${freeList.freeboardCateCd=='3'}">
										자소서
									</c:if>
									<c:if test="${freeList.freeboardCateCd=='4'}">
										인적성
									</c:if>
									<c:if test="${freeList.freeboardCateCd=='5'}">
										자격증
									</c:if>
									<c:if test="${freeList.freeboardCateCd=='6'}">
										어학
									</c:if>
								</span>
								${freeList.freeboardTitle}
							</h4>
						</td>
					</tr>
					<tr>
						<td>
							<h5>
								${freeList.freeboardNick} /<span class="glyphicon glyphicon-time"></span>${freeList.freeboardRegdate}
							</h5>
						</td>
					</tr>
					<tr>
						<td>
							<br>
								<p>${freeList.freeboardContent}</p>
							<br>
						</td>
					</tr>
					
					<!-- 댓글입력 -->					
					<tr>
						<td>
							<div class="input-group">
							    <textarea class="form-control replyContent"  rows="2" cols="120" style="resize:none" placeholder="댓글 입력" required></textarea>     
							    <span class="input-group-addon btn btn-primary replyBtn">등록</span>
							</div>
							<br>
						</td>
					</tr>
				</table>
				
				
				<table>
					<!-- 댓글리스트 -->
					<c:forEach items="${replyMap}" var="replyMap">
					<tr>
						<td>
						<c:if test="${replyMap.freeboardCd == freeList.freeboardCd}">
							 <div class="row"> 
								<div class="col-sm-10">
									<span style="font-weight: bolder;">
										${replyMap.loginNick}  
										<span class="glyphicon glyphicon-time"></span><small>${replyMap.replyRegdate}</small>
									</span>
						</td>
					</tr>	
					<tr>
						<td width="90%">	
							<p class="reply">${replyMap.replyContent}</p>
						</td>
						<td>			
							<a href="/freeboardReplyDelete?replyCd=${replyMap.replyCd}" class="btn btn-default">삭제</a>
						</td>
						<td>
							<a href="/freeboardReplyUpdate?replyCd=${replyMap.replyCd}" class="updateReply btn btn-default">수정</a>
								</div>
							 </div> 
						 </c:if>
						</td>
					</tr>
				
					</c:forEach>
					</table>
				
			<hr>
			<br>
		</c:forEach>
		<!-- 게시글리스트끝 -->
				<!-- 페이징 -->
				<div class="text-center">
					<ul class="pager">
						<li class="previous"><a href="/freeboardList?cate=${freeboardCate}&page=${page-1}">이전</a></li>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${page == i}">
									<li class="active"><a href="/freeboardList?cate=${freeboardCate}&page=${i}">${i}</a></li>
								</c:if>
								<c:if test="${page != i}">
									<li><a href="/freeboardList?cate=${freeboardCate}&page=${i}">${i}</a></li>
								</c:if>
						</c:forEach>
						<li class="next"><a href="/freeboardList?cate=${freeboardCate}&page=${page+1}">다음</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modFooter.jsp" />
</html>

