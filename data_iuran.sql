-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2023 at 11:37 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_iuran`
--

-- --------------------------------------------------------

--
-- Table structure for table `anak`
--

CREATE TABLE `anak` (
  `id_anak` int(11) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `nama_anak` varchar(225) NOT NULL,
  `jenjang_sekolah` varchar(225) NOT NULL,
  `nama_sekolah` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `anak`
--

INSERT INTO `anak` (`id_anak`, `id_anggota`, `nama_anak`, `jenjang_sekolah`, `nama_sekolah`) VALUES
(1129, '5cd49a6f19f59', 'Anak 1', 'SMP', 'SMP 5'),
(1134, '5cd49a6f19f59', 'Anak 1 Ino', 'SMA', 'SMADA');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(64) NOT NULL,
  `nia` varchar(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `kk` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `srt_pengantar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nia`, `nama`, `kk`, `jenis_kelamin`, `alamat`, `srt_pengantar`) VALUES
('5cd49a6f19f59', '0000000321242', 'Indra Kusmana', '2081.jpg', 'Laki-Laki', 'CITAYAM', 'Fried_CHicken_Logo_01.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `angsuran`
--

CREATE TABLE `angsuran` (
  `id_angsuran` varchar(64) NOT NULL,
  `id_pinjaman` varchar(64) NOT NULL,
  `no_angsuran` varchar(225) NOT NULL,
  `jumlah_angsuran` double NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `angsuran`
--

INSERT INTO `angsuran` (`id_angsuran`, `id_pinjaman`, `no_angsuran`, `jumlah_angsuran`, `tanggal`) VALUES
('5cdd729dd8049', '5cd9479f88ebe', 'AGS001', 1300000, '2019-05-20'),
('5ce27eeb53dc6', '5cd9479f88ebe', 'AGSIno001', 1300000, '2019-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `pasangan`
--

CREATE TABLE `pasangan` (
  `id_pasangan` int(11) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `nama_pasangan` varchar(225) NOT NULL,
  `pekerjaan` varchar(225) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pasangan`
--

INSERT INTO `pasangan` (`id_pasangan`, `id_anggota`, `nama_pasangan`, `pekerjaan`, `alamat`) VALUES
(3, '5cd49a6f19f59', 'Cindy Gultom', 'Banker', 'Bekasi'),
(4, '5cd49a6f19f59', 'Andika Habibatul', 'Guru', 'Lamongan');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(64) NOT NULL,
  `nik` varchar(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `alamat` text NOT NULL,
  `nohp` bigint(225) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `hak_akses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `id_pinjaman` varchar(64) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `no_pinjaman` varchar(225) NOT NULL,
  `jumlah_pinjaman` double NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `lama` int(11) NOT NULL,
  `bunga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pinjaman`
--

INSERT INTO `pinjaman` (`id_pinjaman`, `id_anggota`, `no_pinjaman`, `jumlah_pinjaman`, `tanggal_peminjaman`, `lama`, `bunga`) VALUES
('5cd9479f88ebe', '5cd49a6f19f59', 'PJ0001', 3000000, '2019-05-16', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `simpanan_pokok`
--

CREATE TABLE `simpanan_pokok` (
  `id_simpanan_pokok` int(11) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `jumlah` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `simpanan_pokok`
--

INSERT INTO `simpanan_pokok` (`id_simpanan_pokok`, `id_anggota`, `jumlah`) VALUES
(12, '5cd49a6f19f59', 20000000);

-- --------------------------------------------------------

--
-- Table structure for table `simpanan_sukarela`
--

CREATE TABLE `simpanan_sukarela` (
  `id_simpanan_sukarela` varchar(64) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_dibayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `simpanan_sukarela`
--

INSERT INTO `simpanan_sukarela` (`id_simpanan_sukarela`, `id_anggota`, `jumlah`, `tanggal_dibayar`) VALUES
('5cd817e55a8a4', '5cd49a6f19f59', 4500000, '2019-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `simpanan_wajib`
--

CREATE TABLE `simpanan_wajib` (
  `id_simpanan_wajib` varchar(64) NOT NULL,
  `id_anggota` varchar(64) NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_dibayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `simpanan_wajib`
--

INSERT INTO `simpanan_wajib` (`id_simpanan_wajib`, `id_anggota`, `jumlah`, `tanggal_dibayar`) VALUES
('5cd8031e8b16f', '5cd49a6f19f59', 5000000, '2019-05-12'),
('5cd80490b51d1', '5cd49a6f19f59', 5000000, '2019-05-12'),
('5cd8049fd0026', '5cd49a6f19f59', 1000000, '2019-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`) VALUES
(1, 'admin', 'admin', 'INDRA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id_anak`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD PRIMARY KEY (`id_angsuran`),
  ADD KEY `id_pinjaman` (`id_pinjaman`);

--
-- Indexes for table `pasangan`
--
ALTER TABLE `pasangan`
  ADD PRIMARY KEY (`id_pasangan`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`id_pinjaman`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `simpanan_pokok`
--
ALTER TABLE `simpanan_pokok`
  ADD PRIMARY KEY (`id_simpanan_pokok`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `simpanan_sukarela`
--
ALTER TABLE `simpanan_sukarela`
  ADD PRIMARY KEY (`id_simpanan_sukarela`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `simpanan_wajib`
--
ALTER TABLE `simpanan_wajib`
  ADD PRIMARY KEY (`id_simpanan_wajib`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anak`
--
ALTER TABLE `anak`
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1142;

--
-- AUTO_INCREMENT for table `pasangan`
--
ALTER TABLE `pasangan`
  MODIFY `id_pasangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `simpanan_pokok`
--
ALTER TABLE `simpanan_pokok`
  MODIFY `id_simpanan_pokok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anak`
--
ALTER TABLE `anak`
  ADD CONSTRAINT `anak_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE;

--
-- Constraints for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD CONSTRAINT `angsuran_ibfk_1` FOREIGN KEY (`id_pinjaman`) REFERENCES `pinjaman` (`id_pinjaman`) ON DELETE CASCADE;

--
-- Constraints for table `pasangan`
--
ALTER TABLE `pasangan`
  ADD CONSTRAINT `pasangan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE;

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simpanan_pokok`
--
ALTER TABLE `simpanan_pokok`
  ADD CONSTRAINT `simpanan_pokok_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE;

--
-- Constraints for table `simpanan_sukarela`
--
ALTER TABLE `simpanan_sukarela`
  ADD CONSTRAINT `simpanan_sukarela_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `simpanan_wajib`
--
ALTER TABLE `simpanan_wajib`
  ADD CONSTRAINT `simpanan_wajib_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
