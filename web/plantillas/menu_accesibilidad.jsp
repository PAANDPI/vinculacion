<link href="recursos/estilos/menuflotante.css" rel="stylesheet" type="text/css"/>
<link href="recursos/estilos/app.css" rel="stylesheet" type="text/css"/>
<a type="button"  
   style=" position: fixed;right: 20px; bottom: 50px ;width: 50px; height: 50px;transition: all 300ms ease 0ms;font-size: 21px; z-index: 10" 
   class="btn btn-info bi bi-gear blanco   rounded-circle " data-toggle="modal" data-target="#exampleModalCenter" ></a>

<div  class="modal fade "  id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div  class="modal-dialog" role="document">
        <div class="modal-content modaConfiguraciones">        
            <div  class="modal-body p-3">
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mb-3 letra_color font-weight-bold">Ajuste de visión</label>
                    </div>
                    <div class="col-lg-4">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button id="plusBtn" onclick="test(1)" style="box-shadow: 0px 5px 0px 0px #5A6268;" type="button" class="btn btn-sm btn-secondary bi bi-dash"></button>
                            <button id="restBtn" type="button" style="box-shadow: 0px 5px 0px 0px #5A6268;" class="btn btn-sm btn-secondary bi bi-fullscreen"></button>
                            <button id="minusBtn" onclick="test(0)" style="box-shadow: 0px 5px 0px 0px #5A6268;"  type="button" class="btn btn-sm btn-secondary bi bi-plus"></button>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <input id="ColorTexto" style="width: 100px; height: 31px" type="color" > 
                    </div>   
                    <div class="col-lg-5">    
                        <button id="aplicarColor" style="box-shadow: 0px 5px 0px 0px #5A6268;" class="btn btn-sm btn-secondary bi bi-check-square" type="button"> Aplicar color de letra
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
                        <div id="idNormal" class="manino " style="box-shadow: 0px 5px 0px 0px #0069D9;background: #007bff;width: 100%; height: 60px; border-radius: 10px;">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label>    
                        </div>    
                    </div>

                    <div class="col-lg-3">
                        <div id="modoOscuro" style="box-shadow: 0px 5px 0px 0px #404040;" class="manino modoOscuro">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label>    
                        </div>    

                    </div> 
                    <div class="col-lg-3">
                        <div id="modoGris" class="manino btn" style="box-shadow: 0px 5px 0px 0px #5A6268;  background: gray; width: 100%; height: 60px; border-radius: 10px;">
                            <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                            <label class="blanco" style="font-size: 20px;position:absolute; bottom: 0px; left:25px">Texto</label> 
                        </div>    


                    </div> 
                    <div class="col-lg-3 ">
                        <div id="modoBlanco" class="manino" style="box-shadow: 0px 5px 0px 0px #D6D6D6;  background: whitesmoke;  height: 60px; border: 1px solid #CFCFCF; border-radius: 10px">
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
                            <button style="box-shadow: 0px 5px 0px 0px #0069D9;" id="ByN" type="button" class="btn btn-sm m-1 btn-primary rounded">Blanco y negro</button>
                            <button style="box-shadow: 0px 5px 0px 0px #5A6268;" id="Sepia" type="button" class="btn btn-sm m-1 btn-secondary rounded">Sepia</button>
                            <button style="box-shadow: 0px 5px 0px 0px #218838;" id="BajoBrillo" type="button" class="btn btn-sm m-1 btn-success rounded">Bajo brillo</button>
                            <button style="box-shadow: 0px 5px 0px 0px #C82333;" id="AltoContraste" type="button" class="btn btn-sm m-1 btn-danger rounded">Contraste</button>
                            <button style="box-shadow: 0px 5px 0px 0px #E0A800;" id="Saturar" type="button" class="btn btn-sm m-1 btn-warning rounded">Saturar</button>
                            <button style="box-shadow: 0px 5px 0px 0px #23272B;" id="Normal" type="button" class="btn btn-sm m-1 btn-dark rounded">Restaurar</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <label class="m-1 mt-3 letra_color font-weight-bold">Extenciones para mejorar la accesibilidad
                    </div>  
                    <div class="col-lg-4">
                        <a style="background: #E74C3C;
                           box-shadow: 0px 5px 0px 0px #C0392B;" class="btn btn-sm blanco font-weight-bold btn-block" href="https://chrome.google.com/webstore/detail/opendyslexic-for-chrome/cdnapgfjopgaggbmfgbiinmmbdcglnam/related?hl=es">
                            Dislexia
                        </a> 
                    </div>
                    <div class="col-lg-4">
                        <a style="  background: #2ECC71;
                           box-shadow: 0px 5px 0px 0px #27AE60;" class="btn btn-sm blanco font-weight-bold btn-block" href="https://chrome.google.com/webstore/detail/read-aloud-a-text-to-spee/hdhinadidafjejdhmfkjgnolgimiaplp/related?hl=es">
                            Texto a voz
                        </a> 
                    </div>
                    <div class="col-lg-4">
                        <a style="background: #3498DB;
                                    box-shadow: 0px 5px 0px 0px #2980B9;" class="btn btn-sm sombra blanco font-weight-bold btn-block" href="https://chrome.google.com/webstore/detail/selection-reader-text-to/fdffijlhedcdiblbingmagmdnokokgbi/related?hl=es">
                            Texto a voz
                        </a> 
                    </div>
                </div>
                <br>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cerrar</button>                   
                </div>
            </div>

        </div> 

    </div>
</div>

<script src="recursos/javaScript/app.js" type="text/javascript"></script>
<script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>   