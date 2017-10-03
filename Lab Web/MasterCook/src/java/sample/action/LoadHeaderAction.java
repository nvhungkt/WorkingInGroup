/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_category.Tbl_CategoryDAO;
import sample.tbl_category.Tbl_CategoryDTO;

/**
 *
 * @author Administrator
 */
public class LoadHeaderAction {
    private List<Tbl_CategoryDTO> listCat;
    private final String SUCCESS = "success";
    public LoadHeaderAction() {
    }
    
    public String execute() throws Exception {
        Tbl_CategoryDAO dao = new Tbl_CategoryDAO();
        dao.getListCategory();
        setListCat(dao.getListCat());
        
        return getSUCCESS();
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
     * @return the SUCCESS
     */
    public String getSUCCESS() {
        return SUCCESS;
    }
    
}
