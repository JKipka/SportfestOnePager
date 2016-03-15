<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 10.03.2016
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Text</title>

    <%
        String id = request.getParameter("textIDDel");
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
            String query = "DELETE FROM texts WHERE ID='"+id+"'";
            s.execute(query);

            response.sendRedirect("../admin/adminHome.jsp#editTexts");

        }
    %>
</head>
<body>

</body>
</html>
