<%-- 
    Document   : autenticacion
    Created on : Apr 26, 2015, 7:36:18 PM
    Author     : juanjocampuzano
--%>

<!DOCTYPE html>
<html>
    <%
        boolean forward = true;
        Boolean loggedIn = false;
        if (session != null){
             loggedIn = (Boolean)session.getAttribute("loggedIn");
             if (loggedIn != null && (boolean)loggedIn){
                 forward = false;
             }
        }
        
        if (forward){
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    %>
</html>
