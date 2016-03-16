<%@ page import="java.sql.*"%><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 17.02.2016
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

<meta charset="utf-8" />

<meta name="author" content="Jan Kipka" />

<title>Sportfest Hessen 2016</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<script src="script/jquery-1.12.0.min.js"></script>
<script src="script/bootstrap.js"></script>
<script src="script/validate.js"></script>
<link rel="stylesheet" type="text/css" href="script/bootstrap.css">
<link href="script/style.css" rel="stylesheet" />


</head>

<body>

	<!-- navigation panel -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-collapse-main">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Sportfest Hessen 2016</a>
			</div>

			<div class="collapse navbar-collapse" id="navbar-collapse-main">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#home">Home</a></li>
					<li><a href="#termine">Termine</a></li>
					<li><a href="#wettkaempfe">Wettkämpfe</a></li>
					<li><a href="#information">Informationen</a></li>
					<li><a href="#google_map">Kontakt</a></li>
					<li><a href="admin/login.jsp">Login</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- first section - Home -->
	<div id="home" class="home">
		<div class="text-vcenter">
			<h1>Willkommen!</h1>
			<h3>Willkommen auf der offiziellen Seite des Sportfests Hessen!</h3>
			<a href="#about" class="btn btn-default btn-lg">Mehr erfahren</a>
		</div>
	</div>
	<!-- /first section -->

	<!-- second section - About -->
	<div id="termine" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" id="logo">
					<img src="images/Logo.png" alt="" />
				</div>
				<div class="col-sm-9 text-center">
					<h2>Die Termine der Wettkämpfe</h2>
					<%
						PreparedStatement pS;
						String query;
						ResultSet rS;
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
								out.println("<th>Sportart</th>");
								out.println("<th>Sportplatz</th>");
								out.println("<th>Datum</th>");
								out.println("<th>Uhrzeit</th>");
								out.println("</tr>");
								out.println("</thead>");

								query = "SELECT Beschreibung,ort, date_format(Datum, '%e.%m.%Y') AS datum, uhrzeit FROM termine";
								pS = connection.prepareStatement(query);
								rS = pS.executeQuery();
								//Tabelle füllen mit den Daten aus der DB
								while (rS.next()) {
									out.println("<tr>");
									out.println("<td>" + rS.getString(1) + "</td>");
									out.println("<td>" + rS.getString(2) + "</td>");
									out.println("<td>" + rS.getString(3) + "</td>");
									out.println("<td>" + rS.getString(4) + "</td>");
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
	</div>
	<!-- /second section -->

	<!-- third section - Services -->
	<div id="wettkaempfe" class="pad-section">
		<div class="container">
			<h2 class="text-center">Die Wettkämpfe</h2>
			<hr />
			<div class="row text-center">
				<div class="col-sm-4 col-xs-6" id="div_werfen">
					<img class="img-responsive img-rounded" src="images/weitwurf.jpg"
						width="304" height="236">Zu den Ergebnissen</img>
					<h4>Werfen</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
				<div class="col-sm-4 col-xs-6" id="div_sprint">
					<img class="img-responsive img-rounded" src="images/50m.jpg"
						width="304" height="236">Zu den Ergebnissen</img>
					<h4>Sprint</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
				<div class="col-sm-4 col-xs-6" id="div_sprung">
					<img class="img-responsive img-rounded"
						src="images/weitsprung2.jpg" width="304" height="236">Zu den
					Ergebnissen</img>
					<h4>Weitsprung</h4>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Donec in sem cras amet. Donec in sem cras amet.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- /third section -->


	<!-- fourth section - Information -->
	<div id="information" class="pad-section">
		<div class="container">

			<%
				PreparedStatement pSM;
				String queryS;
				ResultSet rSS;
				int textSize = 0;
				int rows = 0;
				try {
					String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
					Connection connection = null;
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					connection = DriverManager.getConnection(connectionURL, "root", "");
					if (!connection.isClosed()) {
						queryS = "SELECT COUNT(*) FROM texts";
						pSM = connection.prepareStatement(queryS);
						rSS = pSM.executeQuery();
						rSS.next();
						textSize = rSS.getInt(1);

						if (textSize > 0) {
							if (textSize % 2 == 0) {
								//Genau anzahl columns
								rows = textSize / 2;
								if (textSize > 2) {
									textSize = 2;
								}
								int pointer = 1;
								String queryHeader = "SELECT Header from texts";
								String queryContent = "SELECT Content from texts";
								Statement header = connection.createStatement();
								Statement content = connection.createStatement();
								ResultSet headerRS = header.executeQuery(queryHeader);
								ResultSet contentRS = content.executeQuery(queryContent);

								for (int i = 0; i < rows; i++) {
									out.println("<div class=\"row\">");
									for (int j = 0; j < textSize; j++) {
										if (headerRS.next() && contentRS.next()) {
											String contentS = contentRS.getString(1);
											System.out.println(contentS);
											out.println("<div class=\"col-sm-6\">");
											out.println("<div class=\"panel panel-default\">");
											out.println("<div class=\"panel-heading\">");
											out.println("<h2 class=\"panel-title\">" + headerRS.getString(1) + "</h2>");
											out.println("</div>");
											out.println("<div class=\"panel-body lead\">");
											out.println(contentS);
											out.println("</div>");
											out.println("</div>");
											out.println("</div>");
										}

									}
									out.println("</div>");
								}

							} else {
								//Einen mehr
								rows = (textSize / 2) + 1;
								if (textSize > 2) {
									textSize = 2;
								}
								int pointer = 1;
								String queryHeader = "SELECT Header from texts";
								String queryContent = "SELECT Content from texts";
								Statement header = connection.createStatement();
								Statement content = connection.createStatement();
								ResultSet headerRS = header.executeQuery(queryHeader);
								ResultSet contentRS = content.executeQuery(queryContent);

								for (int i = 0; i < rows; i++) {
									out.println("<div class=\"row\">");
									for (int j = 0; j < textSize; j++) {
										if (headerRS.next() && contentRS.next()) {

											String contentS = contentRS.getString(1);
											System.out.println(contentS);
											out.println("<div class=\"col-sm-6\">");
											out.println("<div class=\"panel panel-default\">");
											out.println("<div class=\"panel-heading\">");
											out.println("<h2 class=\"panel-title\">" + headerRS.getString(1) + "</h2>");
											out.println("</div>");
											out.println("<div class=\"panel-body lead\">");
											out.println(contentS);
											out.println("</div>");
											out.println("</div>");
											out.println("</div>");
										}

									}
									out.println("</div>");
								}

							}

							connection.close();
						} else {

							out.println("<p>Noch keine Informationen vorhanden.</p>");

						}
					}

				} catch (Exception e) {
					out.println("<p style: 'color: red'>Fehler beim Lesen der Datenbank.</p>");
				}
			%>

			<!--
      <div class="col-sm-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">Additional information</h2>
          </div>
          <div class="panel-body lead">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet.
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">Additional information</h2>
          </div>
          <div class="panel-body lead">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed hendrerit adipiscing blandit. Aliquam placerat, velit a fermentum fermentum, mi felis vehicula justo, a dapibus quam augue non massa. Duis euismod, augue et tempus consequat, lorem mauris porttitor quam, consequat ultricies mauris mi a metus. Phasellus congue, leo sed ultricies tristique, nunc libero tempor ligula, at varius mi nibh in nisi. Aliquam erat volutpat. Maecenas rhoncus, neque facilisis rhoncus tempus, elit ligula varius dui, quis amet.
          </div>
        </div>
      </div>
      -->
		</div>
	</div>
	<!-- /fourth section -->

	<!-- fifth section -->
	<div id="services" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<h3>So finden Sie unseren Sportplatz</h3>
					<h4>Berechnen Sie Ihre Route mit Google Maps</h4>
				</div>
			</div>
			<div class="row" style="padding-top:50px">
				<div class="col-sm-12 center">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d941.2941965827928!2d8.573887114015815!3d50.1050126495043!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x373b4b4339d86245!2sSG+1877+Frankfurt%2FNied+e.V.!5e1!3m2!1sde!2sde!4v1458118725363" width="100%" height="650" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<footer>
		<hr />
		<div class="container">
			<p style="text-align: center">
				<!--Facebook icon-->
				<a href="http://facebook.com/flashissue" target="_blank"><img
					alt=""
					src="/SportfestOnePager/images/facebook.png" />
				</a>&nbsp; &nbsp; &nbsp;
				<!--Google+ icon-->
				<a href="http://plus.google.com" target="_blank"><img alt=""
					src="/SportfestOnePager/images/google.png" />
				</a>&nbsp; &nbsp;&nbsp;
				<!--Twitter icon-->
				<a href="http://twitter.com/flashissue" target="_blank"><img
					alt=""
					src="/SportfestOnePager/images/twitter.png" />
				</a>&nbsp; &nbsp;&nbsp;
				<!--Linkedin icon-->
				<a href="http://pinterest.com" target="_blank"><img alt=""
					src="/SportfestOnePager/images/pinterest.png" />
				</a>
			</p>
			<p class="text-right">Copyright &copy; Sportfest Hessen 2016</p>
		</div>
	</footer>
	<!-- /footer -->






</body>

</html>
