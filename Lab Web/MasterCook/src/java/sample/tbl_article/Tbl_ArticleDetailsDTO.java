/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.sql.Timestamp;

/**
 *
 * @author Turtle
 */
public class Tbl_ArticleDetailsDTO {   
    private String modifiedDate;
    private String articleID;
    private String title;
    private String contentURL;
    private String authorName;
    private String dateTime;
    private String subcategoryName;
    private String subcategoryId;
    private String categoryName;
    private int views;
    private String status;
    private String reason;
    private String checker;
    public Tbl_ArticleDetailsDTO(String checker, String modifiedDate, String articleID, String title, String contentURL, String authorName, String dateTime, String subcategoryName, String categoryName, int views, String status, String reason, String subcategoryId) {        
        this.checker = checker;
        this.modifiedDate = modifiedDate;
        this.subcategoryId = subcategoryId;
        this.status = status;
        this.reason = reason;
        this.articleID = articleID;
        this.title = title;
        this.contentURL = contentURL;
        this.authorName = authorName;
        this.dateTime = dateTime;
        this.subcategoryName = subcategoryName;
        this.categoryName = categoryName;
        this.views = views;
    }

    public Tbl_ArticleDetailsDTO(String articleID, String title, String subcategoryName, int views, String authorName) {
        this.authorName = authorName;
        this.articleID = articleID;
        this.title = title;
        this.subcategoryName = subcategoryName;
        this.views = views;
    }

    public String getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(String modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }
    
    public String getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(String subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getArticleID() {
        return articleID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }
  
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentURL() {
        return contentURL;
    }

    public void setContentURL(String contentURL) {
        this.contentURL = contentURL;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
    
        
    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }
    
}
