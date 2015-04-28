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
        <h1 id="titulo">Jeopardy</h1>
        <table id="table_menu">
            <tr id="table_row">
                <td>
                    <form action="verperfiles" method="get">
                        <input type="hidden" name="jugar" value="true" />
                        <input type="submit" id="click_button" value="Jugar"/>
                    </form>
                </td>
                <td>
                    <form action="nueva_clase.jsp" method="get">
                    <input type="submit" id="click_button" value="Nueva Clase"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="verresultados" method="get">
                    <input type="submit" id="click_button" value="Ver Resultados"/>
                    </form>
                </td>
                <td>
                    <form action="editar_clase.jsp" method="get">
                        <input type="submit" id="click_button" value="Editar Clase"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="cambiarpassword.jsp" method="get">
                    <input type="submit" id="click_button" value="Cambiar contraseña"/>
                    </form>
                </td> 
                <td>
                    <form action="nuevo_tema.jsp" method="get">
                    <input type="submit" id="click_button" value="Nuevo Tema"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="nuevo_perfil.jsp" method="get">
                    <input type="submit" id="click_button" value="Nuevo Perfil"/>
                    </form>
                </td> 
                <td>
                    <form action="editar_tema.jsp" method="get">
                        <input type="submit" id="click_button" value="Editar Tema"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="verperfiles" method="get">
                    <input type="submit" id="click_button" value="Ver Perfiles"/>
                    </form>
                </td>
                <td>
                    <form action="nueva_pista.jsp" method="get">
                    <input type="submit" id="click_button" value="Nueva Pista"/>
                    </form>
                </td>
            </tr>
            <tr id="table_row">
                <td>
                    <form action="verperfiles" method="get">
                    <input type="hidden" name="editar" value="true" />
                    <input type="submit" id="click_button" value="Editar Perfil"/>
                    </form>
                </td>
                <td>
                    <form action="editar_pista.jsp" method="get">
                    <input type="submit" id="click_button" value="Editar Pistas"/>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
