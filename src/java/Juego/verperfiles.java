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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javafx.util.Pair;
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
@WebServlet(name = "verperfiles", urlPatterns = {"/verperfiles"})
public class verperfiles extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        String usuario = (String) session.getAttribute("username");
        String url = "/verperfiles.jsp";
        String perfilId = request.getParameter("perfil");
        if (perfilId != null) {
            url = "/nuevo_perfil.jsp?perfil=" + perfilId;
        }
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            
            Map<Integer, String> clases = new HashMap<>();
            Map<Integer, Map<Integer, Map<String, List<Pista>>>> map = new HashMap<>();
            ResultSet rs = stmt.executeQuery("select Perfil.id, pregunta, respuesta, difficulty, Tema.nombre, col, Clase.nombre from Perfil join Pistas_Perfiles on Perfil.id = id_Perfil join Pista on Pista.id = id_Pista join Tema on Pista.id_Tema = Tema.id join Usuario on id_Usuario = Usuario.id join Clase on Tema.id_clase = Clase.id where username = '" + usuario + "'");
            while(rs.next()) {
                Pista pista = new Pista(rs.getString(2), rs.getString(3), rs.getInt(4));
                String tema = rs.getString(5);
                String clase = rs.getString(7);
                int col = rs.getInt(6);
                int id = rs.getInt(1);
                clases.put(id, clase);
                if(!map.containsKey(id)) {
                    map.put(id, new HashMap<>());
                }
                
                Map<Integer, Map<String, List<Pista>>> perfil = map.get(id);
                if (!perfil.containsKey(col)) {
                    Map<String, List<Pista>> column = new HashMap<>();
                    column.put(tema, new ArrayList<>());
                    perfil.put(col, column);
                }
                
                List<Pista> pistas = perfil.get(col).get(tema);
                pistas.add(pista);
            }
            
            List<Perfil> perfiles = new ArrayList<>();
            map.entrySet().forEach(perfil -> {
                
                int id = perfil.getKey();
                List<String> temas = new ArrayList<>();
                List<List<Pista>> pistas = new ArrayList<>();
                for(int i = 0; i < 5; i++) {
                    temas.add("");
                    pistas.add(null);
                }
                
                perfil.getValue().entrySet().stream().map((column) -> {
                    temas.set(column.getKey(), column.getValue().keySet().iterator().next());
                    return column;
                }).forEach((column) -> {
                    pistas.set(column.getKey(), column.getValue().values().iterator().next());
                });
            
                if (perfilId == null || Integer.parseInt(perfilId) == id) {
                    perfiles.add(new Perfil(id, clases.get(id), temas, pistas));
                }
            });
            
            if (perfilId == null) {
                session.setAttribute("perfiles", perfiles);
            } else {
                session.setAttribute("perfil", perfiles.get(0));
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
