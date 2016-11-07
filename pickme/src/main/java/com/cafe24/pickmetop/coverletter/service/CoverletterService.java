package com.cafe24.pickmetop.coverletter.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.coverletter.repository.CoverletterDao;

@Service
public class CoverletterService {
	final static Logger logger = LoggerFactory.getLogger(CoverletterService.class);
	@Autowired
	CoverletterDao coverletterDao;
	
	public void addCompanyJobCoverletter(CoverletterCompanyJobVo coverletterCompanyjobVo){
		coverletterDao.insertCompanyJobCoverletter(coverletterCompanyjobVo);
	}
}
