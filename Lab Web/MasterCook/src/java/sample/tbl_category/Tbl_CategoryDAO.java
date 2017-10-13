/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_category;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_CategoryDAO implements Serializable{
    private List<Tbl_CategoryDTO> listCat; // list all Category

    public List<Tbl_CategoryDTO> getListCat() {
        return listCat;
    }
    
    
    public void getListCategory() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_Category";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()) {
                    String categoryID = rs.getString("CategoryID");
                    String name = rs.getString("Name");
                    String description = rs.getString("Description");
                    if (listCat == null) {
                        listCat = new ArrayList<>();
                    }
                    listCat.add(new Tbl_CategoryDTO(categoryID, name, description));
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
    
    public String getCategoryName(String catID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "Select Name From tbl_Category where CategoryID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, catID);
                rs = stm.executeQuery();
                if(rs.next()) {
                    return rs.getString("Name");
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
        return null;
    }
}
