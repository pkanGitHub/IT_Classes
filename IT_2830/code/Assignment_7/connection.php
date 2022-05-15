<?php
$con = mysqli_connect("172.19.0.2", "dbuser", "dbpass", "db");

if(mysqli_connect_error()){
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
}