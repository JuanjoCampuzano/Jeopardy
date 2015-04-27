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
    function validacion(){
      var valor = document.getElementById("clases").selectedIndex;
      var valText = document.getElementById("clases").options;
      if(valText[valor].text === ""){
          //alert("Esa no es una opcion valida");
          return false;
      }else{
        var checkNueva_clase = document.forms["editar"]["nueva_clase"].value;
        if(checkNueva_clase === "" || checkNueva_clase === null){
            //alert("Favor de poner el nombre nuevo de la clase");
            return false;
         }
      }
    }
</script>
 <form action="editar_clase" name="editar" method="post">
Selecciona la clase que deseas editar :
    <select id="clases" name="clase">
    </select>
Nombre Nuevo: <input type="text" name="nueva_clase">
<br>
<input type="submit" onclick="return validacion()" id="click">
</form>
<%@include file="footer.jsp" %>