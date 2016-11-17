<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="/WEB-INF/views/common/module/modHeader.jsp" %>
<br>
<br>
<div class="container">
  <h2>회원정보 변경</h2>
 
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>개인정보 변경</th>
       
      
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>이용약관</td>
        
      
      </tr>
      <tr>
        <td>개인정보취급방침</td>
        
       
      </tr>
      <tr>
        <td>문의하기</td>
        
      
      </tr>
      
       <tr>
        <td>제휴제안</td>
        
      
      </tr>
      
      
       <tr>
        <td>회사 소개</td>
        
      
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>