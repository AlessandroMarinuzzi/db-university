<?php


define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "root");
define("DB_NAME", "db_university");


$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME);
// var_dump($connection);

if ($connection && $connection->connect_error) {
    echo 'Connection failed, error:' . $connection->connect_error;
} else {
    echo 'Correctly Connected';
    // var_dump($connection);
}

$statement = $connection->prepare("INSERT INTO `courses` (`name`,`description`, `period`,`year`,`cfu`,`website`) VALUES (?, ?, ?, ?, ?, ?)");
$statement->bind_param( "iss", "iss", $name, $description, $period, $year, $cfu, $website);
$name = "et doloremque omnis";
$description = "Itaque quos aut repellat et amet et.";
$period = "I semestre";
$year = "1";
$cfu = "11";
$website = "www.nonho@capito.com";

$statement->execute();
var_dump($statement);

