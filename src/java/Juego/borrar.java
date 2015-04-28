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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alfredo_altamirano
 */
@WebServlet(name = "borrar", urlPatterns = {"/borrar"})
public class borrar extends HttpServlet {

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
        
        String item = request.getParameter("item");
        String nombre = request.getParameter("nombre");
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            
            switch(item) {
                case "clase":
                    stmt.executeUpdate("delete from Pista where id_Tema in (select id from Tema where id_Clase in (select id from Clase where nombre = '" + nombre + "')) ");
                    stmt.executeUpdate("delete from Tema where id_Clase in (select id from Clase where nombre = '" + nombre + "')");
                    stmt.executeUpdate("delete from Clase where nombre = '" + nombre + "'");
                    break;
                case "tema":
                    stmt.executeUpdate("delete from Pista where id_Tema in (select id from Tema where nombre = '" + nombre + "') ");
                    stmt.executeUpdate("delete from Tema where nombre = '" + nombre + "'");
                    break;
                case "pista":
                    stmt.executeUpdate("delete from Pista where pregunta = '" + nombre + "'");
                    break;
                case "perfil":
                    stmt.executeUpdate("delete from pistas_perfiles where id_perfil = " + nombre + "");
                    stmt.executeUpdate("delete from perfil where id = " + nombre + "");
                    break;
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/menu.jsp");
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
