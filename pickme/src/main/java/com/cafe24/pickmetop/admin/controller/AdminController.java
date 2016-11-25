package com.cafe24.pickmetop.admin.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.pickmetop.admin.service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	
	//관리자 메인페이지 맵핑
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminMain(Locale locale, Model model) {
		model.addAttribute("unreceivedListCount", adminService.getUnreceivedListCount());
		model.addAttribute("visitantCount", adminService.getVisitantCount());
		model.addAttribute("regDateVisitantCountList", adminService.getRegDateVisitantCount());
		return "/admin/adminmain";
	}
}
