
$(document).ready(function () {
    $('#Contenedor-de-formularios').hide();
    $('#formulario-persona').hide();
    $('#formulario-ubicaciones').hide();


    $("#btnInicio").click(function () {
        $('#Contenedor-de-formularios').hide();
        $('#Contenedor-inicio').show(100);

    });

    $("#btnConceptos").click(function () {

    });
    $("#btnUbicaciones").click(function () {
        $('#Contenedor-inicio').hide();
        $('#Contenedor-de-formularios').show();
        $('#formulario-persona').hide();
        $('#formulario-ubicaciones').show(100);
    });
    $("#btnControl-de-usuarios").click(function () {
        $('#Contenedor-inicio').hide();
        $('#Contenedor-de-formularios').show();
        $('#formulario-ubicaciones').hide();
        $('#formulario-persona').show(100);
    });
    $("#btnCategoria").click(function () {

    });
    $("#btnCuenta").click(function () {

    });




});