/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import java.util.List;
import sample.tbl_staff.Tbl_EmployeeDAO;
import sample.tbl_staff.Tbl_EmployeeDTO;

/**
 *
 * @author ahhun
 */
public class ManageEmployeeAction {
    private final String SUCCESS = "success";
    private final String type = "Employees";
    private List<Tbl_EmployeeDTO> listStaff;

    public String getType() {
        return type;
    }
    
    public List<Tbl_EmployeeDTO> getListStaff() {
        return listStaff;
    }
    
    public ManageEmployeeAction() {
    }
    
    public String execute() throws Exception {
        Tbl_EmployeeDAO dao = new Tbl_EmployeeDAO();
        listStaff = dao.getProductivityOfEmployee();
        return SUCCESS;
    }
    
}
