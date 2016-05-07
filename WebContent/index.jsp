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

<link rel="icon" href="images/Logo2.png">

<meta charset="utf-8" />

<meta name="author" content="Jan Kipka & Jannis Stegmann" />

<title>Sportfest Hessen 2016</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<script src="script/jquery-1.12.0.min.js"></script>
<script src="script/bootstrap.js"></script>
<script src="script/validate.js"></script>
<link href="script/bootstrap.css" rel="stylesheet" type="text/css">
<link href="script/style.css" rel="stylesheet">

</head>

<body link="white">

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
					<li><a href="#galerie">Galerie</a></li>
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
			<div style="max-width: 1000px; margin: auto; background-color:rgba(116, 204, 0, 0.7); padding: 30px">
				<h1>Sportfest Hessen 2016 <img src="images/Logo2.png" alt="logo" width="60" height="73"/></h1>
				<h2>Willkommen auf der offiziellen Seite des Sportfests Hessen!</h2>
				<h3>
					<p>Das Sportfest entstand aus der Idee alle interessierten jungen 
					Menschen Hessens in einem Leichtathletik-Wettbewerb zu vereinen.</p>
					<p>Auf der Seite finden Sie Termine zu kommenden Wettkämpfen, die verschiedenen Wettkampfarten 
					sowie weitere Informationen, eine Fotogalerie und unsere Kontaktdaten mit einer Anfahrtsbeschreibung.</p>
				</h3>
				<br>
				<h4>Sie sind Administrator? Dann melden Sie sich bitte über „Login“ rechts oben an.</h4>				
			</div>
			<div style="max-width: 1000px; margin: auto; text-align: center; background-color:rgba(255, 255, 255, 0.8); padding: 10px"">
					<!--Facebook icon-->
					<a href="http://facebook.com/flashissue" target="_blank"><img alt=""
						src="/SportfestOnePager/images/facebook.png" />
					</a>&nbsp; &nbsp; &nbsp;
					<!--Google+ icon-->
					<a href="http://plus.google.com" target="_blank"><img alt=""
						src="/SportfestOnePager/images/google.png" />
					</a>&nbsp; &nbsp;&nbsp;
					<!--Twitter icon-->
					<a href="https://twitter.com/SportfestHessen" target="_blank"><img alt=""
						src="/SportfestOnePager/images/twitter.png" />
					</a>&nbsp; &nbsp;&nbsp;
					<!--Linkedin icon-->
					<a href="http://pinterest.com" target="_blank"><img alt=""
						src="/SportfestOnePager/images/pinterest.png" />
					</a>
				</div>
				
			
			<!-- <a href="#about" class="btn btn-default btn-lg">Mehr erfahren</a> -->
			
		</div>
	</div>
	<!-- /first section -->

	<!-- second section - Termine -->
	<div id="termine" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-3" id="logo">
					<img src="images/Logo.png" alt="logo" style="padding-top: 20px" />
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

	<!-- third section - Wettkämpfe -->
	<div id="wettkaempfe" class="pad-section">
		<div class="container">
			<h2 class="text-center">Die Wettkämpfe</h2>
			<hr/>
			<div class="row text-center">
				<div class="col-sm-3 col-xs-6" id="div_sprint">
					<h4>50-Meter-Sprint</h4>
					<img class="img-responsive img-rounded" src="images/50m.jpg" width="304" height="236"></img>
					<p><br><a href="http://localhost:8080/SportfestOnePager/results/results.jsp" class="btn btn-default">Zu den Ergebnissen</a></p>
					<span>"Der <a href="https://de.wikipedia.org/wiki/50-Meter-Lauf">50-Meter-Sprint</a> ist 
						für Kinder unter 12 Jahren die reguläre Sprintdisziplin. 
						Ab der nächsten Altersgruppe wird dann die Sprintdistanz verlängert. 
						50 Meter werden auf einer ausschließlich geraden Strecke gelaufen, 
						wobei jeder Läufer in seiner eigenen Bahn bleiben muss. 
						Gestartet wird im Tiefstart mit Hilfe von Startblöcken." 
						Vgl. <a href="https://de.wikipedia.org/wiki/50-Meter-Lauf">Wikipedia</a>
					</span>
				</div>
				<div class="col-sm-3 col-xs-6" id="div_sprint">
					<h4>100-Meter-Sprint</h4>
					<img class="img-responsive img-rounded" src="images/100meter2.jpg" width="304" height="236"></img>
					<p><br><a href="http://localhost:8080/SportfestOnePager/results/results100.jsp" class="btn btn-default">Zu den Ergebnissen</a></p>
					<span>"Der <a href="https://de.wikipedia.org/wiki/100-Meter-Lauf">100-Meter-Sprint</a> 
						ist eine Sprintdisziplin in der Leichtathletik und wird auf einer geraden Strecke ausgetragen, 
						wobei jeder Läufer vom Start bis zum Ziel in seiner eigenen Bahn bleiben muss. 
						Gestartet wird im Tiefstart mit Hilfe von Startblöcken. Bei den Olympischen Sommerspielen 
						ist die 100-Meter-Strecke die kürzeste Sprintdistanz." 
						Vgl. <a href="https://de.wikipedia.org/wiki/100-Meter-Lauf">Wikipedia</a>
					</span>
				</div>
				<div class="col-sm-3 col-xs-6" id="div_sprung">
					<h4>Weitsprung</h4>
					<img class="img-responsive img-rounded" src="images/weitsprung2.jpg" width="304" height="236"></img>
					<p><br><a href="http://localhost:8080/SportfestOnePager/results/resultsWS.jsp" class="btn btn-default">Zu den Ergebnissen</a></p>
					<span>"Als <a href="https://de.wikipedia.org/wiki/Weitsprung">Weitsprung</a> bezeichnet man eine 
						olympische Disziplin der Leichtathletik, in der ein Sportler versucht, nach einem Anlauf 
						mittels eines einzelnen Sprungs eine möglichst große Weite zu erzielen.
						Die besten Weitspringer erreichen bei den Männern fast neun Meter (Weltrekord: 8,95 m) 
						und bei den Frauen über sieben Meter (Weltrekord: 7,52 m)." 
						Vgl. <a href="https://de.wikipedia.org/wiki/Weitsprung">Wikipedia</a>
					</span>
				</div>
				<div class="col-sm-3 col-xs-6" id="div_sprung">
					<h4>Weitwurf</h4>
					<img class="img-responsive img-rounded" src="images/weitwurf.jpg" width="304" height="236"></img>
					<p><br><a href="http://localhost:8080/SportfestOnePager/results/resultsWW.jsp" class="btn btn-default">Zu den Ergebnissen</a></p>
					<span>"Der <a href="https://de.wikipedia.org/wiki/Ballwurf">Ballwurf</a> ist eine leichtathletische 
						Disziplin in der Kinder- und Jugendleichtathletik. Er ist im Bereich der Kinderleichtathletik die 
						erste Wurfdisziplin, bevor er in den älteren Jahrgängen durch die anspruchsvolleren Disziplinen 
						Speerwurf, Diskuswurf, Hammerwurf und Kugelstoßen abgelöst wird." 
						Vgl. <a href="https://de.wikipedia.org/wiki/Ballwurf">Wikipedia</a>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- /third section -->

	<!-- fourth section - Informationen -->
	<div id="information" class="pad-section">
		<div class="container">
			<h2 class="text-center">Allgemeine Informationen</h2>

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
		</div>
	</div>
	<!-- /fourth section -->
	
	<!-- fifth section - Galerie -->
	<div id="galerie" class="pad-section">
		<div class="container">
			<h2 class="text-center">Unsere Fotogalerie</h2>
			<hr/>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="images/gallery/picture1.jpg" alt="Fußball">
						<div class="carousel-caption">
							<h3>Fußball</h3>
							<p>Anstoß, das Spiel zur Erholung zwischen den harten Leichtathletikdisziplinen kann los gehen.</p>
						</div>
					</div>
				
					<div class="item">
						<img src="images/gallery/picture2.jpg" alt="Chania">
						<div class="carousel-caption">
							<h3>Weitwurf</h3>
							<p>Peter kurz vorm Abwurf.</p>
						</div>
					</div>
				
					<div class="item">
						<img src="images/gallery/picture3.jpg" alt="Chania">
						<div class="carousel-caption">
							<h3>Sprint</h3>
							<p>Usain Bolt zu Besuch in Frankfurt und liegt wie meistens vorne.</p>
						</div>
					</div>
				
					<div class="item">
						<img src="images/gallery/picture4.jpg" alt="Chania">
						<div class="carousel-caption">
							<h3>Sprint</h3>
							<p>Gerald beim Start.</p>
						</div>
					</div>
					
					<div class="item">
						<img src="images/gallery/picture5.jpg" alt="Chania">
						<div class="carousel-caption">
							<h3>Sprint</h3>
							<p>Auch die jungen Mädels sind dabei.</p>
						</div>
					</div>
				</div>
				
				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		
		
		</div>
	</div>
	<!-- /fifth section -->

	<!-- sixth section - Google Maps -->
	<div id="google_map" class="pad-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<h2>Kontakt und Anfahrt</h2>
					<span>Kontaktpersonen: <a href="mailto:jan.kipka@gmx.de">Jan Kipka</a>: +49 177 7482727 und <a href="mailto:jannis.stegmann@web.de">Jannis Stegmann</a>: +49 151 44501066 </span>
					<br><br>
					<h4>So finden Sie unseren Sportplatz. Berechnen Sie Ihre Route mit Google Maps.</h4>
				</div>
			</div>
			<div class="row" style="padding-top: 30px; padding-bottom: 30px">
				<div class="col-sm-12 center">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d941.2941965827928!2d8.573887114015815!3d50.1050126495043!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x373b4b4339d86245!2sSG+1877+Frankfurt%2FNied+e.V.!5e1!3m2!1sde!2sde!4v1458118725363" width="100%" height="650" frameborder="0" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- /sixth section -->
	
	<!-- footer -->
	<footer>
		<hr />
		<div class="container">
			<p style="text-align: center">
				<!--Facebook icon-->
				<a href="http://facebook.com/flashissue" target="_blank"><img alt=""
					src="/SportfestOnePager/images/facebook.png" />
				</a>&nbsp; &nbsp; &nbsp;
				<!--Google+ icon-->
				<a href="http://plus.google.com" target="_blank"><img alt=""
					src="/SportfestOnePager/images/google.png" />
				</a>&nbsp; &nbsp;&nbsp;
				<!--Twitter icon-->
				<a href="https://twitter.com/SportfestHessen" target="_blank"><img alt=""
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
