<div id="formulario-persona" class="col-lg-12"> 
    <div class="row ">
        <div class="col-lg-5 justify-content-center p-3 ">
            <div  style="width: 500px; height: auto; border-radius: 10px 10px 10px 10px" class="m-auto">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049; border-radius: 10px 10px 0px 0px" class="col-lg-12 pl-0 pt-2">
                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >USUARIO</label>    
                    </div> 
                    <div class="row ">
                        <nav class="nav ml-4">
                            <a id="btnGuardarUsuario" class="btn btn-l efecto_guardar  bi bi-save-fill blanco "> Guardar</a>  
                            <a class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco "> Modificar </a>    
                            <!--<a  class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> Eliminar</a>--> 
                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores"  style="height: 100vh;max-height: 65vh;overflow-y: auto; background:#ededed; border: 1px solid #c4c4c4; border-radius: 0px 0px 10px 10px" >                                                               
                    <div class="form-group">
                        <label class="font-weight-bold">Nombre</label>
                        <input  id="txtNombre" class="form-control form-control-sm" type="text">
                    </div>    

                    <div class="form-group">
                        <label class="font-weight-bold">Apellido</label>
                        <input id="txtApellido" class="form-control form-control-sm" type="text">
                    </div> 
                    <div class="form-group">
                        <label class="font-weight-bold" >Ciudad</label>
                        <select selected="selected" id="cmbCantones"  class="form-control form-control-sm">

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">G�nero</label>
                        <select  class=" form-control form-control-sm" id="cmbGenero">
                            <option value="Femenino" style="font-size: 16px">Femenino</option>
                            <option value="Masculino" style="font-size: 16px">Masculino</option>
                            <option value="Otro" style="font-size: 16px">Otro</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Correo Electr�nico</label>
                        <input  class="form-control form-control-sm" type="text" id="txtCorreo" >
                    </div>                  
                    <div class="form-group">
                        <label class="font-weight-bold">Nombre de usuario</label>
                        <input id="txtNombreUsuario" class="form-control form-control-sm" type="text"  >
                    </div> 
                    <div class="form-group">
                        <label class="font-weight-bold" >Contrase�a</label>
                        <input  class="form-control form-control-sm" type="password" id="txtContrasenia" >
                        <label class="font-weight-bold">Confirmar contrase�a</label>
                        <input  class="form-control form-control-sm" type="password" id="txtConfirmarContrasenia" >
                    </div>                     
                    <hr>  
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="administradorCheck" >
                        <label class="form-check-label" for="administradorCheck">
                            Administrador
                        </label>
                    </div>
                </div>

            </div> 
        </div>
        <div class="col-lg-7 ">
            <label class="font-weight-bold mt-3 bi bi-view-list" style="border-bottom: 0px solid #c4c4c4; width: 95%"> LISTA DE USUARIO</label>
            <div class=" barra-colores  mr-5" style="height: 100vh;max-height: 74vh;overflow-y: auto;  ">
                <table class="table">
                    <tbody id="tbl_personas">
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div> 