/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

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
        session.setAttribute("loggedIn",false);
        String url="/login.jsp";
        
        try{
            // Realizar conexion a la base de datos y extraer datos de usuarios
            url="jdbc:mysql://localhost/jeopardy";
            Connection con=DriverManager.getConnection(url, "root","");
            Statement stmt=con.createStatement();
            String query = "SELECT * FROM usuarios";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                String un = rs.getString(1);
                String pw = rs.getString(2);
                int att = rs.getInt(3) + 1;
                // Comaprar parametros de forma con datos de la tabla
                if (un.equals(username)){
                    if (pw.equals(password)){
                        // Log in exitoso
                        url = "/tablero.jsp";
                        session.setAttribute("loggedIn",true);
                        session.setAttribute("username",username);
                        break;
                    } else {
                        // Log in fallido, incrementar el numero de intentos
                        query = "UPDATE usuarios SET failed="+att+" WHERE username='"+un+"'";
                        stmt.executeUpdate(query);
                        url = "/login.jsp";
                        session.setAttribute("loginmsg", "Password incorrecto. Llevas "+att+" intentos fallidos.");
                        break;
                    }
                }
            }
            
	} catch(Exception e){
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
