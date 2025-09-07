<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <!-- PARA QUE RECONOZCA LOS CARACTERES LATINOS-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>


<!-- NOMBRES DE LAS VARIABLES:  -->
    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
        String pais = request.getParameter("pais");
        String tecno = request.getParameter("tecno");
    %>

    
</body>
</html>