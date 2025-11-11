<%@ page import="java.sql.*" %>
<%
Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ajt_project?useSSL=false&allowPublicKeyRetrieval=true",
        "root",
        ""
    );
} catch(Exception e){
    e.printStackTrace(); // Logs error in Tomcat console
}
%>
