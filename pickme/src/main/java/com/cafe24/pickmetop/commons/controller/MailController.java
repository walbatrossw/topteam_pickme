package com.cafe24.pickmetop.commons.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.pickmetop.commons.MailMail;

@Controller
public class MailController {
	
	final static Logger logger = LoggerFactory.getLogger(MailController.class);
	@RequestMapping(value = "/mail", method = RequestMethod.GET)
	public String home(@RequestParam(value="askContent", defaultValue="")String askContent,
					@RequestParam(value="sessionId", defaultValue="")String sessionId,
					@RequestParam(value="adContent", defaultValue="")String adContent,
					@RequestParam(value="phone", defaultValue="")String phone) {
			logger.info("askContent : {}", askContent);
			logger.info("sessionId : {}", sessionId);
			logger.info("adContent : {}", adContent);
			logger.info("phone : {}", phone);
			String sub = "";
			String content= "";
			if(askContent.equals("")){
				sub = phone+ " :  pickme Á¦ÈÞ/±¤°í ";
				content = adContent;
			}else if(adContent.equals("")){
				sub = sessionId + ": pickme ¹®ÀÇ ";
				content = askContent;
			}
	    	ApplicationContext context =  new ClassPathXmlApplicationContext("/Spring-Mail.xml");
	    	
	    	MailMail mm = (MailMail) context.getBean("mailMail");
	    	mm.sendMail("asdf@gmail.com",
	      		   "yyye1220@naver.com",
	      		   sessionId +sub,
	      		   	content);
		
		return "/maintest";
	}
}
