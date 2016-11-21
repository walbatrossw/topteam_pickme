package com.cafe24.pickmetop.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
 
public class DownloadView extends AbstractView {
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("request"+request);
    	System.out.println("model"+model);
    	System.out.println("response"+response);
    	
    	File file = (File)model.get("etcFileName");
        
        String etcFileName = new String(file.getName());
        System.out.println("etcFileName"+etcFileName);
        
        response.setContentType("aplication/download");
        response.setContentLength((int)file.length());
         
        String userAgent = request.getHeader("User-Agent");
        boolean ie = userAgent.indexOf("MSIE") > -1;
        
        if(ie){
        	etcFileName = URLEncoder.encode(file.getName(), "utf-8");
        } else {
        	etcFileName = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
        	response.setHeader("Content-Disposition", "attachment; filename=\"" + etcFileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setContentLength((int) file.length());
            response.setHeader("connection", "close");
        }
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        
        try {
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        } catch(Exception e){
            e.printStackTrace();
        }finally{
            if(fis != null){
                try{
                    fis.close();
                }catch(Exception e){}
            }
        }// try end;
        out.flush();
    }// render() end;
}
