<%-- 
    Document   : tablero
    Created on : Apr 14, 2015, 12:58:40 PM
    Author     : juanjocampuzano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <script type="text/javascript">
        var getPregunta = function () {
            alert('clicked.');
        }
    </script>
    <body>
        <h1>Juega Jeopardy!</h1>
        <table>
            <%
                final int ROWS = 5, COLUMNS = 5;
                for (int i = 0; i < COLUMNS; i++) {
                    %>
                    <th class="header_juego">Categoria</th>
                    <%
                }
                
                for (int i = 0; i < COLUMNS; i++) {
                    %><tr><%
                    for (int j = 0; j < ROWS; j++) {
                        %>
                        <td class="celda_juego" onclick="getPregunta()">
                        <%
                           out.println((i+1)*200);
                        %>
                        </td>
                        <%
                    }
                    %></tr><%
                }
            %>
        </table>
    </body>
</html>
