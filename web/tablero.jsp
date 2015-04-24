<%-- 
    Document   : tablero
    Created on : Apr 14, 2015, 12:58:40 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <body id="body_juego">
        <h1 id="bienvenida">Juega Jeopardy!</h1>
        <table id='table_juego'>
            <tr>
                <th id="header_juego">Categoria 1</th>
                <th id="header_juego">Categoria 2</th>
                <th id="header_juego">Categoria 3</th>
                <th id="header_juego">Categoria 4</th>
                <th id="header_juego">Categoria 5</th>
            </tr>
            <tr></tr>
            <tr>
                <td id="juego_valor">200</td><td id="juego_valor">200</td><td id="juego_valor">200</td><td id="juego_valor">200</td><td id="juego_valor">200</td>
            </tr>
            <tr>
                <td id="juego_valor">400</td><td id="juego_valor">400</td><td id="juego_valor">400</td><td id="juego_valor">400</td><td id="juego_valor">400</td>
            </tr>
            <tr>
                <td id="juego_valor">600</td><td id="juego_valor">600</td><td id="juego_valor">600</td><td id="juego_valor">600</td><td id="juego_valor">600</td>
            </tr>
            <tr>
                <td id="juego_valor">800</td><td id="juego_valor">800</td><td id="juego_valor">800</td><td id="juego_valor">800</td><td id="juego_valor">800</td>
            </tr>
            <tr>
                <td id="juego_valor">1000</td><td id="juego_valor">1000</td><td id="juego_valor">1000</td><td id="juego_valor">1000</td><td id="juego_valor">1000</td>
            </tr>
        </table>
    </body>
</html>
