
<?php
$dsn = 'mysql:dbname=curiocan_aacm;host=localhost;port=3306';
$name = 'curiocan';
$pass = '95f77qYglR';
$db=false;
//Connect to the database
try {
    $db = new PDO($dsn, $name, $pass);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch(PDOException $e) {
    die('Could not connect to the database:<br/>' . $e);
}
?>
