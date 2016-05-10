<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 11.03.2016
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
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
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "");
	if (!connection.isClosed()) {
		String query = "UPDATE bilder SET src='" + src + "', beschr='" + desc + "' WHERE ID='" + imageID + "'";
		PreparedStatement pS = connection.prepareStatement(query);
		pS.execute(query);

		connection.close();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editBilder");

	}
%>
</head>
<body>

</body>
</html>
