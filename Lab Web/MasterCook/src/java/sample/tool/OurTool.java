/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tool;

import java.io.BufferedReader;
import java.io.FileReader;
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
}
