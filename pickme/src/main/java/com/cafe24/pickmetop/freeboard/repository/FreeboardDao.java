package com.cafe24.pickmetop.freeboard.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.freeboard.model.FreeboardCategoryVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardReplyVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardVo;

@Repository
public class FreeboardDao {
	final static Logger logger = LoggerFactory.getLogger(FreeboardDao.class);
	private final String NS = "com.cafe24.pickmetop.freeboard.repository.FreeboardMapper";
	@Autowired
	@Resource(name = "sqlSessionFreeboard")
	private SqlSessionTemplate sqlSessionFactoryFreeboard;	
	
	//댓글 전체 리스트
	public List<FreeboardReplyVo> selectReply(){
		return sqlSessionFactoryFreeboard.selectList(NS+".selectReply");
	}
	//카테고리 전체리스트
	public List<FreeboardCategoryVo> selectCate(){
		return sqlSessionFactoryFreeboard.selectList(NS+".selectCate");
	}
	
	//게시글입력
	public int freeboardInsert(FreeboardVo freeboardVo){
		logger.info("freeboardVo.toString() {}",freeboardVo.toString());
		return sqlSessionFactoryFreeboard.insert(NS+".freeboardInsert",freeboardVo);
	}
	
	
	//리스츠 & 검색
	public List<FreeboardVo> selectFreeboardList(Map map){
		return sqlSessionFactoryFreeboard.selectList(NS+".selectFreeboardList",map);
	}
	
	
	//댓글입력
	public int freeboardReplyInsert(FreeboardReplyVo freeboardReplyVo){
		return sqlSessionFactoryFreeboard.insert(NS+".freeboardReplyInsert",freeboardReplyVo);
	}
}
