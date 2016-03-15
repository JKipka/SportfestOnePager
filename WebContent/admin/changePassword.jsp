<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 22.02.2016
  Time: 08:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Passwort ändern</title>
    <script src="../script/jquery-1.12.0.min.js"></script>
    <script src="../script/bootstrap.min.js"></script>
    <script src="../script/validate.js"></script>
    <link rel="stylesheet" type="text/css" href="../script/bootstrap.min.css">
    <link href="changePWstyles.css" rel="stylesheet" />

    <%
        String adminID = request.getParameter("changePW");
    %>

</head>
<body>

<div class="container">

    <form role="form" class="form-change" data-toggle="validator" method="post" action="/functions/changePassword.jsp">
        <h2 class="form-change-heading">Passwort ändern</h2>
        <div class="form-group">
            <label for="adminID">Admin-ID:</label>
            <input class="form-control" type="text" id="adminID" name="adminID" value=<%=adminID%> readonly>
        </div>
        <div class="form-group">
            <label for="oldPW">Altes Passwort:</label>
            <input class="form-control" type="password" id="oldPW" name="oldPW" required>
        </div>
        <div class="form-group">
            <label for="newPW1">Neues Passwort:</label>
            <input class="form-control" type="password" id="newPW1" data-minlength="6" name="newPW1" required>
            <span class="help-block">Minimum of 6 characters</span>
        </div>
        <div class="form-group">
            <label for="newPW2">Neues Passwort wiederholen:</label>
            <input class="form-control" type="password" id="newPW2" data-match="#newPW1" data-match-error="Passwörter stimmen nicht überein." required>
            <div class="help-block with-errors"></div>
        </div>

        <button type="submit" class="btn btn-primary">Übernehmen</button>
    </form>

</div> <!-- /container -->




</body>
</html>
