package com.cafe24.pickmetop.commons;

import java.util.Calendar;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

import com.cafe24.pickmetop.commons.repository.CommonsDao;

@Component
public class LoggingListener implements HttpSessionListener{
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(LoggingListener.class);
	public LoggingListener(){}
	
	public void sessionCreated(HttpSessionEvent hse) {
		hse.getSession().setMaxInactiveInterval(30*60);
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(hse.getSession().getServletContext(), FrameworkServlet.SERVLET_CONTEXT_PREFIX + "appServlet");
		CommonsDao commonsDao = (CommonsDao) context.getBean("CommonsDao");
		/*HttpSession session = hse.getSession();*/
		Calendar today = Calendar.getInstance();
		String visitantRegdate = today.get(Calendar.YEAR) + "-" + (today.get(Calendar.MONTH)+1) + "-" + today.get(Calendar.DATE);
		if(commonsDao.selectVisitantRegdate(visitantRegdate) == 0){
			logger.info("insert : {}");
			commonsDao.insertTodayVisitant();
		}else{
			logger.info("update : {}");
			commonsDao.updateTodayVisitant(visitantRegdate);
		}
	}

	public void sessionDestroyed(HttpSessionEvent hse) {
		HttpSession session = hse.getSession();
		System.out.println(session.getId() + ": 세션이 소멸되었습니다.");
	}
}
