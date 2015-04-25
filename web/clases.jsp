<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<clases>
<%
    List<String> clases = (List<String>) session.getAttribute("clases");
    for (String clase: clases) {
        %>
        <clase nombre="<%out.println(clase);%>"></clase>
        <%
    }
%>
</clases>