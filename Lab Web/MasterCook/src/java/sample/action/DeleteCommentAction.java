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
public class DeleteCommentAction {
    private final String SUCCESS = "success";
    private String commentID;
    public DeleteCommentAction() {
    }
    
    public String execute() throws Exception {
        Tbl_CommentDAO dao = new Tbl_CommentDAO();
        dao.deleteComment(commentID);
        return SUCCESS;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }
    
}
