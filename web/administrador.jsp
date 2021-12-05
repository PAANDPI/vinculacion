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
                <div class="row p-5">
                    <div class="col-lg-12 pl-4">

                    </div>
                    <div class="col-lg-12 pl-2 pr-5 pb-3">
                        <div class="row">
                            <div class="col-lg-2">
                                <a class="nav-link btn color_base btn-sm blanco bi bi-folder-plus p-1" href="redactar.jsp"> Nuevo concepto</a>
                            </div>
                            <div class="col-lg-10 ">
                                <div class="input-group mb-3 float-right">
                                    <input type="text" class="form-control form-control-sm  float-right" placeholder="Nombre de la discapacidad a buscar" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-sm blanco  my-2 my-sm-0 font-weight-bold color_base float-right bi bi-search" type="button"> Buscar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 pl-4 pr-4">
                        <div class="barra-colores" style="height: 500px; max-height: 500px; overflow-y: auto; border-left: #002752; ">
                            <table class="table table-fixed">
                                <thead class="">
                                    <tr class=" ">
                                        <th>Titulo</th>
                                        <th>Resumen</th>
                                        <th>Categotia</th>

                                    </tr>
                                </thead>   
                                <tbody >
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td>
                                            <p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check ">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn  naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                    <tr>
                                        <td>Sindrome de down</td>
                                        <td><p>El síndrome de Down es una afección en la que la persona tiene un cromosoma extra. Los cromosomas son pequeños “paquetes” de genes en el organismo. </p></td>
                                        <td>Sensorial</td>
                                        <td>
                                            <button style="border:1px solid #002752" type="button" class="btn naranja font-weight-bold btn-light bi bi-journal-check">Abrir</button>
                                        </td>                                 
                                    </tr>
                                </tbody>                       
                            </table>
                        </div>
                    </div>

                </div>

                <%--<%@include  file="plantillas/administracion/formularios/inicio.jsp" %>--%>


                <!-- <div id="Contenedor-de-formularios" class="row">
                                        <div class="col-lg-5 pl-4 p-0" >
                <%--<%@include  file="plantillas/administracion/formularios/persona.jsp" %>--%>
                <%--<%@include  file="plantillas/administracion/formularios/ubicaciones.jsp" %>--%>
            </div>
        <div class="col-lg-7">
        </div>
        </div> -->

            </div>
        </div>    

    </body>
</html>
