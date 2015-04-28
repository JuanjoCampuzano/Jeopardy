<%-- 
    Document   : tablero
    Created on : Apr 14, 2015, 12:58:40 PM
    Author     : juanjocampuzano
--%>

<%@page import="Juego.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@include file="header.jsp"%>
    <%
        Perfil perfil = (Perfil) session.getAttribute("perfil");
    %>
    <script type="text/javascript">
        var puntos = {};
        var clickPregunta = function (pregunta, respuesta, dificultad, id) {
            var alumno = prompt("Nombre del alumno:");
            if (typeof puntos[alumno] === 'undefined') {
                puntos[alumno] = 0;
            }
            
            var correcto = prompt(pregunta) === respuesta;
            if (correcto) {
                puntos[alumno] += (dificultad+1)*200;
            }
            
            alert(correcto ? "Correcto" : "Incorrecto");
            $('#' + id).attr('onclick', null);
            $('#' + id).html('-');
        };
        
        var terminar = function () {
            puntos['_perfil'] = <%=perfil.id%>;
            $.ajax({
                url: 'terminarjuego',
                type: 'POST', 
                data: puntos,
                success: function () {
                    window.location = "menu.jsp";
                }
            });
        }
    </script>
        <h1 id="titulo">Juega Jeopardy!</h1>
        <table id="table_juego">
            <%
                final int ROWS = 5, COLUMNS = 5;
                for (int i = 0; i < COLUMNS; i++) {
                    %>
                    <th class="header_juego"><%=perfil.temas.get(i)%></th>
                    <%
                }
                
                for (int i = 0; i < COLUMNS; i++) {
                    %><tr><%
                        for (int j = 0; j < ROWS; j++) {
                            out.println("<td class=\"celda_juego\" id=\"celda" + i + j + "\" onclick=\"clickPregunta('" + perfil.pistas.get(j).get(i).pregunta + "', '" + perfil.pistas.get(j).get(i).respuesta + "', " + perfil.pistas.get(j).get(i).dificultad + ", 'celda" + i + j + "')\">");
                            out.println((i+1)*200);
                            out.println("</td>");
                        %>
                        <%
                    }
                    %></tr><%
                }
            %>
        </table>
         <center>
            <div id="break">
                <input id="click_button_small" type="button" onclick="terminar()" value="Terminar">
            </div>
        </center>
<%@include file="footer.jsp"%>