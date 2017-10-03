/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import sample.tbl_comment.Tbl_CommentDAO;

/**
 *
 * @author Turtle
 */
public class SendCommentAction {
    private String articleID;
    private final String SUCCESS = "success";
    private String commentContent;
    private String guestName;
    private String guestPhone;
    private String guestEmail;
    private String message;    
    public SendCommentAction() {
    }
    
    public String execute() throws Exception {        
        String url = SUCCESS;
        String temp = System.currentTimeMillis() + "";        
        String commentID = "C" + temp.substring(temp.length()-9);   
        System.out.println(temp);
        if(guestName==null || guestName.length()==0) {            
            message = "Your Name is required!";
            return url;
        }
        if(commentContent==null || commentContent.length()==0) {            
            message = "Content of the comment is required!";
            return url;
        }
        Tbl_CommentDAO dao = new Tbl_CommentDAO();
        dao.sendComment(commentID, guestName, guestPhone, guestEmail, commentContent, articleID);        
        return url;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getGuestPhone() {
        return guestPhone;
    }

    public void setGuestPhone(String guestPhone) {
        this.guestPhone = guestPhone;
    }

    public String getGuestEmail() {
        return guestEmail;
    }

    public void setGuestEmail(String guestEmail) {
        this.guestEmail = guestEmail;
    }
    
}
