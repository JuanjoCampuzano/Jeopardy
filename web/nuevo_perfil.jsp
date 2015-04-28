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
        
        temaChanged = function (index) {
            $.ajax({
                url: 'getpistas?clase=' + $('#clases').val().trim() + '&tema=' + $('#tema' + index).val(),
                type: 'GET',
                dataType: 'xml',
                success: function(returnedXMLResponse){
                    for (var i = 0; i < 5; i++) {
                        $('#pregunta' + i + index).html('');
                    }
                    $('pista', returnedXMLResponse).each(function () {
                        var pregunta = $(this).attr('pregunta');
                        var dificultad = $(this).attr('dificultad')/200-1;
                        $('#pregunta' + dificultad + index).append('<option value="' + pregunta + '">' + pregunta + '</option>\n');
                    });
                }  
            });
        };
        
        $('#clases').change(function () {
            if (first) {
                $('#noselection').remove();
                first = false;
            }
            
            for (var i = 0; i < 5; i++) {
                for (var j = 0; j < 5; j++) {
                    $('#pregunta' + i + j).html('');
                }
            }
            
            $.ajax({
                url: 'gettemas?clase=' + $('#clases').val(),
                type: 'GET',
                dataType: 'xml',
                success: function(returnedXMLResponse){
                    for (var i = 0; i < 5; i++) {
                        $('#tema' + i).html('');
                    }
                    for (var i = 0; i < 5; i++) {
                        $('#tema' + i).append('<option value="-">-</option>\n');
                    }
                    $('tema', returnedXMLResponse).each(function () {
                        var nombre = $(this).attr('nombre');
                        for (var i = 0; i < 5; i++) {
                            $('#tema' + i).append('<option value="' + nombre + '">' + nombre + '</option>\n');
                        }
                    });
                }  
            });
        });
   });
   
   function validate() {
       var valid = true;
       $('.validacion').each(function () {
           if (!$(this).val()) {
               valid = false;
           }
       });
       if (!valid) {
           alert('Ningun campo debe estar vacio.');
       }
       return valid;
   }
     
</script>
<center>
<h1 id="titulo">Creaci&oacute;n de perfil</h1>
<form action="nuevo_perfil" method="post">
    <h2 id="seleccion">Seleccione una clase:</h2>
    
    <select id="clases" class="validacion" name="clase">
    </select>
    <div id="break">
    <table id="table_menu">
        <tr>
            <%
                for(int i = 0; i < 5; i++) { 
                    out.println("<th><select class=\"validacion\" onchange=\"temaChanged(" + i + ")\" id=\"tema" + i + "\" name=\"tema" + i + "\"></select></th>");
                }
            %>
        </tr>
        <%
            for(int i = 0; i < 5; i++) {
                out.println("<tr>");
                for(int j = 0; j < 5; j++) {
                    out.println("<td><select class=\"validacion\" id=\"pregunta" + i + j + "\" name=\"pregunta" + i + j + "\"></select></td>");
                }
                out.println("<tr>");
            }
        %>
    </table>
    </div>
    <div id="break">
        <input id="click_button_small" type="submit" onclick="return validate()">
    </div>
</form>
</center>
<%@include file="footer.jsp" %>