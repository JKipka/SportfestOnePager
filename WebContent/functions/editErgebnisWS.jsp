<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String id = request.getParameter("idWS");
        String vorname = request.getParameter("vornameWS");
        String nachname = request.getParameter("nachnameWS");
        String alter = request.getParameter("alterWS");
        Date dateS = new SimpleDateFormat("dd.mm.yyyy").parse(alter);
        String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
        alter = dateS2;
        String weite = request.getParameter("zeitWS");
        String verein = request.getParameter("vereinWS");

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
            String query = "UPDATE weitsprung SET Vorname='"+vorname+"', Nachname='"+nachname+"', Geburtstag='"+alter+"', Weite='"+weite+"', Verein='"+verein+"' WHERE ID='"+id+"'";
            s.execute(query);

            response.sendRedirect("../admin/adminHome.jsp#editErgebnisse#div_weitSAdd");

        }
    %>
</head>
<body>

</body>
</html>
