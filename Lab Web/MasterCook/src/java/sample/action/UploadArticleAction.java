/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_staff.Tbl_StaffDTO;

/**
 *
 * @author ahhun
 */
public class UploadArticleAction extends ActionSupport implements ServletRequestAware{
    private String title;
    private String subcategory;
    private String content;
    private String articleID;
    private HttpServletRequest servletRequest;

    public String getArticleID() {
        return articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(String subcategory) {
        this.subcategory = subcategory;
    }
    
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public UploadArticleAction() {
    }
    
    public String execute() throws Exception {
        //Get path
        String filePath = servletRequest.getSession().getServletContext().getRealPath("/") + "Articles/";
        System.out.println("Server path:" + filePath);
        
        //Get session to get staffID
        Map session = ActionContext.getContext().getSession();
        if (session != null) {
            Tbl_StaffDTO staff = (Tbl_StaffDTO) session.get("STAFF");
            if (staff != null) {
                //Generate file name
                String contentURL = staff.getStaffID() + "_" + new Date().getTime() + ".txt";
                
                //Write content to file
                try (   FileWriter fw = new FileWriter(filePath + contentURL);
                        PrintWriter pw = new PrintWriter(fw)) {
                    pw.write(content);
                }
                
                //Upload article
                Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
                articleID = dao.uploadArticle(title, subcategory, contentURL, staff.getStaffID());
                if (articleID != null)
                    return "success";
            }
        }
        
        return "fail";
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
    
}
