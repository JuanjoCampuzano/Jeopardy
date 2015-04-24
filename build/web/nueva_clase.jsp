<%-- 
    Document   : nueva_categoria
    Created on : Apr 22, 2015, 11:33:12 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--se incluye el header.jsp en donde se agregan todos los css y js-->
    <%@include file='header.jsp'%>
    <body>
        <!--input de la nueva categoria que quiere ingresar el usuario-->
        <!--se agrega un div que alinea todos los elementos en el centro para 
        facilitar que los elementos se tengan que alinear uno por uno-->
        <div id='align'>
            <h1 id='bienvenida'>Bienvenido a creacion de categoria</h1>
            <h2 id='seleccion'>Cual sera el nombre de tu nueva categoria?</h2>
            <form>
                <table id='table_menu'>
                    <tr>
                        <td><input type='text' id='categoria'/></td>
                    </tr> 
                    <tr>
                        <td><input id='click_button' type="submit" value='Crear'/></td> 
                    </tr>
                </table>
            </form>
        </div>
        
    </body>
</html>
