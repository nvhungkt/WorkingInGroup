/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_staff.Tbl_StaffDTO;
import sample.tool.OurTool;

/**
 *
 * @author Turtle
 */
public class ManageArticlesByStateAction implements ServletRequestAware{
    private final String SUCCESS = "success";
    private Map<String, List<ArticlePresent>> stateMap;
    private static HttpServletRequest servletRequest;
    public ManageArticlesByStateAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        Tbl_StaffDTO staff = (Tbl_StaffDTO) session.get("STAFF");   
        stateMap = new HashMap<>();
        
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();        
        if(dao.getArticlesByStatus("Pending", staff.getStaffID(),false,1,4)!=0) {        
            stateMap.put("Pending", getListArticles(dao));
        }
        else {
            stateMap.put("Pending", null); 
        }
        if(dao.getArticlesByStatus("Accepted", staff.getStaffID(),false,1,4)!=0) {
            stateMap.put("Accepted", getListArticles(dao));    
        }
        else {
            stateMap.put("Accepted", null); 
        }
        
        if(dao.getArticlesByStatus("Rejected", staff.getStaffID(),false,1,4)!=0) {
            stateMap.put("Rejected", getListArticles(dao));                                        
        }        
        else {
            stateMap.put("Rejected", null);                                        
        }
        return SUCCESS;
    }
    public List<ArticlePresent> getListArticles(Tbl_ArticleDAO dao) throws Exception {                
        List<ArticlePresent> listArticles = dao.getListArticlePresent();
        for (ArticlePresent art : listArticles) {                            
                    String temp = OurTool.readFile(art.getImgLink(), servletRequest);                                        
                    // after this line the img link will surely is the link of img
                    art.setImgLink(OurTool.getFirstImgLink(temp));
                }
        return listArticles;
    }

    public Map<String, List<ArticlePresent>> getStateMap() {
        return stateMap;
    }
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
}
