/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.action;

import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import sample.tbl_staff.Tbl_StaffDTO;

/**
 *
 * @author ahhun
 */
public class UploadImageAction extends ActionSupport implements ServletRequestAware{
    private File fileUpload;
    private String fileUploadContentType;
    private String fileUploadFileName;
    private String content;
    private String title;
    private String articleID;
    private HttpServletRequest servletRequest;
    
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }
    
    public String getFileUploadContentType() {
        return fileUploadContentType;
    }

    public void setFileUploadContentType(String fileUploadContentType) {
        this.fileUploadContentType = fileUploadContentType;
    }

    public String getFileUploadFileName() {
        return fileUploadFileName;
    }

    public void setFileUploadFileName(String fileUploadFileName) {
        //Get session to get staffID
        Map session = ActionContext.getContext().getSession();
        if (session != null) {
            Tbl_StaffDTO staff = (Tbl_StaffDTO) session.get("STAFF");
            if (staff != null) {
                //Generate file name
                String type = fileUploadFileName.substring(fileUploadFileName.lastIndexOf('.'));
                this.fileUploadFileName = staff.getStaffID() + "_" + new Date().getTime() + type;
            }
            else this.fileUploadFileName = fileUploadFileName;
        }
        else this.fileUploadFileName = fileUploadFileName;
    }

    public File getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(File fileUpload) {
        this.fileUpload = fileUpload;
    }
    
    @Override
    public void setServletRequest(HttpServletRequest servletRequest) {
        this.servletRequest = servletRequest;
    }

    public String execute() throws Exception{
        try {
            //Saved image
            String filePath = servletRequest.getSession().getServletContext().getRealPath("/") + "Pictures/";
            System.out.println("Server path:" + filePath + this.fileUploadFileName);
            File fileToCreate = new File(filePath, this.fileUploadFileName);
            FileUtils.copyFile(this.fileUpload, fileToCreate);
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            return INPUT;
        }
            return SUCCESS;
    }
}
