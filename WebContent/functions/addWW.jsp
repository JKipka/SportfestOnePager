<%@ page import="java.sql.Connection" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%

        String vn = request.getParameter("addVornameWW");
        String nn = request.getParameter("addNachnameWW");
        String alter = request.getParameter("addAlterWW");
        String zeit = request.getParameter("addZeitWW");
        String verein = request.getParameter("addVereinWW");
		String sparte = request.getParameter("addSparteWW");

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
            String query = "INSERT INTO weitwurf(Vorname, Nachname, Geburtstag, Meter, Verein, Sparte) VALUES('"+vn+"','"+nn+"','"+alter+"','"+zeit+"','"+verein+"','"+sparte+"')";
            s.execute(query);

            response.sendRedirect("../admin/adminHome.jsp#editErgebnisse");

        }
    %>

</head>
<body>

</body>
</html>
