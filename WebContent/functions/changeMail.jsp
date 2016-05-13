<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title></title>

<%
	String id = request.getParameter("idAdmin");
	String mail = request.getParameter("usernameAdmin");

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	try {

		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");

	}

	if (connection != null) {

		Statement s = connection.createStatement();
		String query = "UPDATE admins SET username='" + mail + "' WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#editAdmins");

	}
%>
</head>
<body>

</body>
</html>
