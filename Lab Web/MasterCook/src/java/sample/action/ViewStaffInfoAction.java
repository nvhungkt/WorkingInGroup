/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import sample.tbl_staff.Tbl_StaffDAO;

/**
 *
 * @author Administrator
 */
public class ViewStaffInfoAction {
    private String staffID;
    private Map<String, String> workingSubcategories; //list all NAME of working subcategory
    private final String SUCCESS = "success";
    public ViewStaffInfoAction() {
    }
    
    public String execute() throws Exception {
        Tbl_StaffDAO dao = new Tbl_StaffDAO();
        dao.getWorkingCategories(getStaffID());
        setWorkingSubcategories(dao.getListWorkingCategory());
        return getSUCCESS();
    }

    /**
     * @return the staffID
     */
    public String getStaffID() {
        return staffID;
    }

    /**
     * @param staffID the staffID to set
     */
    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    /**
     * @return the SUCCESS
     */
    public String getSUCCESS() {
        return SUCCESS;
    }

    /**
     * @return the workingSubcategories
     */
    public Map<String, String> getWorkingSubcategories() {
        return workingSubcategories;
    }

    /**
     * @param workingSubcategories the workingSubcategories to set
     */
    public void setWorkingSubcategories(Map<String, String> workingSubcategories) {
        this.workingSubcategories = workingSubcategories;
    }
    
}
