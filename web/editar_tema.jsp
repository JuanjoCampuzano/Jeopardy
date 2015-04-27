<%-- 
    Document   : editar_pista
    Created on : Apr 25, 2015, 7:21:04 PM
    Author     : AlejandroSanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<script type="text/javascript">
 $(document).ready(function () {
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
        
        var first = true;
        
        $('#clases').change(function (e) {
            if (first) {
                $('#temasDiv').append('Temas<select id="temas" name="tema"></select><br>');
                $('#noselection').remove();
                first = false;
            }
            $.ajax({
                url: 'gettemas?clase=' + $('#clases').val(),
                type: 'GET',
                dataType: 'xml',
                success: function(returnedXMLResponse){
                    $('#temas').html('');
                    $('tema', returnedXMLResponse).each(function () {
                        var nombre = $(this).attr('nombre');
                        $('#temas').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                    });
                }  
            });
        });
        
     function validacion(){
      var checkNuevo_tema = document.forms["editar"]["nuevo_tema"].value;
        //Para testing 
        alert(checkNuevo_tema.value);
        if(checkNuevo_tema === "" || checkNueva_clase === null){
          alert("Favor de poner el nombre nuevo de la clase");
          return false;
       }
    }
        
 });
     
 </script>
<form id="forma" action="editar_tema" name="editar" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
<div id="temasDiv"></div>
Nombre Nuevo: <input type="text" name="nuevo_tema">
<br>
<input type="submit" onclick="return validacion()" id="click">
</form>
<%@include file="footer.jsp" %>