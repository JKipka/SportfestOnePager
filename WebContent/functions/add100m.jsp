<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%><%--
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
	String vn = request.getParameter("addVorname100");
	String nn = request.getParameter("addNachname100");
	String alter = request.getParameter("addAlter100");
	String zeit = request.getParameter("addZeit100");
	String verein = request.getParameter("addVerein100");
	String sparte = request.getParameter("addSparte100");

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
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
		String query = "INSERT INTO 100meterlauf(Vorname, Nachname, Geburtstag, Zeit, Verein, Sparte) VALUES('"
				+ vn + "','" + nn + "','" + alter + "','" + zeit + "','" + verein + "','" + sparte + "')";
		s.execute(query);

		response.sendRedirect("../admin/adminHome.jsp#div_100mEdit");

	}
%>
</head>
<body>

</body>
</html>
