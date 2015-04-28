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
                $('#pistasDiv').html('<h2 id="seleccion">Pistas:</h2><select id="pistas" name="pista"></select><br>');
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
                $('#temasDiv').append('<h2 id="seleccion">Tema:</h2><select id="temas" name="tema"></select><br>');
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
        
        borrar = function() {
            $.ajax({
                url: 'borrar?item=pista&nombre=' + $('#pistas').val().trim(),
                type: 'POST',
                success: function(returnedXMLResponse){
                    window.location = 'menu.jsp';
                }
            });
        }

 });
     
 </script>
 <center>
     <h1 id="titulo">Editar Pista</h1>
<form id="forma" action="editar_pista" method="post">
    <h2 id="seleccion">Clase:</h2>
    <select id="clases" name="clase">
    </select>
<br>
<div id="temasDiv"></div>
<div id="pistasDiv"></div>
<h2 id="seleccion">Pregunta</h2> <input id="textarea" type="text" name="nueva_pista">
<br>
<h2 id="seleccion">Respuesta:</h2> <input id="textarea" type="text" name="nueva_respuesta">
<br>
<div id="break">
<input type="submit" id="click_button_small">
</div>
</form>
        <div id="break">
            <input id="click_button_small" type="button" value="Borrar" onclick="borrar()">
        </div>
</center>
<%@include file="footer.jsp" %>