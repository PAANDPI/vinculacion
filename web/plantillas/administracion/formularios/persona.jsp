<div id="formulario-persona" style="width: 100%; height: 600px; " class="mt-4  float-left  sombra ">                    
            <div style="border-top:  10px solid #0B3049; background: #0B3049;" class="col-lg-12 pl-0 pt-2">

                <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>

                <div  class="row ml-4">
                    <label class=" font-weight-bold blanco " style="font-size: 20px" >Usuarios</label>    
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
            <div class="p-4 barra-colores" style="height: 500px;max-height: 500px;overflow-y: auto;">
                <form>
                    <div class="form-group">
                        <label class=" ">Nombre</label>
                        <input  class="form-control" type="text" id="txt-nombre" >
                    </div>    
                    <div class="form-group">
                        <label class=" ">Apellido</label>
                        <input  class="form-control" type="text" id="txt-apellido" >
                    </div>  
                    <div class="form-group">
                        <label class=" ">Fecha de Nacimiento</label>
                        <input  class="form-control" type="date" id="txt-fechaNacimiento" >
                    </div>  
                    <div class="form-group">
                        <label class=" ">Teléfono</label>
                        <input  class="form-control" type="text" id="txt-telefono" >
                    </div>  
                    <div class="form-group">
                        <label class=" ">Género</label>
                        <select  class=" form-control" id="exampleFormControlSelect1">
                            <option style="font-size: 16px">Femenino</option>
                            <option style="font-size: 16px">Masculino</option>
                            <option style="font-size: 16px">Otro</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class=" ">Dirección</label>
                        <textarea  style="height: 100px" class="form-control" type="text" id="txt-direccion"></textarea>                                                                    
                    </div> 
                    <div class="form-group">
                        <label class=" ">Usuario</label>
                        <input  class="form-control" type="text" id="txt-usuario" >
                    </div>  
                    <div class="form-group">
                        <label class=" ">Correo Electrónico</label>
                        <input  class="form-control" type="text" id="txt-correo" >
                    </div> 
                    <div class="form-group">
                        <label class=" ">Contraseña</label>
                        <input  class="form-control" type="password" id="txt-contrasenia" >
                    </div> 
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                        <label class="form-check-label" for="flexCheckChecked">
                            Administrador
                        </label>
                    </div>
                </form>                         
            </div>

        </div> 