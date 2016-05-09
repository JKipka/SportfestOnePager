<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>


<head>

<title>Title</title>

<%
	String vn = request.getParameter("addVorname50");
	String nn = request.getParameter("addNachname50");
	String alter = request.getParameter("addAlter50");
	String zeit = request.getParameter("addZeit50");
	String verein = request.getParameter("addVerein50");
	String sparte = request.getParameter("addSparte50");

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
		String query = "INSERT INTO 50meterlauf(Vorname, Nachname, Geburtstag, Zeit, Verein, Sparte) VALUES('"
				+ vn + "','" + nn + "','" + alter + "','" + zeit + "','" + verein + "','" + sparte + "')";
		s.execute(query);

		response.sendRedirect("../admin/adminHome.jsp#div_50mEdit");

	}
%>

</head>
<body>

</body>
</html>
