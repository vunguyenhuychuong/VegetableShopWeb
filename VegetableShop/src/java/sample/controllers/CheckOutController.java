/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.daos.OrderDAO;
import sample.daos.ProductDAO;
import sample.daos.ProductError;
import sample.users.Cart;
import sample.users.OrderDTO;
import sample.users.ProductDTO;
import sample.users.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {
    
    private static final String ERROR="checkout.jsp";
    private static final String ERROR_CHECK="viewCart.jsp";
    private static final String OK="checkout.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart) session.getAttribute("CART");
            ProductDAO dao = new ProductDAO();
            OrderDAO order = new OrderDAO();
            boolean check = true;
            float total=0;
            List<ProductDTO> listProduct = new ArrayList<>();
            List<ProductError> listError = new ArrayList<>();           
            
            if(loginUser == null){
                url=ERROR_CHECK;
                request.setAttribute("ERRORCHECK", "Please login user ");
                check = false;
            }else {
                if(cart==null || cart.getCart().size()< 1){
                    url= ERROR_CHECK;
                    request.setAttribute("ERRORCHECK", "Please Add product before check out");
                    check = false;
                }else{
                    for (ProductDTO productDTO : cart.getCart().values()) {
                        String productID = productDTO.getProductID();
                        String productName = productDTO.getProductName();
                        float price = productDTO.getPrice()*productDTO.getQuantity();
                        int quantity = productDTO.getQuantity();
                        int quantityDB = dao.GetProductQuanity(productID);
                        if(quantityDB > quantity){
                            listProduct.add(new ProductDTO(productID, productName, "", price, quantity, "", "", ""));
                            total+=price;
                            request.setAttribute("LIST_CHECK", listProduct);
                            OrderDTO orderCheck  = new OrderDTO("", total, loginUser.getUserID());
                            boolean orderGet = order.create(orderCheck);
                            if(orderGet){
                                url=OK;
                                
                            }
                            
                        }else{
                            listError.add(new ProductError(productID, productName,"", price, quantity, "", "", ""));
                            request.setAttribute("ERRORCHECK", "Those Product not enough quantity to sold");
                            check = false;
                            url=ERROR_CHECK;
                        }
                    }
                }   
            }  
            /*for (ProductDTO product : cart.getCart().values()) {
                total+=product.getPrice() * product.getQuantity();
                String detailID = orderDetail.getDetailID();               
                float price = product.getQuantity() * product.getPrice();
                int quantity = orderDetail.getQuantity();
                String productID = orderDetail.getProductID();
                listOrderDetail.add(new OrderDetailDTO(detailID, price, quantity, quantity, productID));
                listProduct.add(new ProductDTO(productID, productID, url, price, quantity, detailID, productID, url));
            }*/
                   
        }catch(Exception e){
            log("Error at CheckOutController" + e.toString());
        }finally{
           request.getRequestDispatcher(url).forward(request, response);
        }                  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
