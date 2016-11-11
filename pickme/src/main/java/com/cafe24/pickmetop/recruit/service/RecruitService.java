package com.cafe24.pickmetop.recruit.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
	final String imgDir = "C:\\Users\\202-10\\git\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\recruitimg";
	//북마크 확인 
	public String checkBookmarkByLoginId(HttpSession session,String recruitCompanyCd){
		RecruitCompanyBookmarkVo recruitCompanyBookmarkVo = new RecruitCompanyBookmarkVo();
		//testId값
		recruitCompanyBookmarkVo.setLoginId((String) session.getAttribute("id"));
		recruitCompanyBookmarkVo.setRecruitCompanyCd(recruitCompanyCd);
		String checkBookmark=recruitDao.checkBookmarkByLoginId(recruitCompanyBookmarkVo);
		if(checkBookmark!=null){
			return "checkBookmark";
		}
		return "";
	}
	//북마크
	public void insertBookmark(String recruitCompanyCd,String bookmarkChecked, HttpSession session){
		RecruitCompanyBookmarkVo recruitCompanyBookmarkVo = new RecruitCompanyBookmarkVo();
		//testId값
		recruitCompanyBookmarkVo.setLoginId((String) session.getAttribute("id"));
		recruitCompanyBookmarkVo.setRecruitCompanyCd(recruitCompanyCd);
		logger.info("recruitCompanyBookmarkVo : {}",recruitCompanyBookmarkVo.toString());
		logger.info("bookmarkChecked : {}",bookmarkChecked);
		if(bookmarkChecked.equals("checked")){
			//북마크 등록 
			logger.info("bookmarkChecked : {}",bookmarkChecked);
			recruitDao.insertBookmark(recruitCompanyBookmarkVo);
		}else if(bookmarkChecked.equals("unchecked")){
			//북마크 삭제
			recruitDao.deleteBookmark(recruitCompanyBookmarkVo);
		}
		
	}
	//채용상세보기 
	public Recruit selectForRecruitCompanyDetail(String recruitCompanyCd){
			Recruit recruit = new Recruit();
			recruit.setRecruitList(recruitDao.selectForRecruitCompanyDetail(recruitCompanyCd));
		return  recruit;
	}
	
	//IndustryTop 전체리스트
	public List<IndustryTopIndexVo> selectAllTopIndustry(){
		return recruitDao.selectAllTopIndustry();
	}
	//달력화면
	public Map<String , Object> getOneDayList(int ddayYear,int ddayMonth,String ddayOption,String searchCompanyName){
		logger.info("searchCompanyName : {}",searchCompanyName);
		Map map = new HashMap<String , Object>();
		//dday : ?년 + ?월 + 1일
		Calendar dday= Calendar.getInstance();	//오늘날짜
		dday.set(Calendar.DATE,1);
		if(ddayOption.equals("prev")){
			dday.set(ddayYear, ddayMonth,1);
			dday.add(Calendar.MONTH, -1);//1월에서 -1하면 12월이 될수있도록 메서드를 사용
		}else if(ddayOption.equals("next")){
			dday.set(ddayYear, ddayMonth,1);
			dday.add(Calendar.MONTH, 1);//12월에서 +1하면 1월이 될수있도록 메서드를 사용
		}else if(ddayOption.equals("search")){
			dday.set(ddayYear, ddayMonth,1);
		}
		
		//1일의 요일 : 앞부분 공백구하기
		int firstWeek = dday.get(Calendar.DAY_OF_WEEK);
		List<OneDay> oneDayList = new ArrayList<OneDay>();
		//마지막날짜
		int endDay= dday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		//List size(=날짜가 들어갈 <td>의개수)
		int listSize = (firstWeek-1)+endDay;
		if(listSize%7!=0){
			listSize=listSize+(7-(listSize%7));
		}
		//이전달의 마지막날 
		Calendar preMonth = Calendar.getInstance();	
		preMonth.set(Calendar.MONTH, dday.MONTH-1);
		int preLastDay= preMonth.getActualMaximum(Calendar.DATE);
		int beginSpace= preLastDay -(firstWeek-2);
		int endSpace=1;
		for(int i =0; i<listSize;i++){
			OneDay oneDay;
			//앞의공백
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
				companySearchMap.put("searchCompanyName", searchCompanyName);
				//검색어 없을때 전체리스트 보여줌 
				if(searchCompanyName.equals("")||searchCompanyName.equals(null)){
					logger.info("여긴 들어와도됨");
					//시작일 
					List<Recruit> beginScheduleList = recruitDao.selectScheduleListByBeginDate(companySearchMap);		
					//종료일
					List<Recruit> EndScheduleList = recruitDao.selectscheduleListByEndDate(companySearchMap);
					beginScheduleList.addAll(EndScheduleList);
					//두개의 스케쥴을 합침 
					oneDay.setScheduleList(beginScheduleList);
				}
				else if(!searchCompanyName.equals("")||!searchCompanyName.equals(null)){
					
					logger.info("일로들어오면 안돼!!!!!! searchCompanyName : {}  " ,searchCompanyName);
					//시작일 
					List<Recruit> beginScheduleList = recruitDao.searchScheduleListByBeginDate(companySearchMap);		
					//종료일
					List<Recruit> EndScheduleList = recruitDao.searchScheduleListByEndDate(companySearchMap);
					beginScheduleList.addAll(EndScheduleList);
					//두개의 스케쥴을 합침 
					oneDay.setScheduleList(beginScheduleList);
				}		
				//oneDay와 diary테이블 ResultSet반복시키며 비교매핑
			//뒤의공백
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
		today.setMonth(getToDay.get(Calendar.MONTH)+1);
		today.setYear(getToDay.get(Calendar.YEAR));
		map.put("oneDayList", oneDayList);
		map.put("ddayYear", dday.get(Calendar.YEAR));
		map.put("ddayMonth", dday.get(Calendar.MONTH));
		map.put("today", today);
		
		return map;		
	}
	//임시 기업명 입력
	public void insertTemporaryCompany(Recruit recruit){
		recruitDao.insertTemporaryCompany(recruit);
	}
	
	//임시기업명 개수 
	public int selectDefaultCd(){
		return recruitDao.selectDefaultCd();
	}
	//직무 대분류 전체
	public List<JobTopIndexVo> getJobTopIndexCd(){
		return recruitDao.getJopTopIndexCd();
	}
	//직무 중분류 전체리스트 
	public List<JobMidIndexVo> getJobMidIndexCd(){
		return recruitDao.getJobMidIndexCd();
	}
	//전체 기업리스트
	public List<String> selectCompany(){
		return recruitDao.selectCompany();
	}
	//입력받은 기업명으로 기업코드 검색
	public String getCompanyCd(String companyName){
		return recruitDao.getCompanyCd(companyName);
	}
	
	//companyRecruit입력
	public void insertRecruitCompany(Recruit recruit,HttpSession session){
		//test id값
		String id = (String) session.getAttribute("id");
		RecruitCompany recruitCompany = new RecruitCompany();
		
		//객체내에 값setting
		//RecruitCompanyCd를 문자열 + 증가하는수로 setting
		count = recruitDao.getCountOfRecruit() +1;
//		companyCd = "recruit_company_"+count;
		
		recruitCompany.setRecruitCompanyCd(String.valueOf(count));
		recruitCompany.setCompanyCd(recruit.getCompanyCd());
		recruitCompany.setRecruitName(recruit.getRecruitName());
		recruitCompany.setRecruitBegindate(recruit.getRecruitBegindate());
		recruitCompany.setRecruitEnddate(recruit.getRecruitEnddate());
		recruitCompany.setRecruitRegister(id);
		recruitCompany.setRecruitModify(id);
			
		logger.info("recruitCompany : {}",recruitCompany.toString());
			
		recruitDao.insertRecruitCompany(recruitCompany);
	}

	
	//companyRecruitJob입력
	public void insertRecruitCompanyJob(Recruit recruit){
		logger.info("recruit.getRecruitJobEducation() : {} " ,recruit.getRecruitJobEducation());
		for(int i=0; i<recruit.getRecruitList().size(); i++){
			
			//recruitJobCd = 문자열 + 증가하는 값
			int countJop = recruitDao.getCountOfRecruitJob()+1;
			//recruitJobCd= "recruit_company_job_"+ count;
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
			
			//file이름 
			MultipartFile recruitImgs = recruit.getRecruitJobFile();
			String saveFileName = recruit.getRecruitJobFile().getOriginalFilename().substring(0,recruit.getRecruitJobFile().getOriginalFilename().length()-4);

			String ext = recruitImgs.getOriginalFilename().substring(recruitImgs.getOriginalFilename().lastIndexOf(".") + 1);
			ext = ext.toLowerCase();
			saveFileName=saveFileName+ "_" + System.currentTimeMillis()+"."+ext;
			String type = recruitImgs.getContentType();
			logger.info("생성된 파일이름 : {}", saveFileName);
			
			recruitCompanyJobVo.setRecruitJobFile(saveFileName );
			
			// file저장
			String fullFileName = imgDir + "\\" + saveFileName ;
			logger.info("fullFileName : {}", fullFileName);
			File saveFile = new File(fullFileName);
			try {
				// img가 saveFile로 이동
				recruitImgs.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			for(int k=0;k<recruit.getRecruitList().get(i).getcCletterArticle().size();k++){   // coverletterList의 길이만큼 돌려야하는데
				CoverletterCompanyJobVo cletterArticle = new CoverletterCompanyJobVo();
				logger.info("recruit.getRecruitList().get(i).getcCletterArticle().get(k).getCletterArticle() : {}",i +" : "+ k);
				cletterArticle.setRecruitJobCd(String.valueOf(countJop));
				cletterArticle.setCletterArticle(recruit.getRecruitList().get(i).getcCletterArticle().get(k).getCletterArticle());
				logger.info("cletterArticle.toString() :{}", cletterArticle.toString());
				recruitDao.insertCoverletterArticle(cletterArticle);
			}
			logger.info("recruitCompanyJobVo : {}",recruitCompanyJobVo.toString());	
			recruitDao.insertRecruitJob(recruitCompanyJobVo);
		}
	}
}

