<%-- 
    Document   : nueva_pista
    Created on : Apr 23, 2015, 12:01:10 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy</title>
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
