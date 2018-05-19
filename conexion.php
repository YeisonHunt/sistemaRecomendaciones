<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "recomendationsystem";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Conexion Fallida - Revise el funcionamiento de Xampp por favor.: " . $conn->connect_error);
} 


?>