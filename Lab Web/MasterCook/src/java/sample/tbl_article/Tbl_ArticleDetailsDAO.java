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
            String sql = "SELECT m.SubcategoryID, a.Reason, a.Status, a.Title, a.ContentURL, a.[DateTime], a.[Views], s.Name AS AuthorName, m.Name AS SubcategoryName, n.Name AS CategoryName\n" +
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
                int views = rs.getInt("Views");
                String authorName = rs.getString("AuthorName");
                String subcategoryName = rs.getString("SubcategoryName");
                String subcategoryID = rs.getString("SubcategoryID");
                String categoryName = rs.getString("CategoryName");  
                String status = rs.getString("Status");
                String reason = rs.getString("Reason");
                articleDetails = new Tbl_ArticleDetailsDTO(articleID, title, contentURL, authorName, dateTime, subcategoryName, categoryName, views, status, reason, subcategoryID);
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
}
