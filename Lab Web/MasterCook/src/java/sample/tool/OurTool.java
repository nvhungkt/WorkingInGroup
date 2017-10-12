/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tool;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author Administrator
 */
public class OurTool{
    //private static HttpServletRequest servletRequest;
    
    public static String readFile(String fileURL, HttpServletRequest servletRequest) throws Exception {        
        //get file path
        String content = "";
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/") + "Articles/";        
        BufferedReader br = null;
        FileReader fr = null;
        try {
            fr = new FileReader(filePath+fileURL);
            br = new BufferedReader(fr);
            String line;
            while((line = br.readLine())!=null) {
                content+=line;                
            }
            return content;
        }
        finally {
            if(fr!=null) {
                fr.close();
            }
            if(br!=null) {
                br.close();
            }
        }
    }
    
    public static String getFirstImgLink(String content) {
        String src;
        int begin = content.indexOf("<img src=");
        String a = content.substring(begin);
        StringTokenizer stk = new StringTokenizer(a, '"' + "");
        
        // the string tokenizer will cut the content in 3 part:
        // 1. the string before ": example the last of this is <img src=
        // 2. the img src
        // 3. the rest
        
        stk.nextToken(); // remove the number 1
        src = "Pictures/" + stk.nextToken(); // this is the link
        return src;
    }
    
    public static List<String> getPageChoose(int range, int currentPage) {
        List<String> pageChooser = null; 
        int min = 1;
        if(range != min) {
            if(pageChooser == null)
                pageChooser = new ArrayList<>();
            if(currentPage > min)
                pageChooser.add("<< Previous Page");
            //------------------------------------------------------------------
            int leftOut = currentPage - 2;
            int leftIn = currentPage - 1;
            int rightIn = currentPage + 1;
            int rightOut = currentPage + 2;
            int leftDis = currentPage - min;
            int rightDis = range - currentPage;
            if(leftOut > 0)
                pageChooser.add(leftOut + "");
            if (leftIn > 0) 
                pageChooser.add(leftIn + "");
            pageChooser.add(currentPage + "");
            if (rightIn <= range)
                pageChooser.add(rightIn + "");
            if (rightOut <= range) 
                pageChooser.add(rightOut + "");
            if(!pageChooser.contains(min + "")) {
                pageChooser.add(1, min + "");
                if(leftOut > 2)
                    pageChooser.add(2, "...");
            }
            if(!pageChooser.contains(range + "")) {
                if(rightOut < (range - 1)) {
                    pageChooser.add("...");
                }
                pageChooser.add(range + "");
            }
            //------------------------------------------------------------------
            if(currentPage < range)
                pageChooser.add("Next Page >>");
            return pageChooser;
        }
        return null;
    }
}