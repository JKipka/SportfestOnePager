<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%
	String id = request.getParameter("idWS");
	String vorname = request.getParameter("vornameWS");
	String nachname = request.getParameter("nachnameWS");
	String alter = request.getParameter("alterWS");
	Date dateS = new SimpleDateFormat("dd.mm.yyyy").parse(alter);
	String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
	alter = dateS2;
	String weite = request.getParameter("zeitWS");
	String verein = request.getParameter("vereinWS");
	String sparte = request.getParameter("sparteWS");

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
		String query = "UPDATE weitsprung SET Vorname='" + vorname + "', Nachname='" + nachname
				+ "', Geburtstag='" + alter + "', Weite='" + weite + "', Verein='" + verein + "', Sparte='"
				+ sparte + "' WHERE ID='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_weitSEdit");

	}
%>
</head>
<body>

</body>
</html>
