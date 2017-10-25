/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.tbl_staff;

import java.io.Serializable;

/**
 *
 * @author ahhun
 */
public class Tbl_EmployeeDTO implements Serializable{
    private String employeeID;
    private String fullName;
    private String userName;
    private int numberOfAcceptedPosts;
    private int numberOfRejectedPosts;
    private double averageTimeForNewPost;
    private double averageViews;
    private double averageComments;

    public Tbl_EmployeeDTO() {
    }

    public Tbl_EmployeeDTO(String employeeID, String fullName, String userName, int numberOfAcceptedPosts, int numberOfRejectedPosts, double averageTimeForNewPost, double averageViews, double averageComments) {
        this.employeeID = employeeID;
        this.fullName = fullName;
        this.userName = userName;
        this.numberOfAcceptedPosts = numberOfAcceptedPosts;
        this.numberOfRejectedPosts = numberOfRejectedPosts;
        int tmp = (int) (averageTimeForNewPost * 100.0);
        this.averageTimeForNewPost = tmp / 100.0;
        tmp = (int) (averageViews * 100.0);
        this.averageViews = tmp / 100.0;
        tmp = (int) (averageComments * 100.0);
        this.averageComments = tmp / 100.0;
    }

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getNumberOfAcceptedPosts() {
        return numberOfAcceptedPosts;
    }

    public void setNumberOfAcceptedPosts(int numberOfAcceptedPosts) {
        this.numberOfAcceptedPosts = numberOfAcceptedPosts;
    }

    public int getNumberOfRejectedPosts() {
        return numberOfRejectedPosts;
    }

    public void setNumberOfRejectedPosts(int numberOfRejectedPosts) {
        this.numberOfRejectedPosts = numberOfRejectedPosts;
    }

    public double getAverageTimeForNewPost() {
        return averageTimeForNewPost;
    }

    public void setAverageTimeForNewPost(double averageTimeForNewPost) {
        this.averageTimeForNewPost = averageTimeForNewPost;
    }

    public double getAverageViews() {
        return averageViews;
    }

    public void setAverageViews(double averageViews) {
        this.averageViews = averageViews;
    }

    public double getAverageComments() {
        return averageComments;
    }

    public void setAverageComments(double averageComments) {
        this.averageComments = averageComments;
    }
    
}
