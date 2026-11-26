-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2026 pada 12.49
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catshop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bank` varchar(50) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`id_konfirmasi`, `id_pesanan`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 7, 'Muhammad ario', 'BCA', 95000, '2026-10-25 21:30:02', '20261025153001_WhatsApp Image 2026-10-21 at 00.37.34 (2).jpeg'),
(2, 8, 'Muhammad ario', 'BCA', 245000, '2026-10-25 21:57:53', '20261025155753_WhatsApp Image 2026-10-21 at 00.37.35 (1).jpeg'),
(3, 9, 'Muhammad ario', 'Mandiri', 315000, '2026-10-26 09:10:08', '20261026031008_WhatsApp Image 2026-10-21 at 00.37.35 (1).jpeg'),
(4, 11, 'Muhammad ario', 'Mandiri', 250000, '2026-11-17 05:27:38', '20261116232738_flat-design-pet-shop-sale-banner-template_23-2150372160.avif'),
(5, 13, 'alfarizi', 'Mandiri', 309000, '2026-11-18 10:14:53', '20261118041453_1600w-eIixx7PJRrg (1).jpg'),
(6, 14, 'surya', 'Mandiri', 250000, '2026-11-18 13:13:21', '20261118071321_1600w-eIixx7PJRrg (1).jpg'),
(7, 15, 'Jekiboy', 'Mandiri', 245000, '2026-11-26 18:20:08', '20261126122008_WhatsApp Image 2026-11-24 at 12.18.27.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat_lengkap` text NOT NULL,
  `kurir` varchar(100) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `total_belanja` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Menunggu Konfirmasi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_user`, `nama_penerima`, `no_hp`, `alamat_lengkap`, `kurir`, `metode_pembayaran`, `total_belanja`, `tanggal`, `status`) VALUES
(1, 1, 'Muhammad ario', '085719323258', 'bekasi,jatiasih', '', 'COD (Cash on Delivery)', 1354000, '2026-10-25 19:51:16', 'Selesai'),
(2, 1, 'fadil', '085719323254', 'Depok,jakarta', '', 'COD (Cash on Delivery)', 250000, '2026-10-25 20:09:13', 'Menunggu Konfirmasi'),
(3, 1, 'surya', '085719323259', 'Jatiasih,kodau', '', 'COD (Cash on Delivery)', 250000, '2026-10-25 20:30:55', 'Menunggu Konfirmasi'),
(4, 1, 'alfarizi', '085719323251', 'depok', 'J&T Express (Estimasi 2-3 Hari)', 'COD (Cash on Delivery)', 115000, '2026-10-25 20:47:36', 'Menunggu Konfirmasi'),
(5, 1, 'abc', '123', 'bekasi123', 'J&T Express (Estimasi 2-3 Hari)', 'COD (Cash on Delivery)', 315000, '2026-10-25 20:59:34', 'Menunggu Konfirmasi'),
(6, 1, 'aman', '12345', 'kodau', 'J&T Express (Estimasi 2-3 Hari)', 'COD (Cash on Delivery)', 315000, '2026-10-25 21:25:46', 'Menunggu Konfirmasi'),
(7, 1, 'goro', '123456', 'indonesia', 'JNE Reguler (Estimasi 2-3 Hari)', 'Transfer Bank BCA', 95000, '2026-10-25 21:27:53', 'Menunggu Konfirmasi'),
(8, 1, 'ario12', '12345678', 'kota', 'Kurir Reguler (Gratis Ongkir)', 'Transfer Bank BCA', 245000, '2026-10-25 21:57:19', 'Selesai'),
(9, 1, '0497_Muhammadario', '085719323251', 'ario29', 'J&T Express (Estimasi 2-3 Hari)', 'Transfer Bank Mandiri', 315000, '2026-10-26 09:08:34', 'Selesai'),
(10, 1, '0497_Muhammadario', '085719323251', 'BANDUNG', 'J&T Express (Estimasi 2-3 Hari)', 'COD (Cash on Delivery)', 315000, '2026-11-17 04:42:52', 'Selesai'),
(11, 1, '0497_Muhammadario', '085719323254', 'Malang', 'JNE Reguler (Estimasi 2-3 Hari)', 'Transfer Bank Mandiri', 250000, '2026-11-17 05:27:16', 'Selesai'),
(12, 1, '0497_Muhammadario', '12345', 'malang', 'Kurir Reguler (Gratis Ongkir)', 'Transfer Bank Mandiri', 45000, '2026-11-17 18:21:45', 'Menunggu Konfirmasi'),
(13, 1, 'alfarizi', '085719323254', 'jaga karsa', 'J&T Express (Estimasi 2-3 Hari)', 'Transfer Bank Mandiri', 309000, '2026-11-18 10:13:40', 'Terkirim'),
(14, 1, 'surya', '123456', 'bekasi', 'J&T Express (Estimasi 2-3 Hari)', 'Transfer Bank Mandiri', 250000, '2026-11-18 13:12:24', 'Terkirim'),
(15, 1, 'Jekiboy', '085719323251', 'Suryanto', 'JNE Reguler (Estimasi 2-3 Hari)', 'Transfer Bank Mandiri', 245000, '2026-11-26 18:17:54', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` varchar(50) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `berat` varchar(20) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `badge` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `brand`, `nama`, `kategori`, `berat`, `harga`, `gambar`, `badge`) VALUES
('500', 'Royal Canin', 'Royal Canin Kitten 2kg', 'Makanan Kucing', NULL, 250000, 'https://placehold.co/400x400/ffffff/333?text=RC+Kitten', 'Terlaris'),
('901', 'Royal Canin', 'Royal Canin Persian Adult 2kg', 'Makanan Kucing', '2000', 315000, 'https://placehold.co/400x400/ffffff/333?text=RC+Persian', 'Spesial'),
('902', 'Royal Canin', 'Royal Canin Indoor 27 1.5kg', 'Makanan Kucing', '1500', 245000, 'https://placehold.co/400x400/ffffff/333?text=RC+Indoor', ''),
('903', 'Royal Canin', 'Royal Canin Kitten Instinctive Pouch 85g', 'Makanan Kucing', '85', 25000, 'https://placehold.co/400x400/ffffff/333?text=RC+Pouch', 'Promo'),
('baju-kucing', 'Pet Fashion', 'Kostum / Baju Kucing Motif Lucu', 'Aksesoris Kucing', '1 pcs', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Baju+Kucing', ''),
('bandana-kucing', 'Meow Style', 'Bandana Leher Motif Estetik', 'Aksesoris Kucing', '1 pcs', 18000, 'https://placehold.co/500x500/f5f5f5/222$text=Bandana', ''),
('bola-lonceng', 'Cat Fun Toy', 'Mainan Bola Lonceng Interaktif', 'Mainan Kucing', '1 pcs', 25000, 'https://placehold.co/500x500/f5f5f5/222?text=Bola+Lonceng', ''),
('catnip-toy', 'Cat Fun Toy', 'Boneka Ikan Isi Catnip Organik', 'Mainan Kucing', '1 pcs', 35000, 'https://placehold.co/500x500/f5f5f5/222?text=Catnip+Toy', ''),
('deodorizer-pasir', 'Natural Litter', 'Pewangi / Deodorizer Pasir Kucing 450ml', 'Pasir & Toilet', '450 ml', 35000, 'https://placehold.co/500x500/f5f5f5/222?text=Deodorizer', ''),
('dry-shampoo', 'Pet Glow', 'Dry Shampoo / Sampo Kering Semprot', 'Perawatan & Grooming', '150 ml', 50000, 'https://placehold.co/500x500/f5f5f5/222?text=Dry+Shampoo', ''),
('gunting-kuku', 'Bio-Groom', 'Gunting Kuku Kucing + Kikir', 'Perawatan & Grooming', '1 pcs', 20000, 'https://placehold.co/500x500/f5f5f5/222?text=Gunting+Kuku', ''),
('kalung-lonceng', 'Collar Club', 'Kalung Kulit Sintetis + Lonceng', 'Aksesoris Kucing', '1 pcs', 20000, 'https://placehold.co/500x500/f5f5f5/222?text=Kalung+Lonceng', ''),
('kf-all-life-1.5kg', 'Kitchen Flavor', 'Kitchen Flavor All Life', 'Makanan Kucing', '1.5 kg', 144500, 'https://placehold.co/500x500/f5f5f5/222?text=KF+All+Life+1.5kg', '-4%'),
('kf-all-meat-1.3kg', 'Kitchen Flavor', 'Kitchen Flavor All Meat', 'Makanan Kucing', '1.3 kg', 144000, 'https://placehold.co/500x500/f5f5f5/222?text=KF+All+Meat+1.3kg', '-3%'),
('kf-all-meat-1.3kg-2', 'Kitchen Flavor', 'Kitchen Flavor All Meat', 'Makanan Kucing', '1.3 kg', 119000, 'https://placehold.co/500x500/f5f5f5/222?text=KF+All+Meat+Alt', '-7%'),
('kf-gf-adult-1.5kg', 'Kitchen Flavor', 'Kitchen Flavor GF Adult', 'Makanan Kucing', '1.5 kg', 136000, 'https://placehold.co/500x500/f5f5f5/222?text=KF+GF+Adult+1.5kg', '-5%'),
('kf-pouch-70gr', 'Kitchen Flavor', 'Kitchen Flavor Pouch', 'Makanan Kucing', '70 gr', 10000, 'https://placehold.co/500x500/f5f5f5/222?text=KF+Pouch+70gr', '-9%'),
('kf-urinary-1.5kg', 'Kitchen Flavor', 'Kitchen Flavor Urinary', 'Makanan Kucing', '1.5 kg', 153500, 'https://placehold.co/500x500/f5f5f5/222?text=KF+Urinary+1.5kg', '-3%'),
('laser-pointer', 'Pet Play', 'Laser Pointer Mainan LED Kucing', 'Mainan Kucing', '1 pcs', 30000, 'https://placehold.co/500x500/f5f5f5/222?text=Laser+Pointer', ''),
('meo-adult-tuna-1kg', 'Me-O', 'Me-O Adult Tuna', 'Makanan Kucing', '1 kg', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Adult+Tuna', 'PROMO'),
('meo-creamy-treat-pack', 'Me-O', 'Me-O Creamy Treat Snack', 'Makanan Kucing', '60 gr', 18000, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Creamy+Treat', ''),
('meo-kitten-ocean-fish-1kg', 'Me-O', 'Me-O Kitten Ocean Fish', 'Makanan Kucing', '1 kg', 47000, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Kitten', 'NEW'),
('meo-persian-adult-1.2kg', 'Me-O', 'Me-O Persian Adult', 'Makanan Kucing', '1.2 kg', 65000, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Persian', ''),
('meo-pouch-chicken-85gr', 'Me-O', 'Me-O Pouch Adult Chicken', 'Makanan Kucing', '85 gr', 7500, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Pouch+Chicken', 'PROMO'),
('meo-pouch-tuna-85gr', 'Me-O', 'Me-O Pouch Adult Tuna', 'Makanan Kucing', '85 gr', 7500, 'https://placehold.co/500x500/f5f5f5/222?text=Me-O+Pouch+Tuna', ''),
('minyak-ikan', 'Virbac', 'Omega 3 & Minyak Ikan Salmon Kapsul', 'Vitamin & Kesehatan', '50 kapsul', 75000, 'https://placehold.co/500x500/f5f5f5/222?text=Minyak+Ikan', ''),
('obat-cacing', 'Beaphar', 'Obat Cacing Tablet Kucing', 'Vitamin & Kesehatan', '1 strip', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Obat+Cacing', ''),
('parfum-kucing', 'TropiClean', 'Parfum / Cologne Kucing Wangi Tahan Lama', 'Perawatan & Grooming', '100 ml', 38000, 'https://placehold.co/500x500/f5f5f5/222?text=Parfum+Kucing', ''),
('pasir-kopi-10l', 'Hello Cat', 'Pasir Wangi Aroma Kopi 10L', 'Pasir & Toilet', '10 L', 85000, 'https://placehold.co/500x500/f5f5f5/222?text=Pasir+Kopi+10L', ''),
('pasir-lavender-5kg', 'Katz Clean', 'Pasir Gumpal Wangi Lavender 5kg', 'Pasir & Toilet', '5 kg', 50000, 'https://placehold.co/500x500/f5f5f5/222?text=Pasir+Lavender', ''),
('pasir-wangi-5l', 'Natural Litter', 'Pasir Wangi Organik Bentonite 5L', 'Pasir & Toilet', '5 L', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Pasir+Wangi+5L', ''),
('pembersih-telinga', 'Bio-Groom', 'Pembersih Telinga & Mata Kucing', 'Perawatan & Grooming', '60 ml', 40000, 'https://placehold.co/500x500/f5f5f5/222?text=Pembersih+Telinga', ''),
('pp-adult-chicken-1.5kg', 'Pro Plan', 'Pro Plan Adult Chicken 1.5 kg', 'Makanan Kucing', '1.5 kg', 231000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Adult+Chicken+1.5kg', '-8%'),
('pp-adult-chicken-pouch', 'Pro Plan', 'Pro Plan Adult Chicken Gravy Pouch', 'Makanan Kucing', '85 gr', 21000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Adult+Chicken+Pouch', ''),
('pp-fussy-beauty-pouch', 'Pro Plan', 'Pro Plan Fussy Beauty Pouch', 'Makanan Kucing', '85 gr', 31000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Fussy+Beauty', '-3%'),
('pp-kitten-pouch-gravy', 'Pro Plan', 'Pro Plan Kitten Pouch Gravy', 'Makanan Kucing', '85 gr', 21000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Kitten+Pouch+Gravy', '-3%'),
('pp-kitten-pouch-jelly', 'Pro Plan', 'Pro Plan Kitten Pouch Jelly', 'Makanan Kucing', '85 gr', 21000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Kitten+Pouch+Jelly', '-3%'),
('pp-salmon-1kg', 'Pro Plan', 'Pro Plan Salmon Repack', 'Makanan Kucing', '1 kg', 129000, 'https://placehold.co/500x500/f5f5f5/222?text=PP+Salmon+1kg', ''),
('rc-gastro-fibre-pouch-85gr', 'Royal Canin', 'Royal Canin Gastro Fibre Response Cat Pouch 85gr', 'Makanan Kucing', '85 gr', 30000, 'https://placehold.co/500x500/f5f5f5/222?text=RC+Gastro', 'VET'),
('rc-hair-skin-1.5kg', 'Royal Canin', 'ROYAL CANIN Hair & Skin', 'Makanan Kucing', '1.5 kg', 309000, 'https://placehold.co/500x500/f5f5f5/222?text=Hair+%26+Skin+1.5kg', 'PROMO'),
('rc-hair-skin-400gr', 'Royal Canin', 'ROYAL CANIN Hair & Skin', 'Makanan Kucing', '400 gr', 95000, 'https://placehold.co/500x500/f5f5f5/222?text=Hair+%26+Skin+400g', 'PROMO'),
('rc-kitten-400gr', 'Royal Canin', 'Royal Canin Kitten', 'Makanan Kucing', '400 gr', 92500, 'https://placehold.co/500x500/f5f5f5/222?text=Kitten+400g', 'PROMO'),
('rc-mother-baby-2kg', 'Royal Canin', 'Royal Canin Mother & Baby', 'Makanan Kucing', '2 kg', 351500, 'https://placehold.co/500x500/f5f5f5/222?text=Mother+%26+Baby', 'PROMO'),
('rc-persian-400gr', 'Royal Canin', 'ROYAL CANIN Persian', 'Makanan Kucing', '400 gr', 115000, 'https://placehold.co/500x500/f5f5f5/222?text=Persian+400g', 'PROMO'),
('rc-protein-exigent-2kg', 'Royal Canin', 'Royal Canin Protein Exigent 2kg', 'Makanan Kucing', '2 kg', 305000, 'https://placehold.co/500x500/f5f5f5/222?text=Royal+Canin', ''),
('rc-renal-410gr', 'Royal Canin', 'ROYAL CANIN Renal', 'Makanan Kucing', '410 gr', 59900, 'https://placehold.co/500x500/f5f5f5/222?text=Renal+410g', 'PROMO'),
('sampo-kucing', 'Groom-X', 'Sampo Anti Kutu & Jamur 250ml', 'Perawatan & Grooming', '250 ml', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Sampo+Kucing', ''),
('scratcher-kardus', 'Paw Play', 'Papan Garukan / Scratcher Kucing Bulat', 'Mainan Kucing', '1 pcs', 45000, 'https://placehold.co/500x500/f5f5f5/222?text=Scratcher', ''),
('serok-pasir', 'Accessories', 'Serok / Sekop Pasir Kucing Plastik Tebal', 'Pasir & Toilet', '1 pcs', 15000, 'https://placehold.co/500x500/f5f5f5/222?text=Serok+Pasir', ''),
('sisir-bulu', 'Pet Glow', 'Sisir / Brush Lembut Bulu Kucing', 'Perawatan & Grooming', '1 pcs', 25000, 'https://placehold.co/500x500/f5f5f5/222?text=Sisir+Bulu', ''),
('suplemen-gel', 'Nutri-Plus', 'Suplemen Penambah Nafsu Makan Gel', 'Vitamin & Kesehatan', '120 gr', 95000, 'https://placehold.co/500x500/f5f5f5/222?text=Suplemen+Gel', ''),
('tali-tuntun', 'Paws & Claws', 'Harness & Tali Tuntun Jalan Kucing', 'Aksesoris Kucing', '1 set', 55000, 'https://placehold.co/500x500/f5f5f5/222?text=Tali+Tuntun', ''),
('terowongan-kucing', 'Interactive Meow', 'Terowongan Mainan Lipat Kucing', 'Mainan Kucing', '1 pcs', 75000, 'https://placehold.co/500x500/f5f5f5/222?text=Terowongan', ''),
('toilet-box-jumbo', 'Top Litter', 'Bak Pasir / Toilet Kucing Jumbo + Serok', 'Pasir & Toilet', '1 pcs', 65000, 'https://placehold.co/500x500/f5f5f5/222?text=Toilet+Box', ''),
('tongkat-bulu', 'Pet Play', 'Tongkat Bulu Ayam Mainan Kucing', 'Mainan Kucing', '1 pcs', 18000, 'https://placehold.co/500x500/f5f5f5/222?text=Tongkat+Bulu', ''),
('vitamin-bulu', 'Vitapet', 'Vitamin Bulu & Kulit Kucing 60ml', 'Vitamin & Kesehatan', '60 ml', 35000, 'https://placehold.co/500x500/f5f5f5/222?text=Vitamin+Bulu', ''),
('whiskas-adult-mackerel-1.2kg', 'Whiskas', 'Whiskas Adult Dry Food Mackerel', 'Makanan Kucing', '1.2 kg', 135000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Mackerel+1.2kg', 'PROMO'),
('whiskas-adult-tuna-1.2kg', 'Whiskas', 'Whiskas Adult Dry Food Tuna', 'Makanan Kucing', '1.2 kg', 135000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Tuna+1.2kg', ''),
('whiskas-adult-tuna-450gr', 'Whiskas', 'Whiskas Adult Tuna', 'Makanan Kucing', '450 gr', 58000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Tuna', 'PROMO'),
('whiskas-dentabites-treat-50gr', 'Whiskas', 'Whiskas Dentabites Cat Treat', 'Makanan Kucing', '50 gr', 25000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Dentabites', ''),
('whiskas-kitten-mackerel-450gr', 'Whiskas', 'Whiskas Kitten Mackerel', 'Makanan Kucing', '450 gr', 60000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Kitten', ''),
('whiskas-kitten-ocean-fish-450gr', 'Whiskas', 'Whiskas Kitten Ocean Fish', 'Makanan Kucing', '450 gr', 59000, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Kitten+Ocean+Fish', 'NEW'),
('whiskas-pouch-mackerel-85gr', 'Whiskas', 'Whiskas Pouch Adult Mackerel', 'Makanan Kucing', '85 gr', 8500, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Pouch+Mackerel', 'PROMO'),
('whiskas-pouch-tuna-85gr', 'Whiskas', 'Whiskas Pouch Adult Tuna', 'Makanan Kucing', '85 gr', 8500, 'https://placehold.co/500x500/f5f5f5/222?text=Whiskas+Pouch+Tuna', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`) VALUES
(1, 'Muhammad ario', 'ariomuhammad930@gmail.com', '$2y$10$urxZIoXUYFVbbdDwR9iaf.9Nh2mNwhNGpeWnqKePhQWMEIJimmFnC', 'admin'),
(2, 'Admin CatShop', 'admin@catshop.com', '$2y$10$Cs5fuLqvN7lB1ISwSej5/O7R9TPBbziYFtJz4wivT3Vl0B/aDGr2a', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

CREATE TABLE `wishlist` (
  `id_wishlist` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `wishlist`
--

INSERT INTO `wishlist` (`id_wishlist`, `id_user`, `id_produk`) VALUES
(2, 1, 901),
(5, 1, 902),
(7, 1, 500),
(9, 1, 903);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id_wishlist`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `id_konfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id_wishlist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
