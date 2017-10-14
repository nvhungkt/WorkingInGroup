/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.sql.SQLException;
import javax.naming.NamingException;
import sample.tbl_staff.Tbl_StaffDAO;

/**
 *
 * @author ahhun
 */
public class EditStaffAction {
    private String staffID;
    private String name;
    private String phone;
    private String email;
    private String birthday;
    private String address;
    private String gender;
    private String[] workingSubcategories;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public EditStaffAction() {
    }
    
    public String execute() throws Exception {
        try {
            Tbl_StaffDAO dao = new Tbl_StaffDAO();
            dao.editStaff(staffID, name, phone, email, birthday, address, gender);
            dao.editWorkingSubcategories(staffID, workingSubcategories);
        } catch (SQLException | NamingException ex) {
            System.out.println(ex);
            return FAIL;
        }
        return SUCCESS;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String[] getWorkingSubcategories() {
        return workingSubcategories;
    }

    public void setWorkingSubcategories(String[] workingSubcategories) {
        this.workingSubcategories = workingSubcategories;
    }
    
}
