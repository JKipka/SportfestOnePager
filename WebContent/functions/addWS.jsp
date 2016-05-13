<%@ page import="java.sql.Connection"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>

<%
	String vn = request.getParameter("addVornameWS");
	String nn = request.getParameter("addNachnameWS");
	String alter = request.getParameter("addAlterWS");
	String zeit = request.getParameter("addZeitWS");
	String verein = request.getParameter("addVereinWS");
	String sparte = request.getParameter("addSparteWS");

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
		String query = "INSERT INTO weitsprung(Vorname, Nachname, Geburtstag, Weite, Verein, Sparte) VALUES('"
				+ vn + "','" + nn + "','" + alter + "','" + zeit + "','" + verein + "','" + sparte + "')";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_weitSEdit");

	}
%>

</head>
<body>

</body>
</html>
