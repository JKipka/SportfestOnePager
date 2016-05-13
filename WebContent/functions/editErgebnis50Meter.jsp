<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<%
	String id = request.getParameter("id50");
	String vorname = request.getParameter("vorname50");
	String nachname = request.getParameter("nachname50");
	String alter = request.getParameter("alter50");
	Date dateS = new SimpleDateFormat("dd.mm.yyyy").parse(alter);
	String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
	alter = dateS2;
	String zeit = request.getParameter("zeit50");
	String verein = request.getParameter("verein50");
	String sparte = request.getParameter("sparte50");

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
		String query = "UPDATE 50meterlauf SET Vorname='" + vorname + "', Nachname='" + nachname
				+ "', Geburtstag='" + alter + "', Zeit='" + zeit + "', Verein='" + verein + "', Sparte='"
				+ sparte + "' WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_50mEdit");

	}
%>

</head>
<body>

</body>
</html>
