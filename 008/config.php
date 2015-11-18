<?php
//Config.php

	$dsn = 'mysql:dbname=sirkadek_MythCreatures;host=localhost;port=3306';
	$name = 'sirkadek_Monster';
	$pass = 'm0nst3r!';
	$db=false;

//Connect to the database
	try {
    		$db = new PDO($dsn, $name, $pass);
    		$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
	} catch(PDOException $e) {
    		die('Oh, no, what happened? Could not connect to the database: <br />' . $e);
	}

?>