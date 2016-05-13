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
<%
	String id = request.getParameter("id100");
	String vorname = request.getParameter("vorname100");
	String nachname = request.getParameter("nachname100");
	String alter = request.getParameter("alter100");

	//DATUM RICHTIG DEUTSCHEM STANDARD FORMATIERNE
	Date dateS = new SimpleDateFormat("dd.mm.yyyy").parse(alter);
	String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
	alter = dateS2;

	String zeit = request.getParameter("zeit100");
	String verein = request.getParameter("verein100");
	String sparte = request.getParameter("sparte100");

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sportfest", "root", "");

	} catch (SQLException e) {
		e.printStackTrace();

	}

	if (connection != null) {

		Statement s = connection.createStatement();
		String query = "UPDATE 100meterlauf SET Vorname='" + vorname + "', Nachname='" + nachname
				+ "', Geburtstag='" + alter + "', Zeit='" + zeit + "', Verein='" + verein + "', Sparte='"
				+ sparte + "' WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_100mEdit");

	}
%>
</head>
<body>

</body>
</html>
