<%@ page import="java.sql.Connection"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.nio.file.Files"%>
<%@ page import="java.io.File"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 11.03.2016
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Delete Image</title>
<%
	String id = request.getParameter("bildID");
	String path = request.getParameter("bildSRC");
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		e.printStackTrace();

	}

	if (connection != null) {

		Statement s = connection.createStatement();
		String query = "DELETE FROM bilder WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editBilder");

	}
%>
</head>
<body>

</body>
</html>
