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
public class ModifySubcatAction {
    private String subcatID;
    private String subcatName;
    private String catID;
    private String description;
    private boolean active;
    private final String SUCCESS = "success";
    public ModifySubcatAction() {
    }
    
    public String execute() throws Exception {
        Tbl_SubcategoryDAO dao = new Tbl_SubcategoryDAO();
        boolean nameExisted = dao.subcatExisted(subcatName);
        if (!nameExisted) {
            if(subcatName != null && !subcatName.trim().equals("")) {
                dao.updateSubcat(subcatID, subcatName.trim(), catID, description.trim(), active);
            }
        }
        return SUCCESS;
    }

    /**
     * @return the subcatID
     */
    public String getSubcatID() {
        return subcatID;
    }

    /**
     * @param subcatID the subcatID to set
     */
    public void setSubcatID(String subcatID) {
        this.subcatID = subcatID;
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
     * @return the active
     */
    public boolean isActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
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
    
}
