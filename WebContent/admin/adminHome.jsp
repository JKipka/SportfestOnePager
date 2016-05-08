<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	
	<title>Administrator Startseite</title>	
	<link rel="icon" href="/SportfestOnePager/images/Logo2.png">
    
    <script src="../script/jquery-1.12.0.min.js"></script>
    <script src="../script/bootstrap.min.js"></script>
    <script src="../script/validate.js"></script>
    
    <link rel="stylesheet" type="text/css" href="../script/bootstrap.min.css">
    <link href="admin.css" rel="stylesheet"/>

    <%
    	//VORHANDENEN COOKIE ABFRAGEN
        Cookie[] cookies = request.getCookies();
        boolean userLoggedIn = false;
        if(cookies!=null){
            for(Cookie cookie1 : cookies){
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    userLoggedIn = true;
                }
            }
        }

        if(!userLoggedIn){
            response.sendRedirect("login.jsp");
        }
    %>
    
</head>

<body>

<!-- NAVBAR ANFANG -->
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-main">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Administratorbereich</a>
        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse-main">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#overview">Überblick</a></li>
                <li><a href="#editTermine">Termine</a></li>
                <li><a href="#editErgebnisse">Ergebnisse</a></li>
                <li><a href="#editAdmins">Admins verwalten</a></li>
                <li><a href="#editTexts">Texte bearbeiten</a></li>
                <li><a href="#editBilder">Fotos hochladen</a></li>
                <li><a href="/SportfestOnePager/functions/checkOut.jsp">Ausloggen und zurück zur Startseite</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav> <!-- NAVBAR ENDE -->

