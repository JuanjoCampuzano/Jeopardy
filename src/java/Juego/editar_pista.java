/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Juego;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AlejandroSanchez
 */
public class editar_pista extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("pistas");
        String pista_nueva = request.getParameter("nueva_pista");
        HttpSession session = request.getSession();
        String url = "/menu.jsp";
        
        session.setAttribute("error_cambiar_pista", null);
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select count(*) from Pista where pregunta = '" + pista_nueva + "'");
            if (rs.next()) {
                if (rs.getInt(1) != 0) {
                    session.setAttribute("error_cambiar_pista", "Ya existe una pista con ese nombre.");
                    url = "/editar_pista.jsp";
                } else {
                    String query = "UPDATE pista SET nombre= '" + pista_nueva + "' WHERE nombre= '" + nombre + "' ";
                    System.out.println(query);
                    response.getWriter().print(query);
                    stmt.executeUpdate(query);
                }
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
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
