<%-- 
    Document   : administrador
    Created on : 01-dic-2021, 21:28:16
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="recursos/javaScript/administrador.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/administrador.css" rel="stylesheet" type="text/css"/>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <!--<link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">-->   
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@500&display=swap" rel="stylesheet">

        <title>Administrador</title>
    </head>
    <body class="">        
        <%--<%@include file="plantillas/fondo_decoracion_1.jsp" %>--%> 

        <div class="row" >
            <%@include  file="plantillas/administracion/menu_administracion.jsp" %>
            <div class="col-lg-10"> 

                <%@include  file="plantillas/administracion/formularios/conceptos.jsp" %>
                <%@include  file="plantillas/administracion/formularios/inicio.jsp" %>


                <div id="Contenedor-de-formularios" class="row">
                    <div class="col-lg-5 pl-4 p-0" >
                        <%@include  file="plantillas/administracion/formularios/persona.jsp" %>
                        <%@include  file="plantillas/administracion/formularios/ubicaciones.jsp" %>
                    </div>
                    <div class="col-lg-7 ">
                        <div class="row">
                            
                        </div>
                        
                        <table class="table mt-4">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                        
                        
                    </div>
                </div> 

            </div>
        </div>    

        <!-- Modal de Recursos -->
        <div class="modal fade" id="model_recursos" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Añadir Recursos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class=" ">Seleccionar categoría</label>
                            <select  class=" form-control" id="cmb-categoria">
                                <option style="font-size: 16px">Física</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Seleccionar discapacidad</label>
                            <select  class=" form-control" id="cmb-discapacidad">
                                <option style="font-size: 16px">Física</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Seleccionar tipo de recurso</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineCheckbox1" value="option1">
                            <label class="form-check-label" for="inlineCheckbox1">Archivo</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineCheckbox2" value="option2">
                            <label class="form-check-label" for="inlineCheckbox2">Enlace</label>
                        </div>
                        <div class="mb-3">
                            <input class="form-control" type="file" id="formFile">
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" id="exampleFormControlInput1">
                        </div>
                        <div class="form-group">
                            <label class=" ">Descripción</label>
                            <textarea  style="height: 100px" class="form-control" type="text" id="txt-descripcionRecurso"></textarea>                                                                    
                        </div>  
                        <div class="form-group">
                        <label class=" ">Etiqueta</label>
                        <input  class="form-control" type="text" id="txt-etiqueta" >
                    </div> 
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Añadir</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal de Discapacidades -->
        <div class="modal fade" id="model_discapacidad" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Añadir Discapacidad</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class=" ">Discapacidad</label>
                            <input  class="form-control" type="text" id="txt-discapacidad" >
                        </div>  
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary">Añadir</button>
                    </div>
                </div>
            </div>
        </div>




    </body>
</html>
