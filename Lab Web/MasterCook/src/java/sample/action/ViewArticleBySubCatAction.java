/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tool.OurTool;

/**
 *
 * @author Administrator
 */
public class ViewArticleBySubCatAction implements ServletRequestAware{
    private String subcatID;
    private String subcatName;
    private int pageNumber; // the page guest choose to see
    private List<ArticlePresent> results;
    private List<String> pageChooser; // list of generated string for the page chooser
    private final int maxQuantityEachPage = 16; // max result each page display
    private static HttpServletRequest servletRequest;
    private final String SUCCESS = "success";
    public ViewArticleBySubCatAction() {
    }
    
    public String execute() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        int numberResult = dao.totalArticleInSubcat(subcatID);
        if(pageNumber==0) pageNumber++;
        if(numberResult == 0) {
            setResults(null);
        } else {
            int range = (int) Math.ceil(numberResult / (double) maxQuantityEachPage);
            dao.getArticlesBySubcat(subcatID, maxQuantityEachPage, pageNumber);
            setResults(dao.getListArticlePresent());
            if(results != null) {
                String content;
                for (ArticlePresent ar : results) {
                    content = OurTool.readFile(ar.getImgLink(), servletRequest);
                    // after this line the img link will surely is the link of img
                    ar.setImgLink(OurTool.getFirstImgLink(content));
                }
                pageChooser = OurTool.getPageChoose(range, pageNumber);
            }
        }
        return SUCCESS;
    }

    /**
     * @return the subcatID
     */
    public String getSubcatID() {
        return subcatID;
    }

    /**
     * @param subcatID the subcatID to set
     */
    public void setSubcatID(String subcatID) {
        this.subcatID = subcatID;
    }

    /**
     * @return the pageNumber
     */
    public int getPageNumber() {
        return pageNumber;
    }

    /**
     * @param pageNumber the pageNumber to set
     */
    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    /**
     * @return the results
     */
    public List<ArticlePresent> getResults() {
        return results;
    }

    /**
     * @param results the results to set
     */
    public void setResults(List<ArticlePresent> results) {
        this.results = results;
    }

    /**
     * @return the pageChooser
     */
    public List<String> getPageChooser() {
        return pageChooser;
    }

    /**
     * @param pageChooser the pageChooser to set
     */
    public void setPageChooser(List<String> pageChooser) {
        this.pageChooser = pageChooser;
    }

    /**
     * @return the maxQuantityEachPage
     */
    public int getMaxQuantityEachPage() {
        return maxQuantityEachPage;
    }

    /**
     * @return the SUCCESS
     */
    public String getSUCCESS() {
        return SUCCESS;
    }

    /**
     * @return the subcatName
     */
    public String getSubcatName() {
        return subcatName;
    }

    /**
     * @param subcatName the subcatName to set
     */
    public void setSubcatName(String subcatName) {
        this.subcatName = subcatName;
    }
    
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
}
