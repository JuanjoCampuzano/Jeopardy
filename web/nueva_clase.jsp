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
<center>
<form action="nueva_clase" name="nueva" method="post">
    <h1 id="titulo"> Nombre de clase nueva:</h1> 
    <br><input id="textarea" type="text" name="nombre">
    <div id="break">
    <input type="submit" id="click_button_small" onClick="return validacion()">
    </div>
</form>
</center>
<%@include file="footer.jsp" %>