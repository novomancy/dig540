<?php
$host = 'localhost:3306';
$db = 'fergusap_ExhibitB';
$user = 'fergusap_JBRobin02';
$pass = 'PiperKeaton02';
$charset = 'utf8';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$opt = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false
];

$pdo = new PDO($dsn, $user, $pass, $opt);
?>