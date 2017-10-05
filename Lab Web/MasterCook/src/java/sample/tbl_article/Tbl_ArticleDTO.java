/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Administrator
 */
public class Tbl_ArticleDTO implements Serializable{

    public Tbl_ArticleDTO() {
    }

    public Tbl_ArticleDTO(String reason, String articleID, String title, String contentURL, String authorID, String reviewerID, String approverID, Timestamp dateTime, String subcategoryID, String status, Timestamp lastModifiedDateTime, int views, String lastEditorID) {
        this.reason = reason;
        this.articleID = articleID;
        this.title = title;
        this.contentURL = contentURL;
        this.authorID = authorID;
        this.reviewerID = reviewerID;
        this.approverID = approverID;
        this.dateTime = dateTime;
        this.subcategoryID = subcategoryID;
        this.status = status;
        this.lastModifiedDateTime = lastModifiedDateTime;
        this.views = views;
        this.lastEditorID = lastEditorID;
    }

    /**
     * @return the articleID
     */
    public String getArticleID() {
        return articleID;
    }

    /**
     * @param articleID the articleID to set
     */
    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the contentURL
     */
    public String getContentURL() {
        return contentURL;
    }

    /**
     * @param contentURL the contentURL to set
     */
    public void setContentURL(String contentURL) {
        this.contentURL = contentURL;
    }

    /**
     * @return the authorID
     */
    public String getAuthorID() {
        return authorID;
    }

    /**
     * @param authorID the authorID to set
     */
    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    /**
     * @return the reviewerID
     */
    public String getReviewerID() {
        return reviewerID;
    }

    /**
     * @param reviewerID the reviewerID to set
     */
    public void setReviewerID(String reviewerID) {
        this.reviewerID = reviewerID;
    }

    /**
     * @return the approverID
     */
    public String getApproverID() {
        return approverID;
    }

    /**
     * @param approverID the approverID to set
     */
    public void setApproverID(String approverID) {
        this.approverID = approverID;
    }

    /**
     * @return the dateTime
     */
    public Timestamp getDateTime() {
        return dateTime;
    }

    /**
     * @param dateTime the dateTime to set
     */
    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    /**
     * @return the subcategoryID
     */
    public String getSubcategoryID() {
        return subcategoryID;
    }

    /**
     * @param subcategoryID the subcategoryID to set
     */
    public void setSubcategoryID(String subcategoryID) {
        this.subcategoryID = subcategoryID;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the lastModifiedDateTime
     */
    public Timestamp getLastModifiedDateTime() {
        return lastModifiedDateTime;
    }

    /**
     * @param lastModifiedDateTime the lastModifiedDateTime to set
     */
    public void setLastModifiedDateTime(Timestamp lastModifiedDateTime) {
        this.lastModifiedDateTime = lastModifiedDateTime;
    }

    /**
     * @return the views
     */
    public int getViews() {
        return views;
    }

    /**
     * @param views the views to set
     */
    public void setViews(int views) {
        this.views = views;
    }

    /**
     * @return the lastEditorID
     */
    public String getLastEditorID() {
        return lastEditorID;
    }

    /**
     * @param lastEditorID the lastEditorID to set
     */
    public void setLastEditorID(String lastEditorID) {
        this.lastEditorID = lastEditorID;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
    private String articleID;
    private String title;
    private String contentURL;
    private String authorID;
    private String reviewerID;
    private String approverID;
    private Timestamp dateTime;
    private String subcategoryID;
    private String status;
    private Timestamp lastModifiedDateTime;
    private int views;
    private String lastEditorID;
    private String reason;
}
