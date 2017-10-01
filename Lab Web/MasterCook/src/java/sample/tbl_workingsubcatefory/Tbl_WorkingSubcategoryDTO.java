/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_workingsubcatefory;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class Tbl_WorkingSubcategoryDTO implements Serializable{

    public Tbl_WorkingSubcategoryDTO() {
    }

    public Tbl_WorkingSubcategoryDTO(String staffID, String subcategoryID) {
        this.staffID = staffID;
        this.subcategoryID = subcategoryID;
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
     * @return the subcategoryID
     */
    public String getSubcategoryID() {
        return subcategoryID;
    }

    /**
     * @param subcategoryID the subcategoryID to set
     */
    public void setSubcategoryID(String subcategoryID) {
        this.subcategoryID = subcategoryID;
    }
    private String staffID;
    private String subcategoryID;
}
