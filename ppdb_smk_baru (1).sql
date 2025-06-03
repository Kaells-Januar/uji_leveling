-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 01:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ppdb_smk_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kode_petugas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `password`, `kode_petugas`) VALUES
('anjay', 'de12f5798f86bdcc5c759a645e913e4c', 1);

-- --------------------------------------------------------

--
-- Table structure for table `biaya`
--

CREATE TABLE `biaya` (
  `tahun_ajaran` varchar(9) NOT NULL,
  `biaya_daftar` int(11) NOT NULL,
  `biaya_awal` int(11) NOT NULL,
  `biaya_seragam` int(11) NOT NULL,
  `spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biaya`
--

INSERT INTO `biaya` (`tahun_ajaran`, `biaya_daftar`, `biaya_awal`, `biaya_seragam`, `spp`) VALUES
('2024/2025', 100000, 950000, 750000, 290000),
('2025/2026', 100000, 1000000, 850000, 300000),
('2026/2027', 150000, 1050000, 900000, 300000),
('2027/2028', 200000, 1000000, 500000, 250000);

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`) VALUES
('IGAPIN_1', 'Teknik Kendaraan Ringan Otomotif'),
('IGAPIN_2', 'Perkembangan Perangkat Lunak Dan Gim'),
('IGAPIN_3', 'Teknik Permesinan'),
('IGAPIN_4', 'Teknik Jaringan Komputer'),
('IGAPIN_5', 'Teknik Bengkel Sepeda Motor');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_pendaftar` int(10) DEFAULT NULL,
  `tahun_ajaran` varchar(9) DEFAULT NULL,
  `tanggal_bayar` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `rincian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftar`
--

CREATE TABLE `pendaftar` (
  `id_pendaftar` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `jk` char(1) NOT NULL,
  `kode_jurusan` varchar(10) DEFAULT NULL,
  `kode_petugas` int(10) DEFAULT NULL,
  `tahun_ajaran` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pendaftar`
--

INSERT INTO `pendaftar` (`id_pendaftar`, `nama`, `alamat`, `jk`, `kode_jurusan`, `kode_petugas`, `tahun_ajaran`) VALUES
(1112005, 'Januar', 'jajaway', 'L', 'IGAPIN_1', 2, '2024/2025'),
(1112006, 'ara', 'okokook', 'P', 'IGAPIN_2', 4, '2024/2025'),
(1112007, 'geges', 'Prikitiw', 'L', 'IGAPIN_3', 6, '2025/2026');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `kode_petugas` int(10) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `role` enum('Petugas','TU','Admin','Kepala Sekolah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`kode_petugas`, `nama_petugas`, `role`) VALUES
(1, 'Kudanil', 'Petugas'),
(2, 'Asep Sunandar', 'Petugas'),
(3, 'Susanti', 'Petugas'),
(4, 'Ali Syakip', 'Admin'),
(5, 'Sania Marwah', 'TU'),
(6, 'Aria Kamandanu', 'Kepala Sekolah'),
(8, 'sasas', 'Petugas'),
(9, 'Kudanil', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fk_akun_petugas` (`kode_petugas`);

--
-- Indexes for table `biaya`
--
ALTER TABLE `biaya`
  ADD PRIMARY KEY (`tahun_ajaran`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `tahun_ajaran` (`tahun_ajaran`),
  ADD KEY `fk_pembayaran_pendaftar` (`id_pendaftar`);

--
-- Indexes for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD PRIMARY KEY (`id_pendaftar`),
  ADD KEY `kode_jurusan` (`kode_jurusan`),
  ADD KEY `tahun_ajaran` (`tahun_ajaran`),
  ADD KEY `fk_pendaftar_petugas` (`kode_petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pendaftar`
--
ALTER TABLE `pendaftar`
  MODIFY `id_pendaftar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1112008;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `kode_petugas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `fk_akun_petugas` FOREIGN KEY (`kode_petugas`) REFERENCES `petugas` (`kode_petugas`) ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_pendaftar` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`tahun_ajaran`) REFERENCES `biaya` (`tahun_ajaran`);

--
-- Constraints for table `pendaftar`
--
ALTER TABLE `pendaftar`
  ADD CONSTRAINT `fk_pendaftar_petugas` FOREIGN KEY (`kode_petugas`) REFERENCES `petugas` (`kode_petugas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pendaftar_ibfk_1` FOREIGN KEY (`kode_jurusan`) REFERENCES `jurusan` (`kode_jurusan`),
  ADD CONSTRAINT `pendaftar_ibfk_3` FOREIGN KEY (`tahun_ajaran`) REFERENCES `biaya` (`tahun_ajaran`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
