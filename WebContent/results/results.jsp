<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<!-- Include meta tag to ensure proper rendering and touch zooming -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Include jQuery Mobile stylesheets -->
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">

<!-- Include the jQuery library -->
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include the jQuery Mobile library -->
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

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
					<li><a href="../index.jsp#home">Home</a></li>
					<li><a href="../index.jsp#termine">Termine</a></li>
					<li><a href="../index.jsp#wettkaempfe">Wettkämpfe</a></li>
					<li><a href="../index.jsp#information">Informationen</a></li>
					<li><a href="../index.jsp#google_map">Kontakt</a></li>
					<li><a href="../admin/login.jsp">Login</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>


	<div id="resultChoice" class="pad-section">
	<div class="container">
		<h1 class="text-center">Ergebnisse der Wettbewerbe</h1>
		<form role="form" onsubmit="return validateInput()" action="" method="post">
		<div class="form-group">
			<label for="sportart">Sportart auswählen:</label>
			<select class="form-control" id="sportart" name="sportart">
				<option selected="selected">Auswählen</option>
				<option>50-Meter-Lauf</option>
				<option>100-Meter-Lauf</option>
				<option>Weitsprung</option>
				<option>Weitwurf</option>
			</select>
			<br>
			<label for="sparte" id="sparteLabel">Sparte auswählen:</label>
			<select class="form-control" id="sparte" name="sparte">
				<option selected="selected">Auswählen</option>
				<option>U 10</option>
				<option>U 12</option>
				<option>U 14</option>
				<option>U 16</option>
				<option>U 18</option>
				<option>U 20</option>
			</select>
			</div>
			<button type="submit" class="btn btn-success" id="button">Anzeigen</button>
		</form>
		
		<table class="table" cellspacing='0' id="table" cellpadding='10'>
		<thead class="thead-inverse">
		<tr>
		<th>Vorname</th>
		<th>Nachname</th>
		<th>
		</tr>
		</thead>
		</table>
	</div>
	
	
	
	</div>


<script>
	window.onload = function(){
		var input = document.getElementById('sparte');
		input.style.visibility = 'hidden';
		var label = document.getElementById('sparteLabel');
		label.style.visibility = 'hidden';
		var table = document.getElementById('table');
		table.style.visibility = 'hidden';
		var button = document.getElementById('button');
		button.style.visibility = 'hidden';
		var sportart = document.getElementById('sportart');
		sportart.onchange = function(){
			if(sportart.options.value != 'Auswählen'){
			input.style.visibility = 'visible';
			label.style.visibility = 'visible';
			input.onchange = function(){
				if(input.options.value != 'Auswählen'){
				button.style.visibility = 'visible';
				}
			}
			}
		}
	}
	
	function validateInput(){
		var input1 = document.getElementById('sparte').options.value;
		var input2 = document.getElementById('sportart').options.value;
		if((input1!= 'Auswählen') && (input2 != 'Auswählen')){
			document.getElementById('sparte').style.border = "1px solid red";
			document.getElementById('sportart').style.border = "1px solid red";
			return false;
		}else{
			return true;
		}
	}

</script>


</body>
</html>