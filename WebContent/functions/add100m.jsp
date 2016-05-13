<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>

<%
	//FOLGENDER SQL PROZESS IST FÜR ALLE "ADD" JSP SEITEN ÄHNLICH/GLEICH,
	//WESHALB IN WEITEREN DATEIEN KEINE ERLÄUTERNDEN KOMMENTARE MEHR ZU FINDEN SIND

	//Alle benötigten Parameter über die HTTP Request holen, submitted durch das Formular
	String vn = request.getParameter("addVorname100");
	String nn = request.getParameter("addNachname100");
	String alter = request.getParameter("addAlter100");
	String zeit = request.getParameter("addZeit100");
	String verein = request.getParameter("addVerein100");
	String sparte = request.getParameter("addSparte100");

	//SQL Verbindung herstellen
	Connection connection = null;
	try {
		//Treiber laden
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	try {
		//Verbindung herstellen
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		//Bei Fehler weiterleiten auf Error-Seite
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");

	}

	//Wenn Verbindung steht
	if (connection != null) {

		Statement s = connection.createStatement();
		//IN TABELLE EINFÜGEN --> INSERT INTO
		String query = "INSERT INTO 100meterlauf(Vorname, Nachname, Geburtstag, Zeit, Verein, Sparte) VALUES('"
				+ vn + "','" + nn + "','" + alter + "','" + zeit + "','" + verein + "','" + sparte + "')";
		//Statement ausführen
		s.execute(query);
		//Verbindung schließen
		connection.close();
		//Weiterleiten auf Admin Seite
		response.sendRedirect("../admin/adminHome.jsp#div_100mEdit");

	}
%>
</head>
<body>

</body>
</html>
