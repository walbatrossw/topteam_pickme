package com.cafe24.pickmetop.recruit.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.pickmetop.recruit.model.Recruit;

@Repository
public class Commons {
	final static Logger logger = LoggerFactory.getLogger(Commons.class);

	public boolean checkFileType(Recruit recruit) {
		boolean flag = true;
		MultipartFile boardImg = recruit.getRecruitJobFile();
		if (boardImg != null) {
			if (!recruit.getRecruitJobFile().isEmpty()) {
				if (!boardImg.getContentType().equals("image/jpeg") && !boardImg.getContentType().equals("image/png")
						&& !boardImg.getContentType().equals("image/gif")) {
					logger.info("콘텐츠타입 불일치로 화면으로 forward");
					flag = false; 
				}
			}
		}
		return flag;
	}

}
