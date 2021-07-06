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
    var_dump($connection);
}

$name = $_GET['name'];
$sql = "SELECT * FROM courses WHERE name = '" . $name . "';";
$result = $connection->query($sql);

var_dump($result);

if($result && $result->num_rows>0){
    // var_dump($result->fetch_assoc());
    while($course = $result->fetch_array()){
        ?>
        <h1><?= $course['name'];?></h1>
        <p><?= $course['description'];?></p>
        <?php
    }
} elseif ($result) {
    echo "No results";
} else {
    echo "Query error";
};

$connection->close();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="#" method="get">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="insert name" aria-describedby="helpId">
            <small id="helpId" class="text-muted">insert course name</small>
        </div>
    </form>


</body>
</html>