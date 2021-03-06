<%-- 
    Document   : login
    Created on : 28-nov-2021, 19:14:17
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
         <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">     
        <link href="recursos/estilos/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
        <script src="recursos/javaScript/JS-AJAX/login.js" type="text/javascript"></script>
    </head>
    <style>
   
    </style>
        
    <body>
        <%@include file="plantillas/fondo_decoracion.jsp"%>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                            <img src="recursos/imagenes/Logo_colorido.png" class="brand_logo" alt="Logo">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form_container">
                        <form action="">


                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                </div>
                                <input id="txtNombre_usuario" type="text" name="txtUsuario" class="form-control input_user"  placeholder="Nombre de usuario o correo">
                            </div>


                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                                </div>
                                <input id="txtClave" type="password" name="txtClave" class="form-control input_pass" value="" placeholder="Contrase??a">
                            </div>


                            <div class="d-flex justify-content-center mt-3 ">
                                <button id="btnIniciarSecion" type="button" name="button" class="btn btn-block login_btn" style="color: #fff">Iniciar Sesi??n</button>
                            </div>
                                
                            <div class="d-flex justify-content-center mt-3 ">
                                <a href="index.jsp" style="border-radius: 50px;" class="btn btn-light btn-sm font-weight-bold float-right p-2"> <i class="bi bi-house-fill"></i>  Volver a men??</a>
                            </div>

                        </form>
                        
                    </div>

                    <div class="mt-4">
<!--                        <div class="d-flex justify-content-center links">
                            ??Quieres ser colaborador? <a href="#" class="ml-2">Solicitar</a>
                        </div>
                        <div class="d-flex justify-content-center links">
                            <a href="#">??Olvidaste tu contrase??a?</a>
                        </div>-->
                    </div>
                </div>
            </div>
        </div>
        <%@include  file="plantillas/menu_accesibilidad.jsp" %>  
        <!--        <div class=" caja_login ">       
                    <div class="row">
                        <div class="col-lg-3">
                            <img class="mt-3 "  height="500" width="505" src="recursos/imagenes/Logo_nuevo.png" alt=""/>     
                        </div>
                        <div class="col-lg-9">
                             <div class="form-group">
                                <label class="blanco grosor" >Correo</label>
                                <input type="email" class="form-control form-control-sm " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">                
                            </div>
                            <div class="form-group">
                                <label class="blanco grosor">Contrase??a</label>
                                <input type="password" class="form-control form-control-sm" id="exampleInputPassword1" placeholder="Password">
                            </div>            
                            <button type="submit" class="btn btn-block boton_naranja">Iniciar Sesi??n</button>
                            <a href="#" class=" blanco">Recuperar contrase??a</a>
                        </div>
                    </div>
                </div>-->
        <!--Formulario-->        
    </body>
</html>