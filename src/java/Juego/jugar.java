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
@WebServlet(name = "jugar", urlPatterns = {"/jugar"})
public class jugar extends HttpServlet {

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
        String perfilId = request.getParameter("perfil");
        HttpSession session = request.getSession();

        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("select pregunta, respuesta, difficulty, Tema.nombre, col from Perfil join Pistas_Perfiles on Perfil.id = id_Perfil join Pista on Pista.id = id_Pista join Tema on Pista.id_Tema = Tema.id join Usuario on id_Usuario = Usuario.id where Perfil.id = " + perfilId);
            
            List<String> temas = new ArrayList<>();
            List<List<Pista>> pistas = new ArrayList<>();
            
            for(int i = 0; i < 5; i++) {
                temas.add(null);
                pistas.add(new ArrayList<>());
                for (int j = 0; j < 5; j++) {
                    pistas.get(i).add(null);
                }
            }
            
            while (rs.next()) {
                int col = rs.getInt(5), dificultad = rs.getInt(3);
                String tema = rs.getString(4), pregunta = rs.getString(1), respuesta = rs.getString(2);
                temas.set(col, tema);
                pistas.get(col).set(dificultad, new Pista(pregunta, respuesta, dificultad));
            }
            
            session.setAttribute("perfil", new Perfil(Integer.parseInt(perfilId), temas, pistas));
            
        } catch (Exception e) {
            System.out.println(e);
        }

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher("/juego.jsp");
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
