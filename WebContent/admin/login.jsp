<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%
        String errorMsg = request.getParameter("msg");
        if (errorMsg == null) {
            errorMsg = "";
        } else {
            errorMsg = "E-Mail oder Passwort stimmt nicht.";
        }

    %>
    <title>Einloggen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <script src="../script/jquery-1.12.0.min.js"></script>
    <script src="../script/bootstrap.js"></script>
    <script src="../script/validate.js"></script>
    <link rel="stylesheet" type="text/css" href="../script/bootstrap.css">
    <link href="signin.css" rel="stylesheet"/>

    <%
        Cookie[] cookies = request.getCookies();
        boolean userLoggedIn = false;
        if (cookies != null) {
            for (Cookie cookie1 : cookies) {
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    userLoggedIn = true;
                }
            }
        }

        if (userLoggedIn) {
            response.sendRedirect("../admin/adminHome.jsp");
        }
    %>


</head>
<body>

<div class="container">


    <form class="form-signin" action="/SportfestOnePager/php/loggingYouIn.php" method="post">
        <h2 class="form-signin-heading">Bitte anmelden</h2>
        <label for="inputEmail" class="sr-only">Email-Adresse</label>
        <input type="email" id="inputEmail" name="mail" class="form-control" placeholder="Email address" required
               autofocus>
        <label for="inputPassword" class="sr-only">Passwort</label>
        <input type="password" id="inputPassword" name="pw" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button>
        <p style="color: red"><%out.print(errorMsg);%></p>
    </form>

</div> <!-- /container -->

</body>
</html>
