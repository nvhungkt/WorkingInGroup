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
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_ArticleDAO implements Serializable{
    private List<ArticlePresent> listArticlePresent;

    public List<ArticlePresent> getListArticlePresent() {
        return listArticlePresent;
    }
    
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
    
    
    // get article id, title, link content, created date for preview at pages
    public void getLatestAticlesPresent(String categoryID) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                // this will get the ID, Name of category
                String queryCatIDName = "select CategoryID from tbl_Category where CategoryID = ?";
                
                // this will get all article belong to previous category
                String queryArticlesBelongCat 
                        = "select a.ArticleID, a.Title, a.ContentURL, a.DateTime \n"
                        + "from tbl_Article a, tbl_Subcategory s, (" + queryCatIDName +") c \n"
                        + "where s.CategoryID = c.CategoryID and s.SubcategoryID = a.SubcategoryID and Status = 'Accepted'";
                
                // this will get top 5 article by latest date from above
                String sql 
                        = "select top 5 *\n"
                        + "from (" + queryArticlesBelongCat + ") b \n"
                        + "order by DateTime desc";
                stm = con.prepareStatement(sql);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ArticleID");
                    String title = rs.getString("Title");
                    String imgLink = rs.getString("ContentURL");
                    Timestamp date = rs.getTimestamp("DateTime");
                    String createdDate = date.getHours() + ":" + date.getMinutes() + ", " 
                            + date.getDay() +"/"+ date.getMonth()+"/"+ (date.getYear() + 1900);
                    if (listArticlePresent == null) {
                        listArticlePresent = new ArrayList<>();
                    }
                    listArticlePresent.add(new ArticlePresent(id, title, imgLink, createdDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public void getRelatedArticles (String subcategoryID, String articleID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT TOP 3 *\n"
                    + "FROM tbl_Article \n"
                    + "WHERE SubcategoryID=? AND ArticleID<>? AND Status='Accepted'\n"
                    + "ORDER BY [DateTime] DESC";
            stm = con.prepareStatement(sql);
            stm.setString(1, subcategoryID);
            stm.setString(2, articleID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ArticleID");
                String title = rs.getString("Title");
                String imgLink = rs.getString("ContentURL");
                Timestamp date = rs.getTimestamp("DateTime");
                String createdDate = date.getHours() + ":" + date.getMinutes() + ", "
                        + date.getDay() + "/" + date.getMonth() + "/" + (date.getYear() + 1900);
                if (listArticlePresent == null) {
                    listArticlePresent = new ArrayList<>();
                }
                listArticlePresent.add(new ArticlePresent(id, title, imgLink, createdDate));
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public int totalArticleInSubcat(String subcatID) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "select count(ArticleID) as numberResult "
                        + "from tbl_Article "
                        + "where SubcategoryID = ? and Status = 'Accepted'";
                stm = con.prepareStatement(sql);
                stm.setString(1, subcatID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("numberResult");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    
    public int countSearchArticle(String txtSearch) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "select count(ArticleID) as numberResult "
                        + "from tbl_Article "
                        + "where Title Like ? and Status = 'Accepted'";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch +"%");
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("numberResult");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    
    public void searchArticle(String txtSearch, int maxQuantityEachPage, int pageNumber) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                // this will search all result
                String searchArticle = "select ArticleID, Title, ContentURL, DateTime "
                        + "from tbl_Article "
                        + "where Title Like ? and Status = 'Accepted'";
                // this will get maxQuantityEachPage row from the n offset of the above search result
                String sql = "select * \n"
                        + "from (" + searchArticle +") a \n"
                        + "order by a.Title\n"
                        + "offset ? rows fetch next ? rows only";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch +"%");
                stm.setInt(2, maxQuantityEachPage * (pageNumber - 1));
                stm.setInt(3, maxQuantityEachPage);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ArticleID");
                    String title = rs.getString("Title");
                    String imgLink = rs.getString("ContentURL");
                    Timestamp date = rs.getTimestamp("DateTime");
                    String createdDate = date.getHours() + ":" + date.getMinutes() + ", " 
                            + date.getDay() +"/"+ date.getMonth()+"/"+ (date.getYear() + 1900);
                    if (listArticlePresent == null) {
                        listArticlePresent = new ArrayList<>();
                    }
                    listArticlePresent.add(new ArticlePresent(id, title, imgLink, createdDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public void getArticlesBySubcat(String subcatID, int maxQuantityEachPage, int pageNumber) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                // this will search all result
                String searchArticle = "select ArticleID, Title, ContentURL, DateTime "
                        + "from tbl_Article "
                        + "where SubcategoryID = ? and Status = 'Accepted'";
                // this will get maxQuantityEachPage row from the n offset of the above search result
                String sql = "select * \n"
                        + "from (" + searchArticle +") a \n"
                        + "order by a.Title\n"
                        + "offset ? rows fetch next ? rows only";
                stm = con.prepareStatement(sql);
                stm.setString(1, subcatID);
                stm.setInt(2, maxQuantityEachPage * (pageNumber - 1));
                stm.setInt(3, maxQuantityEachPage);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ArticleID");
                    String title = rs.getString("Title");
                    String imgLink = rs.getString("ContentURL");
                    Timestamp date = rs.getTimestamp("DateTime");
                    String createdDate = date.getHours() + ":" + date.getMinutes() + ", " 
                            + date.getDay() +"/"+ date.getMonth()+"/"+ (date.getYear() + 1900);
                    if (listArticlePresent == null) {
                        listArticlePresent = new ArrayList<>();
                    }
                    listArticlePresent.add(new ArticlePresent(id, title, imgLink, createdDate));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
     public int getArticlesByStatus (String status, String authorID, boolean more, int pageNumber, int maxQuantity) throws NamingException, SQLException {
        listArticlePresent = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;        
        int count = 0;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT *\n"
                    + "FROM tbl_Article\n"
                    + "WHERE Status LIKE ? AND AuthorID = ?\n"
                    + "ORDER BY [DateTime] DESC"
                    + "\nOFFSET ? ROWS FETCH NEXT ? ROWS ONLY";            
            if(more) {
                String countString = "SELECT COUNT(ArticleID) AS Result\n" +
                                     "FROM tbl_Article\n" +
                                      "WHERE AuthorID = ? AND [Status] LIKE ?";
                stm = con.prepareStatement(countString);
                stm.setString(1, authorID);
                stm.setString(2, status + "%");
                rs = stm.executeQuery();                
                if(rs.next()) count = rs.getInt("Result"); 
                System.out.println("Result: " + count);
            }
            
            stm = con.prepareStatement(sql);                
            stm.setString(1, status + "%");
            stm.setString(2, authorID);
            stm.setInt(3, maxQuantity * (pageNumber - 1));
            stm.setInt(4, maxQuantity);            
            rs = stm.executeQuery();            
            //Get present for article            
            while (rs.next()) {
                String id = rs.getString("ArticleID");
                String title = rs.getString("Title");
                String imgLink = rs.getString("ContentURL");
                Timestamp date = rs.getTimestamp("DateTime");
                String createdDate = date.getHours() + ":" + date.getMinutes() + ", "
                        + date.getDay() + "/" + date.getMonth() + "/" + (date.getYear() + 1900);
                if (listArticlePresent == null) {
                    listArticlePresent = new ArrayList<>();
                }
                listArticlePresent.add(new ArticlePresent(id, title, imgLink, createdDate));                
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }
}
