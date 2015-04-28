
<%-- 
    Document   : editar_perfil
    Created on : Apr 24, 2015, 5:35:10 PM
    Author     : AlejandroSanchez
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
    Resultados
    <table>
        <tr>
        <th>Alumno</th>
        <th>Puntos</th>
        <th>Juegos</th>
        </tr>
        <%
            List<String> alumnos = (List<String>) session.getAttribute("alumnos");
            List<Integer> puntos = (List<Integer>) session.getAttribute("puntos");
            List<Integer> juegos = (List<Integer>) session.getAttribute("juegos");
            for (int i = 0; i < alumnos.size(); i++) {
                %>
                <tr>
                    <td>
                        <%=alumnos.get(i)%>
                    </td>
                    <td>
                        <%=puntos.get(i)%>
                    </td>
                    <td>
                        <%=juegos.get(i)%>
                    </td>
                </tr>
                <%
            }
        %>
    </table>
<%@include file="footer.jsp" %>