<%@ page import="javax.swing.*"%>
<%@ page import="java.sql.*"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 17.02.2016
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>

<%
	String mail = request.getParameter("mail");
	String password = request.getParameter("pw");

	Connection connection = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");
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
		response.sendRedirect("http://localhost:8080/SportfestOnePager/error/databaseError.html");

	}

	if (connection != null) {
		try {
			boolean success = false;
			Statement sT = connection.createStatement();

			mail = (String) mail;

			password = (String) password;
			String sql = "SELECT * FROM admins WHERE username='" + mail + "' AND password='" + password + "'";
			System.out.println(sql);
			try {
				ResultSet rS = sT.executeQuery(sql);
				if (!rS.isBeforeFirst()) {
					response.sendRedirect("../admin/login.jsp?msg=error");
				} else {
					response.sendRedirect("placeCookie.jsp");
				}

			} catch (SQLException e1) {
				connection.close();
			} finally {
				connection.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection.close();
		}
	}
%>


</html>
