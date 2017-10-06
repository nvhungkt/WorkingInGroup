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
public class RejectArticleAction {
    private final String SUCCESS = "success";
    private String articleID;
    private String staffID;
    private String txtReason;
    public RejectArticleAction() {
    }
    
    public String execute() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        if(txtReason.trim().length()==0) {
            
        }
        dao.rejectArticle(articleID, staffID, txtReason);        
        return SUCCESS;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getTxtReason() {
        return txtReason;
    }

    public void setTxtReason(String txtReason) {
        this.txtReason = txtReason;
    }
    
}
