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
<title>Inviting Admin</title>

<%
	String mail = request.getParameter("addAdminMail");
	int id = 0;
	String encodedPW = "";

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try {

		try {

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null,
					"Error while connecting to SQL Database. Check your database choice from the dropdown list.\n Description: "
							+ e.toString());
		}
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		e.printStackTrace();

	}

	if (connection != null) {

		//Passwort generieren
		String range = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgh";
		String token = "";
		String placeHolder2 = "";
		int n = range.length();
		char placeholder;
		Random r = new Random();

		for (int i = 0; i < 11; i++) {
			placeholder = range.charAt(r.nextInt(n));
			token += placeholder;
		}
		
		placeHolder2 = token;
		encodedPW = Base64.getEncoder().encodeToString(token.getBytes());
		token = encodedPW;

		Statement s = connection.createStatement();
		String query = "INSERT INTO admins (username, password) VALUES ('" + mail + "', '" + token + "')";
		s.execute(query);

		Statement s2 = connection.createStatement();
		String query2 = "SELECT id FROM admins WHERE username='" + mail + "'";
		ResultSet rS1 = s2.executeQuery(query2);
		if (rS1.next()) {
			id = rS1.getInt(1);
		}

		String emailBody = "Hallo%0D%0A%0D%0ASie%20wurden%20als%20Administrator%20für%20das%20Sportfest%20Hessen%202016%20eingeladen.%0D%0AFür%20Sie%20wurde%20ein%20Passwort%20generiert.%20Bitte%20ändern%20Sie%20dies%20umgehend.%20Es%20lautet:"
				+ placeHolder2
				+ ".%0D%0A%0D%0ABitte%20ändern%20Sie%20Ihr%20Passwort%20hier:%20http://localhost:8080/SportfestOnePager/admin/changePassword.jsp?adminID="
				+ id + "%20%0D%0A%0D%0AMit%20freundlichen%20Grüßen%0D%0AIhr%20Sportfest%20Hessen%20Team";

		Desktop desktop;
		if (Desktop.isDesktopSupported() && (desktop = Desktop.getDesktop()).isSupported(Desktop.Action.MAIL)) {
			URI mailto = new URI(
					"mailto:" + mail + "?subject=Einladung%20als%20Administrator&body=" + emailBody);

			desktop.mail(mailto);
			response.sendRedirect("../admin/adminHome.jsp#editAdmins");
		} else {

			response.sendRedirect("../admin/adminHome.jsp#editAdmins");
		}

	}
%>

</head>
<body>Processing...

</body>
</html>
