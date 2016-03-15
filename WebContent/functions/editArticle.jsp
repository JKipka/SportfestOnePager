<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 22.02.2016
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Article</title>

    <%
        String articleID = request.getParameter("textID");
        String header = request.getParameter("textHeader");
        String content = request.getParameter("textContent");
        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "");
        if (!connection.isClosed()) {
            String query = "UPDATE texts SET Header='"+header+"', Content='"+content+"' WHERE ID='"+articleID+"'";
            PreparedStatement pS = connection.prepareStatement(query);
            boolean success = pS.execute(query);

                connection.close();
                response.sendRedirect("http://localhost:8080/admin/adminHome.jsp#editTexts");

        }
    %>
</head>
<body>

</body>
</html>
