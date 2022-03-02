<div class="row justify-content-center  pl-5 pl-xl-2 pr-xl-2  pr-5 pt-1 mt-3">                   
    <div class="col-lg-8 p-0 m-0">
        <div class="row ">
            <div class="col-lg-12">
                <div class="input-group mb-3">
                    <input id="txtDiscapacidad" type="text" class="form-control " style="border: 1px solid #28A83F  " placeholder="Escriba el nombre de la discapacidad o recurso" >
                    <div class="input-group-append">
                        <button onclick="tbl_recursos_parametros()" class="btn btn-success  bi bi-search" type="button"> Buscar</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 mb-3 justify-content-center row align-content-center">
                <fieldset>                    
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" name="tipo" type="radio" id="checNombreDiscapacidad" checked="true" value="option1">
                        <label class="form-check-label" for="inlineCheckbox1">Nombre discapacidad</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input name="tipo" class="form-check-input" type="radio" id="checkBNombreRecursos" value="option2">
                        <label class="form-check-label" for="inlineCheckbox2">Nombre del recurso</label>
                    </div> 
                </fieldset>
                
            </div>
         
            <div class="col-lg-6">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <button onclick="aplicar_filtro()" class="btn btn-success input-group-text  rounded-right" type="button"  
                                style="background: #28A83F; color: white;border: 1px solid #28A83F  ">
                            Aplicar   <i class="bi ml-2 bi-funnel-fill"></i>
                        </button>
                    </div>
                    <select class="form-control" id="cmb-categoria" style="border: 1px solid #28A83F  ">
                    </select>

                </div>

            </div>
            <div class="col-lg-6">
                <button onclick="tbl_recursos()" class="btn btn-warning font-weight-bold float-right " type="button"  >
                    <i class="bi bi-view-list  mr-2"></i>  Cargar todos los recursos  
                </button>
            </div>

        </div>                    
    </div>                
</div>
