/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_staff;

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
 * @author ahhun
 */
public class Tbl_EmployeeDAO implements Serializable{
    public List<Tbl_EmployeeDTO> getProductivityOfEmployee() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBAccess.makeConnection();
            if(con != null) {
                String sql = "SELECT StaffID, Name, Username, [Status], COUNT(a.ArticleID) "
                        + "AS numberOfPosts, SUM([Views]) AS sumViews, COUNT(CommentID) AS numberOfCmts\n" +
                        "FROM \n" +
                        "	tbl_Staff s\n" +
                        "	FULL OUTER JOIN\n" +
                        "	tbl_Article a ON StaffID = a.ReviewerID OR StaffID = a.LastEditorID\n" +
                        "	FULL OUTER JOIN\n" +
                        "	tbl_Comment c ON a.ArticleID = c.ArticleID\n" +
                        "WHERE Role = 'Employee'\n" +
                        "GROUP BY StaffID, [Status], Name, Username\n" +
                        "ORDER BY StaffID, [Status]";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                
                List<Tbl_EmployeeDTO> lists = null;
                String staffID = null;
                String name = null;
                String username = null;
                int numOfAcceptedPosts = 0;
                int numOfRejectedPosts = 0;
                int sumOfViews = 0;
                int numOfCmts = 0;
                
                while (rs.next()) {
                    if (lists == null) lists = new ArrayList();
                    
                    String newStaffID = rs.getString("StaffID");
                    
                    if (staffID == null || !staffID.equals(newStaffID)) {
                        if (staffID != null) {
                            double avgTime = (numOfAcceptedPosts + numOfRejectedPosts) * 24.0 / 30;
                            double avgViews = numOfAcceptedPosts == 0 ? 0 : sumOfViews * 1.0 / numOfAcceptedPosts;
                            double avgCmts = numOfAcceptedPosts == 0 ? 0 : numOfCmts * 1.0 / numOfAcceptedPosts;
                            lists.add(new Tbl_EmployeeDTO(staffID, name, username, numOfAcceptedPosts,
                                    numOfRejectedPosts, avgTime, avgViews, avgCmts));
                            numOfAcceptedPosts = 0;
                            numOfRejectedPosts = 0;
                            sumOfViews = 0;
                            numOfCmts = 0;
                        }
                        
                        staffID = newStaffID;
                        name = rs.getString("Name");
                        username = rs.getString("Username");
                    }
                    
                    String status = rs.getString("Status");
                    if (status != null)
                        switch (status) {
                            case "Accepted":
                                numOfAcceptedPosts += rs.getInt("numberOfPosts");
                                sumOfViews = rs.getInt("sumViews");
                                numOfCmts = rs.getInt("numberOfCmts");
                                break;
                            case "Rejected":
                                numOfRejectedPosts = rs.getInt("numberOfPosts");
                                break;
                            default:
                                numOfAcceptedPosts += rs.getInt("numberOfPosts");
                                break;
                        }
                }
                
                if (lists != null) {
                    double avgTime = (numOfAcceptedPosts + numOfRejectedPosts) * 24.0 / 30;
                    double avgViews = numOfAcceptedPosts == 0 ? 0 : sumOfViews * 1.0 / numOfAcceptedPosts;
                    double avgCmts = numOfAcceptedPosts == 0 ? 0 : numOfCmts * 1.0 / numOfAcceptedPosts;
                    lists.add(new Tbl_EmployeeDTO(staffID, name, username, numOfAcceptedPosts,
                            numOfRejectedPosts, avgTime, avgViews, avgCmts));
                }
                
                return lists;
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
}
