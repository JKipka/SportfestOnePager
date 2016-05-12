<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Edit Article</title>

<%
	//FOLGENDER SQL PROZESS IST FÜR ALLE "EDIT" JSP SEITEN ÄHNLICH/GLEICH,
	//WESHALB IN WEITEREN DATEIEN KEINE ERLÄUTERNDEN KOMMENTARE MEHR ZU FINDEN SIND

	//Nötige Parameter über Http Request holen
	String articleID = request.getParameter("textID");
	String header = request.getParameter("textHeader");
	String content = request.getParameter("textContent");

	//SQL Connection String
	String connectionURL = "jdbc:mysql://localhost:3306/sportfest";

	try {
		//SQL Verbindung aufbauen
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		if (!connection.isClosed()) {
			//SQL Verbindung aufgebaut
			String query = "UPDATE texts SET Header='" + header + "', Content='" + content + "' WHERE ID='"
					+ articleID + "'";
			//Datenbank updaten mit neuen Informationen des Users
			PreparedStatement pS = connection.prepareStatement(query);

			//Ausführen
			pS.execute(query);

			//Verbindung schließen
			connection.close();
			response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editTexts");

		}
	} catch (Exception e) {
		//Bei Fehler weiterleiten auf Error-Seite
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}
%>
</head>
<body>

</body>
</html>
