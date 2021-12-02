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
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
        <title>Administrador</title>
    </head>
    <body class="color_base">        
        <%--<%@include file="plantillas/fondo_decoracion_1.jsp" %>--%> 

        <div class="row" >
            <div class="col-lg-2 pl-5 efecto_cristal " style=" height: 100vh">
                <div class="row pt-2" >
                    <img class="m-auto" width="55" height="50" src="recursos/imagenes/Logo_colorido.png" alt=""/>
                </div>
                <div class="row" >

                    <ul class="nav flex-column" >
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Conceptos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ubicaciones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sugerencias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Control de usuario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Cuenta</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Salir</a>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="col-lg-10">

            </div>
        </div>     
    </body>
</html>
<!-- <nav class="navbar navbar-expand-lg p-0 pl-3 opacidad_oscura " style="border-bottom: 1px solid white">
                <a class="navbar-brand blanco " href="#">F&C</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="blanco bi bi-chevron-bar-down"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent"  >
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="btn blanco botonh nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="btn blanco botonh nav-link "  href="#">Gestión de Buscador</a>
                        </li>                        
                        <li class="nav-item">
                            <a class="btn blanco botonh nav-link " href="#">Gestión de Mapa</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn blanco botonh nav-link " href="#">Control de usuario</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn blanco botonh nav-link " href="#">Salir</a>
                        </li>
                    </ul>                   
                </div>
            </nav>
            <div class="row">
                <div class="col-lg-5">
                    <form>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Email address</label>
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Example select</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect2">Example multiple select</label>
                            <select multiple class="form-control" id="exampleFormControlSelect2">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Example textarea</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="col-lg-7">
                    <table class="table">
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
            </div> -->