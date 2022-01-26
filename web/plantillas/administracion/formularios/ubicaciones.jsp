<div id="formulario-ubicaciones" class="col-lg-12"> 
    <div class="row container">
        <div class="col-lg-5">
            <div  style="width: 100%; height: 80vh; " class="mt-3  float-left  sombra ">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049;" class="col-lg-12 pl-0 pt-2">
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >Lugares</label>    
                    </div> 
                    <div class="row ">
                        <nav class="nav ml-4">
                            <a class="btn btn-l efecto_guardar  bi bi-save-fill blanco " id="btn_guarda_lugar"> </a>  
                            <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> </a>   
                            <a  class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> </a> 

                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores " style="height: 60vh;max-height: 60vh;overflow-y: auto;">
                    <form>                        
                        <div class="form-group">
                            <label class=" ">Seleccionar provincia</label>
                            <select  class=" form-control form-control-sm" id="cmb-provincia" >
                              
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Seleccionar cantón</label>
                            <select  class=" form-control form-control-sm" id="cmb-canton">
                                <option disabled selected hidden>-- Seleccione Cantón --</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class=" ">Nombre del lugar</label>
                            <input  class="form-control form-control-sm" type="text" id="txt-nombreLugar" >
                        </div>    
                        <div class="form-group">
                            <label class=" ">Descripción</label>
                            <textarea  style="height: 100px" class="form-control form-control-sm" type="text" id="txt-descripcionLugar"></textarea>                                                                    
                        </div>                         
                        <div class="form-group">
                            <label class=" ">Coordenada X</label>
                            <input  class="form-control form-control-sm" type="text" id="txt-coordenadaX" >
                        </div>  
                        <div class="form-group">
                            <label class=" ">Coordenada Y</label>
                            <input  class="form-control form-control-sm" type="number" id="txt-coordenadaY" >
                        </div>  
                        <div class="form-group">
                            <label class=" ">Etiqueta</label>
                            <input  class="form-control form-control-sm" type="number" id="txt-etiqueta" >
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