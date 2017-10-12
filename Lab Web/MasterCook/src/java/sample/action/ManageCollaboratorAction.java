/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_staff.Tbl_CollaboratorDAO;
import sample.tbl_staff.Tbl_CollaboratorDTO;

/**
 *
 * @author ahhun
 */
public class ManageCollaboratorAction {
    private final String SUCCESS = "success";
    private final String type = "Collaborators";
    private List<Tbl_CollaboratorDTO> listStaff;

    public String getType() {
        return type;
    }
    
    public List<Tbl_CollaboratorDTO> getListStaff() {
        return listStaff;
    }
    
    public ManageCollaboratorAction() {
    }
    
    public String execute() throws Exception {
        Tbl_CollaboratorDAO dao = new Tbl_CollaboratorDAO();
        listStaff = dao.getProductivityOfCollaborator();
        return SUCCESS;
    }
    
}
