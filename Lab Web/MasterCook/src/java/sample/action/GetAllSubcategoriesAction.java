/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_subcategory.Tbl_SubcategoryDAO;
import sample.tbl_subcategory.Tbl_SubcategoryDTO;

/**
 *
 * @author ahhun
 */
public class GetAllSubcategoriesAction {
    private List<Tbl_SubcategoryDTO> allSubcategories;
    private String username;
    private String name;
    private String phone;
    private String email;
    private String birthday;
    private String address;
    private String gender;
    private String error;
    private final String SUCCESS = "success";
    
    public GetAllSubcategoriesAction() {
    }
    
    public String execute() throws Exception {
        Tbl_SubcategoryDAO dao = new Tbl_SubcategoryDAO();
        dao.getAllSubcat();
        allSubcategories = dao.getListSubcat();
        return SUCCESS;
    }
    
    public List<Tbl_SubcategoryDTO> getAllSubcategories() {
        return allSubcategories;
    }

    /**
     * @return the error
     */
    public String getError() {
        return error;
    }

    /**
     * @param error the error to set
     */
    public void setError(String error) {
        this.error = error;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }
}
