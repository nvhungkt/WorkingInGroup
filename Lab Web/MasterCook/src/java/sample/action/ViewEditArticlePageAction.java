/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.Tbl_ArticleDetailsDAO;
import sample.tbl_article.Tbl_ArticleDetailsDTO;
import sample.tool.OurTool;

/**
 *
 * @author ahhun
 */
public class ViewEditArticlePageAction implements ServletRequestAware{
    private String content;
    private String articleID;
    private Tbl_ArticleDetailsDTO article;
//    private Set<Map.Entry<String, String>> workingCategories;
    private HttpServletRequest servletRequest;
    private final String SUCCESS = "success";

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public Tbl_ArticleDetailsDTO getArticle() {
        return article;
    }

    public void setArticle(Tbl_ArticleDetailsDTO article) {
        this.article = article;
    }

//    public Set<Map.Entry<String, String>> getWorkingCategories() {
//        return workingCategories;
//    }
//
//    public void setWorkingCategories(Set<Map.Entry<String, String>> workingCategories) {
//        this.workingCategories = workingCategories;
//    }
    
    public ViewEditArticlePageAction() {
    }
    
    public String execute() throws Exception {
        //Load article content
        Tbl_ArticleDetailsDAO articleDAO = new Tbl_ArticleDetailsDAO();
        article = articleDAO.getArticleDetails(articleID);
        content = OurTool.readFile(article.getContentURL(), servletRequest);

        String url = SUCCESS;
        return url;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
    
}
