<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-lg-12" id="formulario-conceptos">
    <div style="max-width: 100%"  class="row pl-4  pt-3 pb-3">
        <div  class="col-lg-5 pl-2 pr-2">
            <div class="row">
                <div class="col-lg-2">

                    <a id="addDiscapacidad" class="nav-link btn color_base btn-sm blanco p-1 bi bi-plus-circle" href="redactar.jsp" data-toggle="modal" data-target="#exampleModal"></a>


                </div>
                <div class="col-lg-10 ">
                    <div class="input-group mb-3 float-right">
                        
                        <input id="buscadorDiscapacidades" type="text" autocomplete="off" class="form-control form-control-sm  float-right" placeholder="Escriba el nombre de la discapacidade o categoria a buscar" >                      
                        <div class="input-group-prepend">
                            <span class="input-group-text bi bi-search" id="basic-addon1"></span>
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="barra-colores" style="height: 80vh; max-height: 80vh; overflow-y: auto; border-left: #002752;     ">
                <table id="tblDiscapacidad" class="table table-fixed  table-sm table-hover table-light" >
                    <thead  style="position: sticky; top: 0px;z-index: 10;">
                        <tr class="color_base blanco" >

                            <th class="rounded-left" >DISCAPACIDAD</th>
                            <th>CATEGORIA</th> 
                            <th class="rounded-right">OPCIONES</th>
                        </tr>
                    </thead>   
                    <tbody id="tbl_Discapacidad" >

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
                        <button id="btnAnterio" onclick="navegacionConceptos(-1)" type="button" disabled class="btn btn-sm btn-success"><span class="bi bi-caret-left-fill"></span> Anterior</button>
                        <button id="btnSiguiente" onclick="navegacionConceptos(1)" type="button" disabled class="btn btn-sm btn-success">Siguiente <span class="bi bi-caret-right-fill"></span></button>
                    </div> 
                    <a  id="btnAnadirConcepto" class="btn btn-sm color_base rounded bi bi-plus-circle-dotted blanco float-right  mb-3 mr-3"> Añadir concepto</a>                  
                </div>              
            </div>
            <div class="row ">
                <div class="col-lg-12">
                    <div id="containerConceptos" class="barra-colores "
                         style="height: 80vh;">                        
                        <div class="card p-5  justify-content-center" style="width:100%; height: 75vh; overflow-y:auto; background:white; border-radius: 10px; ">                                                     
                            <div class="alert  alert-info m-auto" style="width: 50%">    
                                <span class="bi bi-info-circle-fill" style="font-size: 25px"> Precaución</span>
                                <hr style="border: 1px  solid">
                                <h4>Seleccione una discapacidad para poder ver los conceptos</h4>                                   
                                <p>Para poder mostrar los conceptos de las discapacidades primero debe seleccionar una discapacidad
                                    entre a la tabla de discapacidades</p>
                            </div>                                                                                
                        </div>
                    </div>   
                </div>
            </div>                         
        </div>
    </div>
</div>
<datalist id="tickmarks">                         
    <option value="10">
    <option value="20">
    <option value="30">
    <option value="40">
    <option value="50" >
    <option value="60">
    <option value="70">
    <option value="80">
    <option value="90">
    <option value="100">
</datalist>