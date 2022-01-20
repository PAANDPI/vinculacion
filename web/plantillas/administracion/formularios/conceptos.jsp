<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-10" id="formulario-conceptos">
    <div  class="row pl-5 pr-5 pt-3 pb-3">
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
                            <th class="rounded-left" >Nombre de la discapacidad</th>
                            <th>Categoria</th> 
                            <th class="rounded-right">Opciones</th>
                        </tr>
                    </thead>   
                    <tbody id="tbl_Discapacidad">

                    </tbody>                       
                </table>
            </div>


        </div>
    </div>
    <div class="row pl-5 pr.5">
        <div class="col-lg-9">

        </div>
        <div class="col-lg-3 pr-5">
            <a href="redactar.jsp" class="btn btn-sm color_base rounded bi bi-plus-circle-dotted blanco float-right mr-3">Añadir concepto</a>
        </div>
    </div>
    <div class="row pl-5 pr-5">
        <div class="col-lg-12">
            <div class="barra-colores" style="height: 35vh; max-height: 35vh; overflow-y: auto; border-left: #002752; ">
                <table class="table table-fixed table-sm">
                    <thead style="position: sticky; top: 0px;z-index: 10;">
                        <tr class="color_base blanco">
                            <th><b>#</b></th>
                            <th>Concepto</th>
                        </tr>
                    </thead>   
                    <tbody >
                        <tr>
                            <th>1</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                        <tr>
                            <th>2</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                        <tr>
                            <th>4</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                        <tr>
                            <th>5</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                        <tr>
                            <th>6</th>
                            <td>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </td>                                                       
                        </tr>
                    </tbody>                       
                </table>
            </div>
        </div>        
    </div>
</div>