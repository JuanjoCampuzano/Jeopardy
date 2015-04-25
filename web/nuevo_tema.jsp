<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: 'getclases',
            type: 'GET', 
            dataType: 'xml',
            success: function(returnedXMLResponse){
                $('clase', returnedXMLResponse).each(function () {
                    var nombre = $(this).attr('nombre');
                    $('#clases').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                });
            }  
        });
    })
     
</script>
<form action="nuevo_tema" method="post">
    Clase:
    <select id="clases" name="clase">
    </select>
<br>
Tema: <input type="text" name="tema"><br>
<input type="submit">
</form>
<%@include file="footer.jsp" %>