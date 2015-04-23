<%-- 
    Document   : nueva_categoria
    Created on : Apr 22, 2015, 11:33:12 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--se incluye el header.jsp en donde se agregan todos los css y js-->
    <%--<%@include file='header.jsp'%>--%>
    <head>
        <style>
            #categoria{
                size:35px;
                font-size: 50px;
                width: 500px;
                padding-top: 100px;
                margin: 0px auto;
            }
            #align{
                text-align: center;
            }
            #bienvenida , #seleccion{
                color: #FFFFFF;
                font-family:Arial;
                font-size: 20px;
                text-align: center;
            }
             body{
                background: #060CE9;
            }
            
            #table_menu{
               margin: 0px auto;
               text-align: center;
              
            }
            td{
                padding: 30px;
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
