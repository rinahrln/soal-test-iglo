<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRUD Karyawan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <h2>Data Karyawan</h2>
    <div id="pegawaiData"></div>

    <h2>Tambah Karyawan</h2>

    <form id="addForm" class="mx-5">
        <div class="mb-3">
            <label class="form-label">NIP</label>
            <input type="text" class="form-control" name="nip" placeholder="NIP">
        </div>
        <div class="mb-3">
            <label class="form-label">Nama</label>
            <input type="text" class="form-control" name="nama" placeholder="Nama Lengkap">
        </div>
        <div class="mb-3">
            <label class="form-label">Divisi</label>
            <input type="text" class="form-control" name="divisi" placeholder="Divisi">
        </div>
        <input type="submit" value="Tambah" class="btn btn-primary">
    </form>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            // Menampilkan data pegawai saat halaman dimuat
            showData();

            // Menambahkan data pegawai
            $("#addForm").submit(function(event) {
                event.preventDefault();
                var data = $(this).serialize();
                $.ajax({
                    url: 'add.php',
                    type: 'POST',
                    data: data,
                    success: function(response) {
                        showData();
                        $("#addForm")[0].reset();
                    }
                });
            });

            // Menghapus data pegawai
            $(document).on("click", ".deleteBtn", function() {
                var nip = $(this).data("nip");
                if (confirm('Apakah Anda yakin ingin menghapus data ini?')) {
                    $.ajax({
                        url: 'delete.php',
                        type: 'POST',
                        data: { nip: nip },
                        success: function(response) {
                            showData();
                        }
                    });
                }
            });

            // Menampilkan data pegawai
            function showData() {
                $.ajax({
                    url: 'fetch.php',
                    type: 'GET',
                    success: function(response) {
                        $("#pegawaiData").html(response);
                    }
                });
            }
        });
    </script>
</body>
</html>