package com.cafe24.pickmetop.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.model.MemberLinkedVo;
import com.cafe24.pickmetop.member.repository.MemberDao;



@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	private final int LINE_PER_PAGE = 10;
	private final int MAX_PER_PAGE = 5;
	
	// 회원 가입 및 관리자 권환 부여
	public void addmemberGeneral(MemberGeneralVo memberGeneralVo){
		memberGeneralVo.setGeneralLevel(1);
		memberGeneralVo.setGeneralState(0);
		memberDao.insertMemberGeneral(memberGeneralVo);
	}
	
	// 회원 검색
	public MemberGeneralVo selectmemberGeneral(MemberGeneralVo memberGeneralVo){
		return memberDao.selectMemberGeneral(memberGeneralVo);
	}
	
	// 회원 리스트
	public Map<String, Object> getMemberGeneralList(int page, String word){
		PageHelper  pageHelper = new PageHelper(page,LINE_PER_PAGE);
		pageHelper.setLastPage(memberDao.selectTotalCount(), MAX_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		map.put("pageHelper", pageHelper);
		map.put("word", word);
		resultMap.put("startPage", pageHelper.startPage(page, MAX_PER_PAGE));
		resultMap.put("endPage", pageHelper.endPage());
		resultMap.put("memberGeneralList", memberDao.selectMemberGeneralList(map));
		
		return resultMap;
	} 
	
	// 회원리스트 페이지
	public int getLastPage() {
		return (int)(Math.ceil((double)memberDao.selectTotalCount()/LINE_PER_PAGE));
	
	}
	
	
		
	public void addmemberLinked(MemberLinkedVo memberLinkedVo){
		
		memberDao.insertMemberLinked(memberLinkedVo);
		
	}

	  

	}

			
	

