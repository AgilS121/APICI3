-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 05:10 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_embuh`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbm_barang`
--

CREATE TABLE `tbm_barang` (
  `id_barang` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` varchar(20) NOT NULL,
  `desc` text NOT NULL,
  `stok` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `pilihan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbm_barang`
--

INSERT INTO `tbm_barang` (`id_barang`, `id_kategori`, `nama`, `harga`, `desc`, `stok`, `foto`, `pilihan`) VALUES
(1, 1, 'buku cerita rakyat', '125000', 'buku yang menceritakan kehidupan raja dan rakyat dalam fiksi', 25, 'raja no life.jpg', 'tersedia'),
(2, 1, 'Death Note', '300000', 'menceritakan tentang pelajar populer yang menemukan buku kematian yang telah di jatuhkan oleh dewa kematian. Kekuatan buku itu ....', 125, 'death note.jpg', 'tersedia per chapter'),
(3, 2, 'One piece', '30000', 'bercerita tentang petualangan seorang pemuda yang kemudian mendapatkan teman di jalan', 200, 'onepiece.jpg', 'terbatas'),
(4, 2, 'conan', '55000', 'Bercerita tentang seorang remaja yang kepergok oleh seorang perampok kemudian diberi pil, tak disangka pil itu membuat seorang remaja tersebut berubah menjadi kecilkembali', 400, 'conan.jpg', 'tersedia'),
(5, 3, 'boboiboy', '70000', 'menceritakan tentang seorang anak berusia sekitar 1 thn yang menemukan bola ajaib dan bisa berbicara kemudian memperoleh 7 elemen yang diberikan oleh bola tersebut', 9000, 'boi.jpg', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `tbm_katbarang`
--

CREATE TABLE `tbm_katbarang` (
  `id_kategori` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbm_katbarang`
--

INSERT INTO `tbm_katbarang` (`id_kategori`, `nama`) VALUES
(1, 'buku'),
(2, 'komik\r\n'),
(3, 'film');

-- --------------------------------------------------------

--
-- Table structure for table `tbm_user`
--

CREATE TABLE `tbm_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `no_telp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbm_user`
--

INSERT INTO `tbm_user` (`id_user`, `nama`, `username`, `password`, `no_telp`) VALUES
(1, 'mamas agilsurya', 'ls', 'karepekoelahya', ''),
(2, 'agil sap', 'agils', '72180418175e0e078113ebd8236193a9', '089665881651');

-- --------------------------------------------------------

--
-- Table structure for table `tbt_pembayaran`
--

CREATE TABLE `tbt_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `tgl_transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `total` varchar(100) NOT NULL,
  `status` enum('sudah','belum') NOT NULL DEFAULT 'belum',
  `tgl_pembayaran` datetime NOT NULL,
  `bukti_pembayaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbt_pembelian`
--

CREATE TABLE `tbt_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbt_pembelian`
--

INSERT INTO `tbt_pembelian` (`id_pembelian`, `id_barang`, `id_user`, `qty`, `harga`) VALUES
(1, 1, 1, 5, '5000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbm_barang`
--
ALTER TABLE `tbm_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tbm_katbarang`
--
ALTER TABLE `tbm_katbarang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbm_user`
--
ALTER TABLE `tbm_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tbt_pembayaran`
--
ALTER TABLE `tbt_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `tbt_pembelian`
--
ALTER TABLE `tbt_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbm_barang`
--
ALTER TABLE `tbm_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbm_katbarang`
--
ALTER TABLE `tbm_katbarang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbm_user`
--
ALTER TABLE `tbm_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbt_pembayaran`
--
ALTER TABLE `tbt_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbt_pembelian`
--
ALTER TABLE `tbt_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
