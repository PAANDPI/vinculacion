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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link href="recursos/estilos/login.css" rel="stylesheet" type="text/css"/>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
    </head>

    <body>
        <svg style="position: absolute; width: 500px; height: 500px; left: -200px; top: -200px" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <path fill="#9A5BCE" d="M68.2,-19.7C74.7,-2.2,56.8,25.7,33.1,42C9.5,58.4,-19.9,63.2,-37.8,50.5C-55.7,37.9,-62.1,7.8,-53.8,-12.1C-45.6,-32,-22.8,-41.7,4,-43C30.8,-44.3,61.7,-37.2,68.2,-19.7Z" transform="translate(100 100)" />
        </svg>

        <svg style="position: absolute; width: 500px; height: 500px; right: -200px " viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <path fill="#EBB575" d="M51.5,-71C64.3,-61.6,70.5,-43.3,75.6,-25.2C80.6,-7.1,84.4,10.8,79.2,25.4C74,39.9,59.6,51.1,44.9,62.8C30.2,74.5,15.1,86.7,-1.2,88.3C-17.4,89.9,-34.8,80.9,-48.9,69C-63,57.1,-73.7,42.3,-80.8,25.2C-87.8,8.1,-91,-11.3,-84.8,-26.6C-78.5,-42,-62.8,-53.3,-47.1,-61.8C-31.3,-70.3,-15.7,-76,1.8,-78.5C19.3,-81,38.7,-80.5,51.5,-71Z" transform="translate(100 100)" />
        </svg>


        <svg style="position: absolute; width: 200px; height: 200px;bottom:50px;  right: 200px " viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <path fill="#E26591" d="M50.6,-71.4C63.9,-60,71.7,-42.9,76.9,-25.4C82,-7.8,84.4,10.2,80.8,27.8C77.2,45.3,67.5,62.5,53,72.7C38.5,83,19.3,86.4,2.3,83.3C-14.8,80.2,-29.5,70.6,-45.1,60.7C-60.7,50.8,-77.2,40.6,-83.7,25.9C-90.1,11.3,-86.6,-7.9,-78.8,-23.6C-71,-39.4,-58.8,-51.8,-44.9,-63C-31.1,-74.2,-15.5,-84.2,1.6,-86.3C18.7,-88.5,37.3,-82.8,50.6,-71.4Z" transform="translate(100 100)" />
        </svg>
               
        <svg style="position: absolute; width: 500px; height: 500px;bottom:  100px; left: 200px;" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <path fill="#57CBAE" d="M50.9,-50.6C67.4,-34.5,83,-17.2,83.5,0.5C84.1,18.3,69.5,36.7,53.1,49.5C36.7,62.3,18.3,69.5,-1.5,71C-21.3,72.4,-42.5,68.1,-58.2,55.3C-73.9,42.5,-84.1,21.3,-82.9,1.2C-81.8,-18.9,-69.3,-37.8,-53.6,-54C-37.8,-70.1,-18.9,-83.4,-0.8,-82.6C17.2,-81.7,34.5,-66.7,50.9,-50.6Z" transform="translate(100 100)" />
        </svg>
        
        <svg style="position: absolute; width: 300px; height: 300px;bottom: -50px; left: -100px;" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
        <path fill="#FFDF78" d="M50.9,-50.6C67.4,-34.5,83,-17.2,83.5,0.5C84.1,18.3,69.5,36.7,53.1,49.5C36.7,62.3,18.3,69.5,-1.5,71C-21.3,72.4,-42.5,68.1,-58.2,55.3C-73.9,42.5,-84.1,21.3,-82.9,1.2C-81.8,-18.9,-69.3,-37.8,-53.6,-54C-37.8,-70.1,-18.9,-83.4,-0.8,-82.6C17.2,-81.7,34.5,-66.7,50.9,-50.6Z" transform="translate(100 100)" />
        </svg>
        
        <%--<%@include file="plantillas/menu.jsp"%>--%>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <div class="d-flex justify-content-center">
                        <div class="brand_logo_container">
                            <img src="recursos/imagenes/Logo_colorido.png" class="brand_logo" alt="Logo">
                        </div>
                    </div>
                    <div class="d-flex justify-content-center form_container">
                        <form>


                            <div class="input-group mb-3">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                                </div>
                                <input type="text" name="" class="form-control input_user" value="" placeholder="Correo electronico">
                            </div>


                            <div class="input-group mb-2">
                                <div class="input-group-append">
                                    <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                                </div>
                                <input type="password" name="" class="form-control input_pass" value="" placeholder="Contraseña">
                            </div>


                            <div class="d-flex justify-content-center mt-3 ">
                                <button type="button" name="button" class="btn btn-block login_btn">Iniciar Sesión</button>
                            </div>


                        </form>
                    </div>

                    <div class="mt-4">
                        <div class="d-flex justify-content-center links">
                            ¿Quieres ser colaborador? <a href="#" class="ml-2">Solicitar</a>
                        </div>
                        <div class="d-flex justify-content-center links">
                            <a href="#">Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                                <label class="blanco grosor">Contraseña</label>
                                <input type="password" class="form-control form-control-sm" id="exampleInputPassword1" placeholder="Password">
                            </div>            
                            <button type="submit" class="btn btn-block boton_naranja">Iniciar Sesión</button>
                            <a href="#" class=" blanco">Recuperar contraseña</a>
                        </div>
                    </div>
                </div>-->
        <!--Formulario-->        
    </body>
</html>