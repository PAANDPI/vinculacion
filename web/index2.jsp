<%-- 
    Document   : index2
    Created on : 24/02/2022, 17:56:27
    Author     : Arialdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

    </head>
    <body>
        <h1>Hello World!</h1>
        <form id="frm" action="RecursoSrv" method="POST" enctype="multipart/form-data">
            <input type="text" name="expresion"/>
            <input type="file" name="archivo" value="..." />
            <input type="submit" value="subir"/>
        </form>

        <script>
            $('#frm').submit(function (e) {
                e.preventDefault();
                var frmData = new FormData(document.getElementById('frm'));
                frmData.append('host', window.location.protocol + '//' + window.location.host);
                frmData.append('accion', 1);
                $.ajax({
                    url: "RecursoSrv",
                    type: "POST",
                    data: frmData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        alert("ok");
                        console.log(data);
                    }
                }); //end ajax
            });
        </script>
    </body>
</html>
