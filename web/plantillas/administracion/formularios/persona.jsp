<div id="formulario-persona" class="col-lg-10"> 
    <div class="row">
        <div class="col-lg-5">
            <div  style="width: 100%; height: 95vh; " class="mt-4  float-left  sombra ">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049;" class="col-lg-12 pl-0 pt-2">
                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >Usuarios</label>    
                    </div> 
                    <div class="row ">
                        <nav class="nav ml-4">
                            <a id="btnGuardarUsuario" class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> </a>  
                            <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> </a>    
                            <a  class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> </a> 
                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores"  style="height: 75vh;max-height: 75vh;overflow-y: auto;">                     
                    <label class="font-weight-bold">Información basica</label>
                        
                    <div class="form-group">
                        <label>Nombre</label>
                        <input  id="txtNombre" class="form-control" type="text">
                    </div>    

                    <div class="form-group">
                        <label>Apellido</label>
                        <input id="txtApellido" class="form-control" type="text">
                    </div> 
                    <div class="form-group">
                        <label >Ciudad</label>
                        <select selected="selected" id="cmbCantones"  class="form-control">
                        
                        </select>
                    </div>
                    <div class="form-group">
                        <label >Género</label>
                        <select  class=" form-control" id="cmbGenero">
                            <option value="Femenino" style="font-size: 16px">Femenino</option>
                            <option value="Masculino" style="font-size: 16px">Masculino</option>
                            <option value="Otro" style="font-size: 16px">Otro</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class=" ">Correo Electrónico</label>
                        <input  class="form-control" type="text" id="txtCorreo" >
                    </div> 
                    <hr>
                    <label class="font-weight-bold">Credenciasles de acceso</label>
                    <div class="form-group">
                        <label class=" ">Nombre de usuario</label>
                        <input id="txtNombreUsuario" class="form-control" type="text"  >
                    </div> 
                    <div class="form-group">
                        <label class=" ">Contraseña</label>
                        <input  class="form-control" type="password" id="txtContrasenia" >
                        <label class=" ">Confirmar contraseña</label>
                        <input  class="form-control" type="password" id="txtConfirmarContrasenia" >
                    </div>                     
                    <hr>  
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                        <label class="form-check-label" for="flexCheckChecked">
                            Administrador
                        </label>
                    </div>
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