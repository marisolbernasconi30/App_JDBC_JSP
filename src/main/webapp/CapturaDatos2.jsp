<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <!-- PARA QUE RECONOZCA LOS CARACTERES LATINOS-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<h1>Captura de datos</h1>

<!-- NOMBRES DE LAS VARIABLES:  -->
    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
        String pais = request.getParameter("pais");
        String tecno = request.getParameter("tecno");

        java.sql.Connection conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "root", "");
        java.sql.Statement sentencia = conexion.createStatement();

        Class.forName("com.mysql.cj.jdbc.Driver");
        String instruccionSql = "INSERT INTO datos_usuarios (Nombre, Apellido, Usuario, Password, Pais, Tecnologia) VALUES ('" + nombre + "', '" + apellido + "', '" + usuario + "', '" + contra + "', '" + pais + "', '" + tecno + "')";
        sentencia.executeUpdate(instruccionSql);
        out.println("Registro exitoso");
        sentencia.close();
    %>

    
</body>
</html>

<!--
*  pwd
*
* cd /home/marisol/eclipse-workspace/PROYECTO/AppJDBC_JSP/Conexion
*
* ls lib/mysql-connector-java-9.4.0.jar
*
* ls ~/eclipse-workspace/PROYECTO/JDBC/JavaDataBaseConnectivity/lib/mysql-connector-java-9.4.0.jar
*
javac -d bin -cp "lib/mysql-connector-java-9.4.0.jar" src/ejercicioPracticoFinal/AppTrabajoFinal1.java
java -cp "bin:lib/mysql-connector-java-9.4.0.jar" ejercicioPracticoFinal.AppTrabajoFinal1
-->






<!-- EN LA TERMINAL DEL VISUAL TENGO QUE PONER:
 pwd
 cd /home/marisol/eclipse-workspace/PROYECTO/AppJDBC_JSP/Conexion/app
mvn clean package
ls target/
sudo cp target/app.war /opt/tomcat11/webapps/
-->
<!-- ABRO LA TERMINAL DE UBUNTU Y REINICIO TOMCAT:
sudo systemctl restart tomcat
-->
<!-- DESPUES EN EL NAVEGADOR PONGO:
http://localhost:8080/AppJDBC_JSP/CapturaDatos2.jsp
→
