-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2020 at 05:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_attitude_baru`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_matkul` char(20) NOT NULL,
  `id_kelas` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_matkul`, `id_kelas`) VALUES
('1', '2'),
('1', '2');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` char(20) NOT NULL,
  `id_matkul` char(15) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `kuota` int(11) NOT NULL,
  `tempat` varchar(50) DEFAULT NULL,
  `waktu` varchar(20) DEFAULT NULL,
  `id_pengajar` char(20) NOT NULL,
  `hari` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_matkul`, `nama_kelas`, `kuota`, `tempat`, `waktu`, `id_pengajar`, `hari`) VALUES
('1', '1', 'A', 20, 'Masjid Tarbiah Lt.1 Utara', '19.30 - 20.30', '1', 'Senin'),
('2', '1', 'B', 20, 'Masjid Tarbiah Lt.1 Barat', '19.30 - 20.30', '2', 'Senin');

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id_mhs` char(20) NOT NULL DEFAULT '',
  `id_matkul` char(20) NOT NULL,
  `id_kelas` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`id_mhs`, `id_matkul`, `id_kelas`) VALUES
('18650000', '1', '1'),
('18650000', '2', '2'),
('18650000', '3', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` char(20) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `angkatan` varchar(10) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `gambar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nama_mhs`, `alamat`, `angkatan`, `username`, `gambar`) VALUES
('18650000', 'Gusti', 'Malang', '2018', '18650000', '5fd2ef1ddb3cc.png'),
('18650001', 'Nai', 'Malang', '2018', '18650001', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` char(20) NOT NULL,
  `id_pengajar` char(15) DEFAULT NULL,
  `nama_matkul` varchar(20) NOT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `id_pengajar`, `nama_matkul`, `sks`) VALUES
('1', '1', 'Talim Quran', NULL),
('2', '2', 'Talim Afkar', NULL),
('3', '3', 'Shobahul Lugho', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_mhs` char(20) NOT NULL,
  `id_matkul` char(20) NOT NULL,
  `id_kelas` char(20) NOT NULL,
  `id_pertemuan` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `id_pengajar` char(15) NOT NULL,
  `nama_pengajar` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `ttl_dosen` text NOT NULL,
  `alamat_dosen` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajar`
--

INSERT INTO `pengajar` (`id_pengajar`, `nama_pengajar`, `username`, `ttl_dosen`, `alamat_dosen`) VALUES
('1', 'Anshor', '1', 'Malang, 1 Januari 1970', 'Malang'),
('2', 'Anwar', '2', 'Banyuwangi, 24 Oktober 1972', 'Banyuwangi'),
('3', 'Miftah', '3', 'Batam, 28 November 1970', 'Batam');

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

CREATE TABLE `pertemuan` (
  `id_pertemuan` int(11) NOT NULL,
  `id_matkul` char(20) NOT NULL,
  `id_kelas` char(20) NOT NULL,
  `judul_materi` text DEFAULT NULL,
  `pertemuan` varchar(20) NOT NULL,
  `materi` text DEFAULT NULL,
  `id_pengajar` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pertemuan`
--

INSERT INTO `pertemuan` (`id_pertemuan`, `id_matkul`, `id_kelas`, `judul_materi`, `pertemuan`, `materi`, `id_pengajar`) VALUES
(1, '1', '1', 'Tajwid', 'Pertemuan 1', 'Tajwid (bahasa Arab: تجويد, translit. tajwīd)jkjsjfdskjfjkdsj', '1'),
(2, '1', '2', 'Hukum Nun Sukun', 'Pertemuan 2', 'Hukum nun mati (sukun) dan tanwin adalah salah satu tajwid yang terdapat dalam Al-Qur\'an. Hukum ini berlaku jika nun mati atau tanwin bertemu huruf-huruf tertentu.', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `level`) VALUES
('111', '111', 'pengajar'),
('18650000', '123', 'mahasiswa'),
('18650001', '321', 'mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_pengajar` (`id_pengajar`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD KEY `id_mhs` (`id_mhs`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD KEY `id_mhs` (`id_mhs`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_pertemuan` (`id_pertemuan`);

--
-- Indexes for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`id_pengajar`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD PRIMARY KEY (`id_pertemuan`),
  ADD KEY `id_matkul` (`id_matkul`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `pertemuan_ibfk_3` (`id_pengajar`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD UNIQUE KEY `password` (`password`),
  ADD KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_3` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `kelas_ibfk_4` FOREIGN KEY (`id_pengajar`) REFERENCES `pengajar` (`id_pengajar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pertemuan_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pertemuan_ibfk_3` FOREIGN KEY (`id_pengajar`) REFERENCES `pengajar` (`id_pengajar`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
