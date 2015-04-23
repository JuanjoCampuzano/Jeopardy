<%-- 
    Document   : menu
    Created on : Apr 22, 2015, 10:23:03 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy</title>
        <!--<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/document_css.css" />-->
        <style>
            #bienvenida , #seleccion{
                color: #FFFFFF;
                font-family:Arial;
                font-size: 20px;
                text-align: center;
            }

            #table_menu{
               margin: 0px auto;
               text-align: center;
              
            }
            td{
                padding: 30px;
            }
            body{
                background: #060CE9;
            }
            #click_button{
                width:500px;
                background: #FFFFFF; 
                padding: 8px 14px 10px; 
                border:3px solid #000000; 
                cursor:pointer; 
                font-family:sans-serif; 
                letter-spacing:1px;
                text-shadow: 0 -1px 0px rgba(0, 0, 0, 0.3); 
                color: #000000;
                border-radius: 10px; 
            }
        </style>
    </head>
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
