<%@ page import="java.sql.Connection"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title></title>

<%
	String id = request.getParameter("delAdmin");

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
		String query = "DELETE FROM admins WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#editAdmins");

	}
%>
</head>
<body>

</body>
</html>
