$(document).ready(function () {

    $('#descripcion').Editor();

    $('#btn-enviar').click(function (e) {
        e.preventDefault();
        $('#descripcion').text($('#descripcion').Editor('getText'));
        resultado();
    });
    $('#inf').click(function (e) {
        e.preventDefault();

    });
    $('#btn_plantilla_uno').click(function (e) {
        e.preventDefault();
        var plantillaUno = "<h1>TÍTULO PRINCIPAL</h1><hr><div style=\" display: flex;\">" +
                "<div>" +
                "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>" +
                "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>" +
                "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>" +
                "</div>" +
                "<div>" +
                "<div style=\"width: 450px; height: 300px; border: 1px solid black; background: url(https://res.cloudinary.com/durxpegdm/image/upload/v1641799052/450x300_pfdnog.jpg)\">" +
                "</div>" +
                "</div>" +
                "</div>";
        $('#descripcion').Editor('setText', [plantillaUno]);
    });
    $('#btn_plantilla_dos').click(function (e) {
        e.preventDefault();

    });
    $('#btn_plantilla_tres').click(function (e) {
        e.preventDefault();

    });
});
