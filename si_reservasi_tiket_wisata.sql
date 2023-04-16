-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 10.58
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_reservasi_tiket_wisata`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(7) NOT NULL,
  `pergi` date NOT NULL,
  `pulang` date NOT NULL,
  `jam_keberangkatan` datetime NOT NULL,
  `jam_kedatangan` datetime NOT NULL,
  `kota_tujuan` varchar(15) NOT NULL,
  `kota_asal` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kapal_laut`
--

CREATE TABLE `kapal_laut` (
  `kode_kapal` varchar(7) NOT NULL,
  `nama_kapal` varchar(10) NOT NULL,
  `rute` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kereta_api`
--

CREATE TABLE `kereta_api` (
  `kode_kereta` varchar(10) NOT NULL,
  `nama_kereta` varchar(15) NOT NULL,
  `rute` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `id_kota` varchar(5) NOT NULL,
  `kota` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `maskapai_penerbangan`
--

CREATE TABLE `maskapai_penerbangan` (
  `kode_maskapai` varchar(7) NOT NULL,
  `rute` varchar(15) NOT NULL,
  `nama_maskapai` varchar(10) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(7) NOT NULL,
  `nama_pegawai` varchar(10) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `jabatan` varchar(13) NOT NULL,
  `bidang_pegawai` varchar(15) NOT NULL,
  `id_pengguna` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan+transportasi`
--

CREATE TABLE `pemesanan+transportasi` (
  `id_pemesanan` varchar(7) NOT NULL,
  `id_jadwal` varchar(7) NOT NULL,
  `jumlah_tiket` varchar(2) NOT NULL,
  `transportasi` varchar(10) NOT NULL,
  `id_pengguna` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket_kapal_laut`
--

CREATE TABLE `tiket_kapal_laut` (
  `kode_kapal` varchar(10) NOT NULL,
  `id_pemesanan` varchar(7) NOT NULL,
  `id_tiket` varchar(7) NOT NULL,
  `nama_penumpang` varchar(15) NOT NULL,
  `harga` int(11) NOT NULL,
  `waktu_berangkat` date NOT NULL,
  `waktu_sampai` date NOT NULL,
  `no_seat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket_kereta_api`
--

CREATE TABLE `tiket_kereta_api` (
  `kode_kereta` varchar(10) NOT NULL,
  `id_tiket` varchar(7) NOT NULL,
  `nama_penumpang` varchar(15) NOT NULL,
  `harga` int(11) NOT NULL,
  `waktu_berangkat` date NOT NULL,
  `waktu_sampai` date NOT NULL,
  `no_seat` int(2) NOT NULL,
  `id_pemesanan` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket_pesawat`
--

CREATE TABLE `tiket_pesawat` (
  `kode_maskapai` varchar(7) NOT NULL,
  `nama_pesawat` varchar(10) NOT NULL,
  `waktu_berangkat` date NOT NULL,
  `waktu_sampai` date NOT NULL,
  `id_tiket` varchar(7) NOT NULL,
  `no_seat` int(2) NOT NULL,
  `id_pemesanan` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `kota_asal` (`kota_asal`),
  ADD KEY `kota_tujuan` (`kota_tujuan`);

--
-- Indeks untuk tabel `kapal_laut`
--
ALTER TABLE `kapal_laut`
  ADD PRIMARY KEY (`kode_kapal`);

--
-- Indeks untuk tabel `kereta_api`
--
ALTER TABLE `kereta_api`
  ADD PRIMARY KEY (`kode_kereta`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indeks untuk tabel `maskapai_penerbangan`
--
ALTER TABLE `maskapai_penerbangan`
  ADD PRIMARY KEY (`kode_maskapai`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_user` (`id_pengguna`);

--
-- Indeks untuk tabel `pemesanan+transportasi`
--
ALTER TABLE `pemesanan+transportasi`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `id_user` (`id_pengguna`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tiket_kapal_laut`
--
ALTER TABLE `tiket_kapal_laut`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `kode_kapal` (`kode_kapal`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `tiket_kereta_api`
--
ALTER TABLE `tiket_kereta_api`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `kode_kereta` (`kode_kereta`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Indeks untuk tabel `tiket_pesawat`
--
ALTER TABLE `tiket_pesawat`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `kode_maskapai` (`kode_maskapai`),
  ADD KEY `id_pemesanan` (`id_pemesanan`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kota_asal`) REFERENCES `kota` (`id_kota`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kota_tujuan`) REFERENCES `kota` (`id_kota`);

--
-- Ketidakleluasaan untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`);

--
-- Ketidakleluasaan untuk tabel `pemesanan+transportasi`
--
ALTER TABLE `pemesanan+transportasi`
  ADD CONSTRAINT `pemesanan+transportasi_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`),
  ADD CONSTRAINT `pemesanan+transportasi_ibfk_3` FOREIGN KEY (`id_pengguna`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Ketidakleluasaan untuk tabel `tiket_kapal_laut`
--
ALTER TABLE `tiket_kapal_laut`
  ADD CONSTRAINT `tiket_kapal_laut_ibfk_3` FOREIGN KEY (`kode_kapal`) REFERENCES `kapal_laut` (`kode_kapal`),
  ADD CONSTRAINT `tiket_kapal_laut_ibfk_4` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan+transportasi` (`id_pemesanan`);

--
-- Ketidakleluasaan untuk tabel `tiket_kereta_api`
--
ALTER TABLE `tiket_kereta_api`
  ADD CONSTRAINT `tiket_kereta_api_ibfk_3` FOREIGN KEY (`kode_kereta`) REFERENCES `kereta_api` (`kode_kereta`),
  ADD CONSTRAINT `tiket_kereta_api_ibfk_4` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan+transportasi` (`id_pemesanan`);

--
-- Ketidakleluasaan untuk tabel `tiket_pesawat`
--
ALTER TABLE `tiket_pesawat`
  ADD CONSTRAINT `tiket_pesawat_ibfk_3` FOREIGN KEY (`kode_maskapai`) REFERENCES `maskapai_penerbangan` (`kode_maskapai`),
  ADD CONSTRAINT `tiket_pesawat_ibfk_4` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan+transportasi` (`id_pemesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
