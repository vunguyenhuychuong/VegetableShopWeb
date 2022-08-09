/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.users.Cart;
import sample.users.OrderDTO;
import sample.users.OrderDetailDTO;
import sample.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class OrderDAO {

    private static final String ORDER = "INSERT INTO tblOrder(orderDate, total, userID) VALUES(CURRENT_TIMESTAMP,?,?)";
    private static final String ADDORDER1 = "UPDATE tblOrderDetail SET detailID=?, price=? , quantity=? ,orderID=? ,productID=? ";
    private static final String ADDORDER = "UPDATE tblPRODUCT set quantity = quantity - ? WHERE productID = ?";
    
    public boolean create(OrderDTO order) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ORDER);
                ptm.setFloat(1, order.getTotal());
                ptm.setString(2, order.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }        
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean addOrder(OrderDetailDTO orderD,Cart cart) throws SQLException, ClassNotFoundException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm= null;
        try{
            conn = DBUtils.getConnection();
            if(conn!= null){
                ptm = conn.prepareStatement(ADDORDER1);
                ptm.setString(1, orderD.getDetailID());
                ptm.setFloat(2, orderD.getPrice());
                ptm.setInt(3, orderD.getQuantity());
                ptm.setInt(4, orderD.getOrderID());
                ptm.setString(5, orderD.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }        
        }finally{
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }    
        return check;
    }
    
    public boolean UpdateOrderQuantity(String productID, int quantityDB) throws SQLException, ClassNotFoundException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(rs.next()){
                ptm = conn.prepareStatement(ADDORDER);
                
                int quantity = quantityDB;
                ptm.setInt(1, quantity);
                ptm.setString(2, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }        
        }finally{
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }    
        return check;
    }

    public boolean addOrder(OrderDTO listOrder) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
