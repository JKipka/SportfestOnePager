<?php
$id = $_POST ["adminID"];
$oldPw = $_POST ["oldPW"];
$newPW = $_POST ["newPW1"];

$link = mysql_connect ( 'localhost:3306', 'root', '' );
mysql_select_db ( 'sportfest' );
if (! $link) {
	$errorURL = "http://localhost:8080/SportfestOnePager/error/databaseError.html";
	header ( "Location: " . $errorURL );
} else {
	
	// Beide Passwörter verschlüsseln mit Base64
	$oldPw = base64_encode ( $oldPw );
	
	$newPW = base64_encode ( $newPW );
	
	// Statement vorbereiten
	$sqlQueryPW = "SELECT password FROM admins WHERE ID=$id";
	$resultPW = mysql_query ( $sqlQueryPW );
	//ersten Eintrag aus ResultSet ziehen
	$existingPW = mysql_result ( $resultPW, 0 );
	
	// Altes eingegebenes Passwort mit tatsächlichem Passwort vergleichen
	if ($oldPw == $existingPW) {
		// Datenbank updaten
		$sql = "UPDATE admins SET password='$newPW' WHERE ID=$id";
		$query = mysql_query ( $sql );
		
		// Verbindung schließen
		mysql_close ( $link );
		
		// Weiterleiten
		$newUrl = "http://localhost:8080/SportfestOnePager/admin/adminHome.jsp";
		header ( "Location: " . $newUrl );
	} else {
		
		// Weiterleiten mit Fehlermeldung
		mysql_close ( $link );
		$newUrl = "http://localhost:8080/SportfestOnePager/admin/changePassword.jsp?adminID=" . $id . "&msg=error";
		header ( "Location: " . $newUrl );
	}
}
?>