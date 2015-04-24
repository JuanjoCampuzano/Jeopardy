<%-- 
    Document   : login
    Created on : Apr 20, 2015, 9:54:45 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="users.login"%>--%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <%
            String msg = (String)session.getAttribute("loginmsg");
            if (msg == null) msg = "";
        %>
    <center>
        <h1 id="bienvenida">Juego de Jeopardy!</h1>
        <h3 id="seleccion">Favor de validar su acceso.</h3>
        <br>
        <h4 style="color:red"><%=msg%></h4>
        <fieldset style="width:250px">
            <form action="loginattempt" method="post">
                <table>
                    <tr><td><h4 id="seleccion">Username</h4></td><td><input type="text" name="username"></td></tr>
                    <tr><td><h4 id="seleccion">Password</h4></td><td><input type="password" name="password"></tr>
                </table>
                <input type="submit" value="Entrar">
            </form>
        </fieldset>
    </center>
    </body>
</html>
