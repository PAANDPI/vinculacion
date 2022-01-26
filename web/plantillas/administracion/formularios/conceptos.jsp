<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-12" id="formulario-conceptos">
    <div  class="row pl-5 pr-5 pt-3 pb-3">
        <div  class="col-lg-5 pl-2 pr-2">
            <div class="row">
                <div class="col-lg-5">
                    <a class="nav-link btn color_base btn-sm blanco p-1" href="redactar.jsp" data-toggle="modal" data-target="#exampleModal">
                        <span class="bi bi-folder-plus mr-2"></span>  Añadir discapacidad</a>
                </div>
                <div class="col-lg-7 ">
                    <div class="input-group mb-3 float-right">
                        <input type="text" class="form-control form-control-sm  float-right" placeholder="Nombre de la discapacidad a buscar" aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-sm blanco  my-2 my-sm-0  color_base float-right bi bi-search" type="button"> Buscar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="barra-colores" style="height: 80vh; max-height: 80vh; overflow-y: auto; border-left: #002752;   ">
                <table class="table table-fixed table-sm" >
                    <thead style="position: sticky; top: 0px;z-index: 10;">
                        <tr  class="color_base blanco" >
                            <th class="rounded-left" >#</th>
                            <th >DISCAPACIDAD</th>
                            <th>CATEGORIA</th> 
                            <th class="rounded-right">OPCIONES</th>
                        </tr>
                    </thead>   
                    <tbody id="tbl_Discapacidad">

                    </tbody>                       
                </table>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="row">
                <div class="col-lg-4">
                    <div class="font-weight-bold">Cantidad de conceptos: <span id="cont">#</span></div>  
                    <div class="font-weight-bold">Concepto: <span id="pag">#</span></div>  
                </div>
                <div class="col-lg-8">
                    <div class="btn-group float-right " role="group" aria-label="Basic example">
                        <button onclick="navegacionConceptos(-1)" type="button" class="btn btn-sm btn-success"><span class="bi bi-caret-left-fill"></span> Anterior</button>
                        <button onclick="navegacionConceptos(1)" type="button" class="btn btn-sm btn-success">Siguiente <span class="bi bi-caret-right-fill"></span></button>
                    </div> 
                    <a id="btnAnadirConcepto" class="btn btn-sm color_base rounded bi bi-plus-circle-dotted blanco float-right  mb-3 mr-3"> Añadir concepto</a> 
                    <!--<a href="redactar.jsp" class="btn btn-sm color_base rounded bi bi-plus-circle-dotted blanco float-right  mb-3 mr-3"> Añadir concepto</a>--> 
                </div>              
            </div>
            <div class="row ">
                <div class="col-lg-12">
                    <div id="containerConceptos" class="barra-colores "
                         style="height: 80vh;">                        
                        <div class="card p-5  justify-content-center" style="width:100%; height: 80vh; overflow-y:auto; background:#E2E2E5 ">                                                     
                            <div class="alert  alert-info m-auto" style="width: 50%">    
                                <span class="bi bi-info-circle-fill" style="font-size: 25px"> Precaución</span>
                                <hr style="border: 1px  solid">
                                <h4>Selecciones una discapacidad para poder ver los conceptos</h4>                                   
                                <p>Para poder mostrar los conceptos de las discapacidades primero debe seleccionar una discapacidad
                                   entra la tabla de discapacidades</p>
                            </div>                                                                                
                        </div>
                    </div>   
                </div>
            </div>                         
        </div>
    </div>
</div>