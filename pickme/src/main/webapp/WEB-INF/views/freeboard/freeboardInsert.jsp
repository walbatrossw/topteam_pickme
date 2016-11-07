<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<div class="container">
  <h2>Table</h2>
  
  <div class="table-responsive">
  <table class="table">
    <thead>
      <tr>
        <th>게시글 코드</th>
        <th>아이디</th>
        <th>등록일</th>
        <th>게시글제목</th>
        <th>게시글 내용</th>
        <th>닉네임</th>
        <th>카테고리</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Anna</td>
        <td>Pitt</td>
        <td>35</td>
        <td>New York</td>
        <td>USA</td>
        <td>USA</td>
      </tr>
    </tbody>
    <tbody>
      <tr>
        <td>2</td>
        <td>Anna</td>
        <td>Pitt</td>
        <td>35</td>
        <td>New York</td>
        <td>USA</td>
        <td>USA</td>
      </tr>
    </tbody>
  </table>
  </div>
</div>

</body>
	<body id="page-top" class="index">
		<div class="container">
			<input type="hidden" name="group_id" value=""/>
			<input type="hidden" name="depth" value=""/>
		 	<input type="hidden" name="board_id" value="" />
		 	<input type="hidden" name="mode" value=""/>
		 	<input type="hidden" name="comment_userid" value=""/>
			<input type="hidden" name="classify" value=""/>
			<input type="hidden" name="subclass" value=""/>
			<tr align="right">
                <td colspan="5">
                <input type="button" value="글쓰기">
			</tr>
		</div>	
		
	
</html>