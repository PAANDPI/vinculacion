<link href="recursos/estilos/menuflotante.css" rel="stylesheet" type="text/css"/>
     <link href="recursos/estilos/app.css" rel="stylesheet" type="text/css"/>
<a type="button"  
   style=" position: fixed;right: 20px; bottom: 50px ;width: 50px; height: 50px;transition: all 300ms ease 0ms;font-size: 21px" 
   class="btn btn-info bi bi-gear blanco   rounded-circle " data-toggle="modal" data-target="#exampleModalCenter" ></a>

<div  class="modal fade "  id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div  class="modal-dialog" role="document">
        <div class="modal-content modaConfiguraciones">
            <div class="p-4">
                <h5 class="modal-title" id="exampleModalLongTitle">Ajuste de pagina</h5>
            </div>
            <div  class="modal-body p-3">
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mb-3 font-weight-bold">Ajuste de visión</label>
                    </div>
                    <div class="col-lg-4">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button id="plusBtn" onclick="test(1)" type="button" class="btn  btn-secondary bi bi-dash"></button>
                            <button id="restBtn" type="button" class="btn  btn-secondary bi bi-fullscreen"></button>
                            <button id="minusBtn" onclick="test(0)"  type="button" class="btn  btn-secondary bi bi-plus"></button>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <button type="button" class="btn   btn-secondary bi bi-search"> Lupa</button> 
                    </div>   
                    <div class="col-lg-5">    
                        <!--<input id="ColorTexto" type="color" ><button id="aplicarColor" class="btn btn-sm  btn-secondary" type="button">Restablecer</button>-->
                        <button id="" class="btn float-right  btn-secondary" type="button">Restablecer</button>
                    </div> 

                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mb-3 font-weight-bold">Modos de contraste</label>
                    </div>
                </div>
                <div class="row">

                    <div class="col-lg-4">
                        <div id="modoOscuro" class="manino modoOscuro">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label>    
                        </div>    

                    </div> 
                    <div class="col-lg-4">
                        <div id="modoGris" class="manino" style="  background: gray; width: 100%;  width: 130px; height: 130px; border-radius: 10px;border: 1px solid #CFCFCF">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label> 
                        </div>    


                    </div> 
                    <div class="col-lg-4 ">
                        <div id="modoNormal"class="manino"  style="  background: whitesmoke;  width: 130px; height: 130px; border: 1px solid #CFCFCF; border-radius: 10px">
                            <span class="bi bi bi-circle-fill m-1 float-right"></span>
                            <label class="negro" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label> 
                        </div>    
                    </div>                                                        
                </div>  
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mt-3 font-weight-bold">Efectos de imagenes
                    </div>   
                    <div class="col-lg-12">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button id="ByN" type="button" class="btn btn-primary">Blanco y negro</button>
                            <button id="Sepia" type="button" class="btn btn-secondary">Sepia</button>
                            <button id="BajoBrillo" type="button" class="btn btn-danger">Bajo brillo</button>
                            <button id="AltoContraste" type="button" class="btn btn-success">Alto contraste</button>
                            <button id="Saturar" type="button" class="btn btn-warning">Saturar</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                </div>
            </div>

        </div> 

    </div>
</div>

<script src="recursos/javaScript/app.js" type="text/javascript"></script>
<script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>   