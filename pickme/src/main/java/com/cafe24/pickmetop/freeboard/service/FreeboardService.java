package com.cafe24.pickmetop.freeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.freeboard.controller.FreeboardController;
import com.cafe24.pickmetop.freeboard.model.FreeboardReplyVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardVo;
import com.cafe24.pickmetop.freeboard.repository.FreeboardDao;

@Service
public class FreeboardService {
	@Autowired
	FreeboardDao dao;
	final static Logger logger = LoggerFactory.getLogger(FreeboardService.class);
	
	//게시글입력
	public void freeboardInsert(FreeboardVo freeboardVo,HttpSession session){
		//test 닉네임
		freeboardVo.setFreeboardNick((String)session.getAttribute("id"));
		//test 아이디 
		freeboardVo.setLoginId((String)session.getAttribute("id"));
		
		logger.info("getFreeboardContent :{}",freeboardVo.getFreeboardContent());
		logger.info("getFreeboardCateCd :{}",freeboardVo.getFreeboardCateCd());
		logger.info("getFreeboardTitle :{}",freeboardVo.getFreeboardTitle());
		
		dao.freeboardInsert(freeboardVo);
	}
	
	
	//리스트
	public Map<String,Object> selectFreeboardList(String freeboardCate,String boardSearch){
		Map map = new HashMap<String,String>();
		logger.info("selectFreeboardList :{}",dao.selectFreeboardList(map));
		int cate=0;
		if(!freeboardCate.equals("")){
			cate= Integer.valueOf(freeboardCate);
		}
		switch (cate) {
        case 1:  map.put("cate", "1");
                 break;
        case 2:  map.put("cate", "2");
                 break;
        case 3:  map.put("cate", "3");
                 break;
        case 4:  map.put("cate", "4");
                 break;
        case 5:  map.put("cate", "5");
                 break;
        case 6:  map.put("cate", "6");
        
                 break;
		}
		if(!boardSearch.equals("")){
			map.put("boardSearch", boardSearch);
		}
		logger.info("map : {}",map.get("cate")+"/"+map.get("boardSearch"));
		
		Map mapForView =  new HashMap<String,Object>();
		mapForView.put("boardList", dao.selectFreeboardList(map));
		//카테고리 전체리스트
		mapForView.put("cateForView", dao.selectCate());
		mapForView.put("replyMap", dao.selectReply());
		logger.info("dao.selectReply() : {}",dao.selectReply());
		return mapForView;
	}
	
	
	//댓글입력
	public void freeboardReplyInsert(FreeboardReplyVo freeboardReplyVo,HttpSession session,String freeboardCd,String replyContent){
		//test
		freeboardReplyVo.setLoginId((String)session.getAttribute("id"));
		freeboardReplyVo.setLoginNick((String)session.getAttribute("id"));
		
		freeboardReplyVo.setFreeboardCd(freeboardCd);
		freeboardReplyVo.setReplyContent(replyContent);
		logger.info("getReplyContent :{}",freeboardReplyVo.getReplyContent());
		logger.info("toString:{}",freeboardReplyVo.toString());
		dao.freeboardReplyInsert(freeboardReplyVo);
	}
}
