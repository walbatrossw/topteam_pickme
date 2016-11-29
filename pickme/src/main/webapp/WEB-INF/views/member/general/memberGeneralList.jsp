<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/module/modHeader.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>전체 회원정보 조회결과</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

    
<div class="container">
  <h2>전체 회원정보 조회결과</h2>
          
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>회원 아이디</th>
        <th>회원 비밀번호</th>
       <th>회원 닉네임</th>
       <th>회원 권한</th>
        <th>회원 가입일자</th>
       <th>최근 로그인일자</th>
       
      </tr>
    </thead>
    
  	<c:forEach  var="memberGeneraList" items="${memberGeneraList}" varStatus="i">
  	  			    	<tr>
				    		<td>${i.count}</td>
				    		<td>${memberGeneraList.generalId}</td>
				    		<td>${memberGeneraList.generalPw}</td>
				    		<td>${memberGeneraList.generalNick}</td>
				    		<td>${memberGeneraList.generalLevel}</td>
				    		<td>${memberGeneraList.generalDate}</td>
				    		<td>${memberGeneraList.generalLogdate}</td>
				    	</tr> 
				</c:forEach>	  
			</tbody>
		</table>
		<!-- 페이징 -->
		
		<div id="paginationWrap">
			<ul class="pagination">
				<li>
					<c:if test="${page>1}">
						<a href="/general/memberGeneralList?page=${page-1}">&laquo;</a>
					</c:if>
				</li>
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
				<li>
					<c:choose>
						<c:when test="${page == i}">
							<a href="/general/memberGeneralList?page=${i}" style="background:#434343; color:#fff;">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="/general/memberGeneralList?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</li>
				</c:forEach>
				<li>
					<c:if test="${page<lastPage}">
						<a href="/general/memberGeneralList?page=${page+1}">&raquo;</a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
</body>

</html>