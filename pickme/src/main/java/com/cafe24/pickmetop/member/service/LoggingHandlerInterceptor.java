package com.cafe24.pickmetop.member.service;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoggingHandlerInterceptor  extends HandlerInterceptorAdapter{
	/*public boolean perHandel(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

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
				}*/
			}


