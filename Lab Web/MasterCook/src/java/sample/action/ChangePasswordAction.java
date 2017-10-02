/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.tbl_staff.Tbl_StaffDAO;
import sample.tbl_staff.Tbl_StaffDTO;

/**
 *
 * @author Turtle
 */
public class ChangePasswordAction {
    private String message;
    private String oldPassword;
    private String newPassword;
    private String confirmPassword;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    public ChangePasswordAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        
        Map session = ActionContext.getContext().getSession();       
        Tbl_StaffDAO dao = new Tbl_StaffDAO();
        Tbl_StaffDTO dto = (Tbl_StaffDTO) session.get("STAFF");       
        if(dto!=null) {            
            if(!oldPassword.equals(dto.getPassword())) {                
                message = "Password is wrong!";
                return url;
            }
            if(!newPassword.equals(confirmPassword)) {
                message = "Confirm password is not matched";
                return url;
            }
            dao.ChangePassword(dto.getStaffID(), newPassword);
         
        }
        url = SUCCESS;
        return url;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }    
}
