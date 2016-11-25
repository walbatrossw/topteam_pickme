package com.cafe24.pickmetop.commons.repository;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonsDao {
	final static Logger logger = LoggerFactory.getLogger(CommonsDao.class);
	final String NS = "com.cafe24.pickmetop.commons.repository.CommonsMapper";
	@Autowired
	@Resource(name = "sqlSessionCommons")
	private SqlSessionTemplate sqlSessionFactoryCommons;
	//방문자 등록할 날짜 체크
	public int selectVisitantRegdate(String visitantRegdate){
		return sqlSessionFactoryCommons.selectOne(NS + ".selectVisitantRegdate", visitantRegdate);
	}
	//해당날짜 방문자 첫등록
	public int insertTodayVisitant(){
		return sqlSessionFactoryCommons.insert(NS + ".insertTodayVisitant");
	}
	//방문자 카운트
	public int updateTodayVisitant(String visitantRegdate){
		return sqlSessionFactoryCommons.update(NS + ".updateTodayVisitant", visitantRegdate);
	}
	
}
