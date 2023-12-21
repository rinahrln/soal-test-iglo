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

// Tambah data karyawan
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nip = $_POST['nip'];
    $nama = $_POST['nama'];
    $jabatan = $_POST['divisi'];

    $sql = "INSERT INTO karyawan_crud (nip, nama, divisi) VALUES ('$nip', '$nama', '$jabatan')";

    if ($conn->query($sql) === TRUE) {
        echo "Data berhasil ditambahkan";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>