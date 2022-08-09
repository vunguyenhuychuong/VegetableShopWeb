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
public class UserError {
    private String userIDError;
    private String passwordError;
    private String fullNameError;
    private String roleIDError;
    private String addressError;
    private String birthdayError;
    private String phoneError;
    private String emailError;
    private String confirmError;

    public UserError() {
        this.userIDError = "";
        this.passwordError = "";
        this.fullNameError = "";
        this.roleIDError = "";
        this.addressError = "";
        this.birthdayError = "";
        this.phoneError = "";
        this.emailError = "";
        this.confirmError = "";
    }

    public UserError(String userIDError, String passwordError, String fullNameError, String roleIDError, String addressError, String birthdayError, String phoneError, String emailError, String confirmError) {
        this.userIDError = userIDError;
        this.passwordError = passwordError;
        this.fullNameError = fullNameError;
        this.roleIDError = roleIDError;
        this.addressError = addressError;
        this.birthdayError = birthdayError;
        this.phoneError = phoneError;
        this.emailError = emailError;
        this.confirmError = confirmError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

   

    
    
    
}
