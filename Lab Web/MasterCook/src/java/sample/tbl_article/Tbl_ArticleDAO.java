/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_ArticleDAO implements Serializable{
    public int approveArticle(String articleID, String newStatus) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;        
        try {
            con = DBAccess.makeConnection();
            String sql = "UPDATE tbl_Article SET Status = ? WHERE ArticleID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, newStatus);
            stm.setString(2, articleID);            
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
