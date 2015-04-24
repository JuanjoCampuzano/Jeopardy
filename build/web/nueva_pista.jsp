<%-- 
    Document   : nueva_pista
    Created on : Apr 23, 2015, 12:01:10 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body>
        <h1 id='bienvenida'>Creaci&oacute;n de pista</h1>
        <h2 id='seleccion'>favor de seleccionar en la categoria y pista(s) que quieres agregar</h2>
        <form>
            <select>
                <!--Llamar a poner la lista de la base de datos-->
            </select>
            <input type='number' id='cantidad'/>
            <input type='submit' value='Generar'/>
            <input type="text" value="pista"/>
                <!--Generar la cantidad de inputs que puso en cantidad-->
        </form>
    </body>
</html>
