<link href="recursos/estilos/menuflotante.css" rel="stylesheet" type="text/css"/>
<link href="recursos/estilos/app.css" rel="stylesheet" type="text/css"/>
<a type="button"  
   style=" position: fixed;right: 20px; bottom: 50px ;width: 50px; height: 50px;transition: all 300ms ease 0ms;font-size: 21px" 
   class="btn btn-info bi bi-gear blanco   rounded-circle " data-toggle="modal" data-target="#exampleModalCenter" ></a>

<div  class="modal fade "  id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div  class="modal-dialog" role="document">
        <div class="modal-content modaConfiguraciones">
            <div class="p-4">
                <h5 class="modal-title letra_color" id="exampleModalLongTitle">Ajuste de pagina</h5>
            </div>
            <div  class="modal-body p-3">
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mb-3 letra_color font-weight-bold">Ajuste de visión</label>
                    </div>
                    <div class="col-lg-4">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button id="plusBtn" onclick="test(1)" type="button" class="btn btn-sm btn-secondary bi bi-dash"></button>
                            <button id="restBtn" type="button" class="btn btn-sm btn-secondary bi bi-fullscreen"></button>
                            <button id="minusBtn" onclick="test(0)"  type="button" class="btn btn-sm btn-secondary bi bi-plus"></button>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <input id="ColorTexto" style="width: 100px; height: 31px" type="color" > 
                    </div>   
                    <div class="col-lg-5">    

                        <button id="aplicarColor" class="btn btn-sm btn-secondary bi bi-check-square" type="button"> Aplicar color de letra
                        </button>                       
                    </div> 
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mb-3 letra_color font-weight-bold">Modos de contraste</label>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="col-lg-3">
                        <div id="idNormal" class="manino " style="background: #007bff;width: 100%; height: 60px; border-radius: 10px;border: 1px solid #CFCFCF">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Normal</label>    
                        </div>    
                    </div>
                    
                    <div class="col-lg-3">
                        <div id="modoOscuro" class="manino modoOscuro">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label>    
                        </div>    

                    </div> 
                    <div class="col-lg-3">
                        <div id="modoGris" class="manino" style="  background: gray; width: 100%; height: 60px; border-radius: 10px;border: 1px solid #CFCFCF">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label> 
                        </div>    


                    </div> 
                    <div class="col-lg-3 ">
                        <div id="modoBlanco"class="manino"  style="  background: whitesmoke;  height: 60px; border: 1px solid #CFCFCF; border-radius: 10px">
                            <span class="bi bi bi-circle-fill m-1 float-right"></span>
                            <label class="negro" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label> 
                        </div>    
                    </div>                                                        
                </div>  
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mt-3 letra_color font-weight-bold">Efectos de imagenes
                    </div>   
                    <div class="col-lg-12">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button id="ByN" type="button" class="btn btn-sm btn-primary">Blanco y negro</button>
                            <button id="Sepia" type="button" class="btn btn-sm  btn-secondary">Sepia</button>
                            <button id="BajoBrillo" type="button" class="btn btn-sm  btn-danger">Bajo brillo</button>
                            <button id="AltoContraste" type="button" class="btn btn-sm  btn-success">Contraste</button>
                            <button id="Saturar" type="button" class="btn btn-sm  btn-warning">Saturar</button>
                            <button id="Normal" type="button" class="btn btn-sm  btn-dark">Restaurar</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button id="" class="btn float-right  btn-secondary" type="button">Restablecer</button>
                </div>
            </div>

        </div> 

    </div>
</div>

<script src="recursos/javaScript/app.js" type="text/javascript"></script>
<script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>   