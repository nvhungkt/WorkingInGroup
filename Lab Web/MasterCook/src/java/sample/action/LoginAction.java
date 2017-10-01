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
 * @author Administrator
 */
public class LoginAction {

    


    /**
     * @return the dto
     */
    public Tbl_StaffDTO getDto() {
        return dto;
    }

    /**
     * @param dto the dto to set
     */
    public void setDto(Tbl_StaffDTO dto) {
        this.dto = dto;
    }

    /**
     * @return the SUCCESS
     */
    public String getSUCCESS() {
        return SUCCESS;
    }

    /**
     * @return the FAIL
     */
    public String getFAIL() {
        return FAIL;
    }

    public String getTxtUsername() {
        return txtUsername;
    }

    public void setTxtUsername(String txtUsername) {
        this.txtUsername = txtUsername;
    }

    public String getTxtPassword() {
        return txtPassword;
    }

    public void setTxtPassword(String txtPassword) {
        this.txtPassword = txtPassword;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    private String txtUsername;
    private String txtPassword;
    private Tbl_StaffDTO dto = null;
    private String message = "";
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public LoginAction() {
    }
    
    public String execute() throws Exception {
        Tbl_StaffDAO dao = new Tbl_StaffDAO();
        setDto(dao.checkLogin(txtUsername, txtPassword));
        if (getDto() != null) {
            Map session = ActionContext.getContext().getSession();
            session.put("STAFF", dto);
            return getSUCCESS();
        }
        if (getTxtUsername() == null || getTxtUsername().equals("")) {
            message = "Username is required!!!";
        } else if(getTxtPassword() == null || getTxtPassword().equals("")) {
            message = "Password is required!!!";
        } else if(dto == null){
            message = "Invalid username or password!!!";
            System.out.println(message);
        }
        return FAIL;
    }
    
}
