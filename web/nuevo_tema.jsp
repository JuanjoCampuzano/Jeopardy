<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: 'getclases',
            type: 'GET', 
            dataType: 'xml',
            success: function(returnedXMLResponse){
                $('clase', returnedXMLResponse).each(function () {
                    var nombre = $(this).attr('nombre');
                    $('#clases').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                });
            }  
        });
    function validacion(){
         var valor = document.forms["nueva"]["tema"].value;
         if(valor === "" || valor === null){
             return false;
         }
     }
        
    });
     
</script>
<form action="nuevo_tema" name="nueva" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
Tema: <input type="text" name="tema"><br>
<input type="submit" onclick="return validacion()">
</form>
<%@include file="footer.jsp" %>