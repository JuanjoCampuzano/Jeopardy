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
@WebServlet(name = "nuevo_tema", urlPatterns = {"/nuevo_tema"})
public class nuevo_tema extends HttpServlet {

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
        
        HttpSession session = request.getSession();

        String clase = request.getParameter("clase");
        String tema = request.getParameter("tema");
        String url = "/menu.jsp";

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select count(*) from tema join clase on id_clase = clase.id where tema.nombre = '" + tema + "' and clase.nombre = '" + clase + "'");

            if (rs.next()) {
                if (rs.getInt(1) != 0) {
                    session.setAttribute("error_crear_tema", "Ya existe un tema con ese nombre.");
                    url = "/nuevo_tema.jsp";
                } else {
                    rs = stmt.executeQuery("select id from Clase where nombre = '" + clase + "'");
                    if (rs.next()) {
                        stmt.executeUpdate("insert into Tema (nombre, id_clase) values ('" + tema + "', '" + rs.getInt(1) + "');");
                    } else {
                        session.setAttribute("error_crear_tema", "No existe esa clase.");
                        url = "/nuevo_tema.jsp";
                    }
                    
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
