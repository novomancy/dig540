<?php
$host = 'localhost:3306';
$db = 'shcrawfo_finalproj2';
$user = 'shcrawfo_user3';
$pass = 'kD48XFQfXX';
$charset = 'utf8';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$opt = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, 
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false
];

$pdo = new PDO($dsn, $user, $pass, $opt);
?>