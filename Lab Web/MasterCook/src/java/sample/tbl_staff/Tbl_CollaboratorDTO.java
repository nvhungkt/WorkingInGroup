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
public class Tbl_CollaboratorDTO implements Serializable{
    private String collaboratorID;
    private String fullName;
    private String userName;
    private int numberOfAcceptedPosts;
    private int numberOfRejectedPosts;
    private int numberOfPendingPosts;
    private double averageTimeForNewPost;
    private double averageViews;
    private double averageComments;

    public Tbl_CollaboratorDTO() {
    }

    public Tbl_CollaboratorDTO(String collaboratorID, String fullName, String userName,int numberOfAcceptedPosts,
            int numberOfRejectedPosts, int numberOfPendingPosts, double averageTimeForNewPost, double averageViews, double averageComments) {
        this.collaboratorID = collaboratorID;
        this.fullName = fullName;
        this.userName = userName;
        this.numberOfAcceptedPosts = numberOfAcceptedPosts;
        this.numberOfRejectedPosts = numberOfRejectedPosts;
        this.numberOfPendingPosts = numberOfPendingPosts;
        this.averageTimeForNewPost = averageTimeForNewPost;
        this.averageViews = averageViews;
        this.averageComments = averageComments;
    }

    public String getCollaboratorID() {
        return collaboratorID;
    }

    public void setCollaboratorID(String collaboratorID) {
        this.collaboratorID = collaboratorID;
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

    public int getNumberOfPendingPosts() {
        return numberOfPendingPosts;
    }

    public void setNumberOfPendingPosts(int numberOfPendingPosts) {
        this.numberOfPendingPosts = numberOfPendingPosts;
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
