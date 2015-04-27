<%-- 
    Document   : editar_tema
    Created on : Apr 25, 2015, 7:01:17 PM
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
        
        var temasChanged = function () {
            $('#temas').change(function (e) {
                $('#pistasDiv').html('Pistas<select id="pistas" name="pista"></select><br>');
                $('#noselection').remove();
                $('#pistas').append('<option id="noselection" value="">-</option>\n');
                first = false;
                
                $.ajax({
                    url: 'getpistas?clase=' + $('#clases').val() + '&' + 'tema=' + $('#temas').val(),
                    type: 'GET',
                    dataType: 'xml',
                    success: function(returnedXMLResponse){
                        $('#pistas').html('');
                        $('pista', returnedXMLResponse).each(function () {
                            var nombre = $(this).attr('pregunta');
                            $('#pistas').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                        });
                    }  
                });
            });
        };
        
        $('#clases').change(function (e) {
            if (first) {
                $('#temasDiv').append('Temas<select id="temas" name="tema"></select><br>');
                $('#noselection').remove();
                $('#temas').append('<option id="noselection" value="">-</option>\n');
                
                first = false;
                temasChanged();
            }
            $('#pistasDiv').html('');
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

 });
     
 </script>
<form id="forma" action="editar_pista" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
<div id="temasDiv"></div>
<div id="pistasDiv"></div>
Pista: <input type="text" name="nueva_pista">
<br>
Respuesta: <input type="text" name="nueva_respuesta">
<br>
Dificultad: <select name="dificultad">
<% for (int i=0; i<5; i++) out.println("<option value="+i+">"+(i+1)*200+"</option>");%>
</select>
<br>
<input type="submit" id="click">
</form>
<%@include file="footer.jsp" %>