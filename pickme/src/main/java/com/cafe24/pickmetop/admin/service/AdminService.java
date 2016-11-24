package com.cafe24.pickmetop.admin.service;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.admin.model.*;
import com.cafe24.pickmetop.admin.repository.AdminDao;

@Service
public class AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminService.class);
	
	@Autowired
	AdminDao adminDao;
	
	//관리자 페이지 각 미승인 게시글 수 가져오기
	public CountVo getUnreceivedListCount(){
		return adminDao.selectUnreceivedListCount();
	}
	
	//방문자수 구하기
	public VisitantCountVo getVisitantCount(){
		Calendar today = Calendar.getInstance();
		String visitantRegdate = today.get(Calendar.YEAR) + "-" + (today.get(Calendar.MONTH)+1) + "-" + today.get(Calendar.DATE);
		return adminDao.selectVisitantCount(visitantRegdate);
	}
}
