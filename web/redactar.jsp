<%-- 
    Document   : index.jsp
    Created on : 19-nov-2021, 15:50:11
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="recursos/javaScript/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="recursos/javaScript/editor.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <link href="recursos/estilos/editor.css" rel="stylesheet" type="text/css"/>       
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#txt-content').Editor();
                //$('#txt-content').Editor('setText', ['<p style="color:red;">Hola</p>']);
                $('#btn-enviar').click(function (e) {
                    e.preventDefault();
                    $('#txt-content').text($('#txt-content').Editor('getText'));
                    resultado();
                });
            });
            function resultado()
            {
                document.getElementById("resu").innerHTML = document.getElementById("txt-content").innerHTML;
                var aux = document.getElementById("resu").textContent;
                document.getElementById("resu").innerHTML = aux;
            }
        </script>
    </head>
    <style>
        *{
            font-family: 'Inconsolata', monospace;
        }
        .bnt_sobre:hover
        {
            background: rgba(255,255,255,0.1);            
        }
    </style>
    <body>
        <div class="row color_base" style="padding-top: 10px">
            <div class="container">
                <div class="col-lg-10">
                    <a style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-archive-fill bnt_sobre" href="#">  Guardar</a>
                    <a style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-eraser-fill bnt_sobre" href="#">  Limpiar</a>
                    <a style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-border-all bnt_sobre" href="#">  Plantillas</a>
                    <a style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-arrow-left bnt_sobre" href="administrador.jsp">  Atras</a>
                </div>
                <div class="col-lg-2">
                    <input type="button" style="margin-bottom: 10px;float: right" class="btn btn-success pb-5" id="btn-enviar" value="Mostrar Resultado">  
                </div>
            </div>          
        </div>


        <h3 class="font-weight-bold text-center">Editor de texto</h3>

        <div class="row">    

            <div class="col-lg-12" style="padding-left: 100px; padding-right: 100px; padding-bottom: 25px">                                            
                <textarea id="txt-content" style=" border: 1px solid #999" name="txt-content"></textarea>
            </div>
            <h3  class="font-weight-bold text-center">Resultado</h3>
            
            <div  class="col-lg-12" style="padding-top:15px; padding-left: 100px; padding-right: 100px ">
                <div  style="border:2px solid #999;border-radius: 10px; min-height: 100px; height: auto">
                    <div id="resu" style="height:auto;">
                    </div>    
                </div> 
            </div>
        </div>         
    </body>
</html>