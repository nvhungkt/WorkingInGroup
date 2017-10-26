/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_category.Tbl_CategoryDAO;
import sample.tbl_category.Tbl_CategoryDTO;
import sample.tool.OurTool;

/**
 *
 * @author Administrator
 */
public class LoadAddSubcatPageAction {
    private List<Tbl_CategoryDTO> listCat;
    private String error;
    private String subcatName;
    private String description;
    private final String SUCCESS = "success";
    public LoadAddSubcatPageAction() {
    }
    
    public String execute() throws Exception {
        listCat = OurTool.getAllCat();
        return SUCCESS;
    }

    /**
     * @return the listCat
     */
    public List<Tbl_CategoryDTO> getListCat() {
        return listCat;
    }

    /**
     * @param listCat the listCat to set
     */
    public void setListCat(List<Tbl_CategoryDTO> listCat) {
        this.listCat = listCat;
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
    
}
