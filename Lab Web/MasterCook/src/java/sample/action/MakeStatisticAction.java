/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sample.tbl_article.Tbl_ArticleDetailsDAO;
import sample.tbl_article.Tbl_ArticleDetailsDTO;

/**
 *
 * @author Turtle
 */
public class MakeStatisticAction {
    private final String SUCCESS = "success";
    private Date beginDate;
    private Date endDate;
    private String type;
    private String message;
    Map<String, Integer> totalPost;
    List<Tbl_ArticleDetailsDTO> mostViewList;
    public MakeStatisticAction() {
    }
    
    public String makeTotalPostStatistic() throws Exception {
        if(beginDate.after(endDate)) {
            message = "Begin Date must be before End Date";
        }
        else {                    
            type = "TotalPost";
            if(totalPost == null) {
                totalPost = new HashMap<String, Integer>();
                Tbl_ArticleDetailsDAO dao = new Tbl_ArticleDetailsDAO();            
                dao.getTotalPost(totalPost, beginDate, endDate);            
            }
        }
        return SUCCESS;
    }
    
    public String makeMostViewStatistic() throws Exception {
        if(beginDate.after(endDate)) {
            message = "Begin Date must be before End Date";
        }
        else {
            type = "MostView";        
            mostViewList = new ArrayList<>();     
            Tbl_ArticleDetailsDAO dao = new Tbl_ArticleDetailsDAO();            
            dao.getMostViewArticle(mostViewList, beginDate, endDate);
        }
        return SUCCESS;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Map<String, Integer> getTotalPost() {
        return totalPost;
    }

    public List<Tbl_ArticleDetailsDTO> getMostViewList() {
        return mostViewList;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
                   
}
