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
import java.sql.Timestamp;
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
                String sql = "Select * From tbl_Staff Where Username = ? and Password = ? and IsActive = 'True'";
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
    
    public Tbl_StaffDTO getInformation(String staffID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if(con != null) {
                String sql = "Select * "
                        + "From tbl_Staff "
                        + "Where StaffID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, staffID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String username = rs.getString("Username");
                    String name = rs.getString("Name");
                    Date birthday = rs.getDate("BirthDay");
                    String gender = rs.getString("Gender");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String address = rs.getString("Address");
                    String role = rs.getString("Role");
                    boolean isActive = rs.getBoolean("IsActive");
                    Tbl_StaffDTO dto = 
                            new Tbl_StaffDTO(staffID, username, null, name, birthday, gender, phone, email, address, role, isActive);
                    return dto;
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
        return null;
    }
    
    public int editStaff(String staffID, String name, String phone, String email,
            String birthday, String address, String gender) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBAccess.makeConnection();            
            String sql = "UPDATE tbl_Staff "
                    + "SET Name = ?, Phone = ?, Email = ?, BirthDay = ?, Address = ?, Gender = ? "
                    + "WHERE StaffID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, phone);
            stm.setString(3, email);
            stm.setString(4, birthday);
            stm.setString(5, address);
            stm.setString(6, gender);
            stm.setString(7, staffID);
            
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
    
    public String createStaff(String username, String name, String phone, String email,
            String birthday, String address, String gender, String role) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBAccess.makeConnection();
            String sql = "SELECT Count(StaffID) as countNumber FROM tbl_Staff";
            stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("countNumber");
                sql = "INSERT INTO tbl_Staff(StaffID, Username, Password, Name, "
                        + "Birthday, Gender, Phone, Email, Address, Role, IsActive) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, "" + (count + 1));
                stm.setString(2, username);
                stm.setString(3, "mastercook");
                stm.setString(4, name);
                stm.setString(5, birthday);
                stm.setString(6, gender);
                stm.setString(7, phone);
                stm.setString(8, email);
                stm.setString(9, address);
                stm.setString(10, role);
                stm.setBoolean(11, true);
                
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
    
    public void editWorkingSubcategories(String staffID, String[] workingSubcategories) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBAccess.makeConnection();            
            String sql = "DELETE FROM tbl_WorkingSubcategory "
                    + "WHERE StaffID = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, staffID);
            stm.executeUpdate();
            
            if (workingSubcategories != null)
                for (String workingSubcategory : workingSubcategories) {
                    sql = "INSERT INTO tbl_WorkingSubcategory VALUES (?, ?)";
                    stm = con.prepareStatement(sql);
                    stm.setString(1, staffID);
                    stm.setString(2, workingSubcategory);
                    stm.executeUpdate();
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
    }
}
