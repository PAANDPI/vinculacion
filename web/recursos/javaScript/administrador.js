
$(document).ready(function () {

    $('#Contenedor-inicio').show(100);
    $('#formulario-conceptos').hide();
    $('#Contenedor-de-formularios').hide();
    $('#formulario-persona').hide();
    $('#formulario-ubicaciones').hide();
     $('#formulario-recursos').hide();
     $('#contenedor-sugerencias').hide();

    $("#btnInicio").click(function () {
        $('#Contenedor-inicio').show(100);
        $('#Contenedor-de-formularios').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
         $('#formulario-recursos').hide();
         $('#contenedor-sugerencias').hide();
    });

    $("#btnConceptos").click(function () {
        $('#formulario-conceptos').show(100);
        $('#Contenedor-inicio').hide();
        $('#Contenedor-de-formularios').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
        $('#contenedor-sugerencias').hide();
    });

    $("#btnUbicaciones").click(function () {
        $('#formulario-ubicaciones').show(100);
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
         $('#formulario-recursos').hide();
         $('#contenedor-sugerencias').hide();
    });


    $("#btnControl-de-usuarios").click(function () {
        $('#formulario-conceptos').hide();
        $('#Contenedor-de-formularios').show();
        $('#Contenedor-inicio').hide();
        $('#formulario-ubicaciones').hide();
        $('#formulario-persona').show(100);
         $('#formulario-recursos').hide();
         $('#contenedor-sugerencias').hide();
    });

    $("#btnCategoria").click(function () {

    });
    $("#btnCuenta").click(function () {

    });
    $("#btnRecursos").click(function ()
    {
        $('#formulario-recursos').show();
        $('#contenedor-sugerencias').hide();
        $('#formulario-ubicaciones').hide();
        $('#Contenedor-de-formularios').hide();
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
    });

    $("#btnSugerencias").click(function () {
        $('#contenedor-sugerencias').show();
        $('#formulario-ubicaciones').hide();
        $('#Contenedor-de-formularios').hide();
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-recursos').hide();
    });
});