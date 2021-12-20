<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-10" id="formulario-conceptos">
    <div  class="row p-5">

        <div  class="col-lg-12 pl-2 pr-2">
             <div class="row">
                    <div class="col-lg-3">
                        <a class="nav-link btn color_base btn-sm blanco bi bi-folder-plus p-1" href="redactar.jsp" data-toggle="modal" data-target="#exampleModal">
                            Añadir discapacidad</a>
                    </div>
                    <div class="col-lg-9 ">
                        <div class="input-group mb-3 float-right">
                            <input type="text" class="form-control form-control-sm  float-right" placeholder="Nombre de la discapacidad a buscar" aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-sm blanco  my-2 my-sm-0 font-weight-bold color_base float-right bi bi-search" type="button"> Buscar</button>
                            </div>
                        </div>
                    </div>
                </div>
           
            <div class="barra-colores" style="height: 75vh; max-height: 75vh; overflow-y: auto; border-left: #002752; ">
                <table class="table table-fixed">
                    <thead >
                        <tr class="color_base blanco">
                            <th>Titulo</th>
                            <th>Categotia</th> 
                            <th>Concepto</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>   
                    <tbody >
                        <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                <input class="form-check-input"  type="checkbox" id="inlineCheckbox1" value="True">                                
                            </td>
                            <td><div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm bi bi-fullscreen">  Ver</button>
                                    <button type="button" class="btn btn-warning btn-sm bi bi-journal-richtext ">  Redactar</button>
                                    <button type="button" class="btn btn-success btn-sm bi bi-folder-plus"> Añadir recursos</button>
                                </div></td>                                 
                        </tr>

                    </tbody>                       
                </table>
            </div>
        </div>

        <!--    <div class="col-lg-12 pl-2 pr-5 pb-3">
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
            </div>-->

    </div>
</div>