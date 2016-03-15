<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

 
<head>

    <title>Title</title>

    <%

      String vn = request.getParameter("addVorname50");
        String nn = request.getParameter("addNachname50");
        String alter = request.getParameter("addAlter50");
        String zeit = request.getParameter("addZeit50");
        String verein = request.getParameter("addVerein50");


    Connection connection = null;
    try {
    Class.forName("com.mysql.jdbc.Driver");

    }catch (ClassNotFoundException e){
    e.printStackTrace();
    }

    try {



    try {

    } catch (Exception e) {

    // TODO Auto-generated catch block
    e.printStackTrace();
    JOptionPane
    .showMessageDialog(
    null,
    "Error while connecting to SQL Database. Check your database choice from the dropdown list.\n Description: "
    + e.toString());
    }
    connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/sportfest", "root", "");

    } catch (SQLException e) {
    e.printStackTrace();

    }

    if (connection!=null){

    Statement s = connection.createStatement();
    String query = "INSERT INTO 50meterlauf(Vorname, Nachname, Geburtstag, Zeit, Verein) VALUES('"+vn+"','"+nn+"','"+alter+"','"+zeit+"','"+verein+"')";
    s.execute(query);

    //request.getRequestDispatcher("/admin/adminHome.jsp#editErgebnisse#div_50mAdd").forward(request, response);
    response.sendRedirect("../admin/adminHome.jsp#editErgebnisse");

    }
    %>



</head>
<body>




</body>
</html>
