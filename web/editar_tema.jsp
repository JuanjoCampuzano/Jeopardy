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
            success: function (returnedXMLResponse) {
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
                $('#temasDiv').append('<h2 id="bienvenida">Selecciona el tema</h2><select id="temas" name="tema"></select><br>');
                $('#noselection').remove();
                first = false;
            }
            $.ajax({
                url: 'gettemas?clase=' + $('#clases').val(),
                type: 'GET',
                dataType: 'xml',
                success: function (returnedXMLResponse) {
                    $('#temas').html('');
                    $('tema', returnedXMLResponse).each(function () {
                        var nombre = $(this).attr('nombre');
                        $('#temas').append('<option value="' + nombre + '">' + nombre + '</option>\n');
                    });
                }
            });
        });

        function validacion() {
            var checkNuevo_tema = document.forms["editar"]["nuevo_tema"].value;
            //Para testing 
            alert(checkNuevo_tema.value);
            if (checkNuevo_tema === "" || checkNueva_clase === null) {
                alert("Favor de poner el nombre nuevo de la clase");
                return false;
            }
        }

        borrar = function() {
            $.ajax({
                url: 'borrar?item=tema&nombre=' + $('#temas').val().trim(),
                type: 'POST',
                success: function (returnedXMLResponse) {
                    window.location = 'menu.jsp';
                }
            });
        }
    });

</script>
<center>
    <h1 id="titulo">Edici&oacute;n de tema</h1>
    <form id="forma" action="editar_tema" name="editar" method="post">
        <h2 id="bienvenida">Seleciona la clase</h2>
        <select id="clases" name="clase">
        </select>
        <br>
        <div id="temasDiv"></div>
        <h2 id="bienvenida">Nombre nuevo del tema:</h2>
        <input type="text" id="textarea" name="nuevo_tema">
        <div id="break">
            <input type="submit" onclick="return validacion()" id="click">
        </div>
    </form>
    <div id="break">
        <input type="button" value="Borrar" onclick="borrar()">
    </div>
</center>
<%@include file="footer.jsp" %>