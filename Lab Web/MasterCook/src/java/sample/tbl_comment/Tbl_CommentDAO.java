/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_comment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
    public void getComment(String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT * FROM tbl_Comment WHERE ArticleID = ?";
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
                //String contentURL
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
