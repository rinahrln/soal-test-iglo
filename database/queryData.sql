-- SOAL NOMOR 1

-- Menampilkan report
select 
case
	when kar.umur between 21 and 30 then '21-30 tahun'
	when kar.umur between 31 and 40 then '31-40 tahun'
else 'Lain-Lain' end as rangeUmur
, count(kar.nip) as totalKaryawan, (kar.gaji*val.kurs) as totalGaji
from db_test.karyawan as kar
inner join db_test.valuta as val on val.valuta = kar.valuta
group by rangeUmur;

-- Buat tabel report karyawan by range umur
CREATE TABLE db_test.reportByUmur (
	range_umur varchar(255),
    total_karyawan varchar(255),
    total_gaji double
);

-- Memasukkan data ke tabel
INSERT INTO db_test.reportByUmur(db_test.reportByUmur.range_umur, db_test.reportByUmur.total_karyawan,
db_test.reportByUmur.total_gaji)
select 
case
	when kar.umur between 21 and 30 then '21-30 tahun'
	when kar.umur between 31 and 40 then '31-40 tahun'
else 'Lain-Lain' end as rangeUmur
, count(kar.nip) as totalKaryawan, (kar.gaji*val.kurs) as totalGaji
from db_test.karyawan as kar
inner join db_test.valuta as val on val.valuta = kar.valuta
group by rangeUmur;



-- SOAL NOMOR 2

-- Menampilkan report
select val.valuta, count(kar.nip) as totalKaryawan, sum(kar.gaji*val.kurs) as totalGaji
from db_test.karyawan as kar
inner join db_test.valuta as val on val.valuta = kar.valuta
group by val.valuta
having sum(kar.gaji*val.kurs) > 15000000;

-- Buat tabel report karyawan by mata uang
CREATE TABLE db_test.reportByMataUang (
	valuta varchar(255),
    total_karyawan varchar(255),
    total_gaji double
);

INSERT INTO db_test.reportByMataUang(db_test.reportByMataUang.valuta,
db_test.reportByMataUang.total_karyawan,db_test.reportByMataUang.total_gaji)
select val.valuta, count(kar.nip) as totalKaryawan, sum(kar.gaji*val.kurs) as totalGaji
from db_test.karyawan as kar
inner join db_test.valuta as val on val.valuta = kar.valuta
group by val.valuta
having sum(kar.gaji*val.kurs) > 15000000
