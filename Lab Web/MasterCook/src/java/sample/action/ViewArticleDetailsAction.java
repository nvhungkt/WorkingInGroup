/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_article.Tbl_ArticleDTO;
import sample.tbl_comment.Tbl_CommentDTO;

/**
 *
 * @author Turtle
 */
public class ViewArticleDetailsAction {
    private final String SUCCESS = "success";
    private String articleID;
    private Tbl_ArticleDTO article;
    private List<Tbl_CommentDTO> comments;
    public ViewArticleDetailsAction() {
    }
    
    public String execute() throws Exception {
        articleID = "R0001";
        String url = SUCCESS;
        
        return url;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public Tbl_ArticleDTO getArticle() {
        return article;
    }

    public void setArticle(Tbl_ArticleDTO article) {
        this.article = article;
    }

    public List<Tbl_CommentDTO> getComments() {
        return comments;
    }
    
}
