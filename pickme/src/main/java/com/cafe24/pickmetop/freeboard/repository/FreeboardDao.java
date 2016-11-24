package com.cafe24.pickmetop.freeboard.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.freeboard.model.FreeboardBookmarkVo;
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
	
	
	//북마크 삭제 
	public int bookmarkDelete(String freeboardCd){
		return sqlSessionFactoryFreeboard.delete(NS+".deleteBookmarkByFreeCd",freeboardCd);
	}
	
	//북마크 아이디로 검색
	public List<String> selectBookmarkById(String loginId){
		return sqlSessionFactoryFreeboard.selectList(NS+".selectBookmarkById",loginId);
	}
	//북마크 등록
	public int bookmarkInsert(FreeboardBookmarkVo freeboardBookmarkVo){
		return sqlSessionFactoryFreeboard.insert(NS+".bookmarkInsert",freeboardBookmarkVo);
	}
	//댓글수정
	public int updateFreeReply(FreeboardReplyVo freeboardReplyVo){
		return sqlSessionFactoryFreeboard.update(NS+".updateFreeReply",freeboardReplyVo);
	}
	
	//게시글수정 
	public int updateFreeContent(FreeboardVo freeboardVo){
		return sqlSessionFactoryFreeboard.update(NS+".updateFreeContent",freeboardVo);
	}
	//게시글삭제
	public int deleteContent(String deleteContent){
		return sqlSessionFactoryFreeboard.delete(NS+".deleteContent",deleteContent);
	}
	
	//댓글삭제 
	
	public int deleteReply(String replyCd){
		return sqlSessionFactoryFreeboard.delete(NS+".deleteReply",replyCd);
	}
	//전체개수
	public int selectFreeboardListCount(String boardSearch,String freeboardCate){
		Map<String,Object> sqlMap = new HashMap<String,Object>();
		sqlMap.put("boardSearch", boardSearch);
		sqlMap.put("cate", freeboardCate);
		logger.info("cate :{}",sqlMap.get("cate"));
		logger.info("boardSearch :{}",sqlMap.get("boardSearch"));
		return sqlSessionFactoryFreeboard.selectOne(NS+".selectTotalCount",sqlMap);
	}
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
