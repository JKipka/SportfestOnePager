<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 18.02.2016
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%
	Cookie[] cookies = request.getCookies();

	boolean userLoggedIn = false;

	if (cookies != null) {
		for (Cookie cookie1 : cookies) {
			if (cookie1.getName().equals("user")) {
				cookie1.setMaxAge(0);
				cookie1.setPath("/");
				//alten Cookie mit leerem Cookie überschreiben
				response.addCookie(cookie1);
			}
		}
	}

	response.sendRedirect("../index.jsp");
%>
</head>
<body>

</body>
</html>
