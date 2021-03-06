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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class nuevousuario extends HttpServlet {

    private String randomPassword() {
        return "abcdef";
    }

    private void sendEmail(String email, String username, String password) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("fredy.altamirano8@gmail.com", "temp123.");
                    }
                });

        String msgBody = "Hola " + username + ",\n\nGracias por registrate a Jeopardy. Tu password temporal es: " + password + ".";

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("admin@jeopardy.com", "jeopardy.com Admin"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email, username));
            msg.setSubject("Your jeopardy.com account has been activated");
            msg.setText(msgBody);
            Transport.send(msg);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

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
        String username = request.getParameter("nombre");
        String mail = request.getParameter("mail");

        // Crear sesion, asumir que no se hizo log in exitoso
        HttpSession session = request.getSession();
        session.setAttribute("loggedIn", false);
        session.setAttribute("loginmsg", "");
        String url = "/login.jsp";

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jeopardy", "root", "");
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select count(*) from Usuario where username = '" + username + "'");
            if (rs.next()) {
                if (rs.getInt(1) != 0) {
                    session.setAttribute("error_crear_usuario", "Ya existe un usuario con ese nombre.");
                    url = "/nuevo_usuario.jsp";
                } else {
                    String password = randomPassword();
                    stmt.executeUpdate("insert into Usuario (username, password) values ('" + username + "', + '" + password + "');");
                    sendEmail(mail, username, password);
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
