
$(document).ready(function () {
    
    $('#Contenedor-inicio').show(100);
    $('#formulario-conceptos').hide();
    $('#Contenedor-de-formularios').hide();
    $('#formulario-persona').hide();
    $('#formulario-ubicaciones').hide();

    $("#btnInicio").click(function () {
        $('#Contenedor-inicio').show(100);
        $('#Contenedor-de-formularios').hide();
        $('#formulario-conceptos').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
    });

    $("#btnConceptos").click(function () {
        $('#formulario-conceptos').show(100);
        $('#Contenedor-inicio').hide();
        $('#Contenedor-de-formularios').hide();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').hide();
    });
    
    $("#btnUbicaciones").click(function () {
        $('#formulario-ubicaciones').show(100);
        $('#Contenedor-de-formularios').show();
        $('#Contenedor-inicio').hide();
        $('#formulario-persona').hide();
        $('#formulario-conceptos').hide();
    });
    
    
    $("#btnControl-de-usuarios").click(function () {
        $('#Contenedor-de-formularios').show();
        $('#Contenedor-inicio').hide();
        $('#formulario-ubicaciones').hide();
        $('#formulario-persona').show(100);
    });
    
    $("#btnCategoria").click(function () {

    });
    $("#btnCuenta").click(function () {

    });




});