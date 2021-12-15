<div id="formulario-ubicaciones" class="col-lg-10"> 
    <div class="row">
        <div class="col-lg-5">
            <div  style="width: 100%; height: 700px; " class="mt-4  float-left  sombra ">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049;" class="col-lg-12 pl-0 pt-2">

                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>

                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >Lugares</label>    
                    </div> 

                    <div class="row ">
                        <nav class="nav ml-4">
                            <a class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> </a>  
                            <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> </a>  
                            <!--<a class="btn btn-l  bi bi-trash-fill blanco efecto_eliminar "> Eliminar</a>-->    
                            <a  class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> </a> 

                        </nav>

                    </div> 

                </div>  
                <div class="p-4 barra-colores" style="height: 600px;max-height: 600px;overflow-y: auto;">
                    <form>                        
                        <div class="form-group">
                            <label class=" ">Seleccionar provincia</label>
                            <select  class=" form-control" id="cmb-provincia">
                                <option style="font-size: 16px">Física</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Seleccionar cantón</label>
                            <select  class=" form-control" id="cmb-canton">
                                <option style="font-size: 16px">Física</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Nombre del lugar</label>
                            <input  class="form-control" type="text" id="txt-nombreLugar" >
                        </div>    
                        <div class="form-group">
                            <label class=" ">Descripción</label>
                            <textarea  style="height: 100px" class="form-control" type="text" id="txt-descripcionLugar"></textarea>                                                                    
                        </div>                         
                        <div class="form-group">
                            <label class=" ">Coordenada X</label>
                            <input  class="form-control" type="text" id="txt-coordenadaX" >
                        </div>  
                        <div class="form-group">
                            <label class=" ">Coordenada Y</label>
                            <input  class="form-control" type="number" id="txt-coordenadaY" >
                        </div>  
                        <div class="form-group">
                            <label class=" ">Etiqueta</label>
                            <input  class="form-control" type="number" id="txt-etiqueta" >
                        </div> 
                    </form>                         
                </div>

            </div> 
        </div> 
        <div class="col-lg-7">
             <table class="table mt-4">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>
        </div>
    </div> 
</div> 