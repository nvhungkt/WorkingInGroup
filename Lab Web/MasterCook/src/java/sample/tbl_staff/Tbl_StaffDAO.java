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
}