<?php

//Geloggten User ziehen
$mail = $_POST["loggedUser"];


//Cookie überschreiben
setCookie( "user", $mail, time()+600, '/');


//Weiterleiten
header ( "Location: http://localhost:8080/SportfestOnePager/admin/adminHome.jsp?#editAdmins" );


?>