<!-- first section - Überblick -->
<div id="overview" class="pad-section">
    <div class="container-fluid row">
        <h1 class="text-center">Überblick</h1>
        <div class="col-sm-6" id="termine_div">

            <%
            
            //Termine aus Datenbank ziehen
                PreparedStatement pS;
                String query;
                ResultSet rSTermine = null;;
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {

                        out.println("<h3>Termine</h3>");
                        //Tabelle
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>Sportart</th>");
                        out.println("<th>Jugendsparte</th>");
                        out.println("<th>Sportplatz</th>");
                        out.println("<th>Datum</th>");
                        out.println("<th>Uhrzeit</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT Beschreibung,Jugendsparte, ort, date_format(Datum, '%e.%m.%Y') AS datum, uhrzeit FROM termine";
                        pS = connection.prepareStatement(query);
                        rSTermine = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rSTermine.next()) {

                            out.println("<tr>");
                            out.println("<td>" + rSTermine.getString(1) + "</td>");
                            out.println("<td>" + rSTermine.getString(2) + "</td>");
                            out.println("<td>" + rSTermine.getString(3) + "</td>");
                            out.println("<td>" + rSTermine.getString(4) + "</td>");
                            out.println("<td>" + rSTermine.getString(5) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>

        <div class="col-sm-6" id="admins_div">
            <%
            
            ResultSet rSAdmins;
            
            //Administratoren aus Datenbank ziehen
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {

                        out.println("<h3>Administratoren</h3>");
                        //Tabelle
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>E-Mail</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT username FROM admins";
                        pS = connection.prepareStatement(query);
                        rSAdmins = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rSAdmins.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rSAdmins.getString(1) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>
    </div>

    <div class="container-fluid row">
    	<h3 style="padding-left: 15px">Ergebnisse</h3>
        <div class="col-sm-6" id="div_50m">
        	
            <h4>50 Meter Lauf</h4>
            <%
            
            //Ergebnisse des 50-Meter-Sprints aus Datenbank ziehen
            
            ResultSet rS50Meter;
            
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {


                        //Tabelle
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>Vorname</th>");
                        out.println("<th>Nachname</th>");
                        out.println("<th>Alter</th>");
                        out.println("<th>Zeit</th>");
                        out.println("<th>Verein</th>");
                        out.println("<th>Sparte</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Zeit, Verein, Sparte FROM 50meterlauf";
                        pS = connection.prepareStatement(query);
                        rS50Meter = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rS50Meter.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rS50Meter.getString(1) + "</td>");
                            out.println("<td>" + rS50Meter.getString(2) + "</td>");
                            out.println("<td>" + rS50Meter.getString(3) + "</td>");
                            out.println("<td>" + rS50Meter.getString(4) + "</td>");
                            out.println("<td>" + rS50Meter.getString(5) + "</td>");
                            out.println("<td>" + rS50Meter.getString(6) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>

        <div class="col-sm-6" id="div_100m">
            <h4>100 Meter Lauf</h4>
            <%
           	ResultSet rS100Meter;
            //Ergebnisse des 100-Meter-Sprints aus Datenbank ziehen
            
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {


                        //Tabelle
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>Vorname</th>");
                        out.println("<th>Nachname</th>");
                        out.println("<th>Alter</th>");
                        out.println("<th>Zeit</th>");
                        out.println("<th>Verein</th>");
                        out.println("<th>Sparte</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Zeit, Verein, Sparte FROM 100meterlauf";
                        pS = connection.prepareStatement(query);
                        rS100Meter = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rS100Meter.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rS100Meter.getString(1) + "</td>");
                            out.println("<td>" + rS100Meter.getString(2) + "</td>");
                            out.println("<td>" + rS100Meter.getString(3) + "</td>");
                            out.println("<td>" + rS100Meter.getString(4) + "</td>");
                            out.println("<td>" + rS100Meter.getString(5) + "</td>");
                            out.println("<td>" + rS100Meter.getString(6) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>


    </div>

    <div class="container-fluid row">
        <div class="col-sm-6" id="div_weitwurf">
            <h4>Weitwurf</h4>
            <%
            
            ResultSet rSWeitwurf;
            
            //Ergebnisse des Weitwurf Wettbewerbs aus Datenbank ziehen
            
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {


                        //Tabelle generieren
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>Vorname</th>");
                        out.println("<th>Nachname</th>");
                        out.println("<th>Alter</th>");
                        out.println("<th>Weite</th>");
                        out.println("<th>Verein</th>");
                        out.println("<th>Sparte</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Meter, Verein, Sparte FROM weitwurf";
                        pS = connection.prepareStatement(query);
                        rSWeitwurf = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rSWeitwurf.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rSWeitwurf.getString(1) + "</td>");
                            out.println("<td>" + rSWeitwurf.getString(2) + "</td>");
                            out.println("<td>" + rSWeitwurf.getString(3) + "</td>");
                            out.println("<td>" + rSWeitwurf.getString(4) + "</td>");
                            out.println("<td>" + rSWeitwurf.getString(5) + "</td>");
                            out.println("<td>" + rSWeitwurf.getString(6) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>

        <div class="col-sm-6" id="div_weitsprung">
            <h4>Weitsprung</h4>
            <%
            
            ResultSet rSWeitsprung;
            
            //Ergebnisse des Weitsprung Wettbewerbs aus Datenbank ziehen
            
                try {
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {


                        //Tabelle generieren
                        out.println("<table class=\"table table-condensed\" cellspacing='0' cellpadding='10'>");
                        out.println("<thead class=\"thead-inverse\">");
                        out.println("<tr>");
                        out.println("<th>Vorname</th>");
                        out.println("<th>Nachname</th>");
                        out.println("<th>Alter</th>");
                        out.println("<th>Meter</th>");
                        out.println("<th>Verein</th>");
                        out.println("<th>Sparte</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        query = "SELECT Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Weite, Verein, Sparte FROM weitsprung";
                        pS = connection.prepareStatement(query);
                        rSWeitsprung = pS.executeQuery();
                        //Tabelle füllen mit den Daten aus der DB
                        while (rSWeitsprung.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rSWeitsprung.getString(1) + "</td>");
                            out.println("<td>" + rSWeitsprung.getString(2) + "</td>");
                            out.println("<td>" + rSWeitsprung.getString(3) + "</td>");
                            out.println("<td>" + rSWeitsprung.getString(4) + "</td>");
                            out.println("<td>" + rSWeitsprung.getString(5) + "</td>");
                            out.println("<td>" + rSWeitsprung.getString(6) + "</td>");
                            out.println("</tr>");

                        }

                        out.println("</table>");

                        connection.close();

                    }


                } catch (Exception ex) {
                    out.println("Unable to connect to database" + ex);
                }

            %>
        </div>
    </div>
</div>
<!-- /first section Überblick ENDE-->

<!-- 2nd section - Termine bearbeiten und hinzufügen -->
<div id="editTermine" class="pad-section">
    <div class="container">
        <h2 class="text-center">Termine bearbeiten</h2>
        <hr/>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_termineBearbeiten">
                <%
                
                //Vorhandene Termine zum Bearbeiten aus Datenbank
                
                    try {
 	
                         String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                         Connection connection = null;
                         Class.forName("com.mysql.jdbc.Driver").newInstance();
                         connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>Termine bearbeiten</h3>");
                            
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Termin-ID</th>");
                            out.println("<th>Sportart</th>");
                            out.println("<th>Jugendsparte</th>");
                            out.println("<th>Sportplatz</th>");
                            out.println("<th>Datum</th>");
                            out.println("<th>Uhrzeit</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT Nummer, Beschreibung, Jugendsparte, Ort, date_format(Datum, '%e.%m.%Y') AS datum, uhrzeit FROM termine";
                            pS = connection.prepareStatement(query);
                            rSTermine = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rSTermine.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/editTermin.jsp'>");
                                out.println("<td><input type='text' name='idT' value='" + rSTermine.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='descT' value='" + rSTermine.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='sparteT' value='" + rSTermine.getString(3) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='placeT' value='" + rSTermine.getString(4) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='dateT' value='" + rSTermine.getString(5) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='timeT' value='" + rSTermine.getString(6) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/deleteTermin.jsp'>");
                                out.println("<input type='text' name='delTermin' value='" + rSTermine.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Löschen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_termineHinzufügen">
                <h3 class="text-center">Termine hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/addTermin.jsp">

                    <div class="form-group">
                        <label for="addSportart">Sportart:</label>
                        <input id="addSportart" name="addSportart" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addSparte">Jugendsparte:</label>
                        <input id="addSparte" name="addSparte" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addSportplatz">Sportplatz:</label>
                        <input id="addSportplatz" name="addSportplatz" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addDate">Datum:</label>
                        <input id="addDate" name="addDate" type="date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addTime">Uhrzeit:</label>
                        <input id="addTime" name="addTime" type="time" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Hinzufügen</button>
                </form>
            </div>


            <script>
                $('.table-remove').click(function () {
                    $(this).parents('tr').detach();
                });
            </script>

        </div>
    </div>
</div>
<!-- /2nd section -->


<!-- third section - Ergebnisse bearbeiten -->
<div id="editErgebnisse" class="pad-section">
    <div class="container">
        <h2 class="text-center">Ergebnisse bearbeiten</h2>
        <hr/>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_50mEdit">
                <%
                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>50-Meter-Sprint Ergebnisse bearbeiten</h3>");
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Ergebniss-ID</th>");
                            out.println("<th>Vorname</th>");
                            out.println("<th>Nachname</th>");
                            out.println("<th>Alter</th>");
                            out.println("<th>Zeit in s</th>");
                            out.println("<th>Verein</th>");
                            out.println("<th>Sparte</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT ID, Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Zeit, Verein, Sparte FROM 50meterlauf";
                            pS = connection.prepareStatement(query);
                            rS50Meter = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rS50Meter.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/editErgebnis50Meter.jsp'>");
                                out.println("<td><input type='text' name='id50' value='" + rS50Meter.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='vorname50' value='" + rS50Meter.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='nachname50' value='" + rS50Meter.getString(3) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='alter50' value='" + rS50Meter.getString(4) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='zeit50' value='" + rS50Meter.getString(5) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='verein50' value='" + rS50Meter.getString(6) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='sparte50' value='" + rS50Meter.getString(7) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/delete50.jsp'>");
                                out.println("<input type='text' name='del50' value='" + rS50Meter.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Löschen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_50mAdd">
                <h3 class="text-center">50-Meter-Sprint Ergebnisse hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/add50m.jsp">

                    <div class="form-group">
                        <label for="addVorname50">Vorname:</label>
                        <input id="addVorname50" name="addVorname50" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addNachname50">Nachname:</label>
                        <input id="addNachname50" name="addNachname50" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addAlter50">Geburtstag:</label>
                        <input id="addAlter50" name="addAlter50" type="date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addZeit50">Zeit:</label>
                        <input id="addZeit50" name="addZeit50" type="time" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addVerein50">Verein:</label>
                        <input id="addVerein50" name="addVerein50" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="addSparte50">Sparte:</label>
                        U<input id="addSparte50" name="addSparte50" type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Hinzufügen</button>
                </form>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_100mEdit">
                <%
                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>100-Meter-Sprint Ergebnisse bearbeiten</h3>");
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Ergebniss-ID</th>");
                            out.println("<th>Vorname</th>");
                            out.println("<th>Nachname</th>");
                            out.println("<th>Alter</th>");
                            out.println("<th>Zeit in s</th>");
                            out.println("<th>Verein</th>");
                            out.println("<th>Sparte</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT ID,Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Zeit, Verein, Sparte FROM 100meterlauf";
                            pS = connection.prepareStatement(query);
                            rS100Meter = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rS100Meter.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/editErgebnis100.jsp'>");
                                out.println("<td><input type='text' name='id100' value='" + rS100Meter.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='vorname100' value='" + rS100Meter.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='nachname100' value='" + rS100Meter.getString(3) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='alter100' value='" + rS100Meter.getString(4) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='zeit100' value='" + rS100Meter.getString(5) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='verein100' value='" + rS100Meter.getString(6) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='sparte100' value='" + rS100Meter.getString(7) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/delete100.jsp'>");
                                out.println("<input type='text' name='del100' value='" + rS100Meter.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Löschen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_100mAdd">
                <h3 class="text-center">100-Meter-Sprint Ergebnisse hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/add100m.jsp">

                    <div class="form-group">
                        <label for="addVorname100">Vorname:</label>
                        <input id="addVorname100" name="addVorname100" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addNachname100">Nachname:</label>
                        <input id="addNachname100" name="addNachname100" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addAlter100">Geburtstag:</label>
                        <input id="addAlter100" name="addAlter100" type="date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addZeit100">Zeit:</label>
                        <input id="addZeit100" name="addZeit100" type="time" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addVerein100">Verein:</label>
                        <input id="addVerein100" name="addVerein100" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="addSparte100">Sparte:</label>
                        U<input id="addSparte100" name="addSparte100" type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Hinzufügen</button>
                </form>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_weitSEdit">
                <%
                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>Weitsprung Ergebnisse bearbeiten</h3>");
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Ergebniss-ID</th>");
                            out.println("<th>Vorname</th>");
                            out.println("<th>Nachname</th>");
                            out.println("<th>Alter</th>");
                            out.println("<th>Weite in m</th>");
                            out.println("<th>Verein</th>");
                            out.println("<th>Sparte</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT ID,Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Weite, Verein, Sparte FROM weitsprung";
                            pS = connection.prepareStatement(query);
                            rSWeitsprung = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rSWeitsprung.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/editErgebnisWS.jsp'>");
                                out.println("<td><input type='text' name='idWS' value='" + rSWeitsprung.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='vornameWS' value='" + rSWeitsprung.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='nachnameWS' value='" + rSWeitsprung.getString(3) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='alterWS' value='" + rSWeitsprung.getString(4) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='zeitWS' value='" + rSWeitsprung.getString(5) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='vereinWS' value='" + rSWeitsprung.getString(6) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='sparteWS' value='" + rSWeitsprung.getString(7) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/deleteWS.jsp'>");
                                out.println("<input type='text' name='delWS' value='" + rSWeitsprung.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Löschen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_weitSAdd">
                <h3 class="text-center">Weitsprung Ergebnisse hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/addWS.jsp">

                    <div class="form-group">
                        <label for="addVornameWS">Vorname:</label>
                        <input id="addVornameWS" name="addVornameWS" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addNachnameWS">Nachname:</label>
                        <input id="addNachnameWS" name="addNachnameWS" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addAlterWS">Geburtstag:</label>
                        <input id="addAlterWS" name="addAlterWS" type="date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addZeitWS">Weite:</label>
                        <input id="addZeitWS" name="addZeitWS" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addVereinWS">Verein:</label>
                        <input id="addVereinWS" name="addVereinWS" type="text" class="form-control">
                    </div>
                     <div class="form-group">
                        <label for="addSparteWS">Sparte:</label>
                        U<input id="addSparteWS" name="addSparteWS" type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Hinzufügen</button>
                </form>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_weitWEdit">
                <%
                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>Weitwurf Ergebnisse bearbeiten</h3>");
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Ergebniss-ID</th>");
                            out.println("<th>Vorname</th>");
                            out.println("<th>Nachname</th>");
                            out.println("<th>Alter</th>");
                            out.println("<th>Weite in m</th>");
                            out.println("<th>Verein</th>");
                            out.println("<th>Sparte</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT ID,Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Meter, Verein, Sparte FROM weitwurf";
                            pS = connection.prepareStatement(query);
                            rSWeitwurf = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rSWeitwurf.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/editErgebnisWW.jsp'>");
                                out.println("<td><input type='text' name='idWW' value='" + rSWeitwurf.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='vornameWW' value='" + rSWeitwurf.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='nachnameWW' value='" + rSWeitwurf.getString(3) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='alterWW' value='" + rSWeitwurf.getString(4) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><input type='text' name='zeitWW' value='" + rSWeitwurf.getString(5) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='vereinWW' value='" + rSWeitwurf.getString(6) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><input type='text' name='sparteWW' value='" + rSWeitwurf.getString(7) + "' class='form-control' style:\"width:20px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/deleteWW.jsp'>");
                                out.println("<input type='text' name='delWW' value='" + rSWeitwurf.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Löschen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_weitWAdd">
                <h3 class="text-center">Weitwurf Ergebnisse hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/addWW.jsp">

                    <div class="form-group">
                        <label for="addVornameWW">Vorname:</label>
                        <input id="addVornameWW" name="addVornameWW" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addNachname50">Nachname:</label>
                        <input id="addNachnameWW" name="addNachnameWW" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addAlterWW">Geburtstag:</label>
                        <input id="addAlterWW" name="addAlterWW" type="date" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addZeitWW">Weite:</label>
                        <input id="addZeitWW" name="addZeitWW" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="addVereinWW">Verein:</label>
                        <input id="addVereinWW" name="addVereinWW" type="text" class="form-control">
                    </div>
                     <div class="form-group">
                        <label for="addSparteWW">Sparte:</label>
                        <input id="addSparteWW" name="addSparteWW" type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success">Hinzufügen</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /third section -->

<div id="editAdmins" class="pad-section">
    <div class="container">
        <h2 class="text-center">Administratoren bearbeiten</h2>
        <hr/>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-6" id="div_adminsBearbeiten">
                <%
                    try {
                        String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                        Connection connection = null;
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        connection = DriverManager.getConnection(connectionURL, "root", "");
                        if (!connection.isClosed()) {

                            out.println("<h3>Administratoren bearbeiten</h3>");
                            //Tabelle in Form

                            out.println("<table class=\"table table-editable\" cellspacing='0' cellpadding='10'>");
                            out.println("<thead class=\"thead-inverse\">");
                            out.println("<tr>");
                            out.println("<th>Admin-ID</th>");
                            out.println("<th>E-Mail</th>");
                            out.println("</tr>");
                            out.println("</thead>");

                            query = "SELECT ID,username FROM admins";
                            pS = connection.prepareStatement(query);
                            rSAdmins = pS.executeQuery();
                            //Tabelle füllen mit den Daten aus der DB
                            while (rSAdmins.next()) {
                                // rowsCounter++;
                                out.println("<tr>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/changeMail.jsp'>");
                                out.println("<td><input type='text' name='idAdmin' value='" + rSAdmins.getString(1) + "' class='form-control' readonly style:\"width:30px\"></td>");
                                out.println("<td><input type='text' name='usernameAdmin' value='" + rSAdmins.getString(2) + "' class='form-control' style:\"width:40px\"></td>");
                                out.println("<td><button type='submit' class='btn btn-success'>Mail speichern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' method='post' action='/SportfestOnePager/admin/changePassword.jsp?adminID="+rSAdmins.getString(1)+"'>");
                                out.println("<input type='text' name='changePW' value='" + rSAdmins.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' name='btnChangePW' id='btnChangePW' class='btn btn-primary'>Passwort ändern</button></td>");
                                out.println("</form>");
                                out.println("<form role='form' action='/SportfestOnePager/functions/deleteAdmin.jsp'>");
                                out.println("<input type='text' name='delAdmin' value='" + rSAdmins.getString(1) + "' hidden>");
                                out.println("<td><button type='submit' class='btn btn-danger'>Entfernen</button></td>");
                                out.println("</form>");
                                out.println("</tr>");

                            }

                            out.println("</table>");


                            //out.println("<button action='../functions/editTermin' type='submit'class='btn btn-success'>Speichern</button>");

                            connection.close();

                        }


                    } catch (Exception ex) {
                        out.println("Unable to connect to database" + ex);
                    }

                %>
            </div>
            <div class="col-sm-3 col-xs-6" id="div_adminsAdd">
                <h3 class="text-center">Administrator hinzufügen</h3>
                <form role="form" action="${pageContext.request.contextPath}/sendmail" method="post">
                    <div class="form-group">
                        <label for="addAdminMail">E-Mail Adresse:</label>
                        <input id="addAdminMail" class="form-control" name="addAdminMail" type="text" required>
                    </div>

                    <button type="submit" class="btn btn-success">Hinzufügen</button>

                </form>
            </div>


            <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modeltitle">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="modeltitle">Passwort ändern</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form" data-toggle="validator" action="">
                                <div class="form-group">
                                    <label for="adminID">Admin-ID:</label>
                                    <input class="form-control" type="password" id="adminID" name="adminID" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="oldPW">Altes Passwort:</label>
                                    <input class="form-control" type="password" id="oldPW" name="oldPW" required>
                                </div>
                                <div class="form-group">
                                    <label for="newPW1">Neues Passwort:</label>
                                    <input class="form-control" type="password" id="newPW1" name="newPW1" required>
                                </div>
                                <div class="form-group">
                                    <label for="newPW2">Neues Passwort wiederholen:</label>
                                    <input class="form-control" type="password" id="newPW2" data-match="#newPW1"
                                           data-match-error="Passwörter stimmen nicht überein." required>
                                </div>
                                <div class="help-block with-errors"></div>
                                <button type="submit" data-dismiss="modal" class="btn btn-primary">Übernehmen</button>
                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </div>
    </div>
</div>


<div id="editTexts" class="pad-section">
    <div class="container">
        <h2 class="text-center">Texte hinzufügen</h2>
        <div class="row text-center">
            <div class="col-sm-6 col-xs-6" id="textebearbeiten">
                <h3 class="text-center">Texte bearbeiten</h3>
                <%
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {
                        String selectCount = "SELECT COUNT(*) FROM texts";
                        String queryContent = "SELECT * from texts";
                        Statement content = connection.createStatement();
                        Statement count = connection.createStatement();
                        ResultSet countS = count.executeQuery(selectCount);
                        ResultSet contentRS = content.executeQuery(queryContent);

                        countS.next();
                        int countAll = countS.getInt(1);

                        if (countAll > 0) {
                            for (int i = 0; i < countAll; i++) {
                                if (contentRS.next()) {%>

                <div class='form-change-text'>
                    <form role='form' action='/SportfestOnePager/functions/editArticle.jsp' id='form-change-text' method="get">
                        <div class='form-group'>
                            <label for='textID'>Text-ID:</label>
                            <input class='form-control' type='text' id='textID' name='textID'
                                   value='<%=contentRS.getInt(1)%>' readonly>
                        </div>
                        <div class='form-group'>
                            <label for='textHeader'>Artikel-Überschrift:</label>
                            <input class='form-control' type='text' id='textHeader' name='textHeader'
                                   value='<%=contentRS.getString(2)%>'>
                        </div>
                        <div class='form-group'>
                            <label for='textContent'>Artikel-Inhalt:</label>
                            <textarea maxlength='4000' class='form-control' rows='5' type='text' id='textContent' name='textContent'><%=contentRS.getString(3)%></textarea>
                        </div>
                            <button type='submit' class='btn btn-success'>Speichern</button>
                    </form>
                            <form role="form" action="/SportfestOnePager/functions/deleteText.jsp" method="get">
                                <input class='form-control' type='hidden' id='textIDDel' name='textIDDel'
                                       value='<%=contentRS.getInt(1)%>'>
                                <button type='submit' class='btn btn-danger'>Löschen</button>
                            </form>


                </div>

                <!--
                                    out.println("<div class='form-change-text'>");
                                    out.println(" <form role='form' action='' id='form-change-text'>");

                                    out.println("<div class='form-group'>");
                                    out.println("    <label for='textID'>Text-ID:</label>");
                                    out.println("    <input class='form-control' type='text' id='textID' name='textID' value='" + contentRS.getInt(1) + "' readonly>");
                                    out.println("</div>");

                                    out.println("<div class='form-group'>");
                                    out.println("    <label for='textHeader'>Artikel-Überschrift:</label>");
                                    out.println("    <input class='form-control' type='text' id='textHeader' name='textHeader' value='" + contentRS.getString(2) + "'>");
                                    out.println("</div>");

                                    out.println("<div class='form-group'>");
                                    out.println("    <label for='textContent'>Artikel-Inhalt:</label>");
                                    out.println("    <textarea class='form-control' rows='5' type='text' id='textContent' name='textContent'>" + contentRS.getString(3) + "</textarea>");
                                    out.println("</div>");

                                    out.println("  <button type='submit' class='btn btn-success'>Speichern</button>");
                                    out.println(" </form>");
                                    out.println("</div>");
                                    -->
                <%
                                }
                            }
                        } else {
                                    %>

                <h4 class="text-center">Keine Texte vorhanden</h4>

                <%
                        }
                connection.close();

                    }
                %>
            </div>
            <div class="col-sm-6 col-xs-6">
                <h3 class="text-center">Text hinzufügen</h3>
                <form role="form" action="/SportfestOnePager/functions/addArticle.jsp" method="get">
                    <div class='form-group'>
                        <label for='textHeaderIn'>Artikel-Überschrift:</label>
                        <input class='form-control' type='text' id='textHeaderIn' name='textHeaderIn' required>
                    </div>
                    <div class='form-group'>
                        <label for='textContentIn'>Artikel-Inhalt:</label>
                        <textarea maxlength='4000' class='form-control' rows='5' type='text' id='textContentIn' name='textContentIn' required></textarea>
                    </div>
                    <button type='submit' class='btn btn-success'>Speichern</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="editBilder" class="pad-section">
    <div class="container">
        <h2 class="text-center">Fotos hinzufügen</h2>
        <div class="row text-center">
            <div class="col-sm-9 col-xs-9" id="bilderBearbeiten">
                <h3 class="text-center">Fotos bearbeiten</h3>
                <%
                    String connectionURL1 = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection1 = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection1 = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection1.isClosed()) {
                        String selectCount = "SELECT COUNT(*) FROM texts";
                        String queryContent = "SELECT * from bilder";
                        Statement content = connection1.createStatement();
                        Statement count = connection1.createStatement();
                        ResultSet countS = count.executeQuery(selectCount);
                        ResultSet contentRS1 = content.executeQuery(queryContent);

                        countS.next();
                        int countAll = countS.getInt(1);

                        %>
                    <table class="table table-editable" cellspacing='0' cellpadding='10'>
                        <thead class="thead-inverse">
                        <tr>
                            <th>ID</th>
                            <th>Quelle</th>
                            <th>Link</th>
                            <th>Beschreibung</th>
                        </tr>
                        </thead>


                <%
                        while(contentRS1.next()){
                        	String r = contentRS1.getString(2);
                            String[] parts = r.split("/WebContent");
                            String relPath = "/SportfestOnePager"+parts[1];
                            %>
                    <tr>
                        <form role="form" action="/SportfestOnePager/functions/editImages.jsp" method="get">
                            <td><input type="text" class="form-control" name="bildID" value="<%=contentRS1.getInt(1)%>"  readonly></td>
                            <td><input type="text" class="form-control" name="bildSRC" value="<%=contentRS1.getString(2)%>"></td>
                            <td><a href="<%=relPath%>">Ansehen</a></td>
                            <td><input type="text" class="form-control" name="bildDesc" value="<%=contentRS1.getString(3)%>"></td>
                            <td><button type="submit" class="btn btn-success">Speichern</button></td>
                        </form>
                        <form role="form" action="/SportfestOnePager/functions/deleteImage.jsp" method="get">
                            <td><input type="hidden" class="form-control" name="bildID" value="<%=contentRS1.getInt(1)%>"  readonly></td>
                            <td><input type="hidden" class="form-control" name="bildSRC" value="<%=contentRS1.getString(2)%>"></td>
                            <td><button type="submit" class="btn btn-danger">Entfernen</button></td>
                        </form>
                    </tr>

                <%
                        }
                    }
                %>
                    </table>
            </div>
            <div class="col-sm-3 col-xs-3" id="bilderHochladen">
                <h3 class="text-center">Fotos hochladen</h3>
                <div style="padding-top: 25px; padding-bottom: 25px;">
                    <form role="form" action="/SportfestOnePager/ImageUpload" encType="multipart/form-data" method="post">
                        <div class="btn-group">
                            <a class='btn btn-primary' href='javascript:;'>
                                Datei auswählen
                                <input type="file" id="input_file"
                                       style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;'
                                       name="file" size="40" onchange='$("#upload-file-info").html($(this).val());'>

                            </a>
                            &nbsp;
                            <span class='label label-info' id="upload-file-info"></span>
                        </div>
                        <br><br>
                        <input type="submit" class="btn btn-default" id="btn_submit" value="Hochladen">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
