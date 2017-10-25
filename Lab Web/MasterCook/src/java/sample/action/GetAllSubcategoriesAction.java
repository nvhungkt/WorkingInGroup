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
}
