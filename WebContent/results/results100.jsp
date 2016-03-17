<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ergebnisse ansehen</title>

<script src="../script/jquery-1.12.0.min.js"></script>
<script src="../script/bootstrap.js"></script>
<script src="../script/validate.js"></script>
<link rel="stylesheet" type="text/css" href="../script/bootstrap.css">
<link href="resultStyles.css" rel="stylesheet" />



<!-- Include jQuery Mobile stylesheets -->
<link rel="stylesheet"
	href="../script/jquery.mobile.css">

<!-- Include the jQuery Mobile library -->
<script
	src="../script/jquery.mobile.js"></script>

</head>
<body>

	<!-- navigation panel -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="/SportfestOnePager/index.jsp" rel="external">Zurück zur Startseite</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse-main">
				<ul class="nav navbar-nav navbar-right">
				<li><a href="/SportfestOnePager/results/results.jsp">50-Meter-Sprints</a></li>
					<li><a href="/SportfestOnePager/results/results100.jsp">100-Meter-Sprints</a></li>
					<li><a href="/SportfestOnePager/results/resultsWS.jsp">Weitsprung</a></li>
					<li><a href="/SportfestOnePager/results/resultsWW.jsp">Weitwurf</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>


	<div id="ergebnisse100M" class="pad-section">
		<div class="container">
			<h2 class="text-center">Ergebnisse der 100-Meter-Sprints</h2>
		<div data-role="main" class="ui-content">
			<form>
			<input id="filter-input-table2" data-type="search" placeholder="Ergebnisse suchen...">
			</form>
		</div>
		
		<table data-role="table" data-mode="columntoggle" class="ui-responsive ui-shadow" id="100M" data-filter="true" data-input="#filter-input-table2">
		<thead>
		<tr>
			<th data-priority="3">Vorname</th>
			<th>Nachname</th>
			<th data-priority="5">Geburtstag</th>
			<th data-priority="1">Zeit (in s)</th>
			<th data-priority="4">Verein</th>
			<th data-priority="2">Sparte</th>
		</tr>
		</thead>
		<tbody>
			
				<%
                    String connectionURL = "jdbc:mysql://localhost:3306/sportfest";
                    Connection connection = null;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "");
                    if (!connection.isClosed()) {
                      
                        String queryContent = "SELECT Vorname, Nachname, date_format(Geburtstag, '%d.%m.%Y') AS datum, Zeit, Verein, Sparte from 100meterlauf";
                        Statement content = connection.createStatement();
                        Statement count = connection.createStatement();
                        ResultSet contentRS = content.executeQuery(queryContent);

                        

                        
                            while (contentRS.next()) {
                               %>
                                
                                <tr>
                                	<td><%=contentRS.getString(1)%></td>
                                	<td><%=contentRS.getString(2)%></td>
                                	<td><%=contentRS.getString(3)%></td>
                                	<td><%=contentRS.getString(4)%></td>
                                	<td><%=contentRS.getString(5)%></td>
                                	<td><%=contentRS.getString(6)%></td>
                                <tr>
                                
                                <%
                                
                            }
                           
                	
                               
                        connection.close();
                    }
                                %>
			
			
		</tbody>
		</table>
		
		
		
		</div>
	</div>
	
	</body>
</html>