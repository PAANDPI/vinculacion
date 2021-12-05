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
    <body>
        <div class="row color_base" style="padding-top: 10px">
            <ul class="nav nav-pills " style="margin: 0 auto" >
                <li class="nav-item">
                    <a style="padding: 10px" class="btn btn-sm  nav-link  blanco" href="#">Guardar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Atras</a>
                </li>
            </ul>
        </div>
        <div class="container">



            <div class="row">
                <div class="col-sm-12">                                            
                    <div class="form-group" >
                        <textarea id="txt-content"  name="txt-content"></textarea>
                    </div>                                    
                </div>
            </div>				              
            <div class="row mb-5">
                <div class="col-lg-12">
                    <input type="button" style="margin-bottom: 10px;float: right" class="btn btn-success pb-5" id="btn-enviar" value="Mostrar Resultado">                                            
                </div>                    
            </div>
            <div class=" row">
                <div class="col-lg-12 ">                     
                    <div class="container" style="border: 1px solid #999; min-height: 100px; height: auto">
                        <div id="resu" style="height:auto;">
                        </div>    
                    </div>                                                   
                </div>                
            </div>
        </div>         
    </body>
</html>