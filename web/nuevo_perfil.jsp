<%@page import="Juego.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<%
    Perfil perfil = (Perfil)session.getAttribute("perfil");
%>
<script type="text/javascript">
    $(document).ready(function () {
        
        var first = true;
        
        var clasesChanged = function () {
            if (first) {
                $('#noselection').remove();
                first = false;
            }
            
            for (var i = 0; i < 5; i++) {
                for (var j = 0; j < 5; j++) {
                    $('#pregunta' + i + j).html('');
                }
            }
            
            var auto2 = true;
            
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
                    
                    if (auto2) {
                        auto2 = false;
                        <%
                        if (request.getParameter("perfil") != null) {
                        for (int i = 0; i < 5; i++) {
                            out.write("$('#tema" + i + "').val('" + perfil.temas.get(i) + " ');\n");
                            out.write("temaChanged(" + i + ");");
                        }
                        }
                        
                        %>
                        
                    }
                    
                }  
            });
        };
        
        var auto = true;
        
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
                
                if (auto) {
                    auto = false;
                    <% if (request.getParameter("perfil") != null) { %>
                        $('#clases').val('<%=perfil.clase + " "%>');
                        clasesChanged();
                    <%}%>
                }
            }  
        });
        
        var auto3 = true;
        
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
                    
                    if (index == 4 && auto3) {
                        auto3 = false;
                        <%
                        if (request.getParameter("perfil") != null) {
                            for (int i = 0; i < 5; i++) {
                                for (int j = 0; j < 5; j++) {
                                    out.write("$('#pregunta" + j + i + "').val('" + perfil.pistas.get(i).get(j).pregunta + " ');\n");
                                }
                            }
                        }
                        %>
                    }
                }  
            });
        };
        
        $('#clases').change(clasesChanged);
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
<%if (request.getParameter("perfil") == null) { %>
<form action="nuevo_perfil" method="post">
<%} else { %>
<form action="nuevo_perfil?perfil=<%=request.getParameter("perfil")%>" method="post">
    <input type="hidden" name="id" value="<%=request.getParameter("perfil")%>">
<%}%>
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
    <%if (request.getParameter("perfil") != null) { %>
    <form action="borrar" method="post">
        <div id="break">
            <input type="hidden" name="nombre" value="<%=perfil.id%>">
            <input type="hidden" name="item" value="perfil">
            <input id="click_button_small" type="submit" value="Borrar">
        </div>
    </form>
    <%}%>

</center>
<%@include file="footer.jsp" %>