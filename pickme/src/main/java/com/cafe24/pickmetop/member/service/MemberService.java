package com.cafe24.pickmetop.member.service;

import java.util.HashMap;
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
	
	// �Ϲ� ȸ�� ���� ������ ����
	public void addmemberGeneral(MemberGeneralVo memberGeneralVo){
		memberGeneralVo.setGeneralLevel(1);
		memberGeneralVo.setGeneralState(0);
		memberDao.insertMemberGeneral(memberGeneralVo);
	}
	
	
	public Map<String, String> selectMemberCheck(String generalId, String generalPw){
		
		
		Map<String, String> resultMap = memberDao.memberGeneralCheck(generalId, generalPw);
		if(resultMap == null) {
			logger.info("일치하는 아이디 없음");
		} else {
			logger.info("일치하는 아이디 있음");
		}
		return resultMap;
	}
	


	
	
	// ȸ�� ����
	public MemberGeneralVo selectmemberGeneral(MemberGeneralVo memberGeneralVo){
		return memberDao.selectMemberGeneral(memberGeneralVo);
	}
	
	// ȸ�� ����Ʈ �� ������
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
	
	// ���� ������ ���� ������
	public int getLastPage() {
		return (int)(Math.ceil((double)memberDao.selectTotalCount()/LINE_PER_PAGE));
	
	}
	
	
		
	public void addmemberLinked(MemberLinkedVo memberLinkedVo){
		
		memberDao.insertMemberLinked(memberLinkedVo);
		
	}

	  

	}

			
	

