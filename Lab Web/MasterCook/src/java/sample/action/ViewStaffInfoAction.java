/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_staff.Tbl_StaffDAO;

/**
 *
 * @author Administrator
 */
public class ViewStaffInfoAction {
    private String staffID;
    private List<String> workingSubcategories; //list all NAME of working subcategory
    private final String SUCCESS = "success";
    public ViewStaffInfoAction() {
    }
    
    public String execute() throws Exception {
        Tbl_StaffDAO dao = new Tbl_StaffDAO();
        dao.getWorkingCategories(getStaffID());
        setWorkingSubcategories(dao.getListWorkingCategory());
        System.out.println("view staff info ");
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
     * @return the workingSubcategories
     */
    public List<String> getWorkingSubcategories() {
        return workingSubcategories;
    }

    /**
     * @param workingSubcategories the workingSubcategories to set
     */
    public void setWorkingSubcategories(List<String> workingSubcategories) {
        this.workingSubcategories = workingSubcategories;
    }

    /**
     * @return the SUCCESS
     */
    public String getSUCCESS() {
        return SUCCESS;
    }
    
}
