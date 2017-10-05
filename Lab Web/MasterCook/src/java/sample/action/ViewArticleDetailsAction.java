/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_article.Tbl_ArticleDetailsDAO;
import sample.tbl_article.Tbl_ArticleDetailsDTO;
import sample.tbl_comment.Tbl_CommentDAO;
import sample.tbl_comment.Tbl_CommentDTO;

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
    private HttpServletRequest servletRequest;
    public ViewArticleDetailsAction() {
    }
    
    public String execute() throws Exception {        
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        dao.increaseView(articleID);
        String url = SUCCESS;        
        Tbl_CommentDAO commentDAO = new Tbl_CommentDAO();
        commentDAO.getComment(articleID);
        comments = commentDAO.getComments();    
        Tbl_ArticleDetailsDAO articleDAO = new Tbl_ArticleDetailsDAO();
        article = articleDAO.getArticleDetails(articleID);           
        content = "";
        readFile(article.getContentURL());
        return url;
    }
    public void readFile(String fileURL) throws Exception {        
        //get file path
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
    
    
    public List<Tbl_CommentDTO> getComments() {
        return comments;
    }
//Get servlet request
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
    
}
