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
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "nuevo_perfil", urlPatterns = {"/nuevo_perfil"})
public class nuevo_perfil extends HttpServlet {

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
        String usuario = (String) session.getAttribute("username");
        String url = "/menu.jsp";
        String perfilId = request.getParameter("perfil");

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();

            if (perfilId != null) {
                stmt.executeUpdate("delete from pistas_perfiles where id_Perfil = " + perfilId);
                stmt.executeUpdate("delete from Perfil where id = " + perfilId);
            }

            ResultSet rs = stmt.executeQuery("select id from Clase where nombre = '" + clase + "'");
            if (rs.next()) {
                int idClase = rs.getInt(1);
                rs = stmt.executeQuery("select id from Usuario where username = '" + usuario + "'");
                if (rs.next()) {
                    int idUsuario = rs.getInt(1);
                    int idPerfil;
                    
                    if (perfilId != null) {
                        stmt.executeUpdate("insert into perfil (id, id_Usuario, id_Clase) values (" + perfilId + ", " + idUsuario + ", " + idClase + ")");
                        idPerfil = Integer.parseInt(perfilId);
                    } else {
                        stmt.executeUpdate("insert into perfil (id_Usuario, id_Clase) values (" + idUsuario + ", " + idClase + ")");
                        rs = stmt.executeQuery("select id from perfil order by id desc limit 1");
                        rs.next();
                        idPerfil = rs.getInt(1);
                    }

                    for (int i = 0; i < 5; i++) {
                        rs = stmt.executeQuery("select id from tema where nombre = '" + request.getParameter("tema" + i) + "'");
                        rs.next();
                        int idTema = rs.getInt(1);
                        for (int j = 0; j < 5; j++) {
                            String pregunta = request.getParameter("pregunta" + j + i);
                            rs = stmt.executeQuery("select id from pista where pregunta = '" + pregunta + "'");
                            rs.next();
                            int idPista = rs.getInt(1);
                            stmt.executeUpdate("insert into pistas_perfiles (id_Perfil, id_Pista, id_Tema, col) values (" + idPerfil
                                    + ", " + idPista + ", " + idTema + ", " + i + ")");
                        }
                    }
                } else {
                    session.setAttribute("error_crear_pista", "usuario invalido.");
                    url = "/";
                }
            } else {
                session.setAttribute("error_crear_perfil", "No existe esa clase.");
                url = "/nuevo_perfil.jsp";
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
