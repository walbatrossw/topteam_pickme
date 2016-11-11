<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
</head>
<body>
<div class="container">
    <h1>memberGenera LIST</h1>
    <table class="table">
        <thead>
            <tr>
                </td><td>id</td><td>pw</td><td>nick</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${memberGeneralListList}">
                <tr>
                    <td>${u.userNo}</td><td>${u.userId}</td><td>${u.userPw}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 아이디 검색 -->
    <div>
        <form action="/userList">
            아이디 검색 : <input type="text" name="word"/><input type="submit"/>
        </form>
    </div>
    <!-- 페이징 -->
    <div>
        <c:if test="${page>1}">
            <a href="/memberGeneralList?page=${page-1}">이전</a>
        </c:if>
        
        ${page}
        
        <c:if test="${page<lastPage}">
            <a href="/memberGeneralList?page=${page+1}">다음</a>
        </c:if>
    </div>
</div>
</body>
</html>

