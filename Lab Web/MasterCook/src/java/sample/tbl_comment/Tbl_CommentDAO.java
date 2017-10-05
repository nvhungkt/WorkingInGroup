/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_comment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_CommentDAO implements Serializable{
    List<Tbl_CommentDTO> comments;
//get list of comment
    public List<Tbl_CommentDTO> getComments() {
        return comments;
    }
    public int deleteComment(String commentID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;  
        try {
            con = DBAccess.makeConnection();
            String sql = "DELETE FROM tbl_Comment WHERE CommentID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, commentID);
            return stm.executeUpdate();
        }
        finally {            
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }        
    }
    public int sendComment(String commentID, String guestName, String guestPhone, String guestEmail, String commentContent, String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;  
        try {
            con = DBAccess.makeConnection();
            String sql = "INSERT INTO tbl_Comment VALUES (?,?,?,?,?,?,?)";
            stm = con.prepareStatement(sql);
            stm.setString(1, commentID);
            stm.setString(2, guestName);
            stm.setString(3, guestEmail);
            stm.setString(4, guestPhone);
            stm.setString(5, commentContent);
            Timestamp t = new Timestamp(System.currentTimeMillis());            
            stm.setTimestamp(6, t);
            stm.setString(7, articleID);
            return stm.executeUpdate();
        }
        finally {            
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }        
    }
    public void getComment(String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT * FROM tbl_Comment WHERE ArticleID = ? ORDER BY [Datetime] DESC ";
            stm = con.prepareStatement(sql);
            stm.setString(1, articleID);
            rs = stm.executeQuery();
            while(rs.next()) {
                String commentID = rs.getString("CommentID");
                String guestName = rs.getString("GuestName");
                String guestEmail = rs.getString("GuestEmail");
                String guestPhone = rs.getString("GuestPhone");
                String commentContent = rs.getString("CommentContent");
                Timestamp dateTime = rs.getTimestamp("Datetime");                
                if(comments==null) {
                    comments = new ArrayList<>();
                }
                Tbl_CommentDTO comment = new Tbl_CommentDTO(commentID, guestName, guestEmail, guestPhone, commentContent, dateTime, articleID);
                comments.add(comment);
            }
        }
        finally {
            if(rs!=null) {
                rs.close();
            }
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }       
    }
}
