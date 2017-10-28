/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_article.Tbl_ArticleDetailsDAO;
import sample.tbl_article.Tbl_ArticleDetailsDTO;
import sample.tbl_comment.Tbl_CommentDAO;
import sample.tbl_comment.Tbl_CommentDTO;
import sample.tbl_staff.Tbl_StaffDTO;
import sample.tool.OurTool;

/**
 *
 * @author Turtle
 */
public class ViewArticleDetailsAction implements ServletRequestAware{
    private final String SUCCESS = "success";
    private String content;
    private String articleID;
    private Tbl_ArticleDetailsDTO article;
    private List<Tbl_CommentDTO> comments;
    private List<ArticlePresent> listArticles;
    private HttpServletRequest servletRequest;
    public ViewArticleDetailsAction() {
    }
    
    public String execute() throws Exception {     
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        Map session = ActionContext.getContext().getSession();
        Tbl_StaffDTO staff = (Tbl_StaffDTO) session.get("STAFF");
        //increase views
        if(staff!=null) {
            dao.increaseView(articleID, staff.getStaffID());    
        }
        else {
            dao.increaseView(articleID, null);
        }        
        String url = SUCCESS;        
        //Load comments
        Tbl_CommentDAO commentDAO = new Tbl_CommentDAO();
        commentDAO.getComment(articleID);
        comments = commentDAO.getComments();    
        //Load article content
        Tbl_ArticleDetailsDAO articleDAO = new Tbl_ArticleDetailsDAO();
        article = articleDAO.getArticleDetails(articleID);          
        content = OurTool.readFile(article.getContentURL(), servletRequest);
        //Load related articles
        dao.getRelatedArticles(article.getSubcategoryId(), articleID);
        listArticles = dao.getListArticlePresent();
        //Set img source for imgLink of ArticlePresent
        if(listArticles!=null) {
            for (ArticlePresent art : listArticles) {
                String temp = OurTool.readFile(art.getImgLink(), servletRequest);
                art.setImgLink(OurTool.getFirstImgLink(temp));
            }
        }
        return url;
    }    

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

    public List<ArticlePresent> getListArticles() {
        return listArticles;
    }
        
    public List<Tbl_CommentDTO> getComments() {
        return comments;
    }
//Get servlet request
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
    
}
