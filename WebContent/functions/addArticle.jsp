<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Add article</title>

<%
	//Parameter ziehen
	String header = request.getParameter("textHeaderIn");
	String content = request.getParameter("textContentIn");

	try {
		//SQL
		String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		if (!connection.isClosed()) {
			String query = "INSERT INTO texts (Header, Content) VALUES ('" + header + "', '" + content + "')";
			PreparedStatement pS = connection.prepareStatement(query);
			boolean success = pS.execute(query);

			connection.close();
			response.sendRedirect("../admin/adminHome.jsp#editTexts");

		}

	} catch (Exception e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}
%>
</head>
<body>

</body>
</html>
