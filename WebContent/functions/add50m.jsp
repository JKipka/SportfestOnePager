<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<title></title>

<%
	//Benötigte Parameter aus Http Request ziehen
	String vn = request.getParameter("addVorname50");
	String nn = request.getParameter("addNachname50");
	String alter = request.getParameter("addAlter50");
	String zeit = request.getParameter("addZeit50");
	String verein = request.getParameter("addVerein50");
	String sparte = request.getParameter("addSparte50");

	//---SQL Verbindung
	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		//Bei Fehler auf Error Seite weiterleiten
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");

	}

	if (connection != null) {
		//SQL Verbindung hergestellt
		//Statement vorbereiten
		Statement s = connection.createStatement();
		String query = "INSERT INTO 50meterlauf(Vorname, Nachname, Geburtstag, Zeit, Verein, Sparte) VALUES('"
				+ vn + "','" + nn + "','" + alter + "','" + zeit + "','" + verein + "','" + sparte + "')";
		//Ausführen
		s.execute(query);
		//Verbindung schließen
		connection.close();
		//Weiterleiten
		response.sendRedirect("../admin/adminHome.jsp#div_50mEdit");

	}
%>

</head>
<body>

</body>
</html>
