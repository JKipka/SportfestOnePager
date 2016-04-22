<?php

//Form Parameter holen durch Method POST
$mail = $_POST["mail"];
$pw = $_POST["pw"];

//Datenbank Verbindung aufmachen
$link = mysql_connect('localhost:3306', 'root', '');
mysql_select_db('sportfest');

if(!$link){
	die("Connection to database failed.");
}else {
	//Datenbank abfragen
	$result = mysql_query("SELECT password FROM admins WHERE username='$mail'");
	if($result){
		//hole ersten Eintrag aus ResultSet -> Passwort des Nutzers $mail
	$pw1 = mysql_result($result, 0);
	//Passwort dekodieren, da Nutzer Passwort nur als Klartext kennt
	$pw1 = base64_decode($pw1);
	//Eingabe und Eintrag aus DB vergleichen
	if($pw1==$pw){
		//Cookie setzen, 5 Minuten, gültig für alle Pfade
		setCookie("user", $mail, time()+300, '/');
		//MySQL schließen
		mysql_close($link);
		//weiterleiten
		header("Location: http://localhost:8080/SportfestOnePager/functions/redirect.jsp");
	}else{
		//MySQL schließen
		mysql_close($link);
		//weiterleiten
		header("Location: http://localhost:8080/SportfestOnePager/admin/login.jsp?msg=error");
	}
	}else{
		//MySQL schließen
		mysql_close($link);
		//weiterleiten
		header("Location: http://localhost:8080/SportfestOnePager/admin/login.jsp?msg=error");
	}
}



?>