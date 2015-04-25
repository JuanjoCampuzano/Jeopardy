<%@page import="Juego.Pista"%>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<pistas>
<%
    List<Pista> pistas = (List<Pista>) session.getAttribute("pistas");
    for (Pista pista: pistas) {
        %>
        <pista pregunta="<%out.println(pista.pregunta);%>" respuesta="<%out.println(pista.respuesta);%>" dificultad="<%out.println(pista.dificultad);%>"></pista>
        <%
    }
%>
</pistas>