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
                            <a id="btnGuardaRecurso" type="button" onclick="Main()" class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> Guardar</a>                       
                            <a id="btn_modificarRecurso" class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco ">  Modificar </a>    
                            <a  id="btn_cancelarRecurso" class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> cancelar </a>
                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores " style="height: 100vh;max-height: 75vh;overflow-y: auto; background:white; border: 1px solid #c4c4c4; border-radius: 0px 0px 10px 10px">

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

                    <div class="">     
                        <label class="font-weight-bold">Seleccionar tipo de recurso</label>                        
                    </div>

                    <fieldset>                    
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" name="tipo" type="radio" id="checkArchivo" checked="true" value="option1">
                            <label class="form-check-label" for="inlineCheckbox1">Subir un archivo</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input name="tipo" class="form-check-input" type="radio" id="checkEnlace" value="option2">
                            <label class="form-check-label" for="inlineCheckbox2">Guardar un enlace</label>
                        </div> 
                    </fieldset>

                    <div id="enlaceC" class="mb-3 mt-3">
                        <label class="font-weight-bold">Enlace del recurso: </label>
                        <input type="text" class="form-control form-control-sm" id="txtEnlace">
                    </div>
                    <div id="fileC" class="mb-3 mt-3"> 
                        <label class="font-weight-bold">Seleccione el archivo: </label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input " id="formFile" >
                            <label class="custom-file-label" for="formFile"></label>
                        </div>

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
            <div class="mr-5 mt-3 mb-2 p-3" style=" background: white; display: flex; flex-wrap: wrap ; 
                 -webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                 box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20);border-radius: 10px;">

                <label style="flex-basis: 40%" class="font-weight-bold bi bi-view-list">  LISTA DE RECURSOS  </label>


                <input  style="flex-basis: 60%" id="buscadorRecursos" placeholder="Buscador de recursos"  type="text" class=" form-control form-control-sm" >

            </div>


            <div class=" barra-colores  mr-5" style="height: 100vh;
                 max-height: 78vh;
                 overflow-y: auto;
                 background: white; 
                 -webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                 box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20);
                 border-radius: 10px;">
                <table id="tblRecursos" class="table">
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