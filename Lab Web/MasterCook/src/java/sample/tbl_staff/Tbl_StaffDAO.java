/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_staff;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;

/**
 *
 * @author Administrator
 */
public class Tbl_StaffDAO implements Serializable{
public int ChangePassword(String staffID, String newPassword) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBAccess.makeConnection();            
            String sql = "UPDATE tbl_Staff SET Password = ? WHERE StaffID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, newPassword);
            stm.setString(2, staffID);
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
    // list of categories NAME this staff working
    private Map<String, String> listWorkingCategory;

    public Map<String, String> getListWorkingCategory() {
        return listWorkingCategory;
    }
    
    // check staff login by username and password 
    public Tbl_StaffDTO checkLogin(String username, String password) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if(con != null) {
                String sql = "Select * From tbl_Staff Where Username = ? and Password = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    String staffID = rs.getString("StaffID");
                    String name = rs.getString("Name");
                    Date birthday = rs.getDate("BirthDay");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String address = rs.getString("Address");
                    String role = rs.getString("Role");
                    boolean isActive = rs.getBoolean("IsActive");
                    Tbl_StaffDTO dto = 
                            new Tbl_StaffDTO(staffID, username, password, name, birthday, gender, phone, email, address, role, isActive);
                    return dto;
                }
            }
        } finally {
            if(rs != null)
                rs.close();
            if(stm != null)
                stm.close();
            if(con != null)
                con.close();
        }
        return null;
    }
    
    // get from DB all categories NAME of this staff is working
    public void getWorkingCategories(String staffID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if(con != null) {
                String sql = "Select s.Name, s.SubcategoryID as subcateID "
                        + "From tbl_WorkingSubcategory w, tbl_Subcategory s "
                        + "Where w.StaffID = ? and w.SubcategoryID = s.SubcategoryID";
                stm = con.prepareStatement(sql);
                stm.setString(1, staffID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    if(listWorkingCategory == null) {
                        listWorkingCategory = new HashMap();
                    }
                    listWorkingCategory.put(rs.getString("subcateID"), rs.getString("Name"));
                }
            }
        } finally {
            if(rs != null)
                rs.close();
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
