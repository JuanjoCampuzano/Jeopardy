<%@page import="Juego.Perfil"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<center>
<%
    List<Perfil> perfiles = (List<Perfil>) session.getAttribute("perfiles");
    for(int i = 0; i < perfiles.size(); i++) {
        %>
            <input type="button" id="click_button_small" value="<%=perfiles.get(i).id%>" onclick="$('#table' + <%=i%>).toggle()">
            <%
            out.println("<table class=\"table_juego\" style=\"display: none;\" id=\"table" + i + "\">");
            %>
                <tr>
                <%
                for(int j = 0; j < 5; j++) {
                %>
                    <th class="header_juego"><%=perfiles.get(i).temas.get(j)%></th>
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
                        <td class="celda_juego" onclick="alert('<%=perfiles.get(i).pistas.get(k).get(j).pregunta%>')"><%=(k+1)*200%></td>
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
            <input type="button" id="click_button_small" value="Jugar" onclick="window.location = 'jugar?perfil=<%=perfiles.get(i).id%>'">
            <%
            } else if (request.getParameter("editar") != null) {
            %>
            <input type="button" id="click_button_small" value="Editar" onclick="window.location = 'verperfiles?perfil=<%=perfiles.get(i).id%>'">
            <%
            }
            %>
            <br>
        <%      
    }
%>
</center>
<%@include file="footer.jsp" %>