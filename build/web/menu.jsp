<%-- 
    Document   : menu
    Created on : Apr 22, 2015, 10:23:03 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <h1 id="bienvenida">Bienvenido a Jeopardy!</h1>
        <h2 id="seleccion">Favor de seleccionar una de las siguientes opciones</h2>
        <table id="table_menu">
            <tr id="table_row">
                <td>
                    <form action="ver_resultados.jsp" method="post">
                    <input type="submit" id="click_button" value="Ver Resultados"/>
                    </form>
                </td>                   
                <td>
                    <form action="" method="post">
                    <input type="submit" id="click_button" value="Modificar Juegos"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="" method="post">
                    <input type="submit" id="click_button" value="Nueva Categoria"/>
                    </form
                </td>
                <td>
                    
                    <input type="submit" id="click_button" value="Nueva Pista"/>
                </td>  
            </tr>
            
            <tr id="table_row">
                <td>
                    
                    <input type="submit" id="click_button" value="Editar Categorias"/>
                </td>
                <td>
                    
                    <input type="submit" id="click_button" value="Editar Pistas"/>
                </td>  
            </tr>
            <tr id="table_row">
                <td>
                    
                    <input type="submit" id="click_button" value="Ir al Juego"/>
                </td>
                <td>
                    <input type="submit" id="click_button" value="Cambiar contraseña"/>
                </td>  
            </tr>
        </table>
       </form>
    </body>
</html>
