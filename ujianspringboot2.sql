-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 07:55 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ujianspringboot2`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` bigint(20) NOT NULL,
  `id_jurusan` bigint(20) DEFAULT NULL,
  `id_keberangkatan` bigint(20) NOT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `no_polisi` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `nomor_polisi` varchar(255) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `nama_supir` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`nomor_polisi`, `kapasitas`, `nama_supir`, `nama_perusahaan`) VALUES
('AA 8236 OK', 2, 'Gayus Tambunan', 'Sumber Melarat'),
('AA 8326 ML', 3, 'Triyono', 'Sumber Melarat'),
('H 7038 EE', 7, 'Tessy Wahyuni Riwayati Hartati', 'Mundur Lancar'),
('L 4693 VM', 5, 'Nazaruddin', 'Pahala Haram'),
('N 3173 EN', 4, 'Sumanto', 'Gunung Longsor');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` bigint(20) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `terminal_akhir` varchar(255) DEFAULT NULL,
  `terminal_awal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `deskripsi`, `terminal_akhir`, `terminal_awal`) VALUES
(1, 'Jakarta - Solo', 'Tirto Nadi', 'Poris'),
(2, 'Jakarta - Bekasi via Tasik', 'Bekasi', 'Pd. Cabe'),
(3, 'Badung - Surabaya', 'Wonokromo', 'Cicaheum'),
(4, 'Medan - Jember via Lampung', 'Tawang Alun', 'Terpadu Amplas'),
(5, 'Solo - Depok', 'Margonda', 'Tirtonadi');

-- --------------------------------------------------------

--
-- Table structure for table `keberangkatan`
--

CREATE TABLE `keberangkatan` (
  `id` bigint(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `id_jurusan` bigint(20) DEFAULT NULL,
  `no_polisi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keberangkatan`
--

INSERT INTO `keberangkatan` (`id`, `harga`, `kelas`, `tanggal`, `id_jurusan`, `no_polisi`) VALUES
(1, 10000, 'Ekonomi', '2020-01-01 10:10:10', 1, 'AA 8236 OK'),
(2, 123000, 'AC', '2021-11-08 12:12:11', 3, 'L 4693 VM'),
(3, 320000, 'Bisnis', '2021-11-09 15:30:10', 5, 'N 3173 EN'),
(4, 400000, 'Eksekutif', '2020-01-01 12:30:10', 1, 'H 7038 EE');

-- --------------------------------------------------------

--
-- Table structure for table `penumpang`
--

CREATE TABLE `penumpang` (
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penumpang`
--

INSERT INTO `penumpang` (`nik`, `nama`, `telepon`) VALUES
('32209929991111', 'Tessy Wahyuni Riwayati Hartati', '0809899900');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`nama`, `alamat`) VALUES
('Gunung Longsor', 'Malang'),
('Mundur Lancar', 'Brebes'),
('Pahala Haram', 'Pacitan'),
('Sumber Melarat', 'Purworejo'),
('Sumber Rejeki', ' Ngawi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`nomor_polisi`),
  ADD KEY `FKiktcnigxp2kirixeml12bwhu8` (`nama_perusahaan`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keberangkatan`
--
ALTER TABLE `keberangkatan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_fnm9y3y4tre0o9yg3dl6k72xg` (`tanggal`),
  ADD KEY `FKp1vlmtq4ksegybyglbk0diffc` (`id_jurusan`),
  ADD KEY `FKpowo06nysddnsljnxx339b9np` (`no_polisi`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keberangkatan`
--
ALTER TABLE `keberangkatan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `FKiktcnigxp2kirixeml12bwhu8` FOREIGN KEY (`nama_perusahaan`) REFERENCES `perusahaan` (`nama`);

--
-- Constraints for table `keberangkatan`
--
ALTER TABLE `keberangkatan`
  ADD CONSTRAINT `FKp1vlmtq4ksegybyglbk0diffc` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id`),
  ADD CONSTRAINT `FKpowo06nysddnsljnxx339b9np` FOREIGN KEY (`no_polisi`) REFERENCES `bus` (`nomor_polisi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
