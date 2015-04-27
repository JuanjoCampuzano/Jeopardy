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
            var pregunta = document.forms["nueva"]["pregunta"].value;
            if(pregunta ==="" || pregunta === null){
                return false;
            }else{
                var respuesta = document.forms["nueva"]["respuesta"].value;
                if(respuesta === "" || respuesta === null){
                    return false;
                }
            }
        }
        
    });
     
</script>
<form id="forma" action="nueva_pista" name="nueva" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
<div id="temasDiv"></div>
Pregunta:<input type="text" name="pregunta"><br>
Respuesta:<input type="text" name="respuesta"><br>
Puntos:<select name="dificultad">
    <option value="200">200</option>
    <option value="400">400</option>
    <option value="600">600</option>
    <option value="800">800</option>
    <option value="1000">1000</option>
</select><br>
<input type="submit" onclick="return valudacion()">
</form>
<%@include file="footer.jsp" %>