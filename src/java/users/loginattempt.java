/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.IOException;
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
 * @author juanjocampuzano
 */
public class loginattempt extends HttpServlet {

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

        // Obtener parametros de la forma
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Crear sesion, asumir que no se hizo log in exitoso
        HttpSession session = request.getSession();
        session.setAttribute("loggedIn", false);
        session.setAttribute("loginmsg", "");
        String url = "/login.jsp";
        
        try {
            // Realizar conexion a la base de datos y extraer datos de usuarios
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jeopardy", "root", "");
            Statement stmt = con.createStatement();
            String query = "SELECT password, failed FROM Usuario WHERE username = '" + username + "'";
            ResultSet rs = stmt.executeQuery(query);
            if (rs.next()) {
                String realPassword = rs.getString(1);
                int attempts = rs.getInt(2);

                // Verificar que la cuenta no este bloqueda
                if (attempts == 3) {
                    session.setAttribute("loginmsg", "Esta cuenta esta bloqueda.");
                    url = "/login.jsp";
                }

                // Comaprar parametros de forma con datos de la tabla
                if (realPassword.equals(password)) {
                    // Log in exitoso
                    url = "/menu.jsp";
                    session.setAttribute("loggedIn", true);
                    session.setAttribute("username", username);
                    session.setAttribute("loginmsg", "");
                    query = "UPDATE Usuario SET failed = 0 WHERE username = '" + username + "'";
                    stmt.executeUpdate(query);
                } else {
                    // Log in fallido, incrementar el numero de intentos
                    query = "UPDATE Usuario SET failed=" + attempts + 1 + " WHERE username='" + username + "'";
                    stmt.executeUpdate(query);
                    url = "/login.jsp";
                    session.setAttribute("loginmsg", "Password incorrecto. Llevas " + attempts + 1 + " intento" + ((attempts == 0) ? "" : "s") + " fallido" + ((attempts == 0) ? "." : "s."));
                }
            } else {
                session.setAttribute("loginmsg", "No existe este usuario.");
                url = "/login.jsp";
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        // Hacer el forward del servlet
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
