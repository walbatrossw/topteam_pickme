package com.cafe24.pickmetop.member.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;


public class LoggingHandlerInterceptor  extends HandlerInterceptorAdapter{
	public boolean perHandel(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

			HttpSession session = request.getSession(false);
				if(session == null) {	
					response.sendRedirect(request.getContextPath()+"/member/general/memberGeneralLogin.jsp");
						return false;
		}
			MemberGeneralVo MemberGenera = (MemberGeneralVo)session.getAttribute("memberGeneralVo");
				if(MemberGenera == null) {	
					response.sendRedirect(request.getContextPath()+"/member/general/memberGeneralLogin.jsp");
						return false;
					}
					return true;
				}
			}


