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
<center>
    <h1 id="titulo">Editar clase</h1>
 <form action="editar_clase" name="editar" method="post">
     <h2 id="seleccion">Selecciona la clase que deseas editar :</h2>
    <select id="clases" name="clase">
    </select>
     <h2 id="seleccion">Nombre Nuevo: </h2>
     <input type="text" id="textarea" name="nueva_clase">
     <div id="break">
     <input type="submit" id="click_button_small" onclick="return validacion()">
     </div>
</form>
</center>
<%@include file="footer.jsp" %>