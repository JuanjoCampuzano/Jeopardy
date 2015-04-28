<%-- 
    Document   : cambiarpassword
    Created on : Apr 22, 2015, 11:16:09 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
    <script>
        function validacion(){
            var actual = document.forms["cambio"]["actual"].value;
            if(actual === "" || actual === null){
                return false;
            }else{
                var nueva = document.forms["cambio"]["nueva1"].value;
                if(nueva === "" || nueva === null ){
                    return false;
                }else{
                    var repeticion = document.forms["cambio"]["nueva2"].value;
                    if(repeticion === "" || repeticion === null){
                        return false;
                    }
                }
            }
       }
    </script>
    <h3>Cambia tu contrase&ntilde;a</h3>
    <form action="cambiopass" name="cambio" method="post">
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
        <input type="submit" onclick="return validacion()" value="Modificar">
    </form>
    
<%@include file="footer.jsp"%>
