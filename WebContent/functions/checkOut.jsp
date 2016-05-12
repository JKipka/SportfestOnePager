
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%
	//USER COOKIE LÖSCHEN

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
