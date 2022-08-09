/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author DELL
 */
public class OrderDTO {
    
    private String Date;
    private float total;
    private String userID;

    public OrderDTO() {
        this.Date = "";
        this.total = 0;
        this.userID = "";
    }

    public OrderDTO(String Date, float total, String userID) {
        this.Date = Date;
        this.total = total;
        this.userID = userID;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
