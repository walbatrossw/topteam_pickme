package com.cafe24.pickmetop.member.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.model.MemberLinkedVo;
import com.cafe24.pickmetop.member.model.*;

@Repository
public class MemberDao {
	private final String NS = "com.cafe24.pickmetop.member.repository.MemberMapper";
	@Autowired
	@Resource(name="sqlSessionMember")
	private SqlSessionTemplate sqlSessionFactoryMember;
	
	// 회원 입력
	public int insertMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.insert(NS+".insertMemberGeneral", memberGeneralVo);
	}
	
	
	// 회원 선택
	public MemberGeneralVo selectMemberGeneral(MemberGeneralVo memberGeneralVo){
		return sqlSessionFactoryMember.selectOne(NS+".selectMemberGeneral", memberGeneralVo);
	}
	
	
	// 회원 리스트
	public List<MemberGeneralVo> selectMemberGeneralList(Map<String, Object> map){
		return sqlSessionFactoryMember.selectList(NS+".selectMemberGeneralList", map);
	}
	
	// 회원 테이블에서 회원 수 
	public int selectTotalCount() {
		return sqlSessionFactoryMember.selectOne(NS+".selectTotalCount");
	}

	
	
	public int insertMemberLinked(MemberLinkedVo memberLinkedVo){
		return sqlSessionFactoryMember.insert(NS+".insertMemberLinked", memberLinkedVo);
	}
	
	public int insertMemberWithdraw(MemberWithdrawVo withdraw){
		return sqlSessionFactoryMember.insert(NS+".insertMemberWithdraw",  withdraw);
		
	}
	public int insertMemberWorkstate(MemberWorkstateVo workstat){
		return sqlSessionFactoryMember.insert(NS+".insertMemberWorkstate", workstat);	
		
		
	}	
		
}
