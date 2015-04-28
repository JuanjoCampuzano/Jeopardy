<%@page import="Juego.Perfil"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>

<%
    List<Perfil> perfiles = (List<Perfil>) session.getAttribute("perfiles");
    for(int i = 0; i < perfiles.size(); i++) {
        %>
            <input type="button" value="<%=perfiles.get(i).id%>" onclick="$('#table' + <%=i%>).toggle()">
            <%
            out.println("<table style=\"display: none;\" id=\"table" + i + "\">");
            %>
                <tr>
                <%
                for(int j = 0; j < 5; j++) {
                %>
                    <th><%=perfiles.get(i).temas.get(j)%></th>
                <%
                }
                %>
                </tr>
                <%
                for(int j = 0; j < 5; j++) {
                    %>
                    <tr>
                    <%
                    for (int k = 0; k < 5; k++) {
                    %>
                        <td onclick="alert('<%=perfiles.get(i).pistas.get(j).get(k).pregunta%>')"><%=(k+1)*200%></td>
                    <%
                    }
                    %>
                    </tr>
                    <%
                }
                %>
            </table>
            <%
            if (request.getParameter("jugar") != null) {
            %>
            <input type="button" value="Jugar" onclick="window.location = 'jugar?perfil=<%=perfiles.get(i).id%>'">
            <%
            } else if (request.getParameter("editar") != null) {
            %>
            <input type="button" value="Editar" onclick="window.location = 'verperfiles?perfil=<%=perfiles.get(i).id%>'">
            <%
            }
            %>
            <br>
        <%      
    }
%>

<%@include file="footer.jsp" %>