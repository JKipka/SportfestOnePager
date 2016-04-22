<?php

$mail = $_POST["mail"];
$pw = $_POST["pw"];

$link = mysql_connect('localhost:3306', 'root', '');
mysql_select_db('sportfest');

if(!$link){
	die("Connection to database failed.");
}else {
	$result = mysql_query("SELECT password FROM admins WHERE username='$mail'");
	if($result){
	$pw1 = mysql_result($result, 0);
	$pw1 = base64_decode($pw1);
	if($pw1==$pw){
		setCookie("user", $mail, time()+300, '/');
		mysql_close($link);
		header("Location: http://localhost:8080/SportfestOnePager/functions/redirect.jsp");
	}else{
		mysql_close($link);
		header("Location: http://localhost:8080/SportfestOnePager/admin/login.jsp?msg=error");
	}
	}else{
		mysql_close($link);
		header("Location: http://localhost:8080/SportfestOnePager/admin/login.jsp?msg=error");
	}
}



?>