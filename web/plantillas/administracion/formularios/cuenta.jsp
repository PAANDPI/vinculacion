<style>
    .bloqueo:hover
    {   
        cursor: not-allowed;
    }
</style>
<div id="formulario-Mi-información" class="col-lg-12"> 
    <div class="row ">
        <div class="col-lg-12 justify-content-center p-3 ">
            <div  style="width: 500px; height: auto; border-radius: 10px 10px 10px 10px" class="m-auto">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049; border-radius: 10px 10px 0px 0px" class="col-lg-12 pl-0 pt-2">
                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >MI INFORMACIÓN</label>    
                    </div> 
                    <div class="row ">
                        <nav class="nav ml-4">
                                                  
                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores"  style="height: 100vh;height: auto;overflow-y: auto; background:white; border: 1px solid #c4c4c4; border-radius: 0px 0px 10px 10px" >                                                                                   
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold">Nombre</label>
                            <input  id="txtMi_Nombre" disabled class="form-control form-control-sm bloqueo" type="text">
                        </div>    
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold">Apellido</label>
                            <input id="txtMi_Apellido" disabled class="form-control form-control-sm bloqueo" type="text">
                        </div> 
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold">Correo Electrónico</label>
                            <input  class="form-control form-control-sm bloqueo" disabled type="text" id="txtMi_Correo" >
                        </div> 
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold">Nombre de usuario</label>
                            <input id="mitxtNombreUsuario" disabled class="form-control form-control-sm bloqueo" type="text"  >
                        </div> 
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold" >Ciudad</label>
                            <select selected="selected" id="cmbMi_Cantones" disabled class="form-control form-control-sm bloqueo"></select>
                        </div>
                        <div class="form-group col-md-6">
                                 <label class="font-weight-bold">Género</label>
                                    <select  class=" form-control form-control-sm bloqueo" disabled id="cmbMi_Genero">
                                        <option value="Femenino " style="font-size: 16px">Femenino</option>
                                        <option value="Masculino" style="font-size: 16px">Masculino</option>
                                        <option value="Otro" style="font-size: 16px">Otro</option>
                                    </select>
                        </div>
                    </div>
                    
                                <div class="form-row justify-content-center">
                                    <button id="btnEditarContrasenia" type="button" class="btn btn-dark btn-sm font-weight-bold">
                                        <i class="bi bi-caret-down-fill"></i>
                                                                Editar contraseña
                                        <i class="bi bi-caret-down-fill"></i>
                                    </button>
                                </div>
                                  <hr> 
                                <div id="contCambiodeClave" class="form-group">
                                            
                                            <label class="font-weight-bold" >Contraseña antigua</label>
                                            <input  class="form-control form-control-sm" type="password" id="txtMi_Contrasenia_antigua" >
                                            <label class="font-weight-bold" >Contraseña nueva</label>
                                            <input  class="form-control form-control-sm" type="password" id="txtMi_Contrasenia" >
                                            <label class="font-weight-bold">Confirmar contraseña nueva</label>
                                            <input  class="form-control form-control-sm" type="password" id="txtMi_ConfirmarContrasenia" >
                                            <a id="btnMiInformacion" class="btn btn-success btn-sm blanco bi bi-save-fill  "> Guardar contraseña</a>  
                                 </div>                     
                      
                                      
                </div>
            </div> 
        </div>
    </div>
</div> 
