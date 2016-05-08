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
	File deleteFile = new File(path);
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try {
		try {

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"Error while connecting to SQL Database. Check your database choice from the dropdown list.\n Description: "
							+ e.toString());
		}
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		e.printStackTrace();

	}

	if (connection != null) {

		Statement s = connection.createStatement();
		String query = "DELETE FROM bilder WHERE ID='" + id + "'";
		s.execute(query);

		Files.deleteIfExists(deleteFile.toPath());

		response.sendRedirect("../admin/adminHome.jsp#editBilder");

	}
%>
</head>
<body>

</body>
</html>
