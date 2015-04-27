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
 <center>
        <h1 id="titulo">Creaci&oacute;n de tema</h1>
    <form action="nuevo_tema" name="nueva" method="post">
        <h2 id="seleccion">Seleccionar clase:</h2>
        <select id="clases" name="clase">
        </select>
    <br>
    <h2 id="seleccion">Tema nuevo:</h2><input type="text" id="textarea" name="tema">
    <div id="break">
    <input type="submit" id="click_button_small" onclick="return validacion()">
    </div>
    </form>
</center>
<%@include file="footer.jsp" %>