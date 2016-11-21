package com.cafe24.pickmetop.member.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.model.MemberLinkedVo;
import com.cafe24.pickmetop.member.model.*;

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	private final String NS = "com.cafe24.pickmetop.member.repository.MemberMapper";
	@Autowired
	@Resource(name="sqlSessionMember")
	private SqlSessionTemplate sqlSessionFactoryMember;
	
	//회원정보 
	public int insertMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.insert(NS+".insertMemberGeneral", memberGeneralVo);
	}
	//로그인 아이디 체크
	public Map<String, String> memberGeneralCheck(String generalId, String generalPw) {
	
		logger.info("generalId : {}", generalId);
		logger.info("generalPw : {}",generalPw);
		Map map = new HashMap();
		map.put("generalId", generalId);
		map.put("generalPw", generalPw);
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralCheck", map);
	}
	// 
	public MemberGeneralVo selectMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.selectOne(NS+".selectMemberGeneral", memberGeneralVo);
	}
	
	
	
	// 회원 리스트
	public List<MemberGeneralVo> selectMemberGeneralList(Map<String, Object> map){
		return sqlSessionFactoryMember.selectList(NS+".selectMemberGeneralList", map);
	}
	
	// 회원 페이지
	public int selectTotalCount() {
		return sqlSessionFactoryMember.selectOne(NS+".selectTotalCount");
		
	}

	
	
	public int insertMemberLinked(MemberLinkedVo memberLinkedVo){
		return sqlSessionFactoryMember.insert(NS+".insertMemberLinked", memberLinkedVo);
		
	}
	//회원 암호 닉네임 변경 
	public int memberGeneralUpdate(MemberGeneralVo memberGeneralVo){
		logger.info("memberGeneralUpdate() MemberDao.java");
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralUpdate", memberGeneralVo);
	}
	
}

		
