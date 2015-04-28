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
    <%@include file="header.jsp"%>
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
                <input type="submit" onclick="return validateForm()" value="Entrar">
            </form>
        </fieldset>
    </center>
    <%@include file="footer.jsp"%>