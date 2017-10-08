/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_article.ArticlePresent;
import sample.tbl_article.Tbl_ArticleDAO;
import sample.tbl_category.Tbl_CategoryDAO;
import sample.tbl_category.Tbl_CategoryDTO;
import sample.tool.OurTool;

/**
 *
 * @author Administrator
 */
public class LoadArticlePresentsAction implements ServletRequestAware{
    // map contain key is a category, value is a map (contain subcat and present article)
    private Map<Tbl_CategoryDTO, List<ArticlePresent>> mapCat;
    private static HttpServletRequest servletRequest;
    private final String SUCCESS = "success";
    public LoadArticlePresentsAction() {
    }
    
    public String execute() throws Exception {
        System.out.println("vo load menu action");
        mapCat = new HashMap<>();
        Tbl_CategoryDAO catDao = new Tbl_CategoryDAO();
        Tbl_ArticleDAO articleDao = new Tbl_ArticleDAO();
        List<ArticlePresent> artPresents;
        String content; // content of an article
        
        // get list all category
        catDao.getListCategory();
        List<Tbl_CategoryDTO> listCat = catDao.getListCat();
        // find list of 5 latest article for each cat
        for (Tbl_CategoryDTO cat : listCat) {
            articleDao.getLatestAticlesPresent(cat.getCategoryID());
            artPresents = articleDao.getListArticlePresent();
            if (artPresents != null) {
                // the img link current is the article link NOT the img
                for (ArticlePresent ar : artPresents) {
                    content = OurTool.readFile(ar.getImgLink(), servletRequest);
                    // after this line the img link will surely is the link of img
                    ar.setImgLink(OurTool.getFirstImgLink(content));
                }
            }
            if(artPresents != null && !artPresents.isEmpty())
                mapCat.put(cat, artPresents);
        }
        return SUCCESS;
    }

    public Map<Tbl_CategoryDTO, List<ArticlePresent>> getMapCat() {
        return mapCat;
    }

    public void setMapCat(Map<Tbl_CategoryDTO, List<ArticlePresent>> mapCat) {
        this.mapCat = mapCat;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        servletRequest = hsr;
    }
    
}
