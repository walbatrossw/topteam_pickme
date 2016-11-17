<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/module/modHeader.jsp" %>
<h1>회원수정</h1>
아이디: <input type="text" name="id"><br>
 
 
 
 
 
 비밀번호 : <input type="password" name="passwd"><br>
닉네임: <input type="text" name="name"><br>
<input type="submit" value="회원수정"><br>




</body>

</html>