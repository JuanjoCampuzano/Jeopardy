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
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alfredo_altamirano
 */
@WebServlet(name = "terminarjuego", urlPatterns = {"/terminarjuego"})
public class terminarjuego extends HttpServlet {

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
        
        int perfilId = Integer.parseInt(request.getParameter("_perfil"));
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            
            stmt.executeUpdate("insert into Juego (id_perfil) values (" + perfilId + ")");
            ResultSet rs = stmt.executeQuery("select id from Juego order by id desc limit 1");
            rs.next();
            int juegoId = rs.getInt(1);
            
            for (Enumeration<String> e = request.getParameterNames(); e.hasMoreElements();) {
                String nombreAlumno = e.nextElement();
                if (nombreAlumno.equals("_perfil")) {
                    continue;
                }
                
                rs = stmt.executeQuery("select count(*) from Alumno where nombre = '" + nombreAlumno + "'");
                rs.next();
                if (rs.getInt(1) == 0) {
                    stmt.executeUpdate("insert into Alumno (nombre) values ('" + nombreAlumno + "')");
                }
                
                rs = stmt.executeQuery("select id from Alumno where nombre = '" + nombreAlumno + "'");
                rs.next();
                int idAlumno = rs.getInt(1);               
                    
                String puntos = request.getParameter(nombreAlumno);
                stmt.executeUpdate("insert into Resultados (id_juego, id_alumno, points) values (" + juegoId + ", " + idAlumno + ", " + puntos + ")");
            }
            
        } catch (Exception e) {
            System.out.println(e);
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
