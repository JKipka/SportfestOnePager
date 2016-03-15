<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Date dateS = new Date();
        DateFormat dF = new SimpleDateFormat("yyyy.MM.dd");

        String id = request.getParameter("idT");
        String desc = request.getParameter("descT");
        String sparte = request.getParameter("sparteT");
        String place = request.getParameter("placeT");
        String date = request.getParameter("dateT");
        dateS = new SimpleDateFormat("dd.mm.yyyy").parse(date);
        String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
        date = dateS2;
        String time = request.getParameter("timeT");

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
            String query = "UPDATE termine SET Beschreibung='"+desc+"', Jugendsparte='"+sparte+"', Ort='"+place+"', Datum='"+date+"', Uhrzeit='"+time+"' WHERE Nummer='"+id+"'";
            s.execute(query);

            response.sendRedirect("../admin/adminHome.jsp#editTermine");

        }


    %>


</head>
<body>

</body>
</html>
