/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Turtle
 */
public class Tbl_ArticleDetailsDAO {
    public Tbl_ArticleDetailsDTO getArticleDetails(String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String checker = "";
            String modifiedDate = "";
            /* Query the approver of article*/
            String queryChecker = "SELECT s.Name\n" +
                                    "FROM tbl_Staff s, tbl_Article a\n" +
                                    "WHERE s.StaffID = a.ApproverID AND a.ArticleID = ?";
            stm = con.prepareStatement(queryChecker);
            stm.setString(1, articleID);
            rs = stm.executeQuery();
            if(rs.next()) {
                checker = rs.getString("Name");
            }
            /* Query the reviewer of article if there is no approver*/
            queryChecker = "SELECT s.Name\n" +
                            "FROM tbl_Staff s, tbl_Article a\n" +
                            "WHERE s.StaffID = a.ReviewerID AND a.ArticleID = ?";
            stm = con.prepareStatement(queryChecker);
            stm.setString(1, articleID);
            rs = stm.executeQuery();
            if(rs.next()) {
                checker = rs.getString("Name");
            }
            /* Query article in detail*/
            String sql = "SELECT a.LastModifiedDateTime, m.SubcategoryID, a.Reason, a.Status, a.Title, a.ContentURL, a.[DateTime], a.[Views], s.Name AS AuthorName, m.Name AS SubcategoryName, n.Name AS CategoryName\n" +
"FROM tbl_Article a, tbl_Staff s, tbl_Subcategory m, tbl_Category n\n" +
"WHERE s.StaffID = a.AuthorID AND m.SubcategoryID = a.SubcategoryID AND m.CategoryID = n.CategoryID AND a.ArticleID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, articleID);
            rs = stm.executeQuery();
            Tbl_ArticleDetailsDTO articleDetails = null;
            if(rs.next()) {
                String title = rs.getString("Title");
                String contentURL = rs.getString("ContentURL");
                Timestamp dateTime = rs.getTimestamp("DateTime");                
                Calendar cal = Calendar.getInstance();
                cal.setTimeInMillis(dateTime.getTime());
                String createdDate = cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE) + ", "
                        + cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR);                                
                Timestamp modifiedDateTime = rs.getTimestamp("LastModifiedDateTime");
                
                if(modifiedDateTime!=null) {
                    cal.setTimeInMillis(modifiedDateTime.getTime());
                    modifiedDate = cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE) + ", "
                            + cal.get(Calendar.DATE) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR);                                
                }
                int views = rs.getInt("Views");
//                String reviewerName 
                String authorName = rs.getString("AuthorName");
                String subcategoryName = rs.getString("SubcategoryName");
                String subcategoryID = rs.getString("SubcategoryID");
                String categoryName = rs.getString("CategoryName");  
                String status = rs.getString("Status");
                String reason = rs.getString("Reason");
                articleDetails = new Tbl_ArticleDetailsDTO(checker, modifiedDate, articleID, title, contentURL, authorName, createdDate, subcategoryName, categoryName, views, status, reason, subcategoryID);
            }
            return articleDetails;
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
    
    public void getTotalPost(Map<String, Integer> totalPost, Date beginDate, Date endDate) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT a.Status, COUNT(a.ArticleID) AS Number\n" +
                        "FROM tbl_Article a\n" +
                        "WHERE a.DateTime >= ? AND a.DateTime < ? \n" +
                        "GROUP BY a.Status";
            stm = con.prepareStatement(sql);                        
            stm.setTimestamp(1, Timestamp.from(beginDate.toInstant()));         
            //FROM 00:00 begin date to 23:59 end date
            stm.setTimestamp(2, Timestamp.from(endDate.toInstant().plus(Duration.ofDays(1))));            
            rs = stm.executeQuery();            
            int numberOfPendingArticle = 0;
            while(rs.next()) {
                String status = rs.getString("Status");
                int number = rs.getInt("Number");
                if(status.contains("Pending")) {
                    numberOfPendingArticle += number;
                }
                else {
                    totalPost.put(status, number);
                }
            }            
            if(numberOfPendingArticle!=0) {
                totalPost.put("Pending", numberOfPendingArticle);
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
    
    public void getMostViewArticle(List<Tbl_ArticleDetailsDTO> mostViewList, Date beginDate, Date endDate) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT TOP 5 a.ArticleID, a.Title, a.[Views], s.Name, t.Name AS [Author]\n" +
                        "FROM tbl_Article a, tbl_Subcategory s, tbl_Staff t\n" +
                        "WHERE a.DateTime >= ? AND a.DateTime < ? AND a.SubcategoryID = s.SubcategoryID AND a.AuthorID = t.StaffID\n" +
                        "ORDER BY a.[Views] DESC";
            stm = con.prepareStatement(sql);                        
            stm.setTimestamp(1, Timestamp.from(beginDate.toInstant()));         
            //FROM 00:00 begin date to 23:59 end date
            stm.setTimestamp(2, Timestamp.from(endDate.toInstant().plus(Duration.ofDays(1))));            
            rs = stm.executeQuery();                        
            while(rs.next()) {
                String articleID = rs.getString("ArticleID");
                String title = rs.getString("Title");
                int view = rs.getInt("Views");
                String subcategoryName = rs.getString("Name");
                String authorName = rs.getString("Author");
                mostViewList.add(new Tbl_ArticleDetailsDTO(articleID, title, subcategoryName, view, authorName));
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
