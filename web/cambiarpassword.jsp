<%-- 
    Document   : cambiarpassword
    Created on : Apr 22, 2015, 11:16:09 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <h3>Cambia tu contrase&ntilde;a</h3>
        <form action="cambiopass" method="post">
            <table>
                <tr>
                    <td>Contrase&ntilde;a actual:</td>
                    <td><input type="password" name="actual"></td>
                </tr>
                <tr>
                    <td>Contrase&ntilde;a nueva:</td>
                    <td><input type="password" name="nueva1"></td>
                </tr>
                <tr>
                    <td>Confirma tu contrase&ntilde;a:</td>
                    <td><input type="password" name="nueva2"></td>
                </tr>
            </table>
            <input type="submit" value="Modificar">
        </form>
    </body>
</html>
