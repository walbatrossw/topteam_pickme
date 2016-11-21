package com.cafe24.pickmetop.commons.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
 
	@RequestMapping("/resumeDetail/download")
    public ModelAndView download( @RequestParam("etcFileName")String etcFileName){
        String pdfDir = "C:\\Users\\202-09\\Desktop\\PickMe_Workspace\\TeamGit\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\resumefile\\portfolio\\";
    	System.out.println("download <------------------------------");
        System.out.println("etcFileName : " + etcFileName);
    	
        ModelAndView modelAndView = new ModelAndView();
        
        modelAndView.addObject("etcFileName", new File(pdfDir+etcFileName));
        modelAndView.setViewName("viewName");
        return modelAndView;
    }
     
}
