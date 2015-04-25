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
public class nueva_pista extends HttpServlet {

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

        String pregunta = request.getParameter("pregunta");
        String respuesta = request.getParameter("respuesta");
        int dificultad = Integer.parseInt(request.getParameter("dificultad"))/200 - 1;
        String tema = request.getParameter("tema");
        String clase = request.getParameter("clase");
        String url = "/menu.jsp";

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select id from Clase where nombre = '" + clase + "'");
            if (rs.next()) {
                int idClase = rs.getInt(1);
                rs = stmt.executeQuery("select id from Tema where nombre = '" + tema + "' and id_clase = " + idClase);
                if (rs.next()) {
                    int idTema = rs.getInt(1);
                    stmt.executeUpdate("insert into Pista (pregunta, respuesta, difficulty, id_tema) values ('" + pregunta + "', '" + respuesta + "', " + dificultad + ", " + idTema + ")");
                } else {
                    session.setAttribute("error_crear_pista", "No existe ese tema.");
                    url = "/nueva_pista.jsp";
                }
            } else {
                session.setAttribute("error_crear_pista", "No existe esa clase.");
                url = "/nueva_pista.jsp";
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
