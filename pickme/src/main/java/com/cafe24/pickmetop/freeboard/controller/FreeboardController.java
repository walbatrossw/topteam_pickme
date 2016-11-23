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

import com.cafe24.pickmetop.freeboard.model.FreeboardReplyVo;
import com.cafe24.pickmetop.freeboard.model.FreeboardVo;
import com.cafe24.pickmetop.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {
	final static Logger logger = LoggerFactory.getLogger(FreeboardController.class);
	@Autowired
	FreeboardService freeService;
	
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
	public String freeboardList(Model model,
			@RequestParam(value="cate", defaultValue="") String freeboardCate,
			@RequestParam(value="boardSearch", defaultValue="") String boardSearch,
			@RequestParam(value="page", defaultValue="1") int page){
		
		//페이징
		if(page < 1){
			page = 1;
		}		
		Map Listmap=freeService.selectFreeboardList(page,freeboardCate,boardSearch);
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
