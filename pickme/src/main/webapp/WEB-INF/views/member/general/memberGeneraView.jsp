<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    String cp = request.getContextPath();
	String generalId =request.getParameter("generalId");
	String generalPw =request.getParameter("generalPw");
	String generalNick =request.getParameter("generalNick");
	
	/*
		// 세션
		1. jsp : session 내장객체 사용(별도로 객체 생성하지 않아도 됨)
		2. 서블릿 : HttpSession session=req.getSession();
	*/
	
	// System.out.println()은 서버의 콘솔창에 정보를 출력함
	// 실무에서 System.out.println()으로 서버 컴에 정보를 출력하면 아주 많이 무식함...
	System.out.println(session.getId());
	System.out.println(session.getMaxInactiveInterval());
	
	if(generalId.equals("generalId") && generalPw.equals("generalPw")){
		//세션 유지시간 설정(초단위)
		session.setMaxInactiveInterval(1*10);
		//세션에 아이디와 이름을 저장
		session.setAttribute("generalId", generalId);
		session.setAttribute("generalPw", generalPw);
		response.sendRedirect("idex.jsp");
		return;
	}
	
	out.print("<script> alert('아이디 또는 패스워드 틀림');");
	out.print("history.back();</script>");
%>


