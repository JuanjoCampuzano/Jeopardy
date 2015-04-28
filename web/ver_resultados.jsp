
<%-- 
    Document   : editar_perfil
    Created on : Apr 24, 2015, 5:35:10 PM
    Author     : AlejandroSanchez
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<center>
    <h1 id="titulo">
    Resultados
    </h1>
    <table id="table_juego">
        <tr>
        <th class="header_juego">Alumno</th>
        <th class="header_juego">Puntos</th>
        <th class="header_juego">Juegos</th>
        </tr>
        <%
            List<String> alumnos = (List<String>) session.getAttribute("alumnos");
            List<Integer> puntos = (List<Integer>) session.getAttribute("puntos");
            List<Integer> juegos = (List<Integer>) session.getAttribute("juegos");
            for (int i = 0; i < alumnos.size(); i++) {
                %>
                <tr>
                    <td class="celda_juego">
                        <%=alumnos.get(i)%>
                    </td>
                    <td class="celda_juego">
                        <%=puntos.get(i)%>
                    </td>
                    <td class="celda_juego">
                        <%=juegos.get(i)%>
                    </td>
                </tr>
                <%
            }
        %>
    </table>
</center>
<%@include file="footer.jsp" %>