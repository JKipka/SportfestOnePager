<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<%
	String sportart = request.getParameter("addSportart");
	String sportplatz = request.getParameter("addSportplatz");
	String sparte = request.getParameter("addSparte");
	String datum = request.getParameter("addDate");
	String zeit = request.getParameter("addTime");

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	try {

		try {

		} catch (Exception e) {

			response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
		}
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");

	}

	if (connection != null) {

		Statement s = connection.createStatement();
		String query = "INSERT INTO termine(Beschreibung, Jugendsparte, Ort, Datum, Uhrzeit) VALUES('"
				+ sportart + "','" + sparte + "','" + sportplatz + "','" + datum + "','" + zeit + "')";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#editTermine");

	}
%>


</head>
<body>



</body>
</html>
