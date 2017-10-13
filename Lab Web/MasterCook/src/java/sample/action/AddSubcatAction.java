/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import sample.tbl_subcategory.Tbl_SubcategoryDAO;

/**
 *
 * @author Administrator
 */
public class AddSubcatAction {
    private String catID;
    private String subcatName;
    private String description;
    private String error;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    public AddSubcatAction() {
    }
    
    public String execute() throws Exception {
        if(catID != null && subcatName != null && !catID.equals("") && !subcatName.trim().equals("") ) {
            Tbl_SubcategoryDAO dao = new Tbl_SubcategoryDAO();
            boolean result = dao.addNewSubcat(catID, subcatName.trim(), description.trim());
            if (result) {
                return SUCCESS;
            }
        } else {
            setError("Name is required!!!");
        }
        return FAIL;
    }

    /**
     * @return the catID
     */
    public String getCatID() {
        return catID;
    }

    /**
     * @param catID the catID to set
     */
    public void setCatID(String catID) {
        this.catID = catID;
    }

    /**
     * @return the subcatName
     */
    public String getSubcatName() {
        return subcatName;
    }

    /**
     * @param subcatName the subcatName to set
     */
    public void setSubcatName(String subcatName) {
        this.subcatName = subcatName;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
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
    
}
