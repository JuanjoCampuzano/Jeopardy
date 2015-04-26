<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript">
     $.ajax({
            url: 'getclases',
            type: 'GET', 
            dataType: 'xml',
            success: function(returnedXMLResponse){
                $('#clases').append('<option id="noselection" value="">-</option>\n');
                $('clase', returnedXMLResponse).each(function () {
                    var nombre = $(this).attr('nombre');
                    $('#clases').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                });
            }  
        });
    //Revisar el valor de la seleccion del usuario usado para testing 
    $(document).ready(function(){ 
        $('#click').click(function(){ 
     alert($('#clases').val());
  });
  
});
 </script>
 <form action="editar_clase" method="post">
Selecciona la clase que deseas editar :
    <select id="clases" name="clase">
    </select>
Nombre Nuevo: <input type="text" name="nueva_clase">
<br>
<input type="submit" id="click">
</form>
<%@include file="footer.jsp" %>