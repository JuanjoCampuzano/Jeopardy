<%-- 
    Document   : nuevo_usuario
    Created on : Apr 27, 2015, 7:50:41 PM
    Author     : AlejandroSanchez
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jeopardy</title>
        <link type="text/css" rel="stylesheet" href="document_css.css" />
        <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
        <script type="text/javascript">
     function validacion(){
         var valor = document.forms["nueva"]["nombre"].value;
         if(valor === "" || valor === null){
             return false;
         }else{
             var mail = document.forms["nueva"]["mail"].value;
             if(mail === "" || mail === null){
                 return false;
             }
         }
     }
    </script>
</head>
   <body>
    <center>
        <form action="nuevousuario" name="nueva" method="post">
            <h1 id="titulo"> Nombre de tu usuario</h1> 
            <br><input id="textarea" type="text" name="nombre">
            <h1 id="titulo"> Mail que quieres usar</h1> 
            <br><input id="textarea" type="text" name="mail">
            <div id="break">
            <input type="submit" id="click_button_small" onClick="return validacion()">
            </div>
        </form>
    </center>
</body>
</html>