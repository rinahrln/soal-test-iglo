-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2023 at 01:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nip` varchar(10) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` int(11) DEFAULT NULL,
  `gaji` double DEFAULT NULL,
  `valuta` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nip`, `nama`, `umur`, `gaji`, `valuta`) VALUES
('001', 'Anton', 25, 650, 'USD'),
('002', 'Budi', 35, 545, 'EUR'),
('003', 'Charles', 30, 7000000, 'IDR'),
('004', 'Dodi', 27, 900, 'USD'),
('005', 'Edwin', 41, 10000000, 'IDR'),
('006', 'Fajar', 20, 750, 'EUR');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_crud`
--

CREATE TABLE `karyawan_crud` (
  `nip` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan_crud`
--

INSERT INTO `karyawan_crud` (`nip`, `nama`, `divisi`) VALUES
('001', 'Anton', 'IT'),
('002', 'Budi', 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `reportbymatauang`
--

CREATE TABLE `reportbymatauang` (
  `valuta` varchar(255) DEFAULT NULL,
  `total_karyawan` varchar(255) DEFAULT NULL,
  `total_gaji` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reportbymatauang`
--

INSERT INTO `reportbymatauang` (`valuta`, `total_karyawan`, `total_gaji`) VALUES
('IDR', '2', 17000000),
('USD', '2', 15500000);

-- --------------------------------------------------------

--
-- Table structure for table `reportbyumur`
--

CREATE TABLE `reportbyumur` (
  `range_umur` varchar(255) DEFAULT NULL,
  `total_karyawan` varchar(255) DEFAULT NULL,
  `total_gaji` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reportbyumur`
--

INSERT INTO `reportbyumur` (`range_umur`, `total_karyawan`, `total_gaji`) VALUES
('21-30 tahun', '3', 6500000),
('31-40 tahun', '1', 4905000),
('Lain-Lain', '2', 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `valuta`
--

CREATE TABLE `valuta` (
  `valuta` varchar(10) NOT NULL,
  `kurs` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `valuta`
--

INSERT INTO `valuta` (`valuta`, `kurs`) VALUES
('CNY', 150),
('EUR', 9000),
('IDR', 1),
('JPY', 200),
('USD', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `valuta` (`valuta`);

--
-- Indexes for table `karyawan_crud`
--
ALTER TABLE `karyawan_crud`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `valuta`
--
ALTER TABLE `valuta`
  ADD PRIMARY KEY (`valuta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`valuta`) REFERENCES `valuta` (`valuta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
