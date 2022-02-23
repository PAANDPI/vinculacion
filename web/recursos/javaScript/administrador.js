
$(document).ready(function () {

    $('#Contenedor-inicio').show("slow");
    $('#formulario-conceptos').hide();
    $('#Contenedor-de-formularios').hide();
    $('#formulario-persona').hide();
    $('#formulario-ubicaciones').hide();
    $('#formulario-recursos').hide();
    $('#formulario-Mi-información').hide();
   

    $("#btnInicio").click(function () {
        $('#Contenedor-inicio').show(100);
        $('#Contenedor-de-formularios').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
         $('#formulario-recursos').hide();
          $('#formulario-Mi-información').hide();
    });

    $("#btnConceptos").click(function () {
        $('#formulario-conceptos').show(100);
        $('#Contenedor-inicio').hide();
        $('#Contenedor-de-formularios').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
        $('#formulario-Mi-información').hide();
    });

    $("#btnUbicaciones").click(function () {
        $('#formulario-ubicaciones').show(100);
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
         $('#formulario-recursos').hide();
        $('#formulario-Mi-información').hide();
    });


    $("#btnControl-de-usuarios").click(function () {
        $('#formulario-conceptos').hide();
        $('#Contenedor-de-formularios').show();
        $('#Contenedor-inicio').hide();
        $('#formulario-ubicaciones').hide();
        $('#formulario-persona').show(100);
         $('#formulario-recursos').hide();
         $('#formulario-Mi-información').hide();
    });
    $("#btnRecursos").click(function ()
    {
        $('#formulario-recursos').show();
       
        $('#formulario-ubicaciones').hide();
        $('#Contenedor-de-formularios').hide();
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-Mi-información').hide();
    });

    $("#btnCuenta").click(function () {
        $('#formulario-Mi-información').show();
        $('#formulario-ubicaciones').hide();
        $('#Contenedor-de-formularios').hide();
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-recursos').hide();
    });
});