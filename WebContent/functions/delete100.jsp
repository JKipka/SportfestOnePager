<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>

<%
	//FOLGENDER SQL PROZESS IST FÜR ALLE "DELETE" JSP SEITEN ÄHNLICH/GLEICH,
	//WESHALB IN WEITEREN DATEIEN KEINE ERLÄUTERNDEN KOMMENTARE MEHR ZU FINDEN SIND

	//Eindeutige ID der Datenbanktabelle aus POST-Methode ziehen
	String id = request.getParameter("del100");

	//SQL Verbindung anlegen
	Connection connection = null;
	try {
		//Treiber laden
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		//Bei Fehler auf Error-Seite weiterleiten
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	try {
		//Verbindung zu Datenbank aufbauen
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}

	if (connection != null) {
		//Statement vorbereiten
		Statement s = connection.createStatement();
		//Löschen über eindeutige ID
		String query = "DELETE FROM 100meterlauf WHERE ID='" + id + "'";
		//Ausführen
		s.execute(query);
		//Verbindung schließen
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_100mEdit");

	}
%>

</head>
<body>

</body>
</html>
