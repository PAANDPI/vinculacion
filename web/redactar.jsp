<%-- 
    Document   : index.jsp
    Created on : 19-nov-2021, 15:50:11
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
%>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>     
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
     
        <script src="recursos/javaScript/editor.js" type="text/javascript"></script>
        <script src="recursos/javaScript/editor2.js" type="text/javascript"></script>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <link href="recursos/estilos/editor.css" rel="stylesheet" type="text/css"/>       
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
    
        <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
      
    </head>
    <style>

        .bnt_sobre:hover
        {
            background: rgba(255,255,255,0.1);            
        }
    </style>
        <%if (username != null) { } else {
        response.sendRedirect("login.jsp");
        }%>       
    <body>
        <div class="row color_base" style="padding-top: 10px">
            <div class="container">
                <div class="col-lg-10">
                    <a id="btnGuardarConcepto" style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-archive-fill bnt_sobre" href="#">  Guardar</a>
                    <a id="btnLimpiarFormulario" style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-eraser-fill bnt_sobre" href="#">  Limpiar</a>
                    <div class="btn-group">
                        <button type="button" class="btn color_base blanco dropdown-toggle bi bi-border-all" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Plantillas  <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a id="btn_plantilla_simple" href="#">Plantilla simple</a></li>
                            <li><a id="btn_plantilla_normal" href="#">Plantilla normal</a></li>
                            <li><a id="btn_plantilla_portada" href="#">Plantilla con portada</a></li>
                        </ul>
                    </div>                   
                    <a style="padding: 10px; font-size: 15px" class="btn btn-sm blanco bi bi-arrow-left bnt_sobre" href="administrador.jsp" onclick="eliminarS()">  Atrás</a>
                </div>
                <div class="col-lg-2">
                    <input onclick="resultado()" type="button" style="margin-bottom: 10px;float: right" class="btn btn-success pb-5" id="btn-enviar" value="Mostrar Resultado">  
                </div>
            </div>          
        </div>

        <div class="row " style="padding-left: 110px; padding-right: 100px; padding-top: 25px;padding-bottom: 10px" >
            <div style="background: #DEDEDE; width: 100%;height: 50px; padding: 10px; border-radius: 5px;font-size: 20px;color: #212529 ">
                <span class="bi bi-bookmarks"></span>  Editor de texto             
            </div>

        </div> 

        <div class="row"  style="padding-left: 100px; padding-right: 100px; padding-bottom: 25px">
             <div class=" col-lg-6">
                <label for="inputState">Nombre de la discapacidad</label>
                <div class="input-group">    

                    <select id="cmb-discapacidad" class="form-control" >
                        
                    </select>

                    <span class="input-group-btn">
                        <button class="btn btn-default bi bi-plus-circle-fill" style="color: #999999"
                                type="button" data-toggle="modal" data-target="#exampleModal"></button>
                    </span>
                </div>
            </div>  
            <div class=" col-lg-6">
                 <label>Título para la información</label>
                 <input  id="txttitulo" class="form-control"  placeholder="Agregue un título para la publicación">
            </div>
           
            
        </div> 
        <label for="inputState" style="padding-left: 100px;">Etiquetas</label> 
        <div class="row" style="padding-left: 100px; padding-right: 100px; padding-bottom: 15px">
            <div class=" col-lg-6">
                <div class="alert alert-warning" role="alert">
                    <span class="bi bi-exclamation-triangle-fill">  <strong>  Advertencia:</strong></span>
                    Sepere cada palabra con un (;) para validarlas como etiquetas.
                </div>
            </div>
            <div class=" col-lg-6">
                <div class="alert alert-success" role="alert">
                    <span class="bi bi-check-all"> <strong>  Ejemplo:</strong> </span>
                    Palabra uno; Palabra dos; Palabra tres; Palabra cuatro;
                </div>
            </div>
            <div class=" col-lg-12">
                <textarea id="etiquetas" class="form-control" ></textarea>
            </div>      
            
        </div> 
        <label for="inputState" style="padding-left: 100px;">Contenido</label> 
        <div class="row">    

            <div class="col-lg-12" style="padding-left: 100px; padding-right: 100px; padding-bottom: 25px">                                            
                <textarea id="descripcion" style="border: 1px solid #999" name="txt-content"></textarea>
            </div>
            <h3  class="font-weight-bold text-center">Resultado</h3>

            <div  class="col-lg-12" style="padding-top:15px; padding-left: 100px; padding-right: 100px ">
                <div  style="border:2px solid #999;border-radius: 10px; min-height: 100px; height: auto">
                    <div id="resu" class="" style="height:auto; padding: 30px">
                    </div>    
                </div> 
            </div>
        </div>

        <!--Modal agregar discapacidad-->
        <%@include file="plantillas/administracion/formularios/discapacidades.jsp" %>
    </body>
       <script src="recursos/javaScript/JS-AJAX/conceptosJS.js" type="text/javascript"></script>
   </html>