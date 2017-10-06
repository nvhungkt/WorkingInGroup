/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import sample.tbl_article.Tbl_ArticleDAO;

/**
 *
 * @author Turtle
 */
public class ApproveArticleAction {
    private final String SUCCESS = "success";
    private String status;
    private String articleID;
    private String staffID;
    public ApproveArticleAction() {
    }
    
    public String execute() throws Exception {        
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        dao.approveArticle(articleID, status, staffID);
        return SUCCESS;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }
    
}
