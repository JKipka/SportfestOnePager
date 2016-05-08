<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 22.02.2016
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Add article</title>

<%
	String header = request.getParameter("textHeaderIn");
	String content = request.getParameter("textContentIn");

	String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
	Connection connection = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "");
	if (!connection.isClosed()) {
		String query = "INSERT INTO texts (Header, Content) VALUES ('" + header + "', '" + content + "')";
		PreparedStatement pS = connection.prepareStatement(query);
		boolean success = pS.execute(query);

		connection.close();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editTexts");

	}
%>
</head>
<body>

</body>
</html>
