<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URI"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.util.Base64"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.util.Properties"%>


<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Admin einladen</title>

<%
	//Mail des einzuladenden Admins aus Http Request ziehen
	String mail = request.getParameter("addAdminMail");

	//Integer Variable für spätere SQL Abfrage für ID des Admins
	int id = 0;

	//String für verschlüsseltes Passwort
	String encodedPW = "";

	//SQL Verbindung
	Connection connection = null;
	try {

		//Treiber laden
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try {
		//Verbindung herstellen
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		e.printStackTrace();

	}

	if (connection != null) {
		//Verbindung hergestellt
		//PASSWORT GENERIEREN

		//Range für Random Objekt festlegen
		String range = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz°!§$%&/()=?.-:_,;+#";
		String token = "";
		String placeHolder2 = "";

		int n = range.length();
		char placeholder;

		//Random Objekt anlegen
		Random r = new Random();

		//Passwort mit 15 soll generiert und in "token" abgespeichert werden
		for (int i = 0; i < 15; i++) {
			placeholder = range.charAt(r.nextInt(n));
			token += placeholder;
		}

		//Generiertes Passwort "token" in "placeholder2" kopieren
		placeHolder2 = token;

		//Passwort verschlüsseln mit Base64
		encodedPW = Base64.getEncoder().encodeToString(token.getBytes());
		token = encodedPW;

		//SQL Statement vorbereiten und ausführen
		Statement s = connection.createStatement();
		String query = "INSERT INTO admins (username, password) VALUES ('" + mail + "', '" + token + "')";
		s.execute(query);

		//2. SQL Statement vorbereiten für ID des neu angelegten Administrators
		Statement s2 = connection.createStatement();
		String query2 = "SELECT id FROM admins WHERE username='" + mail + "'";
		ResultSet rS1 = s2.executeQuery(query2);
		if (rS1.next()) {
			id = rS1.getInt(1);
		}
		//mailto Link vorbereiten mit generiertem Passwort und Link zum Ändern des Passworts
		String emailBody = "Hallo%0D%0A%0D%0ASie%20wurden%20als%20Administrator%20für%20das%20Sportfest%20Hessen%202016%20eingeladen.%0D%0AFür%20Sie%20wurde%20ein%20Passwort%20generiert.%20Bitte%20ändern%20Sie%20dies%20umgehend.%20Es%20lautet:%20"
				+ placeHolder2
				+ ".%0D%0A%0D%0ABitte%20ändern%20Sie%20Ihr%20Passwort%20hier:%20http://localhost:8080/SportfestOnePager/admin/changePassword.jsp?adminID="
				+ id + "%20%0D%0A%0D%0AMit%20freundlichen%20Grüßen%0D%0AIhr%20Sportfest%20Hessen%20Team";

		//Desktop Objekt anlegen
		Desktop desktop;
		if (Desktop.isDesktopSupported() && (desktop = Desktop.getDesktop()).isSupported(Desktop.Action.MAIL)) {
			//URI mit mailto Link anlegen
			URI mailto = new URI(
					"mailto:" + mail + "?subject=Einladung%20als%20Administrator&body=" + emailBody);

			//Standard Mail Programm öffnen über mailto Link
			desktop.mail(mailto);
			connection.close();
			//Weiterleiten
			response.sendRedirect("../admin/adminHome.jsp#editAdmins");
		} else {
			connection.close();
			response.sendRedirect("../admin/adminHome.jsp#editAdmins");
		}

	}
%>

</head>
<body>Processing...

</body>
</html>
