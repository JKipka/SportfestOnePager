<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%
	Date dateS = new Date();
	DateFormat dF = new SimpleDateFormat("yyyy.MM.dd");

	String id = request.getParameter("idT");
	String desc = request.getParameter("descT");
	String sparte = request.getParameter("sparteT");
	String place = request.getParameter("placeT");
	String date = request.getParameter("dateT");
	dateS = new SimpleDateFormat("dd.mm.yyyy").parse(date);
	String dateS2 = new SimpleDateFormat("yyyy.mm.dd").format(dateS);
	date = dateS2;
	String time = request.getParameter("timeT");

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
		String query = "UPDATE termine SET Beschreibung='" + desc + "', Jugendsparte='" + sparte + "', Ort='"
				+ place + "', Datum='" + date + "', Uhrzeit='" + time + "' WHERE Nummer='" + id + "'";
		s.execute(query);
		connection.close();
		response.sendRedirect("../admin/adminHome.jsp#editTermine");

	}
%>


</head>
<body>

</body>
</html>
