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

<%--
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
		System.out.println("Unverschlüsseltes PW für Mail " + mail + ": " + token);
		placeHolder2 = token;
		encodedPW = Base64.getEncoder().encodeToString(token.getBytes());
		token = encodedPW;
		System.out.println("Verschlüsseltes PW für Mail " + mail + ": " + token);

		Statement s = connection.createStatement();
		String query = "INSERT INTO admins (username, password) VALUES ('" + mail + "', '" + token + "')";
		s.execute(query);

		//Send Mail

		/* try {
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
		} */
		
		String emailBody = "Hallo%0D%0A%0D%0ASie%20wurden%20als%20Administrator%20für%20das%20Sportfest%20Hessen%202016%20eingeladen.%0D%0AFür%20Sie%20wurde%20ein%20Passwort%20generiert.%20Bitte%20ändern%20Sie%20dies%20umgehend.%20Es%20lautet:"+placeHolder2+".%0D%0A%0D%0AMit%20freundlichen%20Grüßen%0D%0AIhr%20Sportfest%20Hessen%20Team";

		Desktop desktop;
		if (Desktop.isDesktopSupported() && (desktop = Desktop.getDesktop()).isSupported(Desktop.Action.MAIL)) {
			URI mailto = new URI("mailto:"+mail+"?subject=Einladung%20als%20Administrator&body="+emailBody);
			
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
