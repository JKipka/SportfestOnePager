<?php

$mail = $_POST["loggedUser"];

setCookie( "user", $mail, time()+600, '/');

header ( "Location: http://localhost:8080/SportfestOnePager/admin/adminHome.jsp?#editAdmins" );


?>