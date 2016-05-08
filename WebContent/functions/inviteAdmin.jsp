<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.util.Random"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.AddressException"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Inviting Admin</title>

<%
	String mail = request.getParameter("addAdminMail");

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
		int n = range.length();
		char placeholder;
		Random r = new Random();

		for (int i = 0; i < 11; i++) {
			placeholder = range.charAt(r.nextInt(n));
			token += placeholder;
		}

		Statement s = connection.createStatement();
		String query = "INSERT INTO admins (username, password) VALUES ('" + mail + "', '" + token + "')";
		s.execute(query);

		//Send Mail

		try {
			String empfaenger = (String) mail;
			String absender = "sportfesthessen@gmail.com";
			String password = "peterlustig12";
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.gmail.com");
			properties.put("mail.smtp.port", "587");
			Session session1 = Session.getInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(absender, password);
				}
			});

			Message message = new MimeMessage(session1);

			message.setFrom(new InternetAddress(absender));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(empfaenger));
			message.setSubject("Sie wurden als Administrator des Sportfests Hessen hinzugefügt.");
			String messageText = "<h2>Hey!</h2><br><h4>Sie wurden als Administrator des Sportfests Hessen hinzugefügt.<br>"
					+ "<p>Ihr vorläufiges Passwort zum Login lautet: " + token + "<br>"
					+ "Bitte ändern Sie dieses umgehend, indem sie sich hier zum Admin bereich anmelden:<br>"
					+ "<a href=\"http://localhost:8080/admin/login.jsp\">Zum Login hier klicken</a>.<br>"
					+ "Beste Grüße, Jan vom Sportfest Hessen.";

			message.setContent(messageText, "text/html; charset=utf-8");

			// Send message
			Transport.send(message);
			System.out.print("Mail gesendet");

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (javax.mail.MessagingException e) {
			e.printStackTrace();
		}

		response.sendRedirect("../admin/adminHome.jsp#editAdmins");

	}
%>

</head>
<body>Processing...

</body>
</html>
