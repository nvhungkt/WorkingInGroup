/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import sample.tbl_staff.Tbl_StaffDAO;
import sample.tbl_staff.Tbl_StaffDTO;

/**
 *
 * @author ahhun
 */

//Get working categories before moving to Upload Articles Page
public class ViewUploadArticlePageAction {
    private Set<Entry<String, String>> workingCategories;

    public Set<Entry<String, String>> getWorkingCategories() {
        return workingCategories;
    }
    
    public ViewUploadArticlePageAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session != null) {
            Tbl_StaffDTO staff = (Tbl_StaffDTO) session.get("STAFF");
            if (staff != null) {
                Tbl_StaffDAO dao = new Tbl_StaffDAO();
                dao.getWorkingCategories(staff.getStaffID());
                workingCategories = dao.getListWorkingCategory().entrySet();
            }
        }
        return "success";
    }
    
}
