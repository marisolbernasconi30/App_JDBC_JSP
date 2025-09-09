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



<%@ page import="java.sql.*" %>
<!-- NOMBRES DE LAS VARIABLES:  -->
    <%
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
        String pais = request.getParameter("pais");
        String tecno = request.getParameter("tecno");



        Class.forName("com.mysql.cj.jdbc.Driver");

        try {

        
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "jspuser", "1234");
        Statement sentencia = conexion.createStatement();

        
        String instruccionSql = "INSERT INTO datos (nombre, apellido, usuario, contra, pais, tecnologia) VALUES ('" + nombre + "', '" + apellido + "', '" + usuario + "', '" + contra + "', '" + pais + "', '" + tecno + "')";
        sentencia.executeUpdate(instruccionSql);
        out.println("Registro exitoso");
        sentencia.close();
        
    } catch (Exception e){
        out.println("Error en el registro" + e.getMessage());
    }
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
http://localhost:8080/app/CapturaDatos2.jsp
-->
<!-- git push origin main -->