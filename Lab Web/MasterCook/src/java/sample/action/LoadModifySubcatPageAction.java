/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_category.Tbl_CategoryDTO;
import sample.tbl_subcategory.Tbl_SubcategoryDAO;
import sample.tbl_subcategory.Tbl_SubcategoryDTO;
import sample.tool.OurTool;

/**
 *
 * @author Administrator
 */
public class LoadModifySubcatPageAction {
    private List<Tbl_SubcategoryDTO> listSubcat;
    private List<Tbl_CategoryDTO> listCat;
    private final String SUCCESS = "success";
    public LoadModifySubcatPageAction() {
    }
    
    public String execute() throws Exception {
        Tbl_SubcategoryDAO dao = new Tbl_SubcategoryDAO();
        dao.getAllSubcat();
        listSubcat = dao.getListSubcat();
        setListCat(OurTool.getAllCat());
        return SUCCESS;
    }

    /**
     * @return the listSubcat
     */
    public List<Tbl_SubcategoryDTO> getListSubcat() {
        return listSubcat;
    }

    /**
     * @param listSubcat the listSubcat to set
     */
    public void setListSubcat(List<Tbl_SubcategoryDTO> listSubcat) {
        this.listSubcat = listSubcat;
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
    
}
