<%-- 
    Document   : login
    Created on : Apr 20, 2015, 9:54:45 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script>
            function validateForm(){
                var checkUserName = document.forms["login"]["username"].value;
                var checkPassword = document.forms["login"]["username"].value;
                if((checkUserName=== null || checkUserName === "")||(checkPassword === null  || checkPassword === "")){
                    alert("Favor de llenar todos los datos");
                    return false;
                }
            }
            
    </script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy</title>
        <link type="text/css" rel="stylesheet" href="document_css.css" />
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    </head>

    <body>
        <div class="pageContent">

        <%
            String msg = (String)session.getAttribute("loginmsg");
            if (msg == null) msg = "";
        %>
     <center>
        <h1 id="bienvenida" style="color:whitesmoke">Juego de Jeopardy!</h1>
        <h3 id="seleccion"  style="color:whitesmoke">Favor de validar su acceso.</h3>
        <br>
        <h4 style="color:whitesmoke"><%=msg%></h4>
        <fieldset style="width:250px">
            <form  name="login" action="loginattempt"  method="post">
                <table>
                    <tr><td><h4 id="seleccion">Username</h4></td><td><input type="text" name="username"></td></tr>
                    <tr><td><h4 id="seleccion">Password</h4></td><td><input type="password" name="password"></tr>
                </table>
                <div id="break">
                    <input id="click_button_small" type="submit" onclick="return validateForm()" value="Entrar">
                </div>
            </form>
        </fieldset>
    </center>
    <%@include file="footer.jsp"%>
