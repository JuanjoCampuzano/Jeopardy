<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<temas>
<%
    List<String> temas = (List<String>) session.getAttribute("temas");
    for (String tema: temas) {
        %>
        <tema nombre="<%out.println(tema);%>"></tema>
        <%
    }
%>
</temas>