<?php
$id = $_POST ["adminID"];
$oldPw = $_POST ["oldPW"];
$newPW = $_POST ["newPW1"];

$link = mysql_connect ( 'localhost:3306', 'root', '' );
mysql_select_db ( 'sportfest' );
if (! $link) {
	echo 'fail';
} else {
	
	$oldPw = base64_encode ( $oldPw );
	
	$newPW = base64_encode ( $newPW );
	
	$sql = "UPDATE admins SET password='$newPW' WHERE ID=$id AND password='$oldPw'";
	
	$query = mysql_query ( $sql );
	
	mysql_close ( $link );
	
	$newUrl = "http://localhost:8080/SportfestOnePager/admin/adminHome.jsp";
	
	header ( "Location: " . $newUrl );
}
?>