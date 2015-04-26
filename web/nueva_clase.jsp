<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript">
     function validacion(){
         var valor = document.forms["nueva"]["nombre"].value;
         if(valor === "" || valor === null){
             return false;
         }
     }
</script>
<form action="nueva_clase" name="nueva" method="post">
Nombre: <input type="text" name="nombre">
<br>
<input type="submit" onClick="return validacion()">
</form>
<%@include file="footer.jsp" %>