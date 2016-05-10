<%@page import="java.sql.SQLException"%>
<%@page import="db.DatabaseCon"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
	String filePath = request.getParameter("bildPfad");
	String fileDesc = request.getParameter("bildBeschr");
	DatabaseCon con = new DatabaseCon();
	Connection sqlCon = con.getDBCon();
	String[] paths = null;
	if (filePath.contains("\\")) {
		filePath = filePath.replace("\\", "/");
	}
	
	paths = filePath.split("WebContent");
	filePath = "/SportfestOnePager"+paths[1];

	try {
		PreparedStatement pS = sqlCon.prepareStatement(
				"INSERT INTO bilder (src, beschr) VALUES ('" + filePath + "', '" + fileDesc + "')");
		pS.execute();
		sqlCon.close();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editBilder");
	} catch (SQLException e) {
		e.printStackTrace();
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
	}
%>

</head>
<body>

</body>
</html>