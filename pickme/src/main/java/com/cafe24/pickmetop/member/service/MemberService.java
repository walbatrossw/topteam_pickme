package com.cafe24.pickmetop.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.model.MemberLinkedVo;
import com.cafe24.pickmetop.member.repository.MemberDao;

@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	
	public void addmemberGeneral(MemberGeneralVo memberGeneralVo){
		memberGeneralVo.setGeneralLevel(1);
		memberGeneralVo.setGeneralState(0);
		 memberDao.insertMemberGeneral(memberGeneralVo);
		
	}
	public MemberGeneralVo selectmemberGeneral(MemberGeneralVo memberGeneralVo){
		return memberDao.selectMemberGeneral(memberGeneralVo);
	
		
		
	}
	
	
	
	
	
	public void addmemberLinked(MemberLinkedVo memberLinkedVo){
		
		memberDao.insertMemberLinked(memberLinkedVo);
		
	}

			
	
}
