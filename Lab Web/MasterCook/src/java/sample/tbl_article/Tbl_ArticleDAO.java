/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_ArticleDAO implements Serializable{
    public int approveArticle(String articleID, String staffID, String status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;        
        try {            
            con = DBAccess.makeConnection();
            String field = "ReviewerID";
            String newStatus = "Pending for Manager";
            if(status.equals("Pending for Manager")) {
                field = "ApproverID";
                newStatus = "Accepted";
            }
            String sql = "UPDATE tbl_Article SET " + field + " = ?, Status = ? WHERE ArticleID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, staffID);
            stm.setString(2, newStatus);
            stm.setString(3, articleID);            
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
    
    //Upload article and return ID | null if fail
    public String uploadArticle(String title, String subcategory, String contentUrl, String staffID)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;        
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT Count(ArticleID) as countNumber FROM tbl_Article";
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("countNumber");
                sql = "INSERT INTO tbl_Article(ArticleID, Title, ContentURL, AuthorID, "
                        + "DateTime, SubcategoryID, Status, Views) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, "" + (count + 1));
                stm.setString(2, title);
                stm.setString(3, contentUrl);
                stm.setString(4, staffID);
                stm.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                stm.setString(6, subcategory);
                stm.setString(7, "Pending for Employee");
                stm.setInt(8, 0);
                
                if (stm.executeUpdate() > 0) return "" + (count + 1);
            }
        }
        finally {            
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }
        
        return null;
    }
    public int rejectArticle(String articleID, String staffID, String reason) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;        
        try {                        
            con = DBAccess.makeConnection();
            String sql = "UPDATE tbl_Article SET Status = 'Rejected', Reason = ?, LastEditorID = ?, LastModifiedDateTime = ? WHERE ArticleID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, reason);
            stm.setString(2, staffID);            
            stm.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            stm.setString(4, articleID);
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
    
    public int increaseView(String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;        
        try {
            con = DBAccess.makeConnection();
            String sql = "UPDATE tbl_Article SET Views = Views+1 WHERE ArticleID = ?";
            stm = con.prepareStatement(sql);           
            stm.setString(1, articleID);            
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
}
