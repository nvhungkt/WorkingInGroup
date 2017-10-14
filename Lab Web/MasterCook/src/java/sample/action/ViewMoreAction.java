/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_category.Tbl_CategoryDAO;
import sample.tbl_staff.Tbl_StaffDTO;
import sample.tool.OurTool;

/**
 *
 * @author Turtle
 */
public class ViewMoreAction implements ServletRequestAware {
    private final String SUCCESS = "success";
    private final int MAX_QUANTITY_EACH_PAGE = 16;
    private String status;
    //trang hiện tại
    private int pageNumber;
    //list các giá trị của button pages
    private List<String> pageChooser;
    private static HttpServletRequest servletRequest;
    //List chua cac article present
    private List<ArticlePresent> listArticle;
    private String catID;
    private String catName;
    public ViewMoreAction() {
    }
    
    public String viewByState() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        if(pageNumber==0) pageNumber++;
        Map session = ActionContext.getContext().getSession();
        Tbl_StaffDTO staff = (Tbl_StaffDTO)session.get("STAFF");        
        int numberOfPages = dao.getArticlesByStatus(status, staff.getStaffID(), true, pageNumber, MAX_QUANTITY_EACH_PAGE);        
        setListArticle(getListArticles(dao));
        int range = (int) Math.ceil(numberOfPages / (double) MAX_QUANTITY_EACH_PAGE);
        pageChooser = OurTool.getPageChoose(range, getPageNumber());       
        return SUCCESS;
    }
    
    public String viewMoreAtHome() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        Tbl_CategoryDAO catDao = new Tbl_CategoryDAO();
        catName = catDao.getCategoryName(catID);
        int numberResult = dao.totalArticleInCat(catID);
        if(numberResult == 0) {
            setListArticle(null);
        } else {
            int range = (int) Math.ceil(numberResult / (double) MAX_QUANTITY_EACH_PAGE);
            dao.getArticlesByCat(catID, MAX_QUANTITY_EACH_PAGE, pageNumber);
            setListArticle(dao.getListArticlePresent());
            if(listArticle != null) {
                String content;
                for (ArticlePresent ar : listArticle) {
                    content = OurTool.readFile(ar.getImgLink(), servletRequest);
                    // after this line the img link will surely is the link of img
                    ar.setImgLink(OurTool.getFirstImgLink(content));
                }
                setPageChooser(OurTool.getPageChoose(range, getPageNumber()));
            }
        }
        return SUCCESS;
    }
    public String browseArticle() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        if(pageNumber==0) pageNumber++;
        Map session = ActionContext.getContext().getSession();
        Tbl_StaffDTO staff = (Tbl_StaffDTO)session.get("STAFF");              
        int numberOfPages = dao.getDependingArticles(status, staff.getStaffID(), pageNumber, MAX_QUANTITY_EACH_PAGE);
        if(numberOfPages>0) {
            listArticle = getListArticles(dao);        
            int range = (int) Math.ceil(numberOfPages / (double) MAX_QUANTITY_EACH_PAGE);        
            pageChooser = OurTool.getPageChoose(range, getPageNumber());        
        }
        return SUCCESS;
    }
    //Method lấy img link trong content link và return về lại list các article present đã có img link
    public List<ArticlePresent> getListArticles(Tbl_ArticleDAO dao) throws Exception {                
        List<ArticlePresent> listArticles = dao.getListArticlePresent();
        for (ArticlePresent art : listArticles) {                            
                    String temp = OurTool.readFile(art.getImgLink(), servletRequest);                                        
                    // after this line the img link will surely is the link of img
                    art.setImgLink(OurTool.getFirstImgLink(temp));
                }
        return listArticles;
    }

    public List<String> getPageChooser() {
        return pageChooser;
    }

    public List<ArticlePresent> getListArticle() {
        return listArticle;
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

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }

    /**
     * @param pageChooser the pageChooser to set
     */
    public void setPageChooser(List<String> pageChooser) {
        this.pageChooser = pageChooser;
    }

    /**
     * @param listArticle the listArticle to set
     */
    public void setListArticle(List<ArticlePresent> listArticle) {
        this.listArticle = listArticle;
    }

    /**
     * @return the catID
     */
    public String getCatID() {
        return catID;
    }

    /**
     * @param catID the catID to set
     */
    public void setCatID(String catID) {
        this.catID = catID;
    }

    /**
     * @return the catName
     */
    public String getCatName() {
        return catName;
    }

    /**
     * @param catName the catName to set
     */
    public void setCatName(String catName) {
        this.catName = catName;
    }
}
