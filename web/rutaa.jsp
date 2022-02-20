<%-- 
    Document   : rutaa
    Created on : 19/02/2022, 20:55:55
    Author     : Arialdo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        la ruta es <br/>
        <h1><%
            application.getRealPath(request.getRequestURI());
            %>
        </h1>
        <h2><%
            application.getRealPath("");
            %>
        </h2>
        <h3><%
            request.getRequestURI();
            %>
        </h3>

        <h4><%
            request.getContextPath();
            %>
        </h4>
        <h4><%
            request.getServletPath();
            %>
        </h4>

    </body>
</html>
