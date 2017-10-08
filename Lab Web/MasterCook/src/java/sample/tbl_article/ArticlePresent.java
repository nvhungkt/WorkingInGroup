/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_article;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Administrator
 */
public class ArticlePresent implements Serializable{
    private String id;
    private String title;
    private String imgLink;
    private String createdDate;

    public ArticlePresent() {
    }

    public ArticlePresent(String id, String title, String imgLink, String createdDate) {
        this.id = id;
        this.title = title;
        this.imgLink = imgLink;
        this.createdDate = createdDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgLink() {
        return imgLink;
    }

    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    
}
