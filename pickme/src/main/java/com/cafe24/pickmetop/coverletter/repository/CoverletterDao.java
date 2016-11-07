package com.cafe24.pickmetop.coverletter.repository;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;

@Repository
public class CoverletterDao {
private final String nameSpace = "com.cafe24.pickmetop.coverletter.repository.CoverletterMapper";
	@Autowired
	@Resource(name="sqlSessionCoverletter")
	private SqlSessionTemplate sqlSessionFactoryCoverletter;
	
	public int insertCompanyJobCoverletter(CoverletterCompanyJobVo coverletterCompanyJobVo){
		
		return sqlSessionFactoryCoverletter.insert(nameSpace+".insertCompanyJobCoverletter", coverletterCompanyJobVo);
	}
}
