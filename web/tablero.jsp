<%-- 
    Document   : tablero
    Created on : Apr 14, 2015, 12:58:40 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy!</title>
        <style>
            th {
                color: yellow; 
                background-color: blue; 
                font-size: 40px; 
                font-family: "Helvetica";
                padding: 15px;
            }
            td {
                color: yellow; 
                background-color: blue; 
                font-size: 40px; 
                font-family: "Helvetica";
                padding: 15px;
            }
            td:hover {background-color: #507FFF;}
            td:active {color:orangered;}
        </style> 
    </head>
    <body>
        <table border="solid" border-width="10px" border-color="#101010">
            <tr>
                <th>Categoria 1</th>
                <th>Categoria 2</th>
                <th>Categoria 3</th>
                <th>Categoria 4</th>
                <th>Categoria 5</th>
            </tr>
            <tr></tr>
            <tr>
                <td>200</td><td>200</td><td>200</td><td>200</td><td>200</td>
            </tr>
            <tr>
                <td>400</td><td>400</td><td>400</td><td>400</td><td>400</td>
            </tr>
            <tr>
                <td>600</td><td>600</td><td>600</td><td>600</td><td>600</td>
            </tr>
            <tr>
                <td>800</td><td>800</td><td>800</td><td>800</td><td>800</td>
            </tr>
            <tr>
                <td>1000</td><td>1000</td><td>1000</td><td>1000</td><td>1000</td>
            </tr>
        </table>
    </body>
</html>
