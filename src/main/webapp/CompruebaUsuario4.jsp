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
        
        String usuario = request.getParameter("usuario");
        String contra = request.getParameter("contra");
    

        Class.forName("com.mysql.cj.jdbc.Driver");

        try {

        
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/usuarios", "jspuser", "1234");
        PreparedStatement sentencia = conexion.prepareStatement("SELECT * FROM datos WHERE usuario = ? AND contra = ?",
        
        ResultSet.TYPE_SCROLL_INSENSITIVE,   
        ResultSet.CONCUR_READ_ONLY   ); 
        
        sentencia.setString(1, usuario); 
        sentencia.setString(2, contra); 
        ResultSet resultado = sentencia.executeQuery(); 
        
        if (resultado.absolute(1)){  
            out.println("Usuario correcto");
        } else {
            out.println("Usuario incorrecto");
        }
    } catch (Exception e){
        out.println("Error en el registro " + e.getMessage());
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
http://localhost:8080/app/CompruebaUsuario4.jsp
-->
<!-- git push origin main -->