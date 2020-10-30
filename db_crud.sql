/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.36-MariaDB : Database - db_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_crud` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_crud`;

/*Table structure for table `dosens` */

DROP TABLE IF EXISTS `dosens`;

CREATE TABLE `dosens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nip_dosen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dosen` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dosens_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `dosens_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `dosens` */

insert  into `dosens`(`id`,`id_prodi`,`nip_dosen`,`nama_dosen`,`created_at`,`updated_at`) values 
(1,1,'108989','Wayan Agus','2019-12-06 07:04:22','2019-12-08 12:16:07'),
(2,3,'634538','Ketut Ari','2019-12-10 12:32:08','2019-12-10 12:32:08'),
(3,2,'354656','Darma yasa','2019-12-10 12:32:31','2019-12-10 12:32:31');

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_mahasiswa` int(10) unsigned NOT NULL,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `nilai_huruf` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `krs_id_mahasiswa_foreign` (`id_mahasiswa`),
  KEY `krs_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  CONSTRAINT `krs_id_mahasiswa_foreign` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswas` (`id`),
  CONSTRAINT `krs_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `krs` */

insert  into `krs`(`id`,`id_mahasiswa`,`id_penawaran_mk`,`nilai_huruf`,`created_at`,`updated_at`) values 
(1,1,2,'B',NULL,'2019-12-08 15:17:36'),
(2,2,2,'C+','2019-12-10 13:16:09','2019-12-10 13:16:09');

/*Table structure for table `kurikulums` */

DROP TABLE IF EXISTS `kurikulums`;

CREATE TABLE `kurikulums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kurikulum` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` date NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kurikulums_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `kurikulums_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `kurikulums` */

insert  into `kurikulums`(`id`,`nama_kurikulum`,`tahun`,`id_prodi`,`created_at`,`updated_at`) values 
(1,'KTSP','2006-06-07',1,'2019-12-06 07:05:44','2019-12-06 07:05:44'),
(2,'K13','2013-02-13',1,'2019-12-06 07:06:07','2019-12-06 07:06:07');

/*Table structure for table `mahasiswas` */

DROP TABLE IF EXISTS `mahasiswas`;

CREATE TABLE `mahasiswas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prodi` int(10) unsigned NOT NULL,
  `nim` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_pa` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mahasiswas_id_prodi_foreign` (`id_prodi`),
  KEY `mahasiswas_id_pa_foreign` (`id_pa`),
  CONSTRAINT `mahasiswas_id_pa_foreign` FOREIGN KEY (`id_pa`) REFERENCES `dosens` (`id`),
  CONSTRAINT `mahasiswas_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `mahasiswas` */

insert  into `mahasiswas`(`id`,`id_prodi`,`nim`,`nama`,`alamat`,`email`,`tempat_lahir`,`tanggal_lahir`,`id_pa`,`created_at`,`updated_at`) values 
(1,1,'1805551012','Richard','Gianyar','asiyasiap@gmail.com','Gianyar','2000-07-02',1,'2019-12-06 07:07:27','2019-12-06 07:07:27'),
(2,1,'8372986','Martin','Buleleng','tintin@gmail.com','Singaraja','2000-08-06',2,'2019-12-10 12:49:43','2019-12-12 04:35:01'),
(3,1,'17832982','Ngurah','Karangasem','rahngurah@gmail.com','Denpasar','1999-02-05',3,'2019-12-10 12:50:29','2019-12-12 04:35:20');

/*Table structure for table `matakuliahs` */

DROP TABLE IF EXISTS `matakuliahs`;

