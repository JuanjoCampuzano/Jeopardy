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
public class cambiopass extends HttpServlet {

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
       String actual = request.getParameter("actual");
        String nueva1 = request.getParameter("nueva1");
        String nueva2 = request.getParameter("nueva2");
        
        // Declarar sesion y obtener usuario en activo
        HttpSession session = request.getSession();
        String username = "q";//(String)session.getAttribute("username");
        String url="/menu.jsp";
        
        // Validar que la password sea igual en ambos casos
        if (nueva1.equals(nueva2) && username!=null){
            try {
                // Crear conexion para obtener datos de usuarios
                url="jdbc:mysql://localhost/jeopardy";
                Connection con=DriverManager.getConnection(url, "root","");
                Statement stmt=con.createStatement();
                String query = "SELECT * FROM usuarios WHERE username='"+username+"'";
                ResultSet rs=stmt.executeQuery(query);
                while (rs.next()){
                    // Verificar que la contraseña actual sea correcta
                    if (actual.equals(rs.getString(2))){
                        query = "UPDATE usuarios SET password='"+nueva1+"' WHERE username='"+username+"'";
                        response.getWriter().print(query);
                        stmt.executeUpdate(query);
                    }
                }
                
                
                
            } catch(Exception e){
                System.out.println(e);
            }      
	}
        url ="/menu.jsp";
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
