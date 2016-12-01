package com.cafe24.pickmetop.freeboard.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.pickmetop.freeboard.model.FreeboardBookmarkVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardReplyVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardVo;
import com.cafe24.pickmetop.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {
	final static Logger logger = LoggerFactory.getLogger(FreeboardController.class);
	@Autowired
	FreeboardService freeService;

	//북마크 삭제 
	@RequestMapping(value="/freeboardbookmarkDelete")
	public String bookmarkDelete(String freeboardCd){
		logger.info("북마크 삭제! freeboardCd : {}",freeboardCd);
		freeService.bookmarkDelete(freeboardCd);
		return "redirect:/freeboardList";
	}
		
	//북마크 등록
	@RequestMapping(value="/freeboardbookmarkInsert")
	public String bookmarkInsert(HttpSession session, FreeboardBookmarkVo freeboardBookmarkVo,String freeboardCd){
		logger.info("북마크 등록! freeboardCd : {}",freeboardCd);
		freeService.bookmarkInsert(session,freeboardCd,freeboardBookmarkVo);
		return "redirect:/freeboardList";
	}
	
	//댓글수정
	@RequestMapping(value="/freeboardReplyUpdate")
	public String updateFreeReply(FreeboardReplyVo freeboardReplyVo,
			@RequestParam(value="replyContent", defaultValue="") String replyContent,
			@RequestParam(value="replyCd", defaultValue="") String replyCd){
	
		logger.info("replyContent  : {}",replyContent);
		logger.info("replyCd  : {}",replyCd);
		freeService.updateFreeReply(freeboardReplyVo,replyContent,replyCd);
		
		return "redirect:/freeboardList";
	}
	//게시글 수정
	@RequestMapping(value="/freeboardContentUpdate")
	public String freeboardContentDelete(FreeboardVo freeboardVo,HttpSession session,
			@RequestParam(value="freeboardTitle", defaultValue="") String freeboardTitle,
			@RequestParam(value="freeboardContent", defaultValue="") String freeboardContent,
			@RequestParam(value="freeboardCateCd", defaultValue="") String freeboardCateCd,
			@RequestParam(value="cd", defaultValue="") String cd){
		logger.info("콘텐츠와 타이틀  : {}",freeboardContent+" ///"+freeboardTitle);
		freeService.updateFreeContent(freeboardVo,freeboardTitle,freeboardContent,freeboardCateCd,session,cd);
		
		return "redirect:/freeboardList";
	}
	//게시글삭제
	@RequestMapping(value="/freeboardContentDelete")
	public String freeboardContentDelete(@RequestParam(value="freeboardCd") String freeboardCd){
		logger.info("freeboardCd : {}" , freeboardCd);
		freeService.deleteContent(freeboardCd);
		return "redirect:/freeboardList";
	}
	//댓글삭제
	@RequestMapping(value="/freeboardReplyDelete")
	public String replyDalete(@RequestParam(value="replyCd") String replyCd){
		logger.info("replyCd : {}" , replyCd);
		freeService.deleteReply(replyCd);
		return "redirect:/freeboardList";
	}
	//입력처리
	@RequestMapping(value="/freeboardInsert", method = RequestMethod.GET)
	public String freeboardInsert(HttpSession session,FreeboardVo freeboardVo){

		freeService.freeboardInsert(freeboardVo,session);
		return "redirect:/freeboardList";
	}

	
	//리스트 & 검색 
	@RequestMapping(value="/freeboardList", method = RequestMethod.GET)
	public String freeboardList(Model model,HttpSession session,
			@RequestParam(value="cate", defaultValue="") String freeboardCate,
			@RequestParam(value="boardSearch", defaultValue="") String boardSearch,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="bookmark", defaultValue="") String bookmark){
		
		logger.info("bookmark^^: {} " , bookmark);
		//페이징
		if(page < 1){
			page = 1;
		}		
		Map Listmap=freeService.selectFreeboardList(page,freeboardCate,boardSearch,session,bookmark);
		logger.info("startPage: {}", Listmap.get("startPage"));
		logger.info("endPage: {}", Listmap.get("endPage"));
		
		model.addAttribute("page", page);
	    model.addAttribute("startPage", Listmap.get("startPage"));
	    model.addAttribute("endPage", Listmap.get("endPage"));
	  
		
		model.addAttribute("freeList",Listmap.get("boardList"));
		model.addAttribute("cateForView",Listmap.get("cateForView"));
		model.addAttribute("replyMap",Listmap.get("replyMap"));
		logger.info("Listmap.get(replyMap) : {}",Listmap.get("replyMap"));
		logger.info("freeboardCate : {}",freeboardCate);
		//카테고리 값 유지 
		model.addAttribute("freeboardCate",freeboardCate);
		//북마크 리스트
		model.addAttribute("bookmarkList",Listmap.get("bookmarkList"));
		
		return "/freeboard/freeboardList";
	}
	
	//댓글입력 replyContent
	@RequestMapping(value="/freeboardReply" ,method = RequestMethod.GET)
	public String freeboardReplyInsert(FreeboardReplyVo freeboardReplyVo,HttpSession session,
			@RequestParam(value="freeboardCd", defaultValue="") String freeboardCd,
			@RequestParam(value="replyContent", defaultValue="") String replyContent){
		logger.info("freeboardCd 111:{}",freeboardCd);
		logger.info("freeboardReplyVo.toString() : {}",freeboardReplyVo.toString());
		freeService.freeboardReplyInsert(freeboardReplyVo,session,freeboardCd,replyContent);
		return "redirect:/freeboardList";
	}
	
}
