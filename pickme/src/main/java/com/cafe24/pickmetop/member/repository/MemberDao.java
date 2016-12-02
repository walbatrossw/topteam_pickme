package com.cafe24.pickmetop.member.repository;

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

@Repository
public class MemberDao {
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	private final String NS = "com.cafe24.pickmetop.member.repository.MemberMapper";
	@Autowired
	@Resource(name="sqlSessionMember")
	private SqlSessionTemplate sqlSessionFactoryMember;
	
	//회원가입후 메인 페이지
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
	// 아이디 중복 확인
	public int memberGeneralCheck(String generalId) {
		logger.info("generalId : {}", generalId);	
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralIdCheck", generalId);
	}
	
	// 로그인 화면
	public MemberGeneralVo selectMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.selectOne(NS+".selectMemberGeneral", memberGeneralVo);
	}
			
	// 회원 리스트 페이지 
	public List<MemberGeneralVo> selectMemberGeneralList(Map<String, Object> map){
		return sqlSessionFactoryMember.selectList(NS+".selectMemberGeneralList", map);
	}
	
	// 회원 리스트 페이지 수
	public int selectTotalCount() {
		return sqlSessionFactoryMember.selectOne(NS+".selectTotalCount");
	}
	
	//내정보 누르면 업데이트및 탈퇴 화면
	public MemberGeneralVo memberGeneralInfoForm(String generalId){
		//logger.info("memberGeneralUpdate() MemberDao.java");
		System.out.println("03 memberGeneralInfoForm <-- MemberDao.java");
		System.out.println("generalId : " + generalId);
		
		return sqlSessionFactoryMember.selectOne(NS+".memberGeneralInfoForm", generalId);
	
	}
	// 회원정보 삭제
	public void memberGeneralDelete(String generalId){
		System.out.println("03 memberGeneralDelete <-- MemberDao.java");
		System.out.println("generalId : " + generalId);
		sqlSessionFactoryMember.delete(NS+".memberGeneralDelete", generalId);
	}
	
	public void memberGeneralUpdatePro(MemberGeneralVo memberGeneralVo) {
		sqlSessionFactoryMember.update(NS+".memberGeneralUpdatePro", memberGeneralVo);
	}
	
	//연동회원 등록
	public int memberLinkedInsert(MemberLinkedVo memberLinkedVo){
		return sqlSessionFactoryMember.insert(NS + ".memberLinkedInsert", memberLinkedVo);
	}
	//연동회원 아이디 중복검사
	public int memberLinkedSelectBylinkedId(String linkedId){
		return sqlSessionFactoryMember.selectOne(NS + ".memberLinkedSelectBylinkedId", linkedId);
	}

}		
