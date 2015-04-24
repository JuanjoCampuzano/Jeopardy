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
    <center>
        <h1>Juego de Jeopardy!</h1>
        <h3>Favor de validar su acceso.</h3>
        <br>
        <fieldset style="width:250px">
            <form action="loginattempt" method="post">
                <table>
                    <tr><td>Username:</td><td><input type="text" name="username"></td></tr>
                    <tr><td>Password:</td><td><input type="password" name="password"></tr></tr>
                </table>
                <input type="submit" value="Entrar">
            </form>
        </fieldset>
    </center>
    </body>
</html>
