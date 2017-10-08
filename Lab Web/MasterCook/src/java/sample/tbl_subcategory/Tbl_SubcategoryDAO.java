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
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.dbaccess.DBAccess;
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
}
