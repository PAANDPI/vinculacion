<div id="formulario-recursos" class="col-lg-12"> 
    <div class="row">
        <div class="col-lg-5 justify-content-center p-3">

            <div  style="width: 500px; height: auto; border-radius: 10px 10px 10px 10px " class="m-auto">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049; border-radius: 10px 10px 0px 0px" class="col-lg-12 pl-0 pt-2">
                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >RECURSOS</label>    
                    </div> 
                    <div class="row">
                        <nav class="nav ml-4">
                            <button type="button" onclick="Main()" class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> Guardar</button>  
                            <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> Modificar</a>                           
                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores " style="height: 100vh;max-height: 65vh;overflow-y: auto; background:#ededed; border: 1px solid #c4c4c4; border-radius: 0px 0px 10px 10px">

                    <div class="form-group">
                        <label class="font-weight-bold">Seleccionar categoría</label>
                        <select  class=" form-control form-control-sm" id="cmb-categoria">
                            <option style="font-size: 16px">Física</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Seleccionar discapacidad</label>
                        <select  class=" form-control form-control-sm" id="cmb-discapacidad">

                        </select>
                    </div>
                    <!--<div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="inlineCheckbox1" value="option1">
                        <label class="form-check-label" for="inlineCheckbox1">Archivo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="inlineCheckbox2" value="option2">
                        <label class="form-check-label" for="inlineCheckbox2">Enlace</label>
                    </div>-->
                    <div class="mb-3">     
                        <label class="font-weight-bold">Seleccionar tipo de recurso</label>
                        <input class="form-control form-control-sm" type="file" id="formFile">
                    </div>
                    <div class="mb-3">
                        <label class="font-weight-bold">Nombre del recurso: </label>
                        <input type="text" class="form-control form-control-sm" id="txtRecurso">
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Descripción</label>
                        <textarea  style="height: 100px" class="form-control form-control-sm" type="text" id="txt-descripcionRecurso"></textarea>                                                                    
                    </div>  
                    <div class="form-group">
                        <label class="font-weight-bold">Etiqueta</label>
                        <input  class="form-control form-control-sm" type="text" id="txt-etiquetaa" >
                    </div> 

                </div>

            </div> 

        </div>
  
        <div class="col-lg-7">
            <label class="font-weight-bold mt-3 bi bi-view-list" style="border-bottom: 1px solid #c4c4c4; width: 95%"> LISTA DE RECURSOS</label>
            <div class=" barra-colores  mr-5" style="height: 100vh;max-height: 74vh;overflow-y: auto;  ">
                <table class="table">
                    <thead>
                        <tr>
                        </tr>
                    </thead>
                    <tbody id="tbl_recursos">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div> 