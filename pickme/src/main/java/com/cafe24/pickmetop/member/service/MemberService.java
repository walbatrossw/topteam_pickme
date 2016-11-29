package com.cafe24.pickmetop.member.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.repository.MemberDao;



@Service
public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	MemberDao memberDao;
	private final int LINE_PER_PAGE = 10;
	private final int MAX_PER_PAGE = 5;
	
	// 관리자 사용자 권한 및 id 중복확인
	public boolean addmemberGeneral(MemberGeneralVo memberGeneralVo){
		memberGeneralVo.setGeneralLevel(1);
		memberGeneralVo.setGeneralState(0);
		//로그인 체크 Dao만들고
		int result = memberDao.memberGeneralCheck(memberGeneralVo.getGeneralId());
		if(result == 0) {
			//조건문줘서 로그인중복이 없다면
			memberDao.insertMemberGeneral(memberGeneralVo);
			return true;
		} else {
			//로그인 중복이 있다면 컨트롤러로 뭐 종복이있다는 무슨 경우의 수를 주고
			return false;
		}
		
	}
	
	// session에 id pw 값 비교
	public MemberGeneralVo selectMemberCheck(String generalId, String generalPw){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("generalId", generalId);
		map.put("generalPw", generalPw);
		
		MemberGeneralVo memberGeneralVo = 
				memberDao.memberGeneralCheck(map);
		
/*		Map<String, String> resultMap = memberDao.memberGeneralCheck(generalId, generalPw);
		if(resultMap == null) {
			logger.info("�씪移섑븯�뒗 �븘�씠�뵒 �뾾�쓬");
		} else {
			logger.info("�씪移섑븯�뒗 �븘�씠�뵒 �엳�쓬");
		}*/
		return memberGeneralVo;
	}
	
		// 일반회원 로그인
	public MemberGeneralVo selectmemberGeneral(MemberGeneralVo memberGeneralVo){
		return memberDao.selectMemberGeneral(memberGeneralVo);
	
	}
	
	// 페이징 
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
	
	// 페이지 수
	public int getLastPage() {
		return (int)(Math.ceil((double)memberDao.selectTotalCount()/LINE_PER_PAGE));
	
	}
	
	// 회원정보 수정
	public int memberGeneralUpdate(MemberGeneralVo memberGeneralVo) {
		logger.info("MemberService.java, GeneralId : {}", memberGeneralVo.getGeneralId());
		logger.info("MemberService.java, GeneralPw : {}", memberGeneralVo.getGeneralPw());
		logger.info("MemberService.java, GeneralLevel : {}", memberGeneralVo.getGeneralLevel());
		logger.info("MemberService.java, GeneralNick : {}", memberGeneralVo.getGeneralNick());
		return memberDao.memberGeneralUpdate(memberGeneralVo);
	}
	
	//회원 삭제
	public int memberGeneralDelete(MemberGeneralVo memberGeneralVo) {
		logger.info("MemberService.java, GeneralId : {}", memberGeneralVo.getGeneralId());
		logger.info("MemberService.java, GeneralPw : {}", memberGeneralVo.getGeneralPw());
		logger.info("MemberService.java, GeneralLevel : {}", memberGeneralVo.getGeneralLevel());
		logger.info("MemberService.java, GeneralNick : {}", memberGeneralVo.getGeneralNick());
		return memberDao.memberGeneralDelete(memberGeneralVo);
	}
}
			
	

