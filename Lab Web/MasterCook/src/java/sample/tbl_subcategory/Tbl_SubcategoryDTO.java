/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_subcategory;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class Tbl_SubcategoryDTO implements Serializable{

    public Tbl_SubcategoryDTO() {
    }

    public Tbl_SubcategoryDTO(String subcategoryID, String categoryID, String name, boolean isActive, String description) {
        this.subcategoryID = subcategoryID;
        this.categoryID = categoryID;
        this.name = name;
        this.isActive = isActive;
        this.description = description;
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

    /**
     * @return the categoryID
     */
    public String getCategoryID() {
        return categoryID;
    }

    /**
     * @param categoryID the categoryID to set
     */
    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
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
     * @return the isActive
     */
    public boolean isIsActive() {
        return isActive;
    }

    /**
     * @param isActive the isActive to set
     */
    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
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
    private String subcategoryID;
    private String categoryID;
    private String name;
    private boolean isActive;
    private String description;
}