CREATE TABLE `matakuliahs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_kurikulum` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matakuliahs_id_kurikulum_foreign` (`id_kurikulum`),
  KEY `matakuliahs_id_dosen_foreign` (`id_dosen`),
  KEY `matakuliahs_id_prodi_foreign` (`id_prodi`),
  CONSTRAINT `matakuliahs_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `matakuliahs_id_kurikulum_foreign` FOREIGN KEY (`id_kurikulum`) REFERENCES `kurikulums` (`id`),
  CONSTRAINT `matakuliahs_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `matakuliahs` */

insert  into `matakuliahs`(`id`,`kode_mk`,`nama_mk`,`sks`,`semester`,`id_kurikulum`,`id_dosen`,`id_prodi`,`created_at`,`updated_at`) values 
(1,'TI0212','Algortima',2,1,2,1,1,'2019-12-06 07:07:51','2019-12-06 07:07:51'),
(2,'TI0808','Konsep Basis Data',3,1,2,1,1,'2019-12-10 12:30:06','2019-12-10 12:30:06'),
(3,'S87778','Kalkulus',2,1,2,2,3,'2019-12-10 12:33:03','2019-12-10 12:33:03');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_11_22_063937_create_matakuliahs_table',1),
(2,'2019_11_22_064003_create_prodis_table',1),
(3,'2019_11_22_064019_create_dosens_table',1),
(4,'2019_11_22_064101_create_kurikulums_table',1),
(5,'2019_11_29_063111_create_mahasiswas_table',1),
(6,'2019_12_06_055718_create_pengampus_table',1),
(7,'2019_12_06_060130_create_penawaran_mks_table',1),
(8,'2019_12_06_060219_create_krs_table',1),
(9,'2019_12_06_063755_add_relation_to_dosen_table',1),
(10,'2019_12_06_063847_add_relation_to_mahasiswa_table',1),
(11,'2019_12_06_063916_add_relation_to_kurikulum_table',1),
(12,'2019_12_06_063942_add_relation_to_matakuliah_table',1),
(13,'2019_12_06_064105_add_relation_to_pengampu_table',1),
(14,'2019_12_06_064136_add_relation_to_penawaran_mk_table',1),
(15,'2019_12_06_070054_add_relation_to_krs_table',2);

/*Table structure for table `penawaran_mks` */

DROP TABLE IF EXISTS `penawaran_mks`;

CREATE TABLE `penawaran_mks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tahun_ajaran` year(4) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_prodi` int(10) unsigned NOT NULL,
  `id_matakuliah` int(10) unsigned NOT NULL,
  `kelas` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penawaran_mks_id_prodi_foreign` (`id_prodi`),
  KEY `penawaran_mks_id_matakuliah_foreign` (`id_matakuliah`),
  CONSTRAINT `penawaran_mks_id_matakuliah_foreign` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliahs` (`id`),
  CONSTRAINT `penawaran_mks_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `prodis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `penawaran_mks` */

insert  into `penawaran_mks`(`id`,`tahun_ajaran`,`semester`,`id_prodi`,`id_matakuliah`,`kelas`,`created_at`,`updated_at`) values 
(1,2018,1,1,1,'TI202','2019-12-08 11:15:14','2019-12-12 03:54:52'),
(2,2019,1,1,1,'S878',NULL,'2019-12-12 03:59:49');

/*Table structure for table `pengampus` */

DROP TABLE IF EXISTS `pengampus`;

CREATE TABLE `pengampus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_penawaran_mk` int(10) unsigned NOT NULL,
  `id_dosen` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pengampus_id_penawaran_mk_foreign` (`id_penawaran_mk`),
  KEY `pengampus_id_dosen_foreign` (`id_dosen`),
  CONSTRAINT `pengampus_id_dosen_foreign` FOREIGN KEY (`id_dosen`) REFERENCES `dosens` (`id`),
  CONSTRAINT `pengampus_id_penawaran_mk_foreign` FOREIGN KEY (`id_penawaran_mk`) REFERENCES `penawaran_mks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pengampus` */

insert  into `pengampus`(`id`,`id_penawaran_mk`,`id_dosen`,`order`,`created_at`,`updated_at`) values 
(1,1,1,25,'2019-12-08 11:27:00','2019-12-08 14:09:16'),
(2,2,3,20,'2019-12-10 13:20:43','2019-12-10 13:20:43');

/*Table structure for table `prodis` */

DROP TABLE IF EXISTS `prodis`;

CREATE TABLE `prodis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `prodis` */

insert  into `prodis`(`id`,`nama_prodi`,`created_at`,`updated_at`) values 
(1,'Teknologi Informasi','2019-12-06 07:04:04','2019-12-06 07:04:04'),
(2,'Teknik Arsitek','2019-12-06 07:06:20','2019-12-06 07:06:20'),
(3,'Teknik Sipil','2019-12-06 07:06:36','2019-12-06 07:06:43'),
(4,'Teknik Mesin','2019-12-06 07:06:52','2019-12-06 07:06:52'),
(5,'Teknik Elektro','2019-12-06 07:06:57','2019-12-06 07:06:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
