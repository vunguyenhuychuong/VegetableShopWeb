/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import sample.daos.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author DELL
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR="login.jsp";
    private static final String US="1";
    private static final String USER_PAGE="MainController?action=Show";
    private static final String AD="0";
    private static final String ADMIN_PAGE="MainController?action=Search&search=";
    
    static final Logger LOGGER= Logger.getLogger(LoginController.class);
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try{
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userID, password);
            if(loginUser != null) {
                String roleId = loginUser.getRoleID();
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", loginUser);
                if(AD.equals(roleId)){
                    url= ADMIN_PAGE;
                    LOGGER.info("Login success!");
                }else if(US.equals(roleId)){
                    url= USER_PAGE;
                    LOGGER.info("Login success!");
                }else{
                    request.setAttribute("Error" ,"Your role is not supporting!");
                    LOGGER.info("Role user not found!");
                }
            }else{
                request.setAttribute("ERROR", "INCORRECT userID or password!");
                LOGGER.info("Incorrect userID or password!");
            }
        }catch(Exception e){
            log("Error at LoginController!" +e.toString());
            LOGGER.error(e);
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
