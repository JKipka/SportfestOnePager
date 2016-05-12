<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%
	String id = request.getParameter("idWW");
	String vorname = request.getParameter("vornameWW");
	String nachname = request.getParameter("nachnameWW");
	String alter = request.getParameter("alterWW");
	Date dateS = new SimpleDateFormat("dd.mm.yyyy").parse(alter);
	String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
	alter = dateS2;
	String weite = request.getParameter("zeitWW");
	String verein = request.getParameter("vereinWW");
	String sparte = request.getParameter("sparteWW");

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
		String query = "UPDATE weitwurf SET Vorname='" + vorname + "', Nachname='" + nachname
				+ "', Geburtstag='" + alter + "', Meter='" + weite + "', Verein='" + verein + "', Sparte='"
						+ sparte+"' WHERE ID='"
				+ id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#div_weitWEdit");

	}
%>
</head>
<body>

</body>
</html>
