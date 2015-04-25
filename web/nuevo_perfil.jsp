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
        
        var temaSelected = function (clase, tema) {
            
            $.ajax({
                url: 'getpistas?clase=' + clase.trim() + '&tema=' + tema,
                type: 'GET',
                dataType: 'xml',
                success: function(returnedXMLResponse){
                    var divid = 'divpistas' + clase + tema;
                    divid = divid.replace(/\s+/g, '_');
                    alert(divid);
                    $('pista', returnedXMLResponse).each(function () {
                        var pregunta = $(this).attr('pregunta');
                        alert(pregunta);
                        var dificultad = $(this).attr('dificultad');
                        $('#' + divid).append('<input type="checkbox">' + pregunta + '<br>\n');
                    });
                }  
            });
        };
        
        $('#clases').change(function (e) {
            if (first) {
                $('#noselection').remove();
                first = false;
            }
            $.ajax({
                url: 'gettemas?clase=' + $('#clases').val(),
                type: 'GET',
                dataType: 'xml',
                success: function(returnedXMLResponse){
                    for (var i = 0; i < 5; i++) {
                        $('#tema' + i).html('');
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
     
</script>
<form action="nuevo_tema" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
    <table>
        <tr>
            <%
                for(int i = 0; i < 5; i++) { 
                    out.println("<th><select id=\"tema" + i + "\" name=\"tema" + i + "\"></select></th>");
                }
            %>
        </tr>
        <%
            for(int i = 0; i < 5; i++) {
                out.println("<tr>");
                for(int j = 0; j < 5; j++) {
                    out.println("<td><select id=\"pregunta" + i + j + "\" name=\"pregunta" + i + j + "\"></select></td>");
                }
                out.println("<tr>");
            }
        %>
    </table>
<br>

<input type="submit">
</form>
<%@include file="footer.jsp" %>