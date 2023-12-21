<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "db_test";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data
$sql = "SELECT * FROM karyawan_crud";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<p>NIP: " . $row['nip'] . " - Nama: " . $row['nama'] . " - Divisi: " . $row['divisi'] . " <button class='deleteBtn btn btn-danger' data-nip='" . $row['nip'] . "'>Hapus</button></p>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>