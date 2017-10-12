/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tool.OurTool;

/**
 *
 * @author Administrator
 */
public class GuestSearchAction implements ServletRequestAware{
    private int pageNumber; // the page guest choose to see
    private String txtSearch;
    private List<ArticlePresent> searchResult;
    private List<String> pageChooser; // list of generated string for the page chooser
    private final int maxQuantityEachPage = 16; // max result each page display
    private static HttpServletRequest servletRequest;
    private final String SUCCESS = "success";
    public GuestSearchAction() {
    }
    
    public String execute() throws Exception {
        Tbl_ArticleDAO dao = new Tbl_ArticleDAO();
        int numberResult = dao.countSearchArticle(getTxtSearch());
        if(numberResult == 0) {
            setSearchResult(null);
        } else {
            int range = (int) Math.ceil(numberResult / (double) maxQuantityEachPage);
            dao.searchArticle(getTxtSearch(), getMaxQuantityEachPage(), getPageNumber());
            setSearchResult(dao.getListArticlePresent());
            if(searchResult != null) {
                String content;
                for (ArticlePresent ar : searchResult) {
                    content = OurTool.readFile(ar.getImgLink(), servletRequest);
                    // after this line the img link will surely is the link of img
                    ar.setImgLink(OurTool.getFirstImgLink(content));
                }
                pageChooser = OurTool.getPageChoose(range, getPageNumber());
            }
        }
        return SUCCESS;
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
     * @return the txtSearch
     */
    public String getTxtSearch() {
        return txtSearch;
    }

    /**
     * @param txtSearch the txtSearch to set
     */
    public void setTxtSearch(String txtSearch) {
        this.txtSearch = txtSearch;
    }

    /**
     * @return the searchResult
     */
    public List<ArticlePresent> getSearchResult() {
        return searchResult;
    }

    /**
     * @param searchResult the searchResult to set
     */
    public void setSearchResult(List<ArticlePresent> searchResult) {
        this.searchResult = searchResult;
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
    
    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
}
