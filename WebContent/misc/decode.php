<!DOCTYPE HTML>
<html>  
<body>

<form action="decode.php" method="post">
Passwort: <input type="text" name="password"><br>
<input type="submit">
</form>

</body>
</html>

<?php



$newPW = $_POST["password"];
$newPW = base64_encode($newPW);

print "Passwort verschl�sselt (so in DB einf�gen): ".$newPW."</br>";

?>