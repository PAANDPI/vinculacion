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
           
            <div class="barra-colores" style="height: 45vh; max-height: 45vh; overflow-y: auto; border-left: #002752;   ">
                <table class="table table-fixed table-sm" >
                    <thead style="position: sticky; top: 0px;z-index: 10;">
                        <tr  class="color_base blanco" >
                            <th class="rounded-left" >Titulo</th>
                            <th>Categotia</th> 
                            <th>Concepto</th>
                            <th class="rounded-right">Opciones</th>
                        </tr>
                    </thead>   
                    <tbody >
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" style="z-index: 9" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                        <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                         <tr>
                            <td>Sindrome de down</td>
                            <td>Intelectual</td>
                            <td>
                                Si                               
                            </td>
                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                </div>
                            </td>                                 
                        </tr>
                        
                    </tbody>                       
                </table>
            </div>
            
            
        </div>
    </div>
    <div class="row p-1">
        <div class="col-lg-10">
            
        </div>
        <div class="col-lg-2">
            <a class="btn btn-sm color_base rounded bi bi-plus-circle-dotted blanco float-right mr-3">Añadir concepto</a>
        </div>
    </div>
    <div class="row p-1">
         <div class="barra-colores" style="height: 45vh; max-height: 45vh; overflow-y: auto; border-left: #002752; ">
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
</div>