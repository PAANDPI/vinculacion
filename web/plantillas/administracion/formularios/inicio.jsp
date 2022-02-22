
<style>
    .padre_informacion{
        display: flex;
        flex-wrap: wrap;
        align-content: center;
        justify-content: center;
    }
    .caja_informacion
    {

        width: 200px; 
        height: auto;
        margin-left: 10px;
        margin-right: 10px;
        box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);
        border-bottom: 10px solid #5BAB90;
        display: block;
        justify-content: center; 
        padding: 20px;
        border-radius: 20px;
    }
    .imgInicio{
        width: 100px;
        height: 100px;

    }
    .cantidad{
        font-size: 50px;

    }
</style>
<div class="col-lg-12 pt-5 " id="Contenedor-inicio">
    <h1 class="text-center mt-3">Aplicación administrativa de YUYAPUY</h1>
    <h3 class="text-center mb-5">Información básica de Yuyapuy </h3>
    <div class="padre_informacion mt-5">
        <div class="caja_informacion">
            <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">               
                  <img class="imgInicio " src="recursos/imagenes/001disabled.png" alt=""/>                                                 
            </div>  
            
            <h5 class="font-weight-bold text-center">Discapacidades</h5>
            <div id="caounDiscapacidades" class="cantidad text-center" ></div>
        </div>
        <div class="caja_informacion">
             <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">    
                   <img class="imgInicio" src="recursos/imagenes/002-folder.png" alt=""/>
             </div>
          
            <h5 class="font-weight-bold text-center m">Recursos</h5>
            <div id="caounRecursos" class="cantidad text-center"></div>
        </div>
        <div class="caja_informacion">
            <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">    
                   <img class="imgInicio" src="recursos/imagenes/003-planet-earth.png" alt=""/>
            </div>
            <h5 class="font-weight-bold text-center">Lugares</h5>
            <div id="caounLugares" class="cantidad text-center"></div>
        </div>
        <div class="caja_informacion">
            <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">    
                   <img class="imgInicio" src="recursos/imagenes/004-programmer.png" alt=""/> 
            </div>     
            <h5 class="font-weight-bold text-center">Usuarios</h5>
            <div id="caounPersonas" class="cantidad text-center" ></div>
        </div>
    </div>
</div>