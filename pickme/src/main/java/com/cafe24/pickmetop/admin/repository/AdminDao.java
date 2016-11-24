package com.cafe24.pickmetop.admin.repository;

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
}
