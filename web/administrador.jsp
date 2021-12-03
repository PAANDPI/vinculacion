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

            <div class="col-lg-2 color_base  " style=" height: 100vh; ">                
                <div class="row pt-2 justify-content-center" >
                    <img class=" mt-5" width="75" height="70" src="recursos/imagenes/Logo_colorido.png" alt=""/>
                </div>
                <div class="row pt-2 pb-3 justify-content-center">

                    <h5 class="blanco">Administración</h5>
                </div>
                <div class="row pl-4" >
                    <ul class="nav flex-column" >
                        <li class="nav-item">
                            <a class="nav-link blanco pb-3  efector_barra bi bi-house " href="#"> Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blanco pb-3 efector_barra bi bi-journal-bookmark-fill " href="#"> Conceptos</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link blanco pb-3 efector_barra bi bi-compass " href="#">  Ubicaciones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blanco pb-3 efector_barra bi bi-chat-left-dots " href="#">  Sugerencias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blanco pb-3 efector_barra bi bi-people " href="#">  Control de usuario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blanco efector_barra   bi-card-list " href="#"> Categorias</a>
                            <ul class="list-group ml-5">
                                <a href="#" style="" class="efector_barra bi bi-puzzle blanco btn p-0 text-left  ">
                                    Discapacidades
                                </a> 
                                <a href="#" style="" class="efector_barra bi bi-archive blanco p-0 btn text-left ">
                                    Recursos
                                </a>                               
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blanco pb-3 efector_barra  bi bi-gear " href="#">  Cuenta</a>
                        </li>

                        <li class="nav-item " style="position: absolute; bottom: 20px;right: 5px">
                            <a class="nav-link blanco efector_barra bi bi-box-arrow-left " href="#">    Salir</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-lg-4 pl-5 p-0" >
                <div style="width: 100%; height: 600px; " class="mt-4  float-left  sombra ">                    
                    <div style="border-top:  10px solid #0B3049; background: #0B3049;" class="col-lg-12 pl-0 pt-2">
                        
                        <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                        
                        <div  class="row ml-4">
                            <label class=" font-weight-bold blanco " style="font-size: 20px" >Conceptos</label>    
                        </div> 
                         
                        <div class="row ">
                            <nav class="nav ml-4">
                                <a class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> Guardar</a>  
                                <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> Modificar</a>  
                                <a class="btn btn-l  bi bi-trash-fill blanco efecto_eliminar "> Eliminar</a>    
                                <a  class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> </a> 
                                
                            </nav>
                            
                        </div> 
                            
                    </div>  
                    <div class="p-4 barra-colores" style="height: 500px;max-height: 500px;overflow-y: auto;">
                        <form>

                            <div class="form-group">
                                <label class=" ">Discapacidad</label>
                                <input  class="form-control" type="text" id="txt-discapcidad" >
                            </div>                         
                            <div class="form-group">
                                <label class=" ">Categoria de Discapacidad</label>
                                <select  class=" form-control" id="exampleFormControlSelect1">
                                    <option style="font-size: 16px">Física</option>
                                    <option style="font-size: 16px">Motriz</option>
                                    <option style="font-size: 16px">Visión</option>
                                    <option style="font-size: 16px">Intelectual</option>
                                    <option style="font-size: 16px">Multiple</option>
                                    <option style="font-size: 16px">Sordo-Mudos</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label class=" ">Descripción</label>
                                <textarea  style="height: 100px" class="form-control" type="text" id="txt-discapcidad"></textarea>                                                                    
                            </div>                         
                            <div class="form-group">
                                <label class=" ">Discapacidad</label>
                                <input  class="form-control" type="text" id="txt-discapcidad" >
                            </div>  
                        </form>                         
                    </div>

                </div> 

            </div>
            <div class="col-lg-6">

                <div class="row mt-4 rounded justify-content-center barra-colores" style="height: 600px; max-height: 600px; overflow-y: auto">
                    <div class="card mr-2  text-white bg-primary mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Primary card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card  mr-2 text-white bg-secondary mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Secondary card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 text-white bg-success mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Success card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 text-white bg-danger mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Danger card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 text-white bg-warning mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Warning card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 text-white bg-info mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Info card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 bg-light mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Light card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                    <div class="card mr-2 text-white bg-dark mb-3" style="max-width: 18rem;">
                        <div class="card-header">Header</div>
                        <div class="card-body">
                            <h5 class="card-title">Dark card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </div>                
            </div>
        </div>    

    </body>
</html>
