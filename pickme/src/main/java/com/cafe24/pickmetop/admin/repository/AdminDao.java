package com.cafe24.pickmetop.admin.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.admin.model.*;

@Repository
public class AdminDao {
	final String NS = "com.cafe24.pickmetop.admin.repository.AdminMapper";
	@Autowired
	@Resource(name = "sqlSessionAdmin")
	private SqlSessionTemplate sqlSessionFactoryAdmin;
	
	//미승인 글들 수 가져오기
	public CountVo selectUnreceivedListCount(){
		return sqlSessionFactoryAdmin.selectOne(NS + ".selectUnreceivedListCount");
	}
	//방문자수 구하기
	public VisitantCountVo selectVisitantCount(String visitantRegdate){
		return sqlSessionFactoryAdmin.selectOne(NS + ".selectVisitantCount", visitantRegdate);
	}
	//일별 방문자수
	public List<VisitantCountVo> selectRegDateVisitantCount(){
		return sqlSessionFactoryAdmin.selectList(NS + ".selectRegDateVisitantCount");
	}
}
