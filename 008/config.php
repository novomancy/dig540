<?php

//Set up the database connection for the access layer

$dsn = 'mysql:dbname=yippeezi_filmMusic; host=localhost;port3306';
$name = 'dig5401';
$pass = 'dig*assignment';

$db = false;

//Try to connect to database:error catch if fails to connect

try {
  $db = new PDO($dsn, $name, $pass);
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch(PDOException $e) {
  die('Could not connect to the database:<br />' . $e);
}


?>
