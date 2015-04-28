<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
    <script>
        function validacion(){
            var actual = document.forms["cambio"]["actual"].value;
            if(actual === "" || actual === null){
                return false;
            }else{
                var nueva = document.forms["cambio"]["nueva1"].value;
                if(nueva === "" || nueva === null ){
                    return false;
                }else{
                    var repeticion = document.forms["cambio"]["nueva2"].value;
                    if(repeticion === "" || repeticion === null){
                        return false;
                    }
                }
            }
       }
    </script>
    <h1 id="titulo">Cambia tu contrase&ntilde;a</h1>
    <center>
    <form action="cambiopass" name="cambio" method="post">
        <table>
            <tr>
                <td><h2 id="seleccion">Contrase&ntilde;a actual:</h2></td>
                <td><input type="password" id="textarea" name="actual"></td>
            </tr>
            <tr>
                <td><h2 id="seleccion">Contrase&ntilde;a nueva:</h2></td>
                <td><input type="password" id="textarea" name="nueva1"></td>
            </tr>
            <tr>
                <td><h2 id="seleccion">Confirma tu contrase&ntilde;a:</h2></td>
                <td><input type="password" id="textarea" name="nueva2"></td>
            </tr>
        </table>
        <div id="break">
        <input type="submit" id="click_button_small" onclick="return validacion()" value="Modificar">
        </div>
    </form>
    </center>
    
<%@include file="footer.jsp"%>