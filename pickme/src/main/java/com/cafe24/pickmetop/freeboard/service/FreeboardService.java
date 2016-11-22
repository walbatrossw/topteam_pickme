package com.cafe24.pickmetop.freeboard.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.freeboard.model.FreeboardReplyVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardVo;
import com.cafe24.pickmetop.freeboard.repository.FreeboardDao;

@Service
public class FreeboardService {
	@Autowired
	FreeboardDao dao;
	final static Logger logger = LoggerFactory.getLogger(FreeboardService.class);
	private final int MAX_PAGE_COUNT = 5; //보여질 최대 페이지 수
	private final int MAX_LINE_COUNT = 10; //보여질 최대 게시글
	
    //댓글삭제
	public void deleteReply(String replyCd){
		dao.deleteReply(replyCd);
	}
	
	//게시글입력
	public void freeboardInsert(FreeboardVo freeboardVo,HttpSession session){
		// 닉네임
		freeboardVo.setFreeboardNick((String)session.getAttribute("generalNick"));
		// 아이디 
		freeboardVo.setLoginId((String)session.getAttribute("generalId"));
		
		logger.info("getFreeboardContent :{}",freeboardVo.getFreeboardContent());
		logger.info("getFreeboardCateCd :{}",freeboardVo.getFreeboardCateCd());
		logger.info("getFreeboardTitle :{}",freeboardVo.getFreeboardTitle());
		
		dao.freeboardInsert(freeboardVo);
	}
	
	
	//리스트
	public Map<String,Object> selectFreeboardList(int page,String freeboardCate,String boardSearch){
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		pageHelper.setLastPage(dao.selectFreeboardListCount(boardSearch,freeboardCate), MAX_LINE_COUNT);
		Map<String, Object> mapForView =  new HashMap<String,Object>();
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("pageHelp", pageHelper);
		
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
		
		mapForView.put("startPage", pageHelper.startPage(page, MAX_PAGE_COUNT));
		mapForView.put("endPage", pageHelper.endPage());
		mapForView.put("boardList", dao.selectFreeboardList(map));
		//카테고리 전체리스트
		mapForView.put("cateForView", dao.selectCate());
		mapForView.put("replyMap", dao.selectReply());
		logger.info("dao.selectReply() : {}",dao.selectReply());
		return mapForView;
	}
	
	
	//댓글입력
	public void freeboardReplyInsert(FreeboardReplyVo freeboardReplyVo,HttpSession session,String freeboardCd,String replyContent){
		freeboardReplyVo.setLoginId((String)session.getAttribute("generalId"));
		freeboardReplyVo.setLoginNick((String)session.getAttribute("generalNick"));
		
		freeboardReplyVo.setFreeboardCd(freeboardCd);
		freeboardReplyVo.setReplyContent(replyContent);
		logger.info("getReplyContent :{}",freeboardReplyVo.getReplyContent());
		logger.info("toString:{}",freeboardReplyVo.toString());
		dao.freeboardReplyInsert(freeboardReplyVo);
	}
}
