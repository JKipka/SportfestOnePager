<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 11.03.2016
  Time: 08:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Place Cookie</title>

    <%
        Cookie cookie = new Cookie("user", "logged");
        cookie.setMaxAge(60*5);
        response.addCookie(cookie);
        response.sendRedirect("redirect.jsp");
    %>
</head>
<body>

</body>
</html>
