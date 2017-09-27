<?php

$dsn = 'mysql:dbname=createed_Discworld_2;host=localhost;port=3306';
$name = 'createed_carrot';
$pass = '?@**ZE9z6Lt^';

$db=false;

//Connect to the database
try {
    $db = new PDO($dsn, $name, $pass);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die('Could not connect to the database:<br/>' . $e);
}
?>
