/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import java.util.Map;
import sample.tbl_staff.Tbl_StaffDAO;
import sample.tbl_staff.Tbl_StaffDTO;
import sample.tbl_subcategory.Tbl_SubcategoryDAO;
import sample.tbl_subcategory.Tbl_SubcategoryDTO;

/**
 *
 * @author Administrator
 */
public class ViewStaffInfoAction {
    private String staffID;
    private Tbl_StaffDTO staff;
    private Map<String, String> workingSubcategories; //list all NAME of working subcategory
    private List<Tbl_SubcategoryDTO> allSubcategories;
    private final String SUCCESS = "success";
    public ViewStaffInfoAction() {
    }
    
    public String execute() throws Exception {
        Tbl_StaffDAO dao = new Tbl_StaffDAO();
        dao.getWorkingCategories(getStaffID());
        workingSubcategories = dao.getListWorkingCategory();
        staff = dao.getInformation(staffID);
        
        Tbl_SubcategoryDAO dao2 = new Tbl_SubcategoryDAO();
        dao2.getAllSubcat();
        allSubcategories = dao2.getListSubcat();
        return SUCCESS;
    }

    public String getStaffID() {
        return staffID;
    }

    public Tbl_StaffDTO getStaff() {
        return staff;
    }

    public Map<String, String> getWorkingSubcategories() {
        return workingSubcategories;
    }

    public List<Tbl_SubcategoryDTO> getAllSubcategories() {
        return allSubcategories;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }
    
}
