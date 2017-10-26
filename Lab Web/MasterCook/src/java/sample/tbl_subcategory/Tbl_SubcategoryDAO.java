/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_subcategory;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;
import sample.tool.OurTool;
/**
 *
 * @author Administrator
 */
public class Tbl_SubcategoryDAO implements Serializable{
    private List<Tbl_SubcategoryDTO> listSubcat;

    public List<Tbl_SubcategoryDTO> getListSubcat() {
        return listSubcat;
    }

    public void setListSubcat(List<Tbl_SubcategoryDTO> listSubcat) {
        this.listSubcat = listSubcat;
    }
    
    public void getSubcatByCat(String categoryID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_Subcategory Where CategoryID = ? and IsActive = 'true'";
                stm = con.prepareStatement(sql);
                stm.setString(1, categoryID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String subcategoryID = rs.getString("SubcategoryID");
                    String name = rs.getString("Name");
                    boolean isActive = rs.getBoolean("IsActive");
                    String description = rs.getString("Description");
                    if (listSubcat == null) {
                        listSubcat = new ArrayList<>();
                    }
                    listSubcat.add(new Tbl_SubcategoryDTO(subcategoryID, categoryID, name, isActive, description));
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
    
    public void getAllSubcat() throws NamingException, SQLException {
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "Select * From tbl_Subcategory";
                stm = con.createStatement();
                rs = stm.executeQuery(sql);
                while (rs.next()) {
                    String subcategoryID = rs.getString("SubcategoryID");
                    String categoryID = rs.getString("CategoryID");
                    String name = rs.getString("Name");
                    boolean isActive = rs.getBoolean("IsActive");
                    String description = rs.getString("Description");
                    if (listSubcat == null) {
                        listSubcat = new ArrayList<>();
                    }
                    listSubcat.add(new Tbl_SubcategoryDTO(subcategoryID, categoryID, name, isActive, description));
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
    
    public boolean addNewSubcat(String catID, String subcatName, String description) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String id = OurTool.generateID(con, "tbl_Subcategory");
                String sql = "insert into tbl_Subcategory(SubcategoryID, CategoryID, Name, IsActive, Description)"
                        + " values(?, ?, ?, 'True', ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.setString(2, catID);
                stm.setString(3, subcatName);
                stm.setString(4, description);
                int row = stm.executeUpdate();
                if(row > 0)
                    return true;
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
        return false;
    }
    
    public boolean updateSubcat(String subcatID, String subcatName, String catID, String description, boolean active) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if (con != null) {
                String sql = "Update tbl_Subcategory "
                        + "Set CategoryID = ? , Name = ? , Description = ? , IsActive = ? "
                        + "where SubcategoryID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, catID);
                stm.setString(2, subcatName);
                stm.setString(3, description);
                stm.setBoolean(4, active);
                stm.setString(5, subcatID);
                int row = stm.executeUpdate();
                if(row > 0)
                    return true;
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
        return false;
    }
    
    public boolean subcatExisted(String subcatName) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();            
            String sql = "SELECT * FROM tbl_Subcategory WHERE Name = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, subcatName);
            rs = stm.executeQuery();
            
            if (rs.next()) {
                return true;
            }
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if(stm!=null) {
                stm.close();
            }
            if(con!=null) {
                con.close();
            }
        }
        return false;
    }
}
