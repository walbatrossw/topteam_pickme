package com.cafe24.pickmetop.coverletter.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;

@Repository
public class CoverletterDao {
	final static Logger logger = LoggerFactory.getLogger(CoverletterDao.class);
	private final String nameSpace = "com.cafe24.pickmetop.coverletter.repository.CoverletterMapper";
	@Autowired
	@Resource(name="sqlSessionCoverletter")
	private SqlSessionTemplate sqlSessionFactoryCoverletter;
	
	// 01 회원이 작성한 자기소개서 리스트
	public List<CoverletterMemberVo> selectCoverletterMemberList(){
		return sqlSessionFactoryCoverletter.selectList(nameSpace + ".selectCoverletterMemberList");
	}
	
	
}
