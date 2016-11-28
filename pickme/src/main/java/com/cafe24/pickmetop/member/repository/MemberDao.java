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
	
	//�쉶�썝�젙蹂�  蹂대뒗 �솕硫� �셿猷�
	public int insertMemberGeneral(MemberGeneralVo memberGeneralVo){
		
		return sqlSessionFactoryMember.insert(NS+".insertMemberGeneral", memberGeneralVo);
	}
	
	// 아이디 체크 
	public MemberGeneralVo memberGeneralCheck(Map<String, Object> map) {
	
/*		logger.info("generalId : {}", generalId);
		logger.info("generalPw : {}",generalPw);
		Map map = new HashMap();
		map.put("generalId", generalId);
		map.put("generalPw", generalPw);*/
	
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralCheck", map);
	}
	
	public int memberGeneralCheck(String generalId) {
		logger.info("generalId : {}", generalId);	
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralIdCheck", generalId);
	}
	
	// �씪諛� 濡쒓렇�씤 泥섎━ �셿猷�
	public MemberGeneralVo selectMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.selectOne(NS+".selectMemberGeneral", memberGeneralVo);
	}
			
	// �쉶�썝 由ъ뒪�듃 �셿猷�
	public List<MemberGeneralVo> selectMemberGeneralList(Map<String, Object> map){
		return sqlSessionFactoryMember.selectList(NS+".selectMemberGeneralList", map);
	}
	
	// �쉶�썝 �럹�씠吏� �셿猷�
	public int selectTotalCount() {
		return sqlSessionFactoryMember.selectOne(NS+".selectTotalCount");
	}
	
	//�쉶�썝 �븫�샇 �땳�꽕�엫 
	public int memberGeneralUpdate(MemberGeneralVo memberGeneralVo){
		logger.info("memberGeneralUpdate() MemberDao.java");
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralUpdate", memberGeneralVo);
	
	}
	
	public int memberGeneralDelete(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralDelete", memberGeneralVo);
	}

}		
