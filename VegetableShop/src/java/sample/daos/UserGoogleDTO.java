/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

/**
 *
 * @author DELL
 */
public class UserGoogleDTO {

    private String userID;

    private String email;

    private boolean verified_email;

    private String userName;

    private String given_name;

    private String family_name;

    private String picture;

    public UserGoogleDTO() {
    }

    public UserGoogleDTO(String userID, String email, boolean verified_email, String userName, String given_name, String family_name, String picture) {
        this.userID = userID;
        this.email = email;
        this.verified_email = verified_email;
        this.userName = userName;
        this.given_name = given_name;
        this.family_name = family_name;
        this.picture = picture;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "UserGoogleDTO{" + "userID=" + userID + ", email=" + email + ", verified_email=" + verified_email + ", name=" + userName + ", userName=" + given_name + ", family_name=" + family_name + ", picture=" + picture + '}';
    }
}
