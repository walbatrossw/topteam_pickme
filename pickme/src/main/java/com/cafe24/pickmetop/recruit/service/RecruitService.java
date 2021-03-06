package com.cafe24.pickmetop.recruit.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cafe24.pickmetop.admin.model.IndustryTopIndexVo;
import com.cafe24.pickmetop.admin.model.JobMidIndexVo;
import com.cafe24.pickmetop.admin.model.JobTopIndexVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.recruit.model.OneDay;
import com.cafe24.pickmetop.recruit.model.Recruit;
import com.cafe24.pickmetop.recruit.model.RecruitCompany;
import com.cafe24.pickmetop.recruit.model.RecruitCompanyBookmarkVo;
import com.cafe24.pickmetop.recruit.model.RecruitCompanyJobVo;
import com.cafe24.pickmetop.recruit.repository.RecruitDao;

@Service
public class RecruitService {
	final static Logger logger = LoggerFactory.getLogger(RecruitService.class);
	@Autowired
	RecruitDao recruitDao;
	int count = 0;
	/*=========================local遂=======================*/
	/*final String imgDir = "C:\\Users\\202-10\\git\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\recruitimg";*/
	
	//companyRecruitJob脊径
		public void insertRecruitCompanyJob(Recruit recruit,HttpServletRequest request){
			/*=========================辞獄遂=========================*/
			String imgDir = request.getSession().getServletContext().getRealPath("/")+"upload/recruitimg";
			
			
			logger.info("recruit.getRecruitJobEducation() : {} " ,recruit.getRecruitJobEducation());
			for(int i=0; i<recruit.getRecruitList().size(); i++){
				
				//recruitJobCd掻 亜舌 笛呪 select
				int countJop = recruitDao.getCountOfRecruitJob()+1;
				
				logger.info("recruit {}",recruit.toString());
				RecruitCompanyJobVo recruitCompanyJobVo = new RecruitCompanyJobVo();
				recruitCompanyJobVo.setRecruitJobCd(String.valueOf(countJop));
				recruitCompanyJobVo.setCompanyCd(recruit.getCompanyCd());
				
				recruitCompanyJobVo.setRecruitCompanyCd(String.valueOf(count));
				for(int j=0;j<recruit.getRecruitList().get(i).getJobMidIndexCd().size();j++){
				recruitCompanyJobVo.setJobMidindexCd(recruit.getRecruitList().get(i).getJobMidIndexCd().get(j));
				recruitCompanyJobVo.setRecruitJobWorkstatus(recruit.getRecruitList().get(i).getRecruitJobWorkstatus().get(j));
				recruitCompanyJobVo.setRecruitJobJobdetail(recruit.getRecruitList().get(i).getRecruitJobJobdetail().get(j));
				recruitCompanyJobVo.setRecruitJobEducation(recruit.getRecruitList().get(i).getRecruitJobEducation().get(j));
				}
				
				//file戚硯 = originalFilename + currentTimeMillis
				MultipartFile recruitImgs = recruit.getRecruitJobFile();
				String saveFileName = recruit.getRecruitJobFile().getOriginalFilename().substring(0,recruit.getRecruitJobFile().getOriginalFilename().length()-4);

				String ext = recruitImgs.getOriginalFilename().substring(recruitImgs.getOriginalFilename().lastIndexOf(".") + 1);
				ext = ext.toLowerCase();
				saveFileName=saveFileName+ "_" + System.currentTimeMillis()+"."+ext;
				String type = recruitImgs.getContentType();
				logger.info("持失吉 督析戚硯 : {}", saveFileName);
				
				recruitCompanyJobVo.setRecruitJobFile(saveFileName );
				
				 
				 logger.info("imgDir : {}",imgDir);
				// file煽舌
				 
				/*=========================local遂=======================*/
				 
				/*String fullFileName = imgDir + "\\" + saveFileName ;*/
				 
				/*=========================辞獄遂=========================*/
				String fullFileName = imgDir + "/" + saveFileName ;
				
				logger.info("fullFileName : {}",fullFileName);
				File saveFile = new File(fullFileName);
				try {
				// img亜 saveFile稽 戚疑
					recruitImgs.transferTo(saveFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//切奄社鯵辞 牌鯉 去系
				for(int k=0;k<recruit.getRecruitList().get(i).getcCletterArticle().size();k++){   
					CoverletterCompanyJobVo cletterArticle = new CoverletterCompanyJobVo();
					logger.info("recruit.getRecruitList().get(i).getcCletterArticle().get(k).getCletterArticle() : {}",i +" : "+ k);
					cletterArticle.setRecruitJobCd(String.valueOf(countJop));
					cletterArticle.setcCletterArticle(recruit.getRecruitList().get(i).getcCletterArticle().get(k).getcCletterArticle());
					logger.info("cletterArticle.toString() :{}", cletterArticle.toString());
					recruitDao.insertCoverletterArticle(cletterArticle);
				}
				logger.info("recruitCompanyJobVo : {}",recruitCompanyJobVo.toString());	
				recruitDao.insertRecruitJob(recruitCompanyJobVo);
			}
		}
	
	//切奄社鯵辞 姐呪 
/*	public int countCletter(String recruitJobCd){
		return recruitDao.countCletter(recruitJobCd);
	}*/
	
	//呪舛鉢檎
	public Recruit recruitUpdateForm(String recruitCompanyCd){
		Recruit recruit = new Recruit();
		List<RecruitCompanyJobVo> jobVoList = new ArrayList<RecruitCompanyJobVo>();
		recruit.setRecruitList(recruitDao.recruitUpdateForm(recruitCompanyCd));		
		logger.info("殴焼たたたたたた : {}",recruit.getRecruitList().get(0).getWorkStatus());
		for(int i =0;i<recruit.getRecruitList().size()-1;i++){
			logger.info(" 0 : {}",recruit.getRecruitList().get(i).getRecruitJobCd());
			if(!recruit.getRecruitList().get(i).getRecruitJobCd().equals(recruit.getRecruitList().get(i+1).getRecruitJobCd())){
				logger.info(" 訊級嬢人..1 : {}",recruit.getRecruitList().get(i).getRecruitJobCd());
				logger.info(" 訊級嬢人..2 : {}",recruit.getRecruitList().get(i+1).getRecruitJobCd());
				RecruitCompanyJobVo jobVo = new RecruitCompanyJobVo();
				jobVo.setRecruitJobCd(recruit.getRecruitList().get(i).getRecruitJobCd());
				jobVo.setJobMidindexCd(recruit.getRecruitList().get(i).getJobMidIndexCds());
				jobVo.setRecruitJobWorkstatus(recruit.getRecruitList().get(i).getWorkStatus());
				jobVo.setRecruitJobJobdetail(recruit.getRecruitList().get(i).getJobDetail());
				logger.info("jobVoList.size() : {}",jobVoList.size());
				jobVoList.add(jobVo);
			}
		}
		int a =recruit.getRecruitList().size()-1;
		if(recruit.getRecruitList().get(a) != null){
			RecruitCompanyJobVo jobVo = new RecruitCompanyJobVo();
			logger.info("recruit.getRecruitList().size() : {}",recruit.getRecruitList().size());
			
			jobVo.setRecruitJobCd(recruit.getRecruitList().get(a).getRecruitJobCd());
			jobVo.setJobMidindexCd(recruit.getRecruitList().get(a).getJobMidIndexCds());
			jobVo.setRecruitJobWorkstatus(recruit.getRecruitList().get(a).getWorkStatus());
			jobVo.setRecruitJobJobdetail(recruit.getRecruitList().get(a).getJobDetail());
			
			jobVoList.add(jobVo);
		}
		recruit.setJobVo(jobVoList);
		
		return recruit;
	}
	
	
	//栽原滴 端滴食採 溌昔 
	public String checkBookmarkByLoginId(HttpSession session,String recruitCompanyCd){
		RecruitCompanyBookmarkVo recruitCompanyBookmarkVo = new RecruitCompanyBookmarkVo();
		recruitCompanyBookmarkVo.setLoginId((String) session.getAttribute("generalId"));
		
		recruitCompanyBookmarkVo.setRecruitCompanyCd(recruitCompanyCd);
		String checkBookmark=recruitDao.checkBookmarkByLoginId(recruitCompanyBookmarkVo);
		if(checkBookmark!=null){
			return "checkBookmark";
		}
		return "";
	}
	//栽原滴 去系, 肢薦
	public void insertBookmark(String recruitCompanyCd,String bookmarkChecked, HttpSession session){
		RecruitCompanyBookmarkVo recruitCompanyBookmarkVo = new RecruitCompanyBookmarkVo();
		recruitCompanyBookmarkVo.setLoginId((String) session.getAttribute("generalId"));
		
		recruitCompanyBookmarkVo.setRecruitCompanyCd(recruitCompanyCd);
		logger.info("recruitCompanyBookmarkVo : {}",recruitCompanyBookmarkVo.toString());
		logger.info("bookmarkChecked : {}",bookmarkChecked);
		if(bookmarkChecked.equals("checked")){
			//栽原滴 去系 
			logger.info("bookmarkChecked : {}",bookmarkChecked);
			recruitDao.insertBookmark(recruitCompanyBookmarkVo);
		}else if(bookmarkChecked.equals("unchecked")){
			//栽原滴 肢薦
			recruitDao.deleteBookmark(recruitCompanyBookmarkVo);
		}
		
	}
	//辰遂雌室左奄 
	public Recruit selectForRecruitCompanyDetail(String recruitCompanyCd){
			Recruit recruit = new Recruit();
			recruit.setRecruitList(recruitDao.selectForRecruitCompanyDetail(recruitCompanyCd));
			logger.info("戚暗陥{}",recruitDao.selectForRecruitCompanyDetail(recruitCompanyCd));
		return  recruit;
	}
	
	//至穣浦 穿端軒什闘
	public List<IndustryTopIndexVo> selectAllTopIndustry(){
		return recruitDao.selectAllTopIndustry();
	}
	
	
	//含径鉢檎
	public Map<String , Object> getOneDayList(int ddayYear,int ddayMonth,String ddayOption,String searchCompanyName
			,String bookmark,List<String> jobTopIndexCd,List<String> industryTopindexCd,List<String> recruitJobWorkstatus,HttpSession session){
		logger.info("ddayYear : {}",ddayYear);
		Map map = new HashMap<String , Object>();
		//dday : ?鰍 + ?杉 + 1析
		Calendar dday= Calendar.getInstance();	//神潅劾促
		dday.set(Calendar.DATE,1);//1析稽 実特
		if(ddayOption.equals("prev")){
			dday.set(ddayYear, ddayMonth,1);
			dday.add(Calendar.MONTH, -1);//1杉拭辞 -1馬檎 12杉戚 吃呪赤亀系 五辞球研 紫遂
		}else if(ddayOption.equals("next")){
			dday.set(ddayYear, ddayMonth,1);
			dday.add(Calendar.MONTH, 1);//12杉拭辞 +1馬檎 1杉戚 吃呪赤亀系 五辞球研 紫遂
		}else if(ddayOption.equals("search")){
			dday.set(ddayYear, ddayMonth,1);
			logger.info("dday:{}",dday);
		}
		
		//1析税 推析 : 蒋採歳 因拷姥馬奄
		int firstWeek = dday.get(Calendar.DAY_OF_WEEK);
		List<OneDay> oneDayList = new ArrayList<OneDay>();
		//原走厳劾促
		int endDay= dday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		//List size(=劾促亜 級嬢哀 <td>税鯵呪)
		int listSize = (firstWeek-1)+endDay;
		if(listSize%7!=0){
			listSize=listSize+(7-(listSize%7));
		}
		//戚穿含税 原走厳劾 
		Calendar preMonth = Calendar.getInstance();	
		preMonth.set(Calendar.MONTH, dday.MONTH-1);
		int preLastDay= preMonth.getActualMaximum(Calendar.DATE);
		int beginSpace= preLastDay -(firstWeek-2);
		int endSpace=1;
		for(int i =0; i<listSize;i++){
			//劾促紺 辰遂舛左研 眼聖 梓端
			OneDay oneDay;
			//蒋税因拷
			if(i<(firstWeek-1)){
				oneDay = new OneDay();
				oneDay.setDay(beginSpace);
				beginSpace++;
			
			 
			}else if(i<endDay+(firstWeek-1)){
				oneDay = new OneDay();
				oneDay.setDay((i+1)-(firstWeek-1));
				oneDay.setYear(dday.get(Calendar.YEAR));
				oneDay.setMonth(dday.get(Calendar.MONTH)+1);
				String scheduleDate = oneDay.getYear()+"-"+oneDay.getMonth()+"-"+oneDay.getDay();
				
				Map<String, Object> companySearchMap = new HashMap<String, Object>();
				companySearchMap.put("scheduleDate", scheduleDate);
				
				logger.info("jobTopIndexCd : {} ",jobTopIndexCd.size());
				logger.info("industryTopindexCd :{}",industryTopindexCd.size());
				logger.info("recruitJobWorkstatus :{}",recruitJobWorkstatus);
				logger.info("scheduleDate : {}",scheduleDate);
				
					
	
				if(!bookmark.equals("")){
				
					companySearchMap.put("bookmark", bookmark);
					companySearchMap.put("sessionLoginId",(String)session.getAttribute("generalId"));
				}
				if(jobTopIndexCd.size()!=0){
					
					//焼 戚暗澗 軒什闘艦猿 嬢胸惟..
					companySearchMap.put("jobTopIndexCd", jobTopIndexCd.toArray());
				}
				if(industryTopindexCd.size()!=0){
					
					companySearchMap.put("industryTopindexCd", industryTopindexCd.toArray());
				}
				if(recruitJobWorkstatus.size()!=0){
					
					companySearchMap.put("recruitJobWorkstatus", recruitJobWorkstatus.toArray());
				}
				if(!searchCompanyName.equals("") && bookmark.equals("")){
					companySearchMap.put("searchCompanyName", searchCompanyName);
				}
				//辰遂獣拙析 & 曽戟析 軒什闘
				List<Recruit> beginScheduleList = recruitDao.selectBeginListOnSearchKeyword(companySearchMap);
				List<Recruit> endScheduleList = recruitDao.selectEndListOnSearchKeyword(companySearchMap);
				
				beginScheduleList.addAll(endScheduleList);
				//唖 劾促紺 辰遂獣拙, 曽戟 
				oneDay.setScheduleList(beginScheduleList);	
			
			//及税因拷
			}else {
				oneDay = new OneDay();
				oneDay.setDay(endSpace);
				endSpace++;
			}
			oneDayList.add(oneDay);
		}
		OneDay today = new OneDay();
		Calendar getToDay= Calendar.getInstance();	
		today.setDay(getToDay.get(Calendar.DATE));
		//month澗 0腰属採斗 獣拙馬奄凶庚拭 1聖 希背捜
		today.setMonth(getToDay.get(Calendar.MONTH)+1);
		today.setYear(getToDay.get(Calendar.YEAR));
		map.put("oneDayList", oneDayList);
		map.put("ddayYear", dday.get(Calendar.YEAR));
		map.put("ddayMonth", dday.get(Calendar.MONTH));
		map.put("today", today);
		
		return map;		
	}
	//績獣 奄穣誤 脊径
	public void insertTemporaryCompany(Recruit recruit){
		recruitDao.insertTemporaryCompany(recruit);
	}
	
	//績獣奄穣誤 鯵呪 
	public int selectDefaultCd(){
		return recruitDao.selectDefaultCd();
	}
	//送巷 企歳嫌 穿端
	public List<JobTopIndexVo> getJobTopIndexCd(){
		return recruitDao.getJopTopIndexCd();
	}
	//送巷 掻歳嫌 穿端軒什闘 
	public List<JobMidIndexVo> getJobMidIndexCd(){
		return recruitDao.getJobMidIndexCd();
	}
	//穿端 奄穣軒什闘
	public List<String> selectCompany(){
		return recruitDao.selectCompany();
	}
	//脊径閤精 奄穣誤生稽 奄穣坪球 伊事
	public String getCompanyCd(String companyName){
		return recruitDao.getCompanyCd(companyName);
	}
	
	//companyRecruit脊径
	public void insertRecruitCompany(Recruit recruit,HttpSession session){
		RecruitCompany recruitCompany = new RecruitCompany();
		
		//RecruitCompanyCd鎧拭 坪球掻 亜舌 笛収切研 select
		count = recruitDao.getCountOfRecruit() +1;
		
		//梓端鎧拭 葵setting
		recruitCompany.setRecruitCompanyCd(String.valueOf(count));
		recruitCompany.setCompanyCd(recruit.getCompanyCd());
		recruitCompany.setRecruitName(recruit.getRecruitName());
		recruitCompany.setRecruitBegindate(recruit.getRecruitBegindate());
		recruitCompany.setRecruitEnddate(recruit.getRecruitEnddate());
		recruitCompany.setRecruitRegister((String) session.getAttribute("generalId"));
		recruitCompany.setRecruitModify((String) session.getAttribute("generalId"));
			
		logger.info("recruitCompany : {}",recruitCompany.toString());
			
		recruitDao.insertRecruitCompany(recruitCompany);
	}

	
	
}

