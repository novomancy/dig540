<?php

//Set up the database connection for the access layer

$dsn = 'mysql:dbname=yippeezi_filmMusic; host=localhost;port3306';
$name = 'yippeezi_dig5401';
$password = 'yO^6uPTk7TAq';

//Try to connect to database:error catch if fails to connect

try {
  $db = new PDO($dsn, $name, $password);
  $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch(PDOException $e) {
  die('Could not connect to the database:<br />' . $e);
}


?>
