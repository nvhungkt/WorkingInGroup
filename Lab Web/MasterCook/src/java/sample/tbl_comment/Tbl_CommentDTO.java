/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_comment;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Administrator
 */
public class Tbl_CommentDTO implements Serializable{

    public Tbl_CommentDTO() {
    }

    public Tbl_CommentDTO(String commentID, String guestName, String guestEmail, String guestPhone, String commentContent, Timestamp dateTime, String articleID) {
        this.commentID = commentID;
        this.guestName = guestName;
        this.guestEmail = guestEmail;
        this.guestPhone = guestPhone;
        this.commentContent = commentContent;
        this.dateTime = dateTime;
        this.articleID = articleID;
    }

    /**
     * @return the commentID
     */
    public String getCommentID() {
        return commentID;
    }

    /**
     * @param commentID the commentID to set
     */
    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    /**
     * @return the guestName
     */
    public String getGuestName() {
        return guestName;
    }

    /**
     * @param guestName the guestName to set
     */
    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    /**
     * @return the guestEmail
     */
    public String getGuestEmail() {
        return guestEmail;
    }

    /**
     * @param guestEmail the guestEmail to set
     */
    public void setGuestEmail(String guestEmail) {
        this.guestEmail = guestEmail;
    }

    /**
     * @return the guestPhone
     */
    public String getGuestPhone() {
        return guestPhone;
    }

    /**
     * @param guestPhone the guestPhone to set
     */
    public void setGuestPhone(String guestPhone) {
        this.guestPhone = guestPhone;
    }

    /**
     * @return the commentContent
     */
    public String getCommentContent() {
        return commentContent;
    }

    /**
     * @param commentContent the commentContent to set
     */
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
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
    private String commentID;
    private String guestName;
    private String guestEmail;
    private String guestPhone;
    private String commentContent;
    private Timestamp dateTime;
    private String articleID;
}
