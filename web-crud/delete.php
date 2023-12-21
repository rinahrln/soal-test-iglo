<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "db_test";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Hapus data karyawan
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nip = $_POST['nip'];

    $sql = "DELETE FROM karyawan_crud WHERE nip='$nip'";

    if ($conn->query($sql) === TRUE) {
        echo "Data berhasil dihapus";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>