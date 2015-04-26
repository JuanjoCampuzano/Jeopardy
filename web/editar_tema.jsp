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
 });
     
 </script>
<form id="forma" action="editar_tema" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
<div id="temasDiv"></div>
Nombre Nuevo: <input type="text" name="nuevo_tema">
<br>
<input type="submit" id="click">
</form>
<%@include file="footer.jsp" %>