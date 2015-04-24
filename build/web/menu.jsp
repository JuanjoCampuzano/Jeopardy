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
                    <button id="click_button" type="button">Ver Resultados</button>
                </td>                   
                <td>
                    <button id="click_button" type="button">Modificar Juegos</button>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <button id="click_button" type="button">Nueva Categoria</button>
                </td>
                <td>
                    <button id="click_button" type="button">Nueva Pista</button>
                </td>  
            </tr>
            
            <tr id="table_row">
                <td>
                    <button id="click_button" type="button">Editar Categorias</button>
                </td>
                <td>
                    <button id="click_button" type="button">Editar Pistas</button>
                </td>  
            </tr>
        </table>
    </body>
</html>
