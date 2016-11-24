package com.cafe24.pickmetop.freeboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.freeboard.model.FreeboardBookmarkVo;
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
	
	
	//북마크 삭제 
	public void bookmarkDelete(String freeboardCd){
		dao.bookmarkDelete(freeboardCd);
	}
	//북마크 아이디로 검색

	//북마크 등록
	public void  bookmarkInsert(HttpSession session,String freeboardCd,FreeboardBookmarkVo freeboardBookmarkVo){
		freeboardBookmarkVo.setLoginId((String)session.getAttribute("generalId"));
		freeboardBookmarkVo.setFreeboardCd(freeboardCd);
		dao.bookmarkInsert(freeboardBookmarkVo);
	}
	
	
	//댓글수정
	public void updateFreeReply(FreeboardReplyVo freeboardReplyVo,String replyContent,String replyCd){
		logger.info("댓글수정 서비스 ");
		freeboardReplyVo.setReplyContent(replyContent);
		freeboardReplyVo.setReplyCd(replyCd);
		logger.info("freeboardReplyVo  서비스 :{}" ,freeboardReplyVo.toString());
		dao.updateFreeReply(freeboardReplyVo);
	}
	
	//게시글수정
	public void updateFreeContent(FreeboardVo freeboardVo,String freeboardTitle,String freeboardContent,String freeboardCateCd,HttpSession session,String cd){
		logger.info("freeboardCateCd/freeboardTitle/freeboardContent :{}",freeboardCateCd+"/"+freeboardTitle+"/"+freeboardContent);
		
		freeboardVo.setFreeboardTitle(freeboardTitle);
		freeboardVo.setFreeboardContent(freeboardContent);
		freeboardVo.setFreeboardNick((String)session.getAttribute("generalNick"));
		//switch문이 안됨
		String CateCd = "";
		if(freeboardCateCd.equals("잡담")){
			CateCd ="1";
		}else if(freeboardCateCd.equals("근무환경")){
			CateCd ="2";
		}else if(freeboardCateCd.equals("자소서")){
			CateCd ="3";
		}else if(freeboardCateCd.equals("인적성")){
			CateCd ="4";
		}else if(freeboardCateCd.equals("자격증")){
			CateCd ="5";
		}else if(freeboardCateCd.equals("어학")){
			CateCd ="6";	
		}
		freeboardVo.setFreeboardCateCd(CateCd);
		freeboardVo.setFreeboardCd(cd);
		logger.info("freeboardVo.toString() : {}",freeboardVo.toString());
		dao.updateFreeContent(freeboardVo);
	}
	
	//게시글삭제 
	public void deleteContent(String deleteContent){
		dao.deleteContent(deleteContent);
	}
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
	public Map<String,Object> selectFreeboardList(int page,String freeboardCate,String boardSearch,HttpSession session,String bookmark){
		//페이징
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		pageHelper.setLastPage(dao.selectFreeboardListCount(boardSearch,freeboardCate), MAX_LINE_COUNT);
		Map<String, Object> mapForView =  new HashMap<String,Object>();//controller로 return할 map
		Map<String, Object> map = new HashMap<String,Object>();//dao로 보낼 map
		
		map.put("pageHelp", pageHelper);
		
		//북마크 체크여부확인 
		String loginId = (String)session.getAttribute("generalId");
		List<String> bookmarkList = dao.selectBookmarkById(loginId);
		logger.info("/////////////////북마크리스트 : {}",bookmarkList);
		mapForView.put("bookmarkList", bookmarkList);
		if(!bookmark.equals("")){
			map.put("sessionId",loginId);
		}else{
			int cate=0;
			//카테고리가 name으로 넘어와서 Cd로 바꿔줌
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
		}
		
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
