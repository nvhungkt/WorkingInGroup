/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_staff.Tbl_StaffDTO;

/**
 *
 * @author Turtle
 */
public class ViewMoreAction {
    private final String SUCCESS = "success";
    private String status;
    private int pageNumber;
    public ViewMoreAction() {
    }
    
    public String viewByState() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        Map session = ActionContext.getContext().getSession();
        Tbl_StaffDTO staff = (Tbl_StaffDTO)session.get("STAFF");
        dao.getArticlesByStatus(status, staff.getStaffID(), true, pageNumber);
        return SUCCESS;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    
    
}
