<?php


define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "root");
define("DB_NAME", "db_university");


$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME);
var_dump($connection);

if ($connection && $connection->connect_error) {
    echo 'Connection failed, error:' . $connection->connect_error;
} else {
    echo 'Correctly Connected';
    var_dump($connection);
}