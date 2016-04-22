<?php

$str = "1234";
$str = base64_encode($str);
print $str."</br>";

print base64_decode($str);

print "</br>";

$link = mysql_connect('localhost:3306', 'root', '');
mysql_select_db('sportfest');
if(!$link){
	die("failed: ".mysql_error());
}

$newPW = "1234";
$newPW = base64_encode($newPW);
$query = mysql_query("UPDATE admins SET password='$newPW' WHERE ID=1 AND password='asdf'");

if(!$query){
	die("failed: ".mysql_error());
}else{
	echo 'success';
}

mysql_close($link);

?>