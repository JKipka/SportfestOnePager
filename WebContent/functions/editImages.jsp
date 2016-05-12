<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Edit Images</title>
<%
	String imageID = request.getParameter("bildID");
	String src = request.getParameter("bildSRC");
	String desc = request.getParameter("bildDesc");
	String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
	Connection connection = null;

	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		if (!connection.isClosed()) {
			String query = "UPDATE bilder SET src='" + src + "', beschr='" + desc + "' WHERE ID='" + imageID
					+ "'";
			PreparedStatement pS = connection.prepareStatement(query);
			pS.execute(query);
			connection.close();
			response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editBilder");

		}
	} catch (Exception e) {
		connection.close();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}
%>
</head>
<body>

</body>
</html>
