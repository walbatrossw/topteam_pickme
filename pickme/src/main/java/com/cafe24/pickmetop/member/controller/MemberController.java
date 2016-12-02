package com.cafe24.pickmetop.member.controller;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.repository.MemberDao;
import com.cafe24.pickmetop.member.service.MemberService;



@Controller

@Scope
public class MemberController {
	private  static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	
	private MemberService memberService;
	MemberDao memberdao;
	
	// 일반 회원가입 화면 
	@RequestMapping(value="/memberGeneralInsert")
	public String memberGeneralInsertt(Model model){
		return "/member/general/memberGeneralInsert";
	}
	// 일반 회원 로그인 화면 완료
	@RequestMapping(value="/memberGeneralLogin")
	public String memberGeneralLoginn(Model model){
		return "/member/general/memberGeneralLogin";
	}
	
	// 회원 가입후 메인 페이지 완료
	@RequestMapping(value="/memberGeneralInsert", method = RequestMethod.POST)
	public String memberGeneralInsert(MemberGeneralVo memberGeneralVo, Model model){
		//밑의 서비스를 실행하고
		if(memberService.addmemberGeneral(memberGeneralVo)){
			//boolean 중복이 없고 잘가입이 되었다면 
			//index로리턴	
			return "/index";
		}else{
			//중복값이 있다면
			//다시 로그인화면으로 이동
			//이때 화면에서 체크를 해주고싶으면 뭔가 값을 넘겨서 체크
			model.addAttribute("check", "아이디중복");
			return "/member/general/memberGeneralInsert";
		}
	
	}

		
	// 회원 로그인 처리 완료
	@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public String memberGeneralLogin(HttpServletRequest request,
			@RequestParam(value="generalId") String generalId,
			@RequestParam(value="generalPw") String generalPw) {
		System.out.println("generalId : " + generalId + "//generalPw : " + generalPw);
		String loginCheck = null;
		//Map<String, Object> map = new HashMap<String, Object>();
		MemberGeneralVo memberGeneralVo = 
				memberService.selectMemberCheck(generalId, generalPw);
		System.out.println("memberGeneralVo : " + memberGeneralVo);
				
		if(memberGeneralVo == null) {
			//login 실패
			loginCheck = "redirect:/memberGeneralLogin";			
		}else {
			//login 성공
			HttpSession session  = request.getSession(true);
			session.setAttribute("generalId", generalId);
			session.setAttribute("generalPw",  generalPw);
			session.setAttribute("generalNick", memberGeneralVo.getGeneralNick());
			session.setAttribute("generalLevel", memberGeneralVo.getGeneralLevel());
			loginCheck = "/index";
		}

		return loginCheck;

	}

	// 로그 아웃 페이지 
	@RequestMapping(value="/memberGeneralLogout", method = RequestMethod.GET)
	public String memberGeneralLogout(HttpSession session){
		session.removeAttribute("generalId");
		session.removeAttribute("generalPw");
		session.removeAttribute("generalNick");	
		session.removeAttribute("generalLevel");
	
	return "redirect:/";
	}
	
		
	// 사용자 리스트
	 @RequestMapping(value="/general/memberGeneralList", method=RequestMethod.GET)
	 public String memberGeneralList(Model model, HttpSession session,
			 						@RequestParam(value="page", defaultValue="1") int page,
             						@RequestParam(value="word", required=false) String word) {
		
		 Map <String, Object> memberMap = memberService.getMemberGeneralList(page, word);
		 model.addAttribute("memberGeneraList",memberMap.get("memberGeneralList"));
		 model.addAttribute("page", page);
		 model.addAttribute("startPage",memberMap.get("startPage"));
		 model.addAttribute("endPage", memberMap.get("endPage"));
		 return "/member/general/memberGeneralList";
	 }
	 
	 //회원가입 이용 약관
	 @RequestMapping(value="/terms", method=RequestMethod.GET)
	 public String memberTerms(Model model){
		 return "/common/etc/terms";
	 }
	 
	 // 내정보 누르면 업데이트및 탈퇴 화면
	 @RequestMapping(value="/memberGeneralInfoForm", method=RequestMethod.GET)
	 public String memberGeneralInfoForm(Model model, String generalId){
		 System.out.println("01 memberGeneralInfoForm <-- MemberController.java");
		 System.out.println("generalId : " + generalId);
		 
		 model.addAttribute("memberGeneralInfo", memberService.memberGeneralInfoForm(generalId));
		 	 
		 return "/member/general/memberGeneralUpdate";
	 }
	
		 
	 // 내정보에서 수정버튼 클릭시 업데이트 처리
	 @RequestMapping(value="/memberGeneralUpdate", method = RequestMethod.POST)
	 public String memberGeneralUpdateForm(MemberGeneralVo memberGeneralVo) {
		 
		 memberService.memberGeneralUpdatePro(memberGeneralVo);
		 String generalId = memberGeneralVo.getGeneralId();
		 System.out.println("generalId : " + generalId);
		 
		 return "redirect:/memberGeneralInfoForm?generalId="+generalId+"";
	 }
	 
	 // 내정보에서 탈퇴버튼 클릭시 탈퇴처리
	 @RequestMapping(value="/memberGeneralDelete", method = RequestMethod.POST)
	 public String memberGeneralDelete(String generalId) {
		
		 System.out.println("01 memberGeneralDelete <-- MemberController.java");
		 System.out.println("generalId : " + generalId);
		 
		 memberService.memberGeneralDelete(generalId);
		 
		 return "redirect:/memberGeneralLogout";
	 }
	 // 네이버 로그인 처리
	 @RequestMapping(value="/linkedLogin")
	 public String linkedLogin(String linkedId, String linkedNick, HttpSession session) {
		 logger.info("linkedId : {}", linkedId);
		 logger.info("linkedNick : {}", linkedNick);
		 if(linkedId == null){
			 return "/member/linked/memberLinkedLogin";
		 }else{
			 memberService.memberLinkedInsert(linkedId, linkedNick);
			 session.setAttribute("generalId", linkedId);
			 session.setAttribute("generalNick", linkedNick);
			 return "/index";
		 }
		 
		
	 }
	
}

	
