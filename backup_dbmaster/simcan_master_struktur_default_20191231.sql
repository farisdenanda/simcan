-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.20-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5754
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table dbsimcan_simulasi_merah.keu_ref_rek_4
DROP TABLE IF EXISTS `keu_ref_rek_4`;
CREATE TABLE IF NOT EXISTS `keu_ref_rek_4` (
  `Kd_Rek_1` tinyint(4) NOT NULL,
  `Kd_Rek_2` tinyint(4) NOT NULL,
  `Kd_Rek_3` tinyint(4) NOT NULL,
  `Kd_Rek_4` tinyint(4) NOT NULL,
  `Nm_Rek_4` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Kd_Rek_1`,`Kd_Rek_2`,`Kd_Rek_3`,`Kd_Rek_4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.keu_ref_rek_5
DROP TABLE IF EXISTS `keu_ref_rek_5`;
CREATE TABLE IF NOT EXISTS `keu_ref_rek_5` (
  `Kd_Rek_1` tinyint(4) NOT NULL,
  `Kd_Rek_2` tinyint(4) NOT NULL,
  `Kd_Rek_3` tinyint(4) NOT NULL,
  `Kd_Rek_4` tinyint(4) NOT NULL,
  `Kd_Rek_5` smallint(4) NOT NULL,
  `Nm_Rek_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Peraturan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Id_Rekening` bigint(255) NOT NULL,
  PRIMARY KEY (`Id_Rekening`),
  UNIQUE KEY `Kd_Rek_1` (`Kd_Rek_1`,`Kd_Rek_2`,`Kd_Rek_3`,`Kd_Rek_4`,`Kd_Rek_5`),
  CONSTRAINT `keu_ref_rek_5_ibfk_1` FOREIGN KEY (`Kd_Rek_1`, `Kd_Rek_2`, `Kd_Rek_3`, `Kd_Rek_4`) REFERENCES `keu_ref_rek_4` (`Kd_Rek_1`, `Kd_Rek_2`, `Kd_Rek_3`, `Kd_Rek_4`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_cascading_indikator_kegiatan_pd
DROP TABLE IF EXISTS `kin_trx_cascading_indikator_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `kin_trx_cascading_indikator_kegiatan_pd` (
  `id_indikator_kegiatan_pd` int(11) NOT NULL AUTO_INCREMENT,
  `id_hasil_kegiatan` int(11) NOT NULL DEFAULT '0',
  `id_renstra_kegiatan_indikator` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_indikator_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `FK_kin_trx_cascading_indikator_program_pd_1` (`id_hasil_kegiatan`,`id_renstra_kegiatan_indikator`) USING BTREE,
  CONSTRAINT `FK_kin_trx_cascading_indikator_kegiatan_pd_kin_1` FOREIGN KEY (`id_hasil_kegiatan`) REFERENCES `kin_trx_cascading_kegiatan_opd` (`id_hasil_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_cascading_indikator_program_pd
DROP TABLE IF EXISTS `kin_trx_cascading_indikator_program_pd`;
CREATE TABLE IF NOT EXISTS `kin_trx_cascading_indikator_program_pd` (
  `id_indikator_program_pd` int(11) NOT NULL AUTO_INCREMENT,
  `id_hasil_program` int(11) NOT NULL DEFAULT '0',
  `id_renstra_program_indikator` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_indikator_program_pd`) USING BTREE,
  UNIQUE KEY `FK_kin_trx_cascading_indikator_program_pd_1` (`id_hasil_program`,`id_renstra_program_indikator`) USING BTREE,
  CONSTRAINT `FK_kin_trx_cascading_indikator_program_pd_1` FOREIGN KEY (`id_hasil_program`) REFERENCES `kin_trx_cascading_program_opd` (`id_hasil_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_cascading_kegiatan_opd
DROP TABLE IF EXISTS `kin_trx_cascading_kegiatan_opd`;
CREATE TABLE IF NOT EXISTS `kin_trx_cascading_kegiatan_opd` (
  `id_hasil_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) NOT NULL DEFAULT '0',
  `id_hasil_program` int(11) NOT NULL DEFAULT '0',
  `id_renstra_kegiatan` int(11) NOT NULL DEFAULT '0',
  `uraian_hasil_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_hasil_kegiatan`) USING BTREE,
  KEY `FK_kin_trx_cascading_kegiatan_opd_kin_trx_cascading_program_opd` (`id_hasil_program`,`id_renstra_kegiatan`,`id_unit`) USING BTREE,
  CONSTRAINT `FK_kin_trx_cascading_kegiatan_opd_kin_trx_cascading_program_opd` FOREIGN KEY (`id_hasil_program`) REFERENCES `kin_trx_cascading_program_opd` (`id_hasil_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_cascading_program_opd
DROP TABLE IF EXISTS `kin_trx_cascading_program_opd`;
CREATE TABLE IF NOT EXISTS `kin_trx_cascading_program_opd` (
  `id_hasil_program` int(11) NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL DEFAULT '2019',
  `id_unit` int(11) NOT NULL DEFAULT '0',
  `id_renstra_sasaran` int(11) NOT NULL DEFAULT '0',
  `id_renstra_program` int(11) NOT NULL DEFAULT '0',
  `uraian_hasil_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_hasil_program`) USING BTREE,
  KEY `tahun` (`tahun`,`id_unit`,`id_renstra_sasaran`,`id_renstra_program`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_opd_dok
DROP TABLE IF EXISTS `kin_trx_iku_opd_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_opd_dok` (
  `id_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `no_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date NOT NULL,
  `uraian_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_renstra` int(11) NOT NULL DEFAULT '1',
  `id_perubahan` int(11) DEFAULT NULL,
  `status_dokumen` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_unit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dokumen`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_opd_kegiatan
DROP TABLE IF EXISTS `kin_trx_iku_opd_kegiatan`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_opd_kegiatan` (
  `id_iku_opd_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_iku_opd_program` int(11) NOT NULL,
  `id_indikator_kegiatan_renstra` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `flag_iku` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_esl4` int(11) NOT NULL DEFAULT '0',
  `id_kegiatan_renstra` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_iku_opd_kegiatan`) USING BTREE,
  KEY `id_dokumen` (`id_iku_opd_program`) USING BTREE,
  CONSTRAINT `kin_trx_iku_opd_kegiatan_ibfk_1` FOREIGN KEY (`id_iku_opd_program`) REFERENCES `kin_trx_iku_opd_program` (`id_iku_opd_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_opd_program
DROP TABLE IF EXISTS `kin_trx_iku_opd_program`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_opd_program` (
  `id_iku_opd_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_iku_opd_sasaran` int(11) NOT NULL,
  `id_indikator_program_renstra` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `flag_iku` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_program_renstra` int(11) NOT NULL DEFAULT '0',
  `id_esl3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_iku_opd_program`) USING BTREE,
  KEY `id_dokumen` (`id_iku_opd_sasaran`) USING BTREE,
  CONSTRAINT `kin_trx_iku_opd_program_ibfk_1` FOREIGN KEY (`id_iku_opd_sasaran`) REFERENCES `kin_trx_iku_opd_sasaran` (`id_iku_opd_sasaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_opd_sasaran
DROP TABLE IF EXISTS `kin_trx_iku_opd_sasaran`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_opd_sasaran` (
  `id_iku_opd_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen` int(11) NOT NULL,
  `id_indikator_sasaran_renstra` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `flag_iku` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_sasaran_renstra` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_iku_opd_sasaran`) USING BTREE,
  KEY `id_dokumen` (`id_dokumen`) USING BTREE,
  CONSTRAINT `kin_trx_iku_opd_sasaran_ibfk_1` FOREIGN KEY (`id_dokumen`) REFERENCES `kin_trx_iku_opd_dok` (`id_dokumen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_pemda_dok
DROP TABLE IF EXISTS `kin_trx_iku_pemda_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_pemda_dok` (
  `id_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `no_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date NOT NULL,
  `uraian_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rpjmd` int(11) NOT NULL DEFAULT '1',
  `id_perubahan` int(11) DEFAULT NULL,
  `status_dokumen` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_iku_pemda_rinci
DROP TABLE IF EXISTS `kin_trx_iku_pemda_rinci`;
CREATE TABLE IF NOT EXISTS `kin_trx_iku_pemda_rinci` (
  `id_iku_pemda` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen` int(11) NOT NULL,
  `id_indikator_sasaran_rpjmd` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `flag_iku` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `unit_penanggung_jawab` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_iku_pemda`) USING BTREE,
  KEY `id_dokumen` (`id_dokumen`) USING BTREE,
  CONSTRAINT `kin_trx_iku_pemda_rinci_ibfk_1` FOREIGN KEY (`id_dokumen`) REFERENCES `kin_trx_iku_pemda_dok` (`id_dokumen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es3_dok
DROP TABLE IF EXISTS `kin_trx_perkin_es3_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es3_dok` (
  `id_dokumen_perkin` int(11) NOT NULL AUTO_INCREMENT,
  `id_sotk_es3` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `tanggal_mulai` date NOT NULL DEFAULT '2018-01-01',
  `id_pegawai` int(11) NOT NULL DEFAULT '0',
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_perkin`) USING BTREE,
  KEY `id_unit` (`id_sotk_es3`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es3_kegiatan
DROP TABLE IF EXISTS `kin_trx_perkin_es3_kegiatan`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es3_kegiatan` (
  `id_perkin_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_perkin_program` int(11) DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_sotk_es4` int(11) NOT NULL DEFAULT '0',
  `status_data` int(2) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_kegiatan`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_program`) USING BTREE,
  KEY `id_program` (`id_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_es3_kegiatan_ibfk_1` FOREIGN KEY (`id_perkin_program`) REFERENCES `kin_trx_perkin_es3_program` (`id_perkin_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es3_program
DROP TABLE IF EXISTS `kin_trx_perkin_es3_program`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es3_program` (
  `id_perkin_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) NOT NULL DEFAULT '0',
  `id_perkin_program_opd` int(11) NOT NULL,
  `id_program_renstra` int(11) NOT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_program`) USING BTREE,
  KEY `id_program` (`id_program_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_perkin`) USING BTREE,
  KEY `id_perkin_program_opd` (`id_perkin_program_opd`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_es3_program_ibfk_1` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_es3_dok` (`id_dokumen_perkin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_perkin_es3_program_ibfk_2` FOREIGN KEY (`id_perkin_program_opd`) REFERENCES `kin_trx_perkin_opd_program` (`id_perkin_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es3_program_indikator
DROP TABLE IF EXISTS `kin_trx_perkin_es3_program_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es3_program_indikator` (
  `id_perkin_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_perkin_program` int(11) DEFAULT NULL,
  `id_indikator_program_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_indikator`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_program`) USING BTREE,
  KEY `id_program` (`id_indikator_program_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_es3_program_indikator_ibfk_1` FOREIGN KEY (`id_perkin_program`) REFERENCES `kin_trx_perkin_es3_program` (`id_perkin_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es4_dok
DROP TABLE IF EXISTS `kin_trx_perkin_es4_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es4_dok` (
  `id_dokumen_perkin` int(11) NOT NULL AUTO_INCREMENT,
  `id_sotk_es4` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `tanggal_mulai` date NOT NULL DEFAULT '2018-01-01',
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_perkin`) USING BTREE,
  KEY `id_unit` (`id_sotk_es4`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es4_kegiatan
DROP TABLE IF EXISTS `kin_trx_perkin_es4_kegiatan`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es4_kegiatan` (
  `id_perkin_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) NOT NULL DEFAULT '0',
  `id_perkin_kegiatan_es3` int(11) DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL,
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_kegiatan`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_kegiatan_es3`) USING BTREE,
  KEY `id_program` (`id_kegiatan_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_perkin`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_es4_kegiatan_ibfk_1` FOREIGN KEY (`id_perkin_kegiatan_es3`) REFERENCES `kin_trx_perkin_es3_kegiatan` (`id_perkin_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_perkin_es4_kegiatan_ibfk_2` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_es4_dok` (`id_dokumen_perkin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_es4_kegiatan_indikator
DROP TABLE IF EXISTS `kin_trx_perkin_es4_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_es4_kegiatan_indikator` (
  `id_perkin_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_perkin_kegiatan` int(11) DEFAULT NULL,
  `id_indikator_kegiatan_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_indikator`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_kegiatan`) USING BTREE,
  KEY `id_program` (`id_indikator_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_es4_kegiatan_indikator_ibfk_1` FOREIGN KEY (`id_perkin_kegiatan`) REFERENCES `kin_trx_perkin_es4_kegiatan` (`id_perkin_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_dok
DROP TABLE IF EXISTS `kin_trx_perkin_opd_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_dok` (
  `id_dokumen_perkin` int(11) NOT NULL AUTO_INCREMENT,
  `id_sotk_es2` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `tanggal_mulai` date NOT NULL DEFAULT '2018-01-01',
  `id_pegawai` int(11) NOT NULL DEFAULT '0',
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_perkin`) USING BTREE,
  KEY `id_unit` (`id_sotk_es2`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_program
DROP TABLE IF EXISTS `kin_trx_perkin_opd_program`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_program` (
  `id_perkin_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_perkin_sasaran` int(11) NOT NULL,
  `id_hasil_program` int(11) NOT NULL DEFAULT '0',
  `id_program_renstra` int(11) NOT NULL,
  `id_sotk_es3` int(11) NOT NULL DEFAULT '0',
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_program`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_sasaran`) USING BTREE,
  KEY `id_program` (`id_program_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_opd_program_ibfk_1` FOREIGN KEY (`id_perkin_sasaran`) REFERENCES `kin_trx_perkin_opd_sasaran` (`id_perkin_sasaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_program_indikator
DROP TABLE IF EXISTS `kin_trx_perkin_opd_program_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_program_indikator` (
  `id_perkin_indikator` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_perkin_program` bigint(255) NOT NULL,
  `id_indikator_program_pd` bigint(255) NOT NULL,
  `id_renstra_program_indikator` bigint(255) NOT NULL,
  `jml_target` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_indikator`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_program_pelaksana
DROP TABLE IF EXISTS `kin_trx_perkin_opd_program_pelaksana`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_program_pelaksana` (
  `id_perkin_pelaksana` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_perkin_indikator` bigint(255) NOT NULL,
  `id_sotk_es3` bigint(255) NOT NULL,
  `jml_target` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_pelaksana`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_sasaran
DROP TABLE IF EXISTS `kin_trx_perkin_opd_sasaran`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_sasaran` (
  `id_perkin_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_sasaran`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_dokumen_perkin`) USING BTREE,
  KEY `id_program` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_opd_sasaran_ibfk_1` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_opd_dok` (`id_dokumen_perkin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_perkin_opd_sasaran_indikator
DROP TABLE IF EXISTS `kin_trx_perkin_opd_sasaran_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_perkin_opd_sasaran_indikator` (
  `id_perkin_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_perkin_sasaran` int(11) DEFAULT NULL,
  `id_indikator_sasaran_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkin_indikator`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_sasaran`) USING BTREE,
  KEY `id_program` (`id_indikator_sasaran_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_perkin_opd_sasaran_indikator_ibfk_1` FOREIGN KEY (`id_perkin_sasaran`) REFERENCES `kin_trx_perkin_opd_sasaran` (`id_perkin_sasaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es2_dok
DROP TABLE IF EXISTS `kin_trx_real_es2_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es2_dok` (
  `id_dokumen_real` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) DEFAULT NULL,
  `id_sotk_es2` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `triwulan` int(11) NOT NULL DEFAULT '1',
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_real`) USING BTREE,
  KEY `id_unit` (`id_sotk_es2`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_perkin`) USING BTREE,
  CONSTRAINT `kin_trx_real_es2_dok_ibfk_1` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_opd_dok` (`id_dokumen_perkin`),
  CONSTRAINT `kin_trx_real_es2_dok_ibfk_2` FOREIGN KEY (`id_sotk_es2`) REFERENCES `ref_sotk_level_1` (`id_sotk_es2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es2_program
DROP TABLE IF EXISTS `kin_trx_real_es2_program`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es2_program` (
  `id_real_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_real_sasaran` int(11) NOT NULL DEFAULT '0',
  `id_real_program_es3` int(11) DEFAULT NULL,
  `id_perkin_program` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL,
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_real_program`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_program`) USING BTREE,
  KEY `id_program` (`id_program_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_real_sasaran`) USING BTREE,
  KEY `id_real_program_es3` (`id_real_program_es3`) USING BTREE,
  CONSTRAINT `kin_trx_real_es2_program_ibfk_1` FOREIGN KEY (`id_real_sasaran`) REFERENCES `kin_trx_real_es2_sasaran` (`id_real_sasaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_real_es2_program_ibfk_2` FOREIGN KEY (`id_perkin_program`) REFERENCES `kin_trx_perkin_opd_program` (`id_perkin_program`),
  CONSTRAINT `kin_trx_real_es2_program_ibfk_3` FOREIGN KEY (`id_real_program_es3`) REFERENCES `kin_trx_real_es3_program` (`id_real_program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es2_sasaran
DROP TABLE IF EXISTS `kin_trx_real_es2_sasaran`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es2_sasaran` (
  `id_real_sasaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_real` int(11) DEFAULT NULL,
  `id_perkin_sasaran` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_real_sasaran`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_dokumen_real`) USING BTREE,
  KEY `id_program` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_real_es2_sasaran_ibfk_1` FOREIGN KEY (`id_dokumen_real`) REFERENCES `kin_trx_real_es2_dok` (`id_dokumen_real`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es2_sasaran_indikator
DROP TABLE IF EXISTS `kin_trx_real_es2_sasaran_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es2_sasaran_indikator` (
  `id_real_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_real_sasaran` int(11) DEFAULT NULL,
  `id_perkin_indikator` int(11) DEFAULT NULL,
  `id_indikator_sasaran_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_fisik` decimal(20,2) NOT NULL DEFAULT '0.00',
  `uraian_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_real_indikator`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_real_sasaran`) USING BTREE,
  KEY `id_program` (`id_indikator_sasaran_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_real_es2_sasaran_indikator_ibfk_1` FOREIGN KEY (`id_real_sasaran`) REFERENCES `kin_trx_real_es2_sasaran` (`id_real_sasaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es3_dok
DROP TABLE IF EXISTS `kin_trx_real_es3_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es3_dok` (
  `id_dokumen_real` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) DEFAULT NULL,
  `id_sotk_es3` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `triwulan` int(11) NOT NULL DEFAULT '1',
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_real`) USING BTREE,
  KEY `id_unit` (`id_sotk_es3`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_perkin`) USING BTREE,
  CONSTRAINT `kin_trx_real_es3_dok_ibfk_1` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_es3_dok` (`id_dokumen_perkin`),
  CONSTRAINT `kin_trx_real_es3_dok_ibfk_2` FOREIGN KEY (`id_sotk_es3`) REFERENCES `ref_sotk_level_2` (`id_sotk_es3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es3_kegiatan
DROP TABLE IF EXISTS `kin_trx_real_es3_kegiatan`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es3_kegiatan` (
  `id_real_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_real_program` int(11) NOT NULL DEFAULT '0',
  `id_perkin_kegiatan` int(11) DEFAULT NULL,
  `id_real_kegiatan_es4` int(11) DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL,
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_real_kegiatan_4` int(11) NOT NULL,
  PRIMARY KEY (`id_real_kegiatan`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_kegiatan`) USING BTREE,
  KEY `id_program` (`id_kegiatan_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_real_program`) USING BTREE,
  KEY `id_real_kegiatan_es4` (`id_real_kegiatan_es4`) USING BTREE,
  CONSTRAINT `kin_trx_real_es3_kegiatan_ibfk_1` FOREIGN KEY (`id_real_program`) REFERENCES `kin_trx_real_es3_program` (`id_real_program`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_real_es3_kegiatan_ibfk_2` FOREIGN KEY (`id_real_kegiatan_es4`) REFERENCES `kin_trx_real_es4_kegiatan` (`id_real_kegiatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es3_program
DROP TABLE IF EXISTS `kin_trx_real_es3_program`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es3_program` (
  `id_real_program` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_real` int(11) NOT NULL DEFAULT '0',
  `id_perkin_program` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL,
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `uraian_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_real_program`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_program`) USING BTREE,
  KEY `id_program` (`id_program_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_real`) USING BTREE,
  CONSTRAINT `kin_trx_real_es3_program_ibfk_1` FOREIGN KEY (`id_dokumen_real`) REFERENCES `kin_trx_real_es3_dok` (`id_dokumen_real`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_real_es3_program_ibfk_2` FOREIGN KEY (`id_perkin_program`) REFERENCES `kin_trx_perkin_es3_program` (`id_perkin_program`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es3_program_indikator
DROP TABLE IF EXISTS `kin_trx_real_es3_program_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es3_program_indikator` (
  `id_real_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_real_program` int(11) NOT NULL,
  `id_perkin_indikator` int(11) DEFAULT NULL,
  `id_indikator_program_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_fisik` decimal(20,2) NOT NULL DEFAULT '0.00',
  `uraian_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reviu_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviu_real` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reviu_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_real_indikator`) USING BTREE,
  KEY `id_program` (`id_indikator_program_renstra`) USING BTREE,
  KEY `id_real_program` (`id_real_program`) USING BTREE,
  CONSTRAINT `kin_trx_real_es3_program_indikator_ibfk_1` FOREIGN KEY (`id_real_program`) REFERENCES `kin_trx_real_es3_program` (`id_real_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es4_dok
DROP TABLE IF EXISTS `kin_trx_real_es4_dok`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es4_dok` (
  `id_dokumen_real` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_perkin` int(11) DEFAULT NULL,
  `id_sotk_es4` int(11) NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `triwulan` int(11) NOT NULL DEFAULT '1',
  `no_dokumen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pangkat_penandatangan` int(11) NOT NULL DEFAULT '0',
  `uraian_pangkat_penandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_penandatangan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_dokumen_real`) USING BTREE,
  KEY `id_unit` (`id_sotk_es4`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_perkin`) USING BTREE,
  CONSTRAINT `kin_trx_real_es4_dok_ibfk_1` FOREIGN KEY (`id_dokumen_perkin`) REFERENCES `kin_trx_perkin_es4_dok` (`id_dokumen_perkin`),
  CONSTRAINT `kin_trx_real_es4_dok_ibfk_2` FOREIGN KEY (`id_sotk_es4`) REFERENCES `ref_sotk_level_3` (`id_sotk_es4`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es4_kegiatan
DROP TABLE IF EXISTS `kin_trx_real_es4_kegiatan`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es4_kegiatan` (
  `id_real_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_real` int(11) NOT NULL DEFAULT '0',
  `id_perkin_kegiatan` int(11) DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `pagu_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t2` decimal(20,2) NOT NULL,
  `pagu_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(2) DEFAULT NULL,
  `uraian_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_real_kegiatan`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_perkin_kegiatan`) USING BTREE,
  KEY `id_program` (`id_kegiatan_renstra`) USING BTREE,
  KEY `id_dokumen_perkin` (`id_dokumen_real`) USING BTREE,
  CONSTRAINT `kin_trx_real_es4_kegiatan_ibfk_1` FOREIGN KEY (`id_dokumen_real`) REFERENCES `kin_trx_real_es4_dok` (`id_dokumen_real`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kin_trx_real_es4_kegiatan_ibfk_2` FOREIGN KEY (`id_perkin_kegiatan`) REFERENCES `kin_trx_perkin_es4_kegiatan` (`id_perkin_kegiatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.kin_trx_real_es4_kegiatan_indikator
DROP TABLE IF EXISTS `kin_trx_real_es4_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `kin_trx_real_es4_kegiatan_indikator` (
  `id_real_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `id_real_kegiatan` int(11) DEFAULT NULL,
  `id_perkin_indikator` int(11) DEFAULT NULL,
  `id_indikator_kegiatan_renstra` int(11) DEFAULT NULL,
  `target_tahun` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t2` decimal(20,2) NOT NULL,
  `target_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t2` decimal(20,2) NOT NULL,
  `real_t3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_t4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `real_fisik` decimal(20,2) NOT NULL,
  `uraian_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reviu_renaksi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviu_deviasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviu_real` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_real_indikator`) USING BTREE,
  KEY `id_sasaran_kinerja_skpd` (`id_real_kegiatan`) USING BTREE,
  KEY `id_program` (`id_indikator_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `kin_trx_real_es4_kegiatan_indikator_ibfk_1` FOREIGN KEY (`id_real_kegiatan`) REFERENCES `kin_trx_real_es4_kegiatan` (`id_real_kegiatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_api_manajemen
DROP TABLE IF EXISTS `ref_api_manajemen`;
CREATE TABLE IF NOT EXISTS `ref_api_manajemen` (
  `id_setting` int(11) NOT NULL AUTO_INCREMENT,
  `id_app` int(11) NOT NULL,
  `url_api` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_barrier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_setting`),
  UNIQUE KEY `id_app` (`id_app`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_aspek_pembangunan
DROP TABLE IF EXISTS `ref_aspek_pembangunan`;
CREATE TABLE IF NOT EXISTS `ref_aspek_pembangunan` (
  `id_aspek` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_aspek_pembangunan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_aspek`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_bidang
DROP TABLE IF EXISTS `ref_bidang`;
CREATE TABLE IF NOT EXISTS `ref_bidang` (
  `id_bidang` int(11) NOT NULL AUTO_INCREMENT,
  `kd_urusan` int(255) NOT NULL,
  `kd_bidang` int(255) NOT NULL,
  `nm_bidang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_fungsi` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_bidang`) USING BTREE,
  UNIQUE KEY `idx_ref_bidang` (`kd_urusan`,`kd_bidang`) USING BTREE,
  KEY `fk_ref_fungsi` (`kd_fungsi`) USING BTREE,
  CONSTRAINT `ref_bidang_ibfk_1` FOREIGN KEY (`kd_fungsi`) REFERENCES `ref_fungsi` (`kd_fungsi`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ref_bidang_ibfk_2` FOREIGN KEY (`kd_urusan`) REFERENCES `ref_urusan` (`kd_urusan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_data_sub_unit
DROP TABLE IF EXISTS `ref_data_sub_unit`;
CREATE TABLE IF NOT EXISTS `ref_data_sub_unit` (
  `tahun` int(11) NOT NULL,
  `id_rincian_unit` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_unit` int(11) NOT NULL,
  `alamat_sub_unit` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota_sub_unit` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_jabatan_pimpinan_skpd` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_pimpinan_skpd` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_pimpinan_skpd` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rincian_unit`) USING BTREE,
  UNIQUE KEY `tahun` (`tahun`,`id_sub_unit`) USING BTREE,
  KEY `id_sub_unit` (`id_sub_unit`) USING BTREE,
  CONSTRAINT `fk_data_sub_unit` FOREIGN KEY (`id_sub_unit`) REFERENCES `ref_sub_unit` (`id_sub_unit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_desa
DROP TABLE IF EXISTS `ref_desa`;
CREATE TABLE IF NOT EXISTS `ref_desa` (
  `id_kecamatan` int(11) NOT NULL,
  `kd_desa` int(11) NOT NULL COMMENT 'kode desa / kelurahan',
  `id_desa` int(11) NOT NULL AUTO_INCREMENT,
  `status_desa` int(11) NOT NULL COMMENT '2 = Desa 1 = Kelurahan',
  `nama_desa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_zona` int(11) NOT NULL,
  PRIMARY KEY (`id_desa`) USING BTREE,
  UNIQUE KEY `id_kecamatan` (`id_kecamatan`,`kd_desa`) USING BTREE,
  CONSTRAINT `ref_desa_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `ref_kecamatan` (`id_kecamatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_dokumen
DROP TABLE IF EXISTS `ref_dokumen`;
CREATE TABLE IF NOT EXISTS `ref_dokumen` (
  `id_dokumen` int(255) NOT NULL,
  `nm_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_proses` int(11) NOT NULL DEFAULT '0' COMMENT '0 = rkpd 1 = renja 2 = rpjmd 3 = renstra',
  `urut_tampil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_fungsi
DROP TABLE IF EXISTS `ref_fungsi`;
CREATE TABLE IF NOT EXISTS `ref_fungsi` (
  `kd_fungsi` int(11) NOT NULL AUTO_INCREMENT,
  `kode_fungsi` int(11) NOT NULL DEFAULT '0',
  `nm_fungsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kd_fungsi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_group
DROP TABLE IF EXISTS `ref_group`;
CREATE TABLE IF NOT EXISTS `ref_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_roles` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_indikator
DROP TABLE IF EXISTS `ref_indikator`;
CREATE TABLE IF NOT EXISTS `ref_indikator` (
  `id_indikator` int(11) NOT NULL AUTO_INCREMENT,
  `type_indikator` int(11) NOT NULL DEFAULT '0' COMMENT '0 keluaran 1 hasil 2 dampak 3 masukan',
  `jenis_indikator` int(11) NOT NULL DEFAULT '0' COMMENT '1 positif 0 negatif',
  `sifat_indikator` int(11) NOT NULL DEFAULT '0' COMMENT '1 Incremental 2 Absolut  3 Komulatif',
  `nm_indikator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag_iku` int(11) NOT NULL DEFAULT '0' COMMENT '0 non iku 1 iku pemda 2 iku skpd',
  `asal_indikator` int(11) DEFAULT '0' COMMENT '0 rpjmd 1 renstra 2 rkpd 3 renja',
  `metode_penghitungan` blob COMMENT 'file image ',
  `sumber_data_indikator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_satuan_output` int(255) DEFAULT NULL,
  `kualitas_indikator` int(255) NOT NULL DEFAULT '0' COMMENT '0 kualitas 1 kuantitas 2 persentase 3 rata-rata 4 rasio',
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `id_aspek` int(11) NOT NULL DEFAULT '0',
  `nama_file` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator`) USING BTREE,
  FULLTEXT KEY `nm_indikator` (`nm_indikator`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_jadwal
DROP TABLE IF EXISTS `ref_jadwal`;
CREATE TABLE IF NOT EXISTS `ref_jadwal` (
  `tahun` int(11) NOT NULL,
  `id_proses` int(11) NOT NULL AUTO_INCREMENT,
  `id_langkah` int(11) NOT NULL,
  `jenis_proses` int(11) NOT NULL DEFAULT '0' COMMENT '0 = rkpd 1 = renja 2 = rpjmd 3 = renstra',
  `uraian_proses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `status_proses` int(255) DEFAULT '0' COMMENT '0 = belum 1 = proses 2 = selesai 3 = kedaluwarsa 4 = batal',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proses`) USING BTREE,
  UNIQUE KEY `idx_ref_jadwal` (`tahun`,`id_langkah`,`jenis_proses`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_jenis_lokasi
DROP TABLE IF EXISTS `ref_jenis_lokasi`;
CREATE TABLE IF NOT EXISTS `ref_jenis_lokasi` (
  `id_jenis` int(11) NOT NULL,
  `nm_jenis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_jenis`) USING BTREE,
  UNIQUE KEY `id_jenis` (`id_jenis`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_kabupaten
DROP TABLE IF EXISTS `ref_kabupaten`;
CREATE TABLE IF NOT EXISTS `ref_kabupaten` (
  `id_pemda` int(11) NOT NULL,
  `id_prov` int(11) NOT NULL,
  `id_kab` int(11) NOT NULL AUTO_INCREMENT,
  `kd_kab` int(11) NOT NULL,
  `nama_kab_kota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kab`) USING BTREE,
  UNIQUE KEY `id_pemda` (`id_pemda`,`id_prov`,`id_kab`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_kecamatan
DROP TABLE IF EXISTS `ref_kecamatan`;
CREATE TABLE IF NOT EXISTS `ref_kecamatan` (
  `id_pemda` int(11) NOT NULL,
  `kd_kecamatan` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kecamatan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kecamatan`) USING BTREE,
  UNIQUE KEY `id_kecamatan` (`id_pemda`,`kd_kecamatan`) USING BTREE,
  CONSTRAINT `fk_ref_kecamatan` FOREIGN KEY (`id_pemda`) REFERENCES `ref_kabupaten` (`id_kab`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_kegiatan
DROP TABLE IF EXISTS `ref_kegiatan`;
CREATE TABLE IF NOT EXISTS `ref_kegiatan` (
  `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT,
  `id_program` int(11) NOT NULL,
  `kd_kegiatan` int(11) NOT NULL,
  `nm_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_ref_kegiatan` (`id_program`,`kd_kegiatan`) USING BTREE,
  CONSTRAINT `fk_ref_kegiatan` FOREIGN KEY (`id_program`) REFERENCES `ref_program` (`id_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3982 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_kolom_tabel_dasar
DROP TABLE IF EXISTS `ref_kolom_tabel_dasar`;
CREATE TABLE IF NOT EXISTS `ref_kolom_tabel_dasar` (
  `id_kolom_tabel_dasar` int(11) NOT NULL,
  `id_tabel_dasar` int(11) DEFAULT NULL,
  `nama_kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id_kolom_tabel_dasar`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `id_tabel_dasar` (`id_tabel_dasar`) USING BTREE,
  CONSTRAINT `ref_kolom_tabel_dasar_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ref_kolom_tabel_dasar` (`id_kolom_tabel_dasar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ref_kolom_tabel_dasar_ibfk_2` FOREIGN KEY (`id_tabel_dasar`) REFERENCES `ref_tabel_dasar` (`id_tabel_dasar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_langkah
DROP TABLE IF EXISTS `ref_langkah`;
CREATE TABLE IF NOT EXISTS `ref_langkah` (
  `id_langkah` int(255) NOT NULL,
  `jenis_dokumen` int(255) NOT NULL,
  `nm_langkah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_langkah`,`jenis_dokumen`) USING BTREE,
  UNIQUE KEY `idx_ref_step` (`id_langkah`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_laporan
DROP TABLE IF EXISTS `ref_laporan`;
CREATE TABLE IF NOT EXISTS `ref_laporan` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_modul` int(11) NOT NULL DEFAULT '0' COMMENT '0 : Parameter 1 : SSH 2 : ASB 3 : RPJMD 4 : Renstra 5 : RKPD 6 : Renja 7 : Forum 8 : Musrenbang 9 : Pokir 10 : PPAS 11 : RAPBD : 12 APBD ',
  `id_dokumen` int(11) NOT NULL DEFAULT '0',
  `jns_laporan` int(11) NOT NULL DEFAULT '0' COMMENT '0 : Utama 1 : Manajemen',
  `id_laporan` int(11) NOT NULL DEFAULT '1',
  `no_urut` int(11) NOT NULL DEFAULT '1',
  `uraian_laporan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_laporan` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_modul` (`id_modul`,`id_dokumen`,`jns_laporan`,`id_laporan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_log_akses
DROP TABLE IF EXISTS `ref_log_akses`;
CREATE TABLE IF NOT EXISTS `ref_log_akses` (
  `id_log` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fl1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fd1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fp2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fu3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fr4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_log_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_log_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_lokasi
DROP TABLE IF EXISTS `ref_lokasi`;
CREATE TABLE IF NOT EXISTS `ref_lokasi` (
  `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_lokasi` int(11) NOT NULL COMMENT '0 = Kewilayahan\r\n1 = Ruas Jalan \r\n2 = Saluran Irigasi\r\n3 = Kawasan\r\n99 = Lokasi di Luar Daerah',
  `nama_lokasi` varchar(255) CHARACTER SET latin1 NOT NULL,
  `id_desa` int(11) DEFAULT NULL,
  `id_desa_awal` int(11) DEFAULT NULL,
  `id_desa_akhir` int(11) DEFAULT NULL,
  `koordinat_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `koordinat_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `koordinat_3` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `koordinat_4` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luasan_kawasan` decimal(20,2) DEFAULT '0.00',
  `satuan_luas` int(50) DEFAULT NULL,
  `panjang` decimal(20,2) DEFAULT '0.00',
  `satuan_panjang` int(50) DEFAULT NULL,
  `lebar` decimal(20,2) DEFAULT '0.00',
  `satuan_lebar` int(11) DEFAULT NULL,
  `keterangan_lokasi` longtext CHARACTER SET latin1,
  PRIMARY KEY (`id_lokasi`) USING BTREE,
  UNIQUE KEY `jenis_lokasi` (`jenis_lokasi`,`nama_lokasi`,`id_desa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_mapping_asb_renstra
DROP TABLE IF EXISTS `ref_mapping_asb_renstra`;
CREATE TABLE IF NOT EXISTS `ref_mapping_asb_renstra` (
  `id_aktivitas_asb` bigint(20) NOT NULL,
  `id_kegiatan_renstra` int(11) NOT NULL,
  KEY `idx_ref_mapping_asb_renstra` (`id_aktivitas_asb`,`id_kegiatan_renstra`) USING BTREE,
  KEY `fk_ref_mapping_asb_renstra1` (`id_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `fk_ref_mapping_asb_renstra` FOREIGN KEY (`id_aktivitas_asb`) REFERENCES `trx_asb_aktivitas` (`id_aktivitas_asb`),
  CONSTRAINT `fk_ref_mapping_asb_renstra1` FOREIGN KEY (`id_kegiatan_renstra`) REFERENCES `trx_renstra_kegiatan` (`id_kegiatan_renstra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_menu
DROP TABLE IF EXISTS `ref_menu`;
CREATE TABLE IF NOT EXISTS `ref_menu` (
  `id_menu` bigint(255) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `menu` int(11) NOT NULL,
  `akses` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE,
  UNIQUE KEY `menu` (`menu`,`group_id`) USING BTREE,
  KEY `akses` (`akses`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pangkat_golongan
DROP TABLE IF EXISTS `ref_pangkat_golongan`;
CREATE TABLE IF NOT EXISTS `ref_pangkat_golongan` (
  `id_pangkat_pns` bigint(255) NOT NULL AUTO_INCREMENT,
  `pangkat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `golongan` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ruang` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pangkat_pns`),
  UNIQUE KEY `id_pangkat_pns` (`id_pangkat_pns`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pegawai
DROP TABLE IF EXISTS `ref_pegawai`;
CREATE TABLE IF NOT EXISTS `ref_pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_pegawai` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pegawai` int(11) NOT NULL DEFAULT '0',
  `status_kepegawaian` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pegawai`) USING BTREE,
  UNIQUE KEY `nip_pegawai` (`nip_pegawai`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pegawai_pangkat
DROP TABLE IF EXISTS `ref_pegawai_pangkat`;
CREATE TABLE IF NOT EXISTS `ref_pegawai_pangkat` (
  `id_pangkat` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(255) NOT NULL DEFAULT '0',
  `pangkat_pegawai` int(11) DEFAULT NULL,
  `tmt_pangkat` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pangkat`) USING BTREE,
  UNIQUE KEY `id_pegawai` (`id_pegawai`,`pangkat_pegawai`) USING BTREE,
  CONSTRAINT `ref_pegawai_pangkat_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `ref_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pegawai_unit
DROP TABLE IF EXISTS `ref_pegawai_unit`;
CREATE TABLE IF NOT EXISTS `ref_pegawai_unit` (
  `id_unit_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(255) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `tingkat_eselon` int(11) NOT NULL,
  `id_sotk` int(11) NOT NULL,
  `nama_jabatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmt_unit` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_unit_pegawai`) USING BTREE,
  UNIQUE KEY `id_pegawai` (`id_pegawai`,`id_unit`,`tingkat_eselon`,`id_sotk`) USING BTREE,
  KEY `id_unit` (`id_unit`) USING BTREE,
  CONSTRAINT `ref_pegawai_unit_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `ref_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ref_pegawai_unit_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pembatalan
DROP TABLE IF EXISTS `ref_pembatalan`;
CREATE TABLE IF NOT EXISTS `ref_pembatalan` (
  `id_batal` int(255) NOT NULL AUTO_INCREMENT,
  `uraian_batal` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_batal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pemda
DROP TABLE IF EXISTS `ref_pemda`;
CREATE TABLE IF NOT EXISTS `ref_pemda` (
  `kd_prov` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `id_pemda` int(11) NOT NULL AUTO_INCREMENT,
  `prefix_pemda` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_prov` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_kabkota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ibu_kota` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_jabatan_kepala_daerah` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_kepala_daerah` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_jabatan_sekretariat_daerah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_sekretariat_daerah` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_sekretariat_daerah` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_perencanaan` int(11) DEFAULT NULL COMMENT 'id_sub_unit koordinator perencanaan',
  `nama_kepala_bappeda` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_kepala_bappeda` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_keuangan` int(11) DEFAULT NULL COMMENT 'id_sub_unit pengelola keuangan',
  `nama_kepala_bpkad` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_kepala_bpkad` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_pemda` mediumblob,
  `alamat` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_faksimili` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checksum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checksum2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pemda`) USING BTREE,
  UNIQUE KEY `kd_prov` (`kd_prov`,`kd_kab`) USING BTREE,
  UNIQUE KEY `id_pemda` (`id_pemda`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_pengusul
DROP TABLE IF EXISTS `ref_pengusul`;
CREATE TABLE IF NOT EXISTS `ref_pengusul` (
  `id_pengusul` int(255) NOT NULL,
  `nm_pengusul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pengusul`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_program
DROP TABLE IF EXISTS `ref_program`;
CREATE TABLE IF NOT EXISTS `ref_program` (
  `id_bidang` int(11) NOT NULL,
  `id_program` int(11) NOT NULL AUTO_INCREMENT,
  `kd_program` int(11) NOT NULL,
  `uraian_program` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_program`) USING BTREE,
  UNIQUE KEY `idx_ref_program` (`id_bidang`,`kd_program`) USING BTREE,
  CONSTRAINT `fk_ref_program` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_rek_1
DROP TABLE IF EXISTS `ref_rek_1`;
CREATE TABLE IF NOT EXISTS `ref_rek_1` (
  `kd_rek_1` int(11) NOT NULL,
  `nama_kd_rek_1` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`kd_rek_1`) USING BTREE,
  UNIQUE KEY `kd_rek_1` (`kd_rek_1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_rek_2
DROP TABLE IF EXISTS `ref_rek_2`;
CREATE TABLE IF NOT EXISTS `ref_rek_2` (
  `kd_rek_1` int(11) NOT NULL,
  `kd_rek_2` int(11) NOT NULL,
  `nama_kd_rek_2` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`kd_rek_1`,`kd_rek_2`) USING BTREE,
  UNIQUE KEY `kd_rek_1` (`kd_rek_1`,`kd_rek_2`) USING BTREE,
  CONSTRAINT `fk_ref_rek_2` FOREIGN KEY (`kd_rek_1`) REFERENCES `ref_rek_1` (`kd_rek_1`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_rek_3
DROP TABLE IF EXISTS `ref_rek_3`;
CREATE TABLE IF NOT EXISTS `ref_rek_3` (
  `kd_rek_1` int(11) NOT NULL,
  `kd_rek_2` int(11) NOT NULL,
  `kd_rek_3` int(11) NOT NULL,
  `nama_kd_rek_3` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saldo_normal` char(1) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`kd_rek_1`,`kd_rek_2`,`kd_rek_3`) USING BTREE,
  KEY `kd_rek_1` (`kd_rek_1`,`kd_rek_2`,`kd_rek_3`) USING BTREE,
  CONSTRAINT `fk_ref_rek_3` FOREIGN KEY (`kd_rek_1`, `kd_rek_2`) REFERENCES `ref_rek_2` (`kd_rek_1`, `kd_rek_2`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_rek_4
DROP TABLE IF EXISTS `ref_rek_4`;
CREATE TABLE IF NOT EXISTS `ref_rek_4` (
  `kd_rek_1` int(11) NOT NULL,
  `kd_rek_2` int(11) NOT NULL,
  `kd_rek_3` int(11) NOT NULL,
  `kd_rek_4` int(11) NOT NULL,
  `nama_kd_rek_4` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`kd_rek_1`,`kd_rek_2`,`kd_rek_3`,`kd_rek_4`) USING BTREE,
  UNIQUE KEY `kd_rek_1` (`kd_rek_1`,`kd_rek_2`,`kd_rek_3`,`kd_rek_4`) USING BTREE,
  CONSTRAINT `fk_ref_rek_4` FOREIGN KEY (`kd_rek_1`, `kd_rek_2`, `kd_rek_3`) REFERENCES `ref_rek_3` (`kd_rek_1`, `kd_rek_2`, `kd_rek_3`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_rek_5
DROP TABLE IF EXISTS `ref_rek_5`;
CREATE TABLE IF NOT EXISTS `ref_rek_5` (
  `kd_rek_1` int(11) NOT NULL,
  `kd_rek_2` int(11) NOT NULL,
  `kd_rek_3` int(11) NOT NULL,
  `kd_rek_4` int(11) NOT NULL,
  `kd_rek_5` int(11) NOT NULL,
  `nama_kd_rek_5` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peraturan` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rekening` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_rekening`) USING BTREE,
  UNIQUE KEY `kd_rek_1` (`kd_rek_1`,`kd_rek_2`,`kd_rek_3`,`kd_rek_4`,`kd_rek_5`) USING BTREE,
  KEY `id_rekening` (`id_rekening`) USING BTREE,
  CONSTRAINT `ref_rek_5_ibfk_1` FOREIGN KEY (`kd_rek_1`, `kd_rek_2`, `kd_rek_3`, `kd_rek_4`) REFERENCES `ref_rek_4` (`kd_rek_1`, `kd_rek_2`, `kd_rek_3`, `kd_rek_4`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1582 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_revisi
DROP TABLE IF EXISTS `ref_revisi`;
CREATE TABLE IF NOT EXISTS `ref_revisi` (
  `id_revisi` int(255) NOT NULL,
  `uraian_revisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_revisi`) USING BTREE,
  UNIQUE KEY `idx_ref_revisi` (`id_revisi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_satuan
DROP TABLE IF EXISTS `ref_satuan`;
CREATE TABLE IF NOT EXISTS `ref_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_satuan` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `singkatan_satuan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope_pemakaian` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_satuan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_setting
DROP TABLE IF EXISTS `ref_setting`;
CREATE TABLE IF NOT EXISTS `ref_setting` (
  `tahun_rencana` int(11) NOT NULL COMMENT 'tahun_perencanaan',
  `jenis_rw` int(11) NOT NULL DEFAULT '0' COMMENT 'jenis_pembatasan_rw, 0 tidak dibatasi, 1 jml_usulan, 2 jml_pagu',
  `jml_rw` int(11) NOT NULL DEFAULT '0' COMMENT 'batas usulan rw, 0 tidak dibatasi',
  `pagu_rw` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jenis_desa` int(11) NOT NULL DEFAULT '0' COMMENT 'jenis_pembatasan_rw, 0 tidak dibatasi, 1 jml_usulan, 2 jml_pagu',
  `jml_desa` int(11) NOT NULL DEFAULT '0' COMMENT 'batas usulan rw, 0 tidak dibatasi',
  `pagu_desa` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jenis_kecamatan` int(11) NOT NULL DEFAULT '0' COMMENT 'jenis_pembatasan_rw, 0 tidak dibatasi, 1 jml_usulan, 2 jml_pagu',
  `jml_kecamatan` int(11) NOT NULL DEFAULT '0' COMMENT 'batas usulan rw, 0 tidak dibatasi',
  `pagu_kecamatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `deviasi_pagu` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_setting` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`tahun_rencana`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_sotk_level_1
DROP TABLE IF EXISTS `ref_sotk_level_1`;
CREATE TABLE IF NOT EXISTS `ref_sotk_level_1` (
  `id_sotk_es2` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) NOT NULL,
  `nama_eselon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat_eselon` int(11) NOT NULL COMMENT '1/2/3',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sotk_es2`) USING BTREE,
  KEY `id_unit` (`id_unit`) USING BTREE,
  CONSTRAINT `ref_sotk_level_1_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_sotk_level_2
DROP TABLE IF EXISTS `ref_sotk_level_2`;
CREATE TABLE IF NOT EXISTS `ref_sotk_level_2` (
  `id_sotk_es3` int(11) NOT NULL AUTO_INCREMENT,
  `id_sotk_es2` int(11) NOT NULL,
  `nama_eselon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat_eselon` int(11) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sotk_es3`) USING BTREE,
  KEY `id_sotk_es2` (`id_sotk_es2`) USING BTREE,
  CONSTRAINT `ref_sotk_level_2_ibfk_1` FOREIGN KEY (`id_sotk_es2`) REFERENCES `ref_sotk_level_1` (`id_sotk_es2`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_sotk_level_3
DROP TABLE IF EXISTS `ref_sotk_level_3`;
CREATE TABLE IF NOT EXISTS `ref_sotk_level_3` (
  `id_sotk_es4` int(11) NOT NULL AUTO_INCREMENT,
  `id_sotk_es3` int(11) NOT NULL,
  `nama_eselon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat_eselon` int(11) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sotk_es4`) USING BTREE,
  KEY `id_sotk_es2` (`id_sotk_es3`) USING BTREE,
  CONSTRAINT `ref_sotk_level_3_ibfk_1` FOREIGN KEY (`id_sotk_es3`) REFERENCES `ref_sotk_level_2` (`id_sotk_es3`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_golongan
DROP TABLE IF EXISTS `ref_ssh_golongan`;
CREATE TABLE IF NOT EXISTS `ref_ssh_golongan` (
  `id_golongan_ssh` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_ssh` int(11) NOT NULL DEFAULT '0' COMMENT '0 = BL 1=BTL 2=Pendapatan 3=Pembiayaan ',
  `no_urut` int(11) NOT NULL,
  `uraian_golongan_ssh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_golongan_ssh`) USING BTREE,
  UNIQUE KEY `idx_ref_ssh_golongan` (`id_golongan_ssh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_kelompok
DROP TABLE IF EXISTS `ref_ssh_kelompok`;
CREATE TABLE IF NOT EXISTS `ref_ssh_kelompok` (
  `id_kelompok_ssh` int(11) NOT NULL AUTO_INCREMENT,
  `id_golongan_ssh` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `uraian_kelompok_ssh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kelompok_ssh`) USING BTREE,
  KEY `fk_ssh_kelompok` (`id_golongan_ssh`) USING BTREE,
  CONSTRAINT `fk_ssh_kelompok` FOREIGN KEY (`id_golongan_ssh`) REFERENCES `ref_ssh_golongan` (`id_golongan_ssh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_perkada
DROP TABLE IF EXISTS `ref_ssh_perkada`;
CREATE TABLE IF NOT EXISTS `ref_ssh_perkada` (
  `id_perkada` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_perkada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_perkada` date NOT NULL,
  `tahun_berlaku` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `id_perkada_induk` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_perkada`) USING BTREE,
  UNIQUE KEY `idx_ref_ssh_perkada_2` (`id_perkada`,`id_perkada_induk`,`id_perubahan`) USING BTREE,
  KEY `idx_ref_ssh_perkada_1` (`id_perkada`,`created_at`,`updated_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_perkada_tarif
DROP TABLE IF EXISTS `ref_ssh_perkada_tarif`;
CREATE TABLE IF NOT EXISTS `ref_ssh_perkada_tarif` (
  `id_tarif_perkada` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_tarif_old` bigint(11) NOT NULL DEFAULT '0',
  `no_urut` bigint(11) NOT NULL,
  `id_tarif_ssh` bigint(11) NOT NULL,
  `id_rekening` int(11) DEFAULT NULL,
  `id_zona_perkada` int(11) NOT NULL,
  `jml_rupiah` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tarif_perkada`) USING BTREE,
  UNIQUE KEY `ref_ssh_perkada_tarif_unik` (`id_tarif_ssh`,`id_zona_perkada`) USING BTREE,
  KEY `fk_ref_tarif_jumlah_1` (`id_zona_perkada`) USING BTREE,
  KEY `idx_ref_ssh_tarif_jumlah` (`id_tarif_ssh`,`id_zona_perkada`) USING BTREE,
  CONSTRAINT `fk_ref_tarif_jumlah` FOREIGN KEY (`id_tarif_ssh`) REFERENCES `ref_ssh_tarif` (`id_tarif_ssh`),
  CONSTRAINT `fk_ref_tarif_jumlah_1` FOREIGN KEY (`id_zona_perkada`) REFERENCES `ref_ssh_perkada_zona` (`id_zona_perkada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1599 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_perkada_zona
DROP TABLE IF EXISTS `ref_ssh_perkada_zona`;
CREATE TABLE IF NOT EXISTS `ref_ssh_perkada_zona` (
  `id_zona_perkada` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
  `id_perkada` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `id_zona` int(11) NOT NULL,
  `nama_zona` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_zona_perkada`) USING BTREE,
  UNIQUE KEY `idx_ref_ssh_tarif_jumlah` (`id_perkada`,`id_zona`,`id_perubahan`) USING BTREE,
  KEY `fk_ref_tarif_jumlah_1` (`id_zona_perkada`,`no_urut`,`id_perkada`,`id_zona`) USING BTREE,
  KEY `ref_ssh_perkada_zona_fk` (`id_zona`) USING BTREE,
  CONSTRAINT `FK_ref_ssh_perkada_zona_ref_ssh_zona` FOREIGN KEY (`id_zona`) REFERENCES `ref_ssh_zona` (`id_zona`),
  CONSTRAINT `FK_ref_ssh_perkada_zona_ref_ssh_zona_1` FOREIGN KEY (`id_perkada`) REFERENCES `ref_ssh_perkada` (`id_perkada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_rekening
DROP TABLE IF EXISTS `ref_ssh_rekening`;
CREATE TABLE IF NOT EXISTS `ref_ssh_rekening` (
  `id_rekening_ssh` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_tarif_ssh` bigint(20) NOT NULL,
  `id_rekening` int(11) NOT NULL,
  `uraian_tarif_ssh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rekening_ssh`) USING BTREE,
  UNIQUE KEY `fk_ref_ssh_rekening` (`id_tarif_ssh`,`id_rekening`) USING BTREE,
  CONSTRAINT `fk_ref_ssh_rekening` FOREIGN KEY (`id_tarif_ssh`) REFERENCES `ref_ssh_tarif` (`id_tarif_ssh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_sub_kelompok
DROP TABLE IF EXISTS `ref_ssh_sub_kelompok`;
CREATE TABLE IF NOT EXISTS `ref_ssh_sub_kelompok` (
  `id_sub_kelompok_ssh` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok_ssh` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `uraian_sub_kelompok_ssh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_pj` int(11) DEFAULT NULL,
  `jns_hibah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sub_kelompok_ssh`) USING BTREE,
  KEY `fk_ref_ssh_sub_kelompok` (`id_kelompok_ssh`) USING BTREE,
  CONSTRAINT `fk_ref_ssh_sub_kelompok` FOREIGN KEY (`id_kelompok_ssh`) REFERENCES `ref_ssh_kelompok` (`id_kelompok_ssh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_tarif
DROP TABLE IF EXISTS `ref_ssh_tarif`;
CREATE TABLE IF NOT EXISTS `ref_ssh_tarif` (
  `id_tarif_ssh` bigint(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
  `id_sub_kelompok_ssh` int(11) NOT NULL,
  `uraian_tarif_ssh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan_tarif_ssh` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_satuan` int(11) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = aktif, 1 = non aktif',
  PRIMARY KEY (`id_tarif_ssh`) USING BTREE,
  UNIQUE KEY `id_ref_ssh_tarif_1` (`id_tarif_ssh`,`no_urut`,`id_sub_kelompok_ssh`) USING BTREE,
  KEY `id_ref_ssh_tarif` (`id_sub_kelompok_ssh`) USING BTREE,
  FULLTEXT KEY `uraian_tarif_ssh` (`uraian_tarif_ssh`),
  CONSTRAINT `fk_ref_ssh_tarif` FOREIGN KEY (`id_sub_kelompok_ssh`) REFERENCES `ref_ssh_sub_kelompok` (`id_sub_kelompok_ssh`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_zona
DROP TABLE IF EXISTS `ref_ssh_zona`;
CREATE TABLE IF NOT EXISTS `ref_ssh_zona` (
  `id_zona` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan_zona` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskripsi_zona` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_zona`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_ssh_zona_lokasi
DROP TABLE IF EXISTS `ref_ssh_zona_lokasi`;
CREATE TABLE IF NOT EXISTS `ref_ssh_zona_lokasi` (
  `id_zona_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_zona` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_desa` int(11) DEFAULT NULL,
  `diskripsi_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_zona_lokasi`) USING BTREE,
  KEY `fk_zona_lokasi` (`id_zona`) USING BTREE,
  CONSTRAINT `fk_zona_lokasi` FOREIGN KEY (`id_zona`) REFERENCES `ref_ssh_zona` (`id_zona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_status_usul
DROP TABLE IF EXISTS `ref_status_usul`;
CREATE TABLE IF NOT EXISTS `ref_status_usul` (
  `id_status_usul` int(11) NOT NULL,
  `uraian_status_usul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_status_usul`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_sub_unit
DROP TABLE IF EXISTS `ref_sub_unit`;
CREATE TABLE IF NOT EXISTS `ref_sub_unit` (
  `id_sub_unit` int(255) NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) NOT NULL,
  `kd_sub` int(255) NOT NULL,
  `nm_sub` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sub_unit`) USING BTREE,
  KEY `idx_ref_sub_unit` (`id_unit`,`kd_sub`) USING BTREE,
  CONSTRAINT `fk_ref_sub_unit` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_sumber_dana
DROP TABLE IF EXISTS `ref_sumber_dana`;
CREATE TABLE IF NOT EXISTS `ref_sumber_dana` (
  `id_sumber_dana` int(11) NOT NULL,
  `uraian_sumber_dana` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_sumber_dana`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_tabel_dasar
DROP TABLE IF EXISTS `ref_tabel_dasar`;
CREATE TABLE IF NOT EXISTS `ref_tabel_dasar` (
  `id_tabel_dasar` int(11) NOT NULL,
  `nama_tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_tabel_dasar`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_tahun
DROP TABLE IF EXISTS `ref_tahun`;
CREATE TABLE IF NOT EXISTS `ref_tahun` (
  `id_tahun` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemda` int(11) NOT NULL,
  `id_rpjmd` int(11) NOT NULL,
  `tahun_0` int(255) NOT NULL,
  `tahun_1` int(255) NOT NULL,
  `tahun_2` int(255) NOT NULL,
  `tahun_3` int(255) NOT NULL,
  `tahun_4` int(255) NOT NULL,
  `tahun_5` int(255) NOT NULL,
  PRIMARY KEY (`id_tahun`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_unit
DROP TABLE IF EXISTS `ref_unit`;
CREATE TABLE IF NOT EXISTS `ref_unit` (
  `id_unit` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `kd_unit` int(255) NOT NULL,
  `nm_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_unit`) USING BTREE,
  KEY `idx_ref_unit` (`id_bidang`,`kd_unit`) USING BTREE,
  CONSTRAINT `fk_ref_unit` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_urusan
DROP TABLE IF EXISTS `ref_urusan`;
CREATE TABLE IF NOT EXISTS `ref_urusan` (
  `kd_urusan` int(11) NOT NULL AUTO_INCREMENT,
  `kode_urusan` int(11) NOT NULL DEFAULT '0',
  `nm_urusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`kd_urusan`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.ref_user_role
DROP TABLE IF EXISTS `ref_user_role`;
CREATE TABLE IF NOT EXISTS `ref_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_peran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tambah` int(11) NOT NULL DEFAULT '0',
  `edit` int(11) NOT NULL DEFAULT '0',
  `hapus` int(11) NOT NULL DEFAULT '0',
  `lihat` int(11) NOT NULL DEFAULT '0',
  `reviu` int(11) NOT NULL DEFAULT '0',
  `posting` int(11) NOT NULL DEFAULT '0',
  `status_role` int(11) NOT NULL DEFAULT '0' COMMENT '0 aktif 1 non aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.temp_table_info
DROP TABLE IF EXISTS `temp_table_info`;
CREATE TABLE IF NOT EXISTS `temp_table_info` (
  `TBL_INDEX` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TABLE_SCHEMA` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `COLUMN_TYPE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IS_NULLABLE` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `COLUMN_KEY` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `COLUMN_DEFAULT` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `EXTRA` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `INDEX_NAME` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `SEQ_IN_INDEX` int(11) DEFAULT NULL,
  `NON_UNIQUE` int(11) DEFAULT NULL,
  `FLAG` int(11) DEFAULT NULL,
  KEY `TBL_INDEX` (`TBL_INDEX`,`TABLE_NAME`,`COLUMN_NAME`,`IS_NULLABLE`,`COLUMN_KEY`,`INDEX_NAME`,`FLAG`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_aktivitas_pd
DROP TABLE IF EXISTS `trx_anggaran_aktivitas_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_aktivitas_pd` (
  `id_aktivitas_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_pd` bigint(20) NOT NULL,
  `id_aktivitas_old` bigint(11) NOT NULL DEFAULT '0',
  `id_aktivitas_rkpd_final` int(11) DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_rkpd_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_rkpd_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_satuan_publik` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_anggaran` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_keu` int(11) NOT NULL DEFAULT '0' COMMENT '0 = detail 1 = grouping',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = rkpd 1 tambahan baru',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checksum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aktivitas_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_pelaksana_pd`) USING BTREE,
  KEY `id_pelaksana_pd` (`id_pelaksana_pd`,`id_aktivitas_rkpd_final`,`tahun_anggaran`,`sumber_aktivitas`,`sumber_dana`,`id_perubahan`,`id_aktivitas_asb`,`sumber_data`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_aktivitas_pd_trx_anggaran_pelaksana_pd` FOREIGN KEY (`id_pelaksana_pd`) REFERENCES `trx_anggaran_pelaksana_pd` (`id_pelaksana_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_belanja_pd
DROP TABLE IF EXISTS `trx_anggaran_belanja_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_belanja_pd` (
  `id_belanja_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_belanja_rkpd_final` int(11) NOT NULL DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL DEFAULT '0',
  `no_urut` int(11) NOT NULL DEFAULT '0',
  `id_zona_ssh` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL DEFAULT '0',
  `id_item_ssh` bigint(20) NOT NULL DEFAULT '0',
  `id_rekening_ssh` int(11) NOT NULL DEFAULT '0',
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_prognas` int(11) DEFAULT '0',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `koefisien` decimal(20,2) NOT NULL DEFAULT '1.00',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `koefisien_rkpd` decimal(20,2) NOT NULL DEFAULT '1.00',
  `harga_satuan_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checksum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_jumlah` decimal(20,2) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_belanja_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_anggaran`,`no_urut`,`id_belanja_pd`,`id_aktivitas_pd`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_aktivitas_pd`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_belanja_pd_trx_anggaran_aktivitas_pd` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_anggaran_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_dokumen
DROP TABLE IF EXISTS `trx_anggaran_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_dokumen` (
  `id_dokumen_keu` int(11) NOT NULL AUTO_INCREMENT,
  `jns_dokumen_keu` int(11) NOT NULL DEFAULT '0' COMMENT '0 ppas 1 apbd',
  `kd_dokumen_keu` int(11) NOT NULL DEFAULT '0' COMMENT '0 murni 1 pergeseran_1 2 perubahan 3 pergeseran_2',
  `id_perubahan` int(11) NOT NULL DEFAULT '0' COMMENT '0 awal',
  `id_dokumen_ref` int(11) NOT NULL DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL COMMENT 'tahun perencanaan',
  `nomor_keu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_keu` date NOT NULL,
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_ppkd` int(11) DEFAULT NULL,
  `id_sub_unit_ppkd` int(11) DEFAULT '0',
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sinkronisasi` int(11) NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dokumen_keu`) USING BTREE,
  UNIQUE KEY `tahun_ranwal` (`jns_dokumen_keu`,`kd_dokumen_keu`,`id_perubahan`,`tahun_anggaran`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_indikator
DROP TABLE IF EXISTS `trx_anggaran_indikator`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_indikator` (
  `id_indikator_program_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_anggaran_pemda` int(11) NOT NULL,
  `id_indikator_rkpd_final` int(11) NOT NULL COMMENT 'nomor urut indikator sasaran',
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_keuangan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_program_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_anggaran_pemda`,`kd_indikator`,`no_urut`,`id_indikator_rkpd_final`) USING BTREE,
  KEY `id_anggaran_pemda` (`id_anggaran_pemda`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_indikator_trx_anggaran_program` FOREIGN KEY (`id_anggaran_pemda`) REFERENCES `trx_anggaran_program` (`id_anggaran_pemda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_kegiatan_pd
DROP TABLE IF EXISTS `trx_anggaran_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_kegiatan_pd` (
  `id_kegiatan_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_program_pd` bigint(20) NOT NULL,
  `id_keg_old` bigint(20) NOT NULL DEFAULT '0',
  `id_kegiatan_pd_rkpd_final` int(11) DEFAULT NULL,
  `id_unit` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checksum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_program_pd`,`tahun_anggaran`,`id_kegiatan_pd_rkpd_final`,`id_perubahan`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_program_pd`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_kegiatan_pd_trx_anggaran_program_pd` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_anggaran_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_keg_indikator_pd
DROP TABLE IF EXISTS `trx_anggaran_keg_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_keg_indikator_pd` (
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_indikator_rkpd_final` int(11) DEFAULT NULL,
  `tahun_anggaran` int(11) NOT NULL,
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_anggaran`,`id_indikator_rkpd_final`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_kegiatan_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_indikator_rkpd_final`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_kegiatan_pd`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_keg_indikator_pd_trx_anggaran_kegiatan_pd` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_anggaran_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_lokasi_pd
DROP TABLE IF EXISTS `trx_anggaran_lokasi_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_lokasi_pd` (
  `id_lokasi_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi_rkpd_final` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `jenis_lokasi` int(11) NOT NULL DEFAULT '0',
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rkpd 1 anggaran',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lokasi_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_aktivitas_pd`,`tahun_anggaran`,`no_urut`,`id_lokasi_pd`,`jenis_lokasi`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_lokasi_pd_trx_anggaran_aktivitas_pd` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_anggaran_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_pelaksana
DROP TABLE IF EXISTS `trx_anggaran_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_pelaksana` (
  `id_pelaksana_anggaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggaran_pemda` int(11) NOT NULL,
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_urusan_anggaran` int(11) NOT NULL,
  `id_pelaksana_rkpd_final` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_rkpd_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_anggaran` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pelaksana_anggaran`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_anggaran`,`id_anggaran_pemda`,`id_unit`,`id_urusan_anggaran`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_anggaran_pemda`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_anggaran`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_pelaksana_trx_anggaran_program` FOREIGN KEY (`id_anggaran_pemda`) REFERENCES `trx_anggaran_program` (`id_anggaran_pemda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_pelaksana_pd
DROP TABLE IF EXISTS `trx_anggaran_pelaksana_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_pelaksana_pd` (
  `id_pelaksana_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_old` bigint(20) NOT NULL DEFAULT '0',
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_rkpd_final` int(11) DEFAULT NULL,
  `tahun_anggaran` int(11) NOT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  `hak_akses` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pelaksana_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_kegiatan_pd`,`tahun_anggaran`,`no_urut`,`id_pelaksana_pd`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_pelaksana_pd_trx_anggaran_kegiatan_pd` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_anggaran_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_program
DROP TABLE IF EXISTS `trx_anggaran_program`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_program` (
  `id_anggaran_pemda` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokumen_keu` int(11) NOT NULL DEFAULT '0',
  `id_rkpd_ranwal` int(11) NOT NULL COMMENT '0 baru',
  `id_rkpd_final` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru',
  `no_urut` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL 3 Pembiayaan',
  `tahun_anggaran` int(11) NOT NULL,
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_keuangan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RKPD 1 = Baru',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_anggaran_pemda`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`tahun_anggaran`,`thn_id_rpjmd`,`id_visi_rpjmd`,`id_misi_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_program_rpjmd`,`no_urut`,`id_rkpd_final`,`id_rkpd_ranwal`,`id_dokumen_keu`) USING BTREE,
  KEY `id_dokumen_keu` (`id_dokumen_keu`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_program_trx_anggaran_dokumen` FOREIGN KEY (`id_dokumen_keu`) REFERENCES `trx_anggaran_dokumen` (`id_dokumen_keu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_program_pd
DROP TABLE IF EXISTS `trx_anggaran_program_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_program_pd` (
  `id_program_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_prog_old` bigint(11) NOT NULL DEFAULT '0',
  `id_pelaksana_anggaran` int(11) NOT NULL,
  `kd_dokumen_keu` int(11) NOT NULL DEFAULT '0' COMMENT '0 murni 1 pergeseran_1 2 perubahan 3 pergeseran_2',
  `jns_dokumen_keu` int(11) NOT NULL DEFAULT '0' COMMENT '0 ppas 1 apbd',
  `id_perubahan` int(11) NOT NULL DEFAULT '0' COMMENT '0 awal',
  `id_dokumen_keu` int(11) NOT NULL DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL 3 Penerimaan',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_program_pd_rkpd_final` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_prognas` int(11) DEFAULT '0',
  `id_progprov` int(11) DEFAULT '0',
  `id_program_ref` int(11) NOT NULL,
  `pagu_rkpd_final` decimal(20,2) DEFAULT '0.00',
  `pagu_anggaran` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RKPD 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checksum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_program_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_program_id_program_ref` (`id_unit`,`tahun_anggaran`,`kd_dokumen_keu`,`jns_dokumen_keu`,`id_perubahan`,`id_pelaksana_anggaran`,`id_program_ref`,`id_program_pd_rkpd_final`,`id_dokumen_keu`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_pelaksana_anggaran`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_program_pd_trx_anggaran_pelaksana` FOREIGN KEY (`id_pelaksana_anggaran`) REFERENCES `trx_anggaran_pelaksana` (`id_pelaksana_anggaran`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_prog_indikator_pd
DROP TABLE IF EXISTS `trx_anggaran_prog_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_prog_indikator_pd` (
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_program_pd` bigint(11) NOT NULL,
  `id_indikator_rkpd_final` int(11) NOT NULL DEFAULT '0',
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_anggaran`,`id_indikator_rkpd_final`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_program_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_program_pd`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_prog_indikator_pd_trx_anggaran_program_pd` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_anggaran_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_tapd
DROP TABLE IF EXISTS `trx_anggaran_tapd`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_tapd` (
  `id_tapd` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_dokumen_keu` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_unit_pegawai` int(11) NOT NULL,
  `peran_tim` varchar(255) NOT NULL,
  `status_tim` int(255) NOT NULL DEFAULT '0',
  `tmt_tim` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tapd`),
  UNIQUE KEY `id_dokumen_keu` (`id_dokumen_keu`,`id_pegawai`,`id_unit_pegawai`,`status_tim`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `trx_anggaran_tapd_ibfk_1` FOREIGN KEY (`id_dokumen_keu`) REFERENCES `trx_anggaran_dokumen` (`id_dokumen_keu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_anggaran_tapd_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `ref_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_tapd_unit
DROP TABLE IF EXISTS `trx_anggaran_tapd_unit`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_tapd_unit` (
  `id_unit_tapd` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_tapd` bigint(255) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `status_unit` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_unit_tapd`),
  UNIQUE KEY `id_tapd` (`id_tapd`,`id_unit`,`status_unit`),
  CONSTRAINT `trx_anggaran_tapd_unit_ibfk_1` FOREIGN KEY (`id_tapd`) REFERENCES `trx_anggaran_tapd` (`id_tapd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_unit_kpa
DROP TABLE IF EXISTS `trx_anggaran_unit_kpa`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_unit_kpa` (
  `id_kpa` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_pa` bigint(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_unit_pegawai` int(11) NOT NULL,
  `id_program` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kpa`) USING BTREE,
  UNIQUE KEY `id_pa` (`id_pa`,`id_program`,`id_pegawai`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `trx_anggaran_unit_kpa_ibfk_1` FOREIGN KEY (`id_pa`) REFERENCES `trx_anggaran_unit_pa` (`id_pa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_anggaran_unit_kpa_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `ref_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_unit_pa
DROP TABLE IF EXISTS `trx_anggaran_unit_pa`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_unit_pa` (
  `id_pa` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_dokumen_keu` int(11) NOT NULL,
  `no_dokumen` varchar(255) DEFAULT NULL,
  `tgl_dokumen` date DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_pegawai` int(11) NOT NULL,
  `id_unit_pegawai` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pa`),
  UNIQUE KEY `id_dokumen_keu` (`id_dokumen_keu`,`id_unit`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `trx_anggaran_unit_pa_ibfk_1` FOREIGN KEY (`id_dokumen_keu`) REFERENCES `trx_anggaran_dokumen` (`id_dokumen_keu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_anggaran_unit_pa_ibfk_2` FOREIGN KEY (`id_pegawai`) REFERENCES `ref_pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_anggaran_urusan
DROP TABLE IF EXISTS `trx_anggaran_urusan`;
CREATE TABLE IF NOT EXISTS `trx_anggaran_urusan` (
  `id_urusan_anggaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_anggaran_pemda` int(11) NOT NULL,
  `tahun_anggaran` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rkpd 1 baru',
  `id_urusan_rkpd_final` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_urusan_anggaran`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_anggaran`,`id_anggaran_pemda`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_anggaran_pemda`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `FK_trx_anggaran_urusan_trx_anggaran_program` FOREIGN KEY (`id_anggaran_pemda`) REFERENCES `trx_anggaran_program` (`id_anggaran_pemda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_aktivitas
DROP TABLE IF EXISTS `trx_asb_aktivitas`;
CREATE TABLE IF NOT EXISTS `trx_asb_aktivitas` (
  `id_aktivitas_asb` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_asb_sub_sub_kelompok` int(11) NOT NULL,
  `nm_aktivitas_asb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_aktivitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskripsi_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) DEFAULT '0.00',
  `id_satuan_1` int(11) DEFAULT NULL COMMENT 'cost driver',
  `sat_derivatif_1` int(11) DEFAULT NULL,
  `volume_2` decimal(20,2) DEFAULT '0.00',
  `id_satuan_2` int(11) DEFAULT NULL COMMENT 'cost driver',
  `sat_derivatif_2` int(11) DEFAULT NULL,
  `range_max` decimal(20,2) NOT NULL DEFAULT '0.00',
  `kapasitas_max` decimal(20,2) NOT NULL DEFAULT '0.00',
  `range_max1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `kapasitas_max1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `temp_id` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_aktivitas_asb`) USING BTREE,
  KEY `fk_trx_aktivitas_asb` (`id_asb_sub_sub_kelompok`) USING BTREE,
  CONSTRAINT `FK_trx_asb_aktivitas_trx_asb_sub_sub_kelompok` FOREIGN KEY (`id_asb_sub_sub_kelompok`) REFERENCES `trx_asb_sub_sub_kelompok` (`id_asb_sub_sub_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_kelompok
DROP TABLE IF EXISTS `trx_asb_kelompok`;
CREATE TABLE IF NOT EXISTS `trx_asb_kelompok` (
  `id_asb_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `id_asb_perkada` int(11) NOT NULL,
  `uraian_kelompok_asb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` float DEFAULT NULL,
  PRIMARY KEY (`id_asb_kelompok`) USING BTREE,
  KEY `FK_trx_asb_cluster_trx_asb_perkada` (`id_asb_perkada`) USING BTREE,
  CONSTRAINT `FK_trx_asb_cluster_trx_asb_perkada` FOREIGN KEY (`id_asb_perkada`) REFERENCES `trx_asb_perkada` (`id_asb_perkada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_komponen
DROP TABLE IF EXISTS `trx_asb_komponen`;
CREATE TABLE IF NOT EXISTS `trx_asb_komponen` (
  `id_aktivitas_asb` bigint(20) NOT NULL,
  `id_komponen_asb` bigint(20) NOT NULL AUTO_INCREMENT,
  `nm_komponen_asb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rekening` int(11) NOT NULL,
  `temp_id` float DEFAULT NULL,
  PRIMARY KEY (`id_komponen_asb`) USING BTREE,
  KEY `FK_trx_asb_komponen_trx_asb_aktivitas` (`id_aktivitas_asb`) USING BTREE,
  CONSTRAINT `FK_trx_asb_komponen_trx_asb_aktivitas` FOREIGN KEY (`id_aktivitas_asb`) REFERENCES `trx_asb_aktivitas` (`id_aktivitas_asb`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_komponen_rinci
DROP TABLE IF EXISTS `trx_asb_komponen_rinci`;
CREATE TABLE IF NOT EXISTS `trx_asb_komponen_rinci` (
  `id_komponen_asb_rinci` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_komponen_asb` bigint(20) NOT NULL,
  `jenis_biaya` int(11) NOT NULL DEFAULT '1' COMMENT '1 fix 2 dependent variabel 3 independen variable',
  `id_tarif_ssh` bigint(11) NOT NULL,
  `koefisien1` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `id_satuan1` int(11) DEFAULT NULL,
  `sat_derivatif1` int(11) DEFAULT NULL,
  `koefisien2` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `id_satuan2` int(11) DEFAULT NULL,
  `sat_derivatif2` int(11) DEFAULT NULL,
  `koefisien3` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `id_satuan3` int(11) DEFAULT NULL,
  `satuan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hub_driver` int(11) DEFAULT '0' COMMENT '1 driver1 2 driver2 3 driver12 0 N/A',
  PRIMARY KEY (`id_komponen_asb_rinci`) USING BTREE,
  KEY `fk_ref_komponen_asb_rinc` (`id_tarif_ssh`) USING BTREE,
  KEY `idx_ref_komponen_asb_rinci` (`id_komponen_asb`) USING BTREE,
  KEY `FK_trx_asb_komponen_rinci_ref_satuan` (`id_satuan1`) USING BTREE,
  KEY `FK_trx_asb_komponen_rinci_ref_satuan_2` (`id_satuan2`) USING BTREE,
  KEY `FK_trx_asb_komponen_rinci_ref_satuan_3` (`id_satuan3`) USING BTREE,
  FULLTEXT KEY `ket_group` (`ket_group`),
  CONSTRAINT `FK_trx_asb_komponen_rinci_ref_ssh_tarif` FOREIGN KEY (`id_tarif_ssh`) REFERENCES `ref_ssh_tarif` (`id_tarif_ssh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_trx_asb_komponen_rinci_trx_asb_komponen` FOREIGN KEY (`id_komponen_asb`) REFERENCES `trx_asb_komponen` (`id_komponen_asb`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3479732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_perhitungan
DROP TABLE IF EXISTS `trx_asb_perhitungan`;
CREATE TABLE IF NOT EXISTS `trx_asb_perhitungan` (
  `tahun_perhitungan` int(11) NOT NULL,
  `id_perhitungan` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_perkada` int(11) NOT NULL,
  `flag_aktif` int(11) NOT NULL DEFAULT '0' COMMENT '0 aktif 1 non aktif',
  PRIMARY KEY (`id_perhitungan`) USING BTREE,
  UNIQUE KEY `idx_trx_perhitungan_asb` (`tahun_perhitungan`,`id_perkada`,`flag_aktif`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_perhitungan_rinci
DROP TABLE IF EXISTS `trx_asb_perhitungan_rinci`;
CREATE TABLE IF NOT EXISTS `trx_asb_perhitungan_rinci` (
  `id_perhitungan_rinci` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_perhitungan` bigint(20) NOT NULL,
  `id_asb_kelompok` bigint(20) NOT NULL,
  `id_asb_sub_kelompok` bigint(20) NOT NULL,
  `id_asb_sub_sub_kelompok` bigint(20) NOT NULL,
  `id_aktivitas_asb` bigint(20) NOT NULL,
  `id_komponen_asb` bigint(20) NOT NULL,
  `id_komponen_asb_rinci` bigint(20) NOT NULL,
  `id_tarif_ssh` bigint(20) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_pagu` decimal(20,2) DEFAULT '0.00',
  `kfix` decimal(20,4) DEFAULT '0.0000',
  `kmax` decimal(20,4) DEFAULT '0.0000',
  `kdv1` decimal(20,4) DEFAULT '0.0000',
  `kr1` decimal(20,4) DEFAULT '0.0000',
  `kdv2` decimal(20,4) DEFAULT '0.0000',
  `kr2` decimal(20,4) DEFAULT '0.0000',
  `kiv1` decimal(20,4) DEFAULT '0.0000',
  `kiv2` decimal(20,4) DEFAULT '0.0000',
  `kiv3` decimal(20,4) DEFAULT '0.0000',
  PRIMARY KEY (`id_perhitungan_rinci`) USING BTREE,
  UNIQUE KEY `id_trx_perhitungan_aktivitas` (`id_perhitungan`,`id_asb_kelompok`,`id_asb_sub_kelompok`,`id_aktivitas_asb`,`id_komponen_asb`,`id_komponen_asb_rinci`,`id_zona`) USING BTREE,
  CONSTRAINT `trx_asb_perhitungan_rinci_ibfk_1` FOREIGN KEY (`id_perhitungan`) REFERENCES `trx_asb_perhitungan` (`id_perhitungan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_perkada
DROP TABLE IF EXISTS `trx_asb_perkada`;
CREATE TABLE IF NOT EXISTS `trx_asb_perkada` (
  `id_asb_perkada` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_perkada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_perkada` date NOT NULL,
  `tahun_berlaku` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_asb_perkada`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_sub_kelompok
DROP TABLE IF EXISTS `trx_asb_sub_kelompok`;
CREATE TABLE IF NOT EXISTS `trx_asb_sub_kelompok` (
  `id_asb_sub_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `id_asb_kelompok` int(11) NOT NULL,
  `uraian_sub_kelompok_asb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` float DEFAULT NULL,
  PRIMARY KEY (`id_asb_sub_kelompok`) USING BTREE,
  KEY `FK_trx_asb_cluster_trx_asb_perkada` (`id_asb_kelompok`) USING BTREE,
  CONSTRAINT `trx_asb_sub_kelompok_ibfk_1` FOREIGN KEY (`id_asb_kelompok`) REFERENCES `trx_asb_kelompok` (`id_asb_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_asb_sub_sub_kelompok
DROP TABLE IF EXISTS `trx_asb_sub_sub_kelompok`;
CREATE TABLE IF NOT EXISTS `trx_asb_sub_sub_kelompok` (
  `id_asb_sub_sub_kelompok` int(11) NOT NULL AUTO_INCREMENT,
  `id_asb_sub_kelompok` int(11) NOT NULL,
  `uraian_sub_sub_kelompok_asb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` float DEFAULT NULL,
  PRIMARY KEY (`id_asb_sub_sub_kelompok`) USING BTREE,
  KEY `FK_trx_asb_cluster_trx_asb_perkada` (`id_asb_sub_kelompok`) USING BTREE,
  CONSTRAINT `FK_trx_asb_sub_sub_kelompok_trx_asb_sub_kelompok` FOREIGN KEY (`id_asb_sub_kelompok`) REFERENCES `trx_asb_sub_kelompok` (`id_asb_sub_kelompok`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd
DROP TABLE IF EXISTS `trx_forum_skpd`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd` (
  `id_forum_skpd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_forum_program` bigint(20) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_forum_skpd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_forum_program`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_forum_program`) USING BTREE,
  CONSTRAINT `FK_trx_forum_skpd_trx_forum_skpd_program` FOREIGN KEY (`id_forum_program`) REFERENCES `trx_forum_skpd_program` (`id_forum_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_aktivitas
DROP TABLE IF EXISTS `trx_forum_skpd_aktivitas`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_aktivitas` (
  `id_aktivitas_forum` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_forum_skpd` bigint(20) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_aktivitas_renja` int(11) DEFAULT '0',
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja 1 tambahan baru',
  `id_satuan_publik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_forum`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_forum_skpd`) USING BTREE,
  CONSTRAINT `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` FOREIGN KEY (`id_forum_skpd`) REFERENCES `trx_forum_skpd_pelaksana` (`id_pelaksana_forum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_belanja
DROP TABLE IF EXISTS `trx_forum_skpd_belanja`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_belanja` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_forum` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi_forum` bigint(20) NOT NULL,
  `id_zona_ssh` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL,
  `id_item_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL,
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '1',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1_forum` int(11) NOT NULL,
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2_forum` int(11) NOT NULL DEFAULT '1',
  `harga_satuan_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL,
  PRIMARY KEY (`id_belanja_forum`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_forum`,`no_urut`,`id_belanja_forum`,`id_lokasi_forum`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_lokasi_forum`) USING BTREE,
  CONSTRAINT `trx_forum_skpd_belanja_ibfk_1` FOREIGN KEY (`id_lokasi_forum`) REFERENCES `trx_forum_skpd_aktivitas` (`id_aktivitas_forum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_dokumen
DROP TABLE IF EXISTS `trx_forum_skpd_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_dokumen` (
  `id_dokumen_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit_renja` int(255) NOT NULL,
  `nomor_ranwal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ranwal` date NOT NULL,
  `tahun_ranwal` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_ranwal`) USING BTREE,
  UNIQUE KEY `id_unit_renja` (`id_unit_renja`,`tahun_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_kebijakan
DROP TABLE IF EXISTS `trx_forum_skpd_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_kebijakan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_renja` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_renja`,`id_unit`,`no_urut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_kegiatan_indikator
DROP TABLE IF EXISTS `trx_forum_skpd_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_kegiatan_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_skpd` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_forum_skpd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_forum_skpd`) USING BTREE,
  CONSTRAINT `trx_forum_skpd_kegiatan_indikator_ibfk_1` FOREIGN KEY (`id_forum_skpd`) REFERENCES `trx_forum_skpd` (`id_forum_skpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_lokasi
DROP TABLE IF EXISTS `trx_forum_skpd_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_lokasi` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_forum` bigint(20) NOT NULL,
  `id_lokasi_forum` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_renja` int(11) DEFAULT '0',
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `jenis_lokasi` int(11) NOT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan 2 musrenbang 3 pokir',
  PRIMARY KEY (`id_lokasi_forum`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_pelaksana_forum`,`tahun_forum`,`no_urut`,`id_lokasi_forum`) USING BTREE,
  CONSTRAINT `trx_forum_skpd_lokasi_ibfk_1` FOREIGN KEY (`id_pelaksana_forum`) REFERENCES `trx_forum_skpd_aktivitas` (`id_aktivitas_forum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_pelaksana
DROP TABLE IF EXISTS `trx_forum_skpd_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_pelaksana` (
  `id_pelaksana_forum` bigint(20) NOT NULL AUTO_INCREMENT,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_forum` bigint(11) NOT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  PRIMARY KEY (`id_pelaksana_forum`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_aktivitas_forum`,`tahun_forum`,`no_urut`,`id_pelaksana_forum`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `trx_forum_skpd_pelaksana_ibfk_1` FOREIGN KEY (`id_aktivitas_forum`) REFERENCES `trx_forum_skpd` (`id_forum_skpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_program
DROP TABLE IF EXISTS `trx_forum_skpd_program`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_program` (
  `id_forum_program` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_forum_rkpdprog` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_renja_program` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_forum` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_forum_program`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_program_id_program_ref` (`id_unit`,`id_renja_program`,`id_program_ref`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_forum_rkpdprog`) USING BTREE,
  CONSTRAINT `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` FOREIGN KEY (`id_forum_rkpdprog`) REFERENCES `trx_forum_skpd_program_ranwal` (`id_forum_rkpdprog`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_program_indikator
DROP TABLE IF EXISTS `trx_forum_skpd_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_program_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_program` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_forum_program`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_forum_program`) USING BTREE,
  CONSTRAINT `trx_forum_skpd_program_indikator_ibfk_1` FOREIGN KEY (`id_forum_program`) REFERENCES `trx_forum_skpd_program` (`id_forum_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_program_ranwal
DROP TABLE IF EXISTS `trx_forum_skpd_program_ranwal`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_program_ranwal` (
  `id_forum_rkpdprog` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL DEFAULT '0',
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  PRIMARY KEY (`id_forum_rkpdprog`) USING BTREE,
  UNIQUE KEY `id_rkpd_ranwal_id_bidang_id_unit` (`id_rkpd_ranwal`,`id_bidang`,`id_unit`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_forum_skpd_usulan
DROP TABLE IF EXISTS `trx_forum_skpd_usulan`;
CREATE TABLE IF NOT EXISTS `trx_forum_skpd_usulan` (
  `id_sumber_usulan` bigint(20) NOT NULL AUTO_INCREMENT,
  `sumber_usulan` int(11) DEFAULT '0' COMMENT '0 renja 1 musrendes 2 musrencam 3 pokir 4 forum_skpd',
  `id_lokasi_forum` bigint(20) NOT NULL,
  `id_ref_usulan` int(11) DEFAULT NULL,
  `volume_1_usulan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2_usulan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 tanpa 1 dengan 2 digabung 3 ditolak',
  `uraian_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_sumber_usulan`) USING BTREE,
  KEY `id_trx_forum_skpd_usulan` (`id_ref_usulan`,`id_sumber_usulan`,`id_lokasi_forum`) USING BTREE,
  KEY `FK_trx_forum_skpd_usulan_trx_forum_skpd_lokasi` (`id_lokasi_forum`) USING BTREE,
  CONSTRAINT `FK_trx_forum_skpd_usulan_trx_forum_skpd_lokasi` FOREIGN KEY (`id_lokasi_forum`) REFERENCES `trx_forum_skpd_lokasi` (`id_lokasi_forum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_group_menu
DROP TABLE IF EXISTS `trx_group_menu`;
CREATE TABLE IF NOT EXISTS `trx_group_menu` (
  `menu` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  UNIQUE KEY `menu` (`menu`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_isian_data_dasar
DROP TABLE IF EXISTS `trx_isian_data_dasar`;
CREATE TABLE IF NOT EXISTS `trx_isian_data_dasar` (
  `id_isian_tabel_dasar` int(11) NOT NULL AUTO_INCREMENT,
  `id_kolom_tabel_dasar` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `nmin1` decimal(20,2) DEFAULT '0.00',
  `nmin2` decimal(20,2) DEFAULT '0.00',
  `nmin3` decimal(20,2) DEFAULT '0.00',
  `nmin4` decimal(20,2) DEFAULT '0.00',
  `nmin5` decimal(20,2) DEFAULT '0.00',
  `tahun` int(4) DEFAULT NULL,
  `nmin1_persen` decimal(20,2) DEFAULT '0.00',
  `nmin2_persen` decimal(20,2) DEFAULT '0.00',
  `nmin3_persen` decimal(20,2) DEFAULT '0.00',
  `nmin4_persen` decimal(20,2) DEFAULT '0.00',
  `nmin5_persen` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_isian_tabel_dasar`) USING BTREE,
  KEY `id_kolom_tabel_dasar` (`id_kolom_tabel_dasar`) USING BTREE,
  KEY `id_kecamatan` (`id_kecamatan`) USING BTREE,
  CONSTRAINT `trx_isian_data_dasar_ibfk_1` FOREIGN KEY (`id_kolom_tabel_dasar`) REFERENCES `ref_kolom_tabel_dasar` (`id_kolom_tabel_dasar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_isian_data_dasar_ibfk_2` FOREIGN KEY (`id_kecamatan`) REFERENCES `ref_kecamatan` (`id_kecamatan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_log_api
DROP TABLE IF EXISTS `trx_log_api`;
CREATE TABLE IF NOT EXISTS `trx_log_api` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `id_app` int(11) NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `tgl_kirim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_kirim` int(11) NOT NULL,
  `log_kirim` varchar(500) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_log_api_keu
DROP TABLE IF EXISTS `trx_log_api_keu`;
CREATE TABLE IF NOT EXISTS `trx_log_api_keu` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `tahun` int(11) NOT NULL,
  `id_dok_keu` int(11) NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_sub_unit` int(11) DEFAULT NULL,
  `tgl_kirim` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_kirim` int(11) NOT NULL,
  `step_kirim` int(11) NOT NULL DEFAULT '0',
  `log_kirim` varchar(5000) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_log_events
DROP TABLE IF EXISTS `trx_log_events`;
CREATE TABLE IF NOT EXISTS `trx_log_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_events` int(11) NOT NULL DEFAULT '0',
  `discription` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrencam
DROP TABLE IF EXISTS `trx_musrencam`;
CREATE TABLE IF NOT EXISTS `trx_musrencam` (
  `tahun_musren` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrencam` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_asb_aktivitas` int(11) NOT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_kondisi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolak_ukur_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output_aktivitas` decimal(20,2) DEFAULT '0.00',
  `id_satuan` int(11) DEFAULT NULL,
  `id_satuan_desa` int(11) DEFAULT NULL,
  `volume` decimal(20,2) DEFAULT '0.00',
  `volume_desa` decimal(20,2) DEFAULT '0.00',
  `harga_satuan` decimal(20,2) DEFAULT '0.00',
  `harga_satuan_desa` decimal(20,2) DEFAULT '0.00',
  `jml_pagu` decimal(20,2) DEFAULT '0.00',
  `jml_pagu_desa` decimal(20,2) DEFAULT '0.00',
  `id_usulan_desa` bigint(255) DEFAULT NULL,
  `pagu_aktivitas` decimal(20,2) DEFAULT '0.00',
  `sumber_usulan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Ranwal/Renja 1 = Desa 2 = Musrencam',
  `status_usulan` int(11) NOT NULL COMMENT '0 = Proses Usulan 1 = Kirim_Forum',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0= Diterima\r\n1= Diterima dengan perubahan\r\n2= Digabungkan dengan usulan lain\r\n3= Ditolak',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_musrencam`) USING BTREE,
  UNIQUE KEY `idx_trx_musrendes` (`id_renja`,`tahun_musren`,`no_urut`,`id_musrencam`,`id_kecamatan`,`id_usulan_desa`) USING BTREE,
  CONSTRAINT `trx_musrencam_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrencam_lokasi
DROP TABLE IF EXISTS `trx_musrencam_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_musrencam_lokasi` (
  `tahun_musren` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrencam` int(11) NOT NULL,
  `id_lokasi_musrencam` int(11) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL COMMENT 'difilter hanya id lokasi yang jenis lokasinya kewilayahan',
  `id_desa` int(11) DEFAULT NULL,
  `rt` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `uraian_kondisi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_foto` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_musrendes` int(11) DEFAULT NULL,
  `id_lokasi_musrendes` int(255) DEFAULT NULL,
  `sumber_data` int(11) DEFAULT NULL COMMENT '0 = desa 1 = kecamatan',
  `volume_desa` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_lokasi_musrencam`) USING BTREE,
  UNIQUE KEY `idx_trx_musrendes_lokasi` (`id_musrencam`,`tahun_musren`,`no_urut`,`id_lokasi_musrencam`,`id_desa`,`rt`,`rw`) USING BTREE,
  CONSTRAINT `trx_musrencam_lokasi_ibfk_1` FOREIGN KEY (`id_musrencam`) REFERENCES `trx_musrencam` (`id_musrencam`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrendes
DROP TABLE IF EXISTS `trx_musrendes`;
CREATE TABLE IF NOT EXISTS `trx_musrendes` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrendes` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_desa` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_asb_aktivitas` int(11) NOT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_kondisi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolak_ukur_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output_aktivitas` decimal(20,2) DEFAULT '0.00',
  `id_satuan` int(11) DEFAULT NULL,
  `id_satuan_rw` int(11) DEFAULT NULL,
  `volume` decimal(20,2) DEFAULT '0.00',
  `volume_rw` decimal(20,2) DEFAULT '0.00',
  `harga_satuan` decimal(20,2) DEFAULT '0.00',
  `harga_satuan_rw` decimal(20,2) DEFAULT '0.00',
  `jml_pagu` decimal(20,2) DEFAULT '0.00',
  `jml_pagu_rw` decimal(20,2) DEFAULT '0.00',
  `id_usulan_rw` bigint(255) DEFAULT NULL,
  `pagu_aktivitas` decimal(20,2) DEFAULT '0.00',
  `sumber_usulan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Ranwal/Renja 1 = RW 2 = Musrendes',
  `status_usulan` int(11) NOT NULL COMMENT '0 = Proses Usulan 1 = Kirim_Musrencam',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0= Diterima\r\n1= Diterima dengan perubahan\r\n2= Digabungkan dengan usulan lain\r\n3= Ditolak',
  PRIMARY KEY (`id_musrendes`) USING BTREE,
  UNIQUE KEY `idx_trx_musrendes` (`id_renja`,`tahun_renja`,`no_urut`,`id_musrendes`,`id_desa`,`id_usulan_rw`) USING BTREE,
  CONSTRAINT `fk_trx_musrendes` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrendes_lokasi
DROP TABLE IF EXISTS `trx_musrendes_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_musrendes_lokasi` (
  `tahun_musren` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrendes` int(11) NOT NULL,
  `id_lokasi_musrendes` int(11) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL COMMENT 'difilter hanya id lokasi yang jenis lokasinya kewilayahan',
  `id_desa` int(11) DEFAULT NULL,
  `rt` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `uraian_kondisi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_foto` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) DEFAULT NULL COMMENT '0 = RW 1 = Desa',
  `volume_rw` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_desa` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_lokasi_musrendes`) USING BTREE,
  UNIQUE KEY `idx_trx_musrendes_lokasi` (`id_musrendes`,`tahun_musren`,`no_urut`,`id_lokasi_musrendes`,`id_desa`,`rt`,`rw`) USING BTREE,
  CONSTRAINT `fk_trx_musrendes_lokasi` FOREIGN KEY (`id_musrendes`) REFERENCES `trx_musrendes` (`id_musrendes`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrendes_rw
DROP TABLE IF EXISTS `trx_musrendes_rw`;
CREATE TABLE IF NOT EXISTS `trx_musrendes_rw` (
  `tahun_musren` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrendes_rw` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_desa` int(11) NOT NULL,
  `id_kegiatan` int(11) NOT NULL,
  `id_asb_aktivitas` int(11) NOT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_kondisi` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_satuan` int(11) NOT NULL DEFAULT '0',
  `volume` decimal(20,2) NOT NULL DEFAULT '0.00',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_pagu` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_usulan` int(11) NOT NULL COMMENT '0 = Proses Usulan 1 = Kirim_Musrencam',
  `rt` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_musrendes_rw`) USING BTREE,
  UNIQUE KEY `tahun_musren` (`tahun_musren`,`no_urut`,`id_renja`,`id_desa`,`id_kegiatan`,`id_asb_aktivitas`,`rt`,`rw`) USING BTREE,
  KEY `id_renja` (`id_renja`) USING BTREE,
  CONSTRAINT `trx_musrendes_rw_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrendes_rw_lokasi
DROP TABLE IF EXISTS `trx_musrendes_rw_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_musrendes_rw_lokasi` (
  `no_urut` int(11) NOT NULL,
  `id_musrendes_rw` int(11) NOT NULL,
  `id_musrendes_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `file_foto` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_kondisi` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_usulan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Proses Usulan 1 = Kirim_Musrencam',
  PRIMARY KEY (`id_musrendes_lokasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab
DROP TABLE IF EXISTS `trx_musrenkab`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab` (
  `id_musrenkab` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_ranwal` int(11) NOT NULL COMMENT '0 baru',
  `id_rkpd_rancangan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru',
  `no_urut` int(11) NOT NULL,
  `tahun_rkpd` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_musrenkab`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`id_program_rpjmd`,`id_visi_rpjmd`,`id_sasaran_rpjmd`,`thn_id_rpjmd`,`id_rkpd_rancangan`,`id_tujuan_rpjmd`,`tahun_rkpd`,`no_urut`,`id_misi_rpjmd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_aktivitas_pd
DROP TABLE IF EXISTS `trx_musrenkab_aktivitas_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_aktivitas_pd` (
  `id_aktivitas_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_pd` bigint(20) NOT NULL,
  `id_aktivitas_forum` int(11) NOT NULL DEFAULT '0',
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_aktivitas_renja` int(11) DEFAULT '0',
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja 1 tambahan baru',
  `id_satuan_publik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_pelaksana_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_aktivitas_pd_ibfk_1` FOREIGN KEY (`id_pelaksana_pd`) REFERENCES `trx_musrenkab_pelaksana_pd` (`id_pelaksana_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_belanja_pd
DROP TABLE IF EXISTS `trx_musrenkab_belanja_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_belanja_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_belanja_forum` int(11) NOT NULL DEFAULT '0',
  `id_zona_ssh` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL,
  `id_item_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL,
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '1',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1_forum` int(11) NOT NULL,
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2_forum` int(11) NOT NULL DEFAULT '1',
  `harga_satuan_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL,
  PRIMARY KEY (`id_belanja_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_forum`,`no_urut`,`id_belanja_pd`,`id_aktivitas_pd`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_aktivitas_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_belanja_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_musrenkab_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=737 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_dokumen
DROP TABLE IF EXISTS `trx_musrenkab_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_dokumen` (
  `id_dokumen_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_rkpd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_rkpd` date NOT NULL,
  `tahun_rkpd` int(11) NOT NULL COMMENT 'tahun perencanaan',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_perencana` int(11) DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_rkpd`) USING BTREE,
  UNIQUE KEY `tahun_ranwal` (`tahun_rkpd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_indikator
DROP TABLE IF EXISTS `trx_musrenkab_indikator`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrenkab` int(11) NOT NULL,
  `id_indikator_program_rkpd` int(11) NOT NULL COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  PRIMARY KEY (`id_indikator_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_musrenkab`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_indikator` (`id_musrenkab`) USING BTREE,
  CONSTRAINT `trx_musrenkab_indikator_ibfk_1` FOREIGN KEY (`id_musrenkab`) REFERENCES `trx_musrenkab` (`id_musrenkab`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_kebijakan
DROP TABLE IF EXISTS `trx_musrenkab_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_musrenkab` int(11) NOT NULL,
  `id_kebijakan_rancangan` int(11) NOT NULL,
  `id_kebijakan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal_kebijakan` (`tahun_rkpd`,`id_musrenkab`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_kebijakan` (`id_musrenkab`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_kebijakan_pd
DROP TABLE IF EXISTS `trx_musrenkab_kebijakan_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_kebijakan_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_pd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_pd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_renja`,`id_unit`,`no_urut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_kegiatan_pd
DROP TABLE IF EXISTS `trx_musrenkab_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_kegiatan_pd` (
  `id_kegiatan_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_program_pd` bigint(20) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_skpd` int(11) DEFAULT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_program_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_kegiatan_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_musrenkab_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_keg_indikator_pd
DROP TABLE IF EXISTS `trx_musrenkab_keg_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_keg_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_kegiatan_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_kegiatan_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_keg_indikator_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_musrenkab_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_lokasi_pd
DROP TABLE IF EXISTS `trx_musrenkab_lokasi_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_lokasi_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_lokasi_forum` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  `id_lokasi_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_renja` int(11) DEFAULT '0',
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `jenis_lokasi` int(11) NOT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan 2 musrenbang 3 pokir',
  PRIMARY KEY (`id_lokasi_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_aktivitas_pd`,`tahun_forum`,`no_urut`,`id_lokasi_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_lokasi_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_musrenkab_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_pelaksana
DROP TABLE IF EXISTS `trx_musrenkab_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_musrenkab` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  PRIMARY KEY (`id_pelaksana_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_musrenkab`,`id_unit`,`id_urusan_rkpd`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_musrenkab`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_rkpd`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_musrenkab_pelaksana_ibfk_1` FOREIGN KEY (`id_urusan_rkpd`) REFERENCES `trx_musrenkab_urusan` (`id_urusan_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_musrenkab_pelaksana_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_pelaksana_pd
DROP TABLE IF EXISTS `trx_musrenkab_pelaksana_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_pelaksana_pd` (
  `id_pelaksana_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_pelaksana_forum` int(11) DEFAULT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  PRIMARY KEY (`id_pelaksana_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_kegiatan_pd`,`tahun_forum`,`no_urut`,`id_pelaksana_pd`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `trx_musrenkab_pelaksana_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_musrenkab_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_program_pd
DROP TABLE IF EXISTS `trx_musrenkab_program_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_program_pd` (
  `id_program_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_rkpd` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) DEFAULT NULL,
  `id_renja_program` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_forum` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_program_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_pelaksana_rkpd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_program_pd_ibfk_1` FOREIGN KEY (`id_pelaksana_rkpd`) REFERENCES `trx_musrenkab_pelaksana` (`id_pelaksana_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_prog_indikator_pd
DROP TABLE IF EXISTS `trx_musrenkab_prog_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_prog_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_pd` bigint(11) NOT NULL,
  `id_program_forum` int(11) NOT NULL DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_program_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_musrenkab_prog_indikator_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_musrenkab_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_musrenkab_urusan
DROP TABLE IF EXISTS `trx_musrenkab_urusan`;
CREATE TABLE IF NOT EXISTS `trx_musrenkab_urusan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_musrenkab` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  PRIMARY KEY (`id_urusan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_musrenkab`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_musrenkab`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `trx_musrenkab_urusan_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`) ON UPDATE CASCADE,
  CONSTRAINT `trx_musrenkab_urusan_ibfk_2` FOREIGN KEY (`id_musrenkab`) REFERENCES `trx_musrenkab` (`id_musrenkab`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_pokir
DROP TABLE IF EXISTS `trx_pokir`;
CREATE TABLE IF NOT EXISTS `trx_pokir` (
  `id_tahun` int(11) NOT NULL,
  `id_pokir` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_pengusul` date NOT NULL,
  `asal_pengusul` int(11) NOT NULL DEFAULT '0' COMMENT '0 Fraksi\r\n1 Pempinan\r\n2 Badan Musyawarah\r\n3 Komisi\r\n4 Badan Legislasi Daerah\r\n5 Badan Anggaran\r\n6 Badan Kehormatan\r\n9 Badan Lainnya',
  `jabatan_pengusul` int(11) NOT NULL DEFAULT '4' COMMENT '0 ketua 1 wakil ketua 2 sekretaris 3 bendahara 4 anggota',
  `nama_pengusul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_anggota` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daerah_pemilihan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_pokir` int(11) DEFAULT '0' COMMENT '1 surat 2 email 3 telepon 4 lisan 9 lainnya',
  `bukti_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entried_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pokir`) USING BTREE,
  UNIQUE KEY `id_tahun` (`id_tahun`,`tanggal_pengusul`,`asal_pengusul`,`jabatan_pengusul`,`nomor_anggota`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_pokir_lokasi
DROP TABLE IF EXISTS `trx_pokir_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_pokir_lokasi` (
  `id_pokir_usulan` int(11) NOT NULL,
  `id_pokir_lokasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_kecamatan` int(11) NOT NULL,
  `id_desa` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `rt` int(11) DEFAULT NULL,
  `diskripsi_lokasi` blob,
  PRIMARY KEY (`id_pokir_lokasi`) USING BTREE,
  UNIQUE KEY `id_pokir_usulan` (`id_pokir_usulan`,`id_kecamatan`,`id_desa`,`rw`,`rt`) USING BTREE,
  CONSTRAINT `trx_pokir_lokasi_ibfk_1` FOREIGN KEY (`id_pokir_usulan`) REFERENCES `trx_pokir_usulan` (`id_pokir_usulan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_pokir_tl
DROP TABLE IF EXISTS `trx_pokir_tl`;
CREATE TABLE IF NOT EXISTS `trx_pokir_tl` (
  `id_pokir_tl` int(11) NOT NULL AUTO_INCREMENT,
  `id_pokir` int(11) NOT NULL,
  `id_pokir_usulan` int(11) NOT NULL,
  `id_pokir_lokasi` int(11) NOT NULL,
  `unit_tl` int(11) DEFAULT NULL,
  `status_tl` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Belum TL, 1 = Disposisi Ke Unit, 2 = Dipending, 3 = Perlu Dibahas kembali  4 = tidak diakomodir',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pokir_tl`) USING BTREE,
  UNIQUE KEY `id_pokir_usulan` (`id_pokir`,`id_pokir_usulan`,`id_pokir_lokasi`) USING BTREE,
  KEY `trx_pokir_tl_ibfk_1` (`id_pokir_usulan`) USING BTREE,
  CONSTRAINT `trx_pokir_tl_ibfk_1` FOREIGN KEY (`id_pokir_usulan`) REFERENCES `trx_pokir_usulan` (`id_pokir_usulan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_pokir_tl_unit
DROP TABLE IF EXISTS `trx_pokir_tl_unit`;
CREATE TABLE IF NOT EXISTS `trx_pokir_tl_unit` (
  `id_pokir_unit` int(11) NOT NULL AUTO_INCREMENT,
  `unit_tl` int(11) DEFAULT NULL,
  `id_pokir_tl` int(11) NOT NULL,
  `id_pokir` int(11) NOT NULL,
  `id_pokir_usulan` int(11) NOT NULL,
  `id_pokir_lokasi` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL DEFAULT '0',
  `id_lokasi_renja` int(11) NOT NULL DEFAULT '0',
  `id_aktivitas_forum` int(11) NOT NULL DEFAULT '0',
  `id_lokasi_forum` int(11) NOT NULL DEFAULT '0',
  `volume_tl` decimal(20,2) DEFAULT '0.00',
  `pagu_tl` decimal(20,2) DEFAULT '0.00',
  `status_tl` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Belum TL, 1 = Diakomodir Renja, 2 = Diakomodir Forum, 3 = Tidak diakomodir',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pokir_unit`) USING BTREE,
  UNIQUE KEY `id_pokir_usulan` (`id_pokir`,`id_pokir_usulan`,`id_pokir_lokasi`) USING BTREE,
  KEY `trx_pokir_tl_ibfk_1` (`id_pokir_usulan`) USING BTREE,
  KEY `trx_pokir_tl_unit_ibfk_1` (`id_pokir_tl`) USING BTREE,
  CONSTRAINT `trx_pokir_tl_unit_ibfk_1` FOREIGN KEY (`id_pokir_tl`) REFERENCES `trx_pokir_tl` (`id_pokir_tl`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_pokir_usulan
DROP TABLE IF EXISTS `trx_pokir_usulan`;
CREATE TABLE IF NOT EXISTS `trx_pokir_usulan` (
  `id_pokir` int(11) NOT NULL,
  `id_pokir_usulan` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL DEFAULT '1',
  `id_judul_usulan` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskripsi_usulan` blob,
  `id_unit` int(11) DEFAULT NULL,
  `volume` decimal(20,2) DEFAULT '0.00',
  `id_satuan` int(11) DEFAULT NULL,
  `jml_anggaran` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entried_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pokir_usulan`) USING BTREE,
  UNIQUE KEY `id_pokir` (`id_pokir`,`no_urut`) USING BTREE,
  KEY `id_unit` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_pokir_usulan_ibfk_1` FOREIGN KEY (`id_pokir`) REFERENCES `trx_pokir` (`id_pokir`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_pokir_usulan_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_prioritas_pemda
DROP TABLE IF EXISTS `trx_prioritas_pemda`;
CREATE TABLE IF NOT EXISTS `trx_prioritas_pemda` (
  `id_tema_rkpd` int(11) NOT NULL,
  `id_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_prioritas`) USING BTREE,
  KEY `id_tema_rkpd` (`id_tema_rkpd`),
  CONSTRAINT `trx_prioritas_pemda_ibfk_1` FOREIGN KEY (`id_tema_rkpd`) REFERENCES `trx_prioritas_pemda_tema` (`id_tema_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_prioritas_pemda_tema
DROP TABLE IF EXISTS `trx_prioritas_pemda_tema`;
CREATE TABLE IF NOT EXISTS `trx_prioritas_pemda_tema` (
  `tahun` int(11) NOT NULL,
  `id_tema_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_tema` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tema_rkpd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_program_nasional
DROP TABLE IF EXISTS `trx_program_nasional`;
CREATE TABLE IF NOT EXISTS `trx_program_nasional` (
  `id_prioritas` int(11) NOT NULL,
  `tahun` int(11) NOT NULL DEFAULT '2018',
  `id_prognas` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_program_nasional` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_prognas`) USING BTREE,
  KEY `id_prioritas` (`id_prioritas`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_program_nasional_urusan
DROP TABLE IF EXISTS `trx_program_nasional_urusan`;
CREATE TABLE IF NOT EXISTS `trx_program_nasional_urusan` (
  `id_prognas` int(11) NOT NULL,
  `id_prognas_urusan` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `lingkup_program` int(11) NOT NULL DEFAULT '0',
  `ref_rek_1` int(11) NOT NULL DEFAULT '0',
  `ref_rek_2` int(11) NOT NULL DEFAULT '0',
  `ref_rek_3` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_prognas_urusan`) USING BTREE,
  UNIQUE KEY `id_prognas` (`id_bidang`,`id_prognas`,`lingkup_program`,`ref_rek_1`,`ref_rek_2`,`ref_rek_3`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_program_provinsi
DROP TABLE IF EXISTS `trx_program_provinsi`;
CREATE TABLE IF NOT EXISTS `trx_program_provinsi` (
  `id_prioritas` int(11) NOT NULL DEFAULT '0',
  `tahun` int(11) NOT NULL DEFAULT '2017',
  `id_progprov` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_program_provinsi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id_progprov`) USING BTREE,
  KEY `id_prioritas` (`id_prioritas`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_program_provinsi_urusan
DROP TABLE IF EXISTS `trx_program_provinsi_urusan`;
CREATE TABLE IF NOT EXISTS `trx_program_provinsi_urusan` (
  `id_progprov` int(11) NOT NULL,
  `id_progprov_urusan` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) DEFAULT '0',
  `lingkup_program` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_progprov_urusan`) USING BTREE,
  UNIQUE KEY `id_progprov` (`id_progprov`,`id_bidang`,`lingkup_program`) USING BTREE,
  KEY `id_progprov_urusan` (`id_progprov_urusan`) USING BTREE,
  CONSTRAINT `trx_program_provinsi_urusan_ibfk_1` FOREIGN KEY (`id_progprov`) REFERENCES `trx_program_provinsi` (`id_progprov`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_aktivitas
DROP TABLE IF EXISTS `trx_renja_aktivitas`;
CREATE TABLE IF NOT EXISTS `trx_renja_aktivitas` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT NULL,
  `id_satuan_publik` int(11) DEFAULT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolak_ukur_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output_aktivitas` decimal(20,2) DEFAULT '0.00',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rata2` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(255) DEFAULT NULL,
  `id_satuan_2` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_aktivitas_renja`) USING BTREE,
  CONSTRAINT `trx_renja_aktivitas_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_pelaksana` (`id_pelaksana_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_belanja
DROP TABLE IF EXISTS `trx_renja_belanja`;
CREATE TABLE IF NOT EXISTS `trx_renja_belanja` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_lokasi_renja` int(11) NOT NULL,
  `id_zona_ssh` int(11) NOT NULL DEFAULT '0',
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '1 ssh 0 asb',
  `id_aktivitas_asb` bigint(20) DEFAULT NULL,
  `id_tarif_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_belanja_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_belanja` (`id_lokasi_renja`,`tahun_renja`,`no_urut`,`id_belanja_renja`) USING BTREE,
  CONSTRAINT `trx_renja_belanja_ibfk_1` FOREIGN KEY (`id_lokasi_renja`) REFERENCES `trx_renja_aktivitas` (`id_aktivitas_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_dokumen
DROP TABLE IF EXISTS `trx_renja_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_renja_dokumen` (
  `id_dokumen_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit_renja` int(255) NOT NULL,
  `nomor_ranwal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ranwal` date NOT NULL,
  `tahun_ranwal` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  `jns_dokumen` int(255) NOT NULL,
  `id_dokumen_ref` int(255) NOT NULL DEFAULT '0',
  `id_perubahan` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dokumen_ranwal`) USING BTREE,
  UNIQUE KEY `id_unit_renja` (`id_unit_renja`,`tahun_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_kebijakan
DROP TABLE IF EXISTS `trx_renja_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_renja_kebijakan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_renja` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kebijakan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_kebijakan` (`tahun_renja`,`id_unit`,`no_urut`,`id_sasaran_renstra`,`id_kebijakan_renja`,`id_renja`) USING BTREE,
  KEY `fk_trx_renja_rancangan_kebijakan` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `trx_renja_kebijakan_ibfk_1` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renja_rancangan` (`id_sasaran_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_kegiatan
DROP TABLE IF EXISTS `trx_renja_kegiatan`;
CREATE TABLE IF NOT EXISTS `trx_renja_kegiatan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL COMMENT 'juga menunjukkan prioritas',
  `id_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja_program` bigint(11) NOT NULL,
  `id_rkpd_renstra` int(11) DEFAULT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_kegiatan` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_selanjutnya` decimal(20,2) DEFAULT '0.00',
  `status_pelaksanaan_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = tepat 1 = dimajukan 2 = ditunda 3 dibatalkan 4 baru',
  `pagu_musrenbang` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja skpd 1 =  tambahan baru',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 Final',
  `status_rancangan` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum selesai 1 siap kirim ke forum',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`id_rkpd_renstra`,`tahun_renja`,`no_urut`,`id_renja`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `FK_trx_renja_rancangan_trx_renja_rancangan_program` (`id_renja_program`) USING BTREE,
  CONSTRAINT `trx_renja_kegiatan_ibfk_2` FOREIGN KEY (`id_rkpd_renstra`) REFERENCES `trx_rkpd_renstra` (`id_rkpd_renstra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_renja_kegiatan_ibfk_3` FOREIGN KEY (`id_rkpd_ranwal`) REFERENCES `trx_rkpd_ranwal` (`id_rkpd_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_renja_kegiatan_ibfk_4` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_kegiatan_indikator
DROP TABLE IF EXISTS `trx_renja_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_kegiatan_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) NOT NULL,
  `id_indikator_kegiatan_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `angka_tahun` decimal(20,2) DEFAULT '0.00',
  `angka_renstra` decimal(20,2) DEFAULT '0.00',
  `id_satuan_output` int(255) DEFAULT NULL,
  `status_data` int(11) DEFAULT '0' COMMENT '0 draft 1 final',
  `sumber_data` int(11) DEFAULT '0' COMMENT '0 renstra 1 tambahan',
  PRIMARY KEY (`id_indikator_kegiatan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja`) USING BTREE,
  KEY `FK_trx_renja_rancangan_indikator_trx_renja_rancangan` (`id_renja`) USING BTREE,
  CONSTRAINT `trx_renja_kegiatan_indikator_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_lokasi
DROP TABLE IF EXISTS `trx_renja_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_renja_lokasi` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) NOT NULL,
  `id_lokasi_renja` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_lokasi` int(11) NOT NULL COMMENT '0 kewilayah 1 teknis',
  `id_lokasi` int(11) NOT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_desa` int(11) DEFAULT NULL,
  `rt` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lokasi_renja`) USING BTREE,
  UNIQUE KEY `idx_rancangan_renja_lokasi` (`id_pelaksana_renja`,`tahun_renja`,`no_urut`,`id_lokasi_renja`) USING BTREE,
  CONSTRAINT `trx_renja_lokasi_ibfk_1` FOREIGN KEY (`id_pelaksana_renja`) REFERENCES `trx_renja_aktivitas` (`id_aktivitas_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_pelaksana
DROP TABLE IF EXISTS `trx_renja_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_renja_pelaksana` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) DEFAULT '0',
  `ket_usul` int(11) DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `id_lokasi` int(11) NOT NULL DEFAULT '0' COMMENT 'Lokasi Penyelenggaraan Kegiatan',
  PRIMARY KEY (`id_pelaksana_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_pelaksana_renja`) USING BTREE,
  CONSTRAINT `trx_renja_pelaksana_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_program
DROP TABLE IF EXISTS `trx_renja_program`;
CREATE TABLE IF NOT EXISTS `trx_renja_program` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_renja_ranwal` int(11) NOT NULL DEFAULT '0',
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_ranwal` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `status_program_rkpd` int(11) DEFAULT NULL COMMENT 'status pelaksanaan unit di rkpd',
  `sumber_data_rkpd` int(11) DEFAULT NULL COMMENT 'sumber usulan pelaksana unit di rkpd',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_renja_program`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`tahun_renja`,`no_urut`,`id_rkpd_ranwal`,`id_program_rpjmd`,`id_unit`,`id_bidang`,`id_renja_ranwal`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_ibfk_2` (`id_renja_ranwal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_program_indikator
DROP TABLE IF EXISTS `trx_renja_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_program_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja_program`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_renja_program`) USING BTREE,
  CONSTRAINT `trx_renja_program_indikator_ibfk_1` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_program_rkpd
DROP TABLE IF EXISTS `trx_renja_program_rkpd`;
CREATE TABLE IF NOT EXISTS `trx_renja_program_rkpd` (
  `tahun_renja` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_renja_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `jml_data` int(11) NOT NULL DEFAULT '0',
  `jml_baru` int(11) NOT NULL DEFAULT '0',
  `jml_lama` int(11) NOT NULL DEFAULT '0',
  `jml_tepat` int(11) NOT NULL DEFAULT '0',
  `jml_maju` int(11) NOT NULL DEFAULT '0',
  `jml_tunda` int(11) NOT NULL DEFAULT '0',
  `jml_batal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_renja_ranwal`) USING BTREE,
  UNIQUE KEY `tahun_renja_id_rkpd_ranwal_id_unit` (`tahun_renja`,`id_rkpd_ranwal`,`id_unit`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan
DROP TABLE IF EXISTS `trx_renja_rancangan`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL COMMENT 'juga menunjukkan prioritas',
  `id_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja_program` bigint(11) NOT NULL,
  `id_rkpd_renstra` int(11) DEFAULT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_kegiatan` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_selanjutnya` decimal(20,2) DEFAULT '0.00',
  `status_pelaksanaan_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = tepat 1 = dimajukan 2 = ditunda 3 dibatalkan 4 baru',
  `pagu_musrenbang` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja skpd 1 =  tambahan baru',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 Final',
  `status_rancangan` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum selesai 1 siap kirim ke forum',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`id_rkpd_renstra`,`tahun_renja`,`no_urut`,`id_renja`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `FK_trx_renja_rancangan_trx_renja_rancangan_program` (`id_renja_program`) USING BTREE,
  CONSTRAINT `FK_trx_renja_rancangan_trx_renja_rancangan_program` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_rancangan_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trx_rancangan_renja_1` FOREIGN KEY (`id_rkpd_ranwal`) REFERENCES `trx_rkpd_ranwal` (`id_rkpd_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_aktivitas
DROP TABLE IF EXISTS `trx_renja_rancangan_aktivitas`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_aktivitas` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT NULL,
  `id_satuan_publik` int(11) DEFAULT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolak_ukur_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output_aktivitas` decimal(20,2) DEFAULT '0.00',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rata2` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(255) DEFAULT NULL,
  `id_satuan_2` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_aktivitas_renja`) USING BTREE,
  CONSTRAINT `trx_renja_rancangan_aktivitas_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_rancangan_pelaksana` (`id_pelaksana_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_belanja
DROP TABLE IF EXISTS `trx_renja_rancangan_belanja`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_belanja` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_lokasi_renja` int(11) NOT NULL,
  `id_zona_ssh` int(11) NOT NULL DEFAULT '0',
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '1 ssh 0 asb',
  `id_aktivitas_asb` bigint(20) DEFAULT NULL,
  `id_tarif_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_belanja_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_belanja` (`id_lokasi_renja`,`tahun_renja`,`no_urut`,`id_belanja_renja`) USING BTREE,
  CONSTRAINT `FK_trx_renja_rancangan_belanja_trx_renja_rancangan_lokasi` FOREIGN KEY (`id_lokasi_renja`) REFERENCES `trx_renja_rancangan_aktivitas` (`id_aktivitas_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_dokumen
DROP TABLE IF EXISTS `trx_renja_rancangan_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_dokumen` (
  `id_dokumen_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit_renja` int(255) NOT NULL,
  `nomor_ranwal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ranwal` date NOT NULL,
  `tahun_ranwal` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_ranwal`) USING BTREE,
  UNIQUE KEY `id_unit_renja` (`id_unit_renja`,`tahun_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_indikator
DROP TABLE IF EXISTS `trx_renja_rancangan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) NOT NULL,
  `id_indikator_kegiatan_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `angka_tahun` decimal(20,2) DEFAULT '0.00',
  `angka_renstra` decimal(20,2) DEFAULT '0.00',
  `id_satuan_output` int(255) DEFAULT NULL,
  `status_data` int(11) DEFAULT '0' COMMENT '0 draft 1 final',
  `sumber_data` int(11) DEFAULT '0' COMMENT '0 renstra 1 tambahan',
  PRIMARY KEY (`id_indikator_kegiatan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja`) USING BTREE,
  KEY `FK_trx_renja_rancangan_indikator_trx_renja_rancangan` (`id_renja`) USING BTREE,
  CONSTRAINT `FK_trx_renja_rancangan_indikator_trx_renja_rancangan` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_rancangan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_kebijakan
DROP TABLE IF EXISTS `trx_renja_rancangan_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_kebijakan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_renja` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_kebijakan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_kebijakan` (`tahun_renja`,`id_unit`,`no_urut`,`id_sasaran_renstra`,`id_kebijakan_renja`,`id_renja`) USING BTREE,
  KEY `fk_trx_renja_rancangan_kebijakan` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renja_rancangan_kebijakan` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renja_rancangan` (`id_sasaran_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_lokasi
DROP TABLE IF EXISTS `trx_renja_rancangan_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_lokasi` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) NOT NULL,
  `id_lokasi_renja` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_lokasi` int(11) NOT NULL COMMENT '0 kewilayah 1 teknis',
  `id_lokasi` int(11) NOT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_desa` int(11) DEFAULT NULL,
  `rt` int(11) DEFAULT NULL,
  `rw` int(11) DEFAULT NULL,
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_lokasi_renja`) USING BTREE,
  UNIQUE KEY `idx_rancangan_renja_lokasi` (`id_pelaksana_renja`,`tahun_renja`,`no_urut`,`id_lokasi_renja`) USING BTREE,
  CONSTRAINT `fk_rancangan_renja_lokasi` FOREIGN KEY (`id_pelaksana_renja`) REFERENCES `trx_renja_rancangan_aktivitas` (`id_aktivitas_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_pelaksana
DROP TABLE IF EXISTS `trx_renja_rancangan_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_pelaksana` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) DEFAULT '0',
  `ket_usul` int(11) DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `id_lokasi` int(11) NOT NULL DEFAULT '0' COMMENT 'Lokasi Penyelenggaraan Kegiatan',
  PRIMARY KEY (`id_pelaksana_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_pelaksana_renja`) USING BTREE,
  CONSTRAINT `fk_trx_rancangan_renja_pelaksana` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_rancangan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_program
DROP TABLE IF EXISTS `trx_renja_rancangan_program`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_program` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_renja_ranwal` int(11) NOT NULL DEFAULT '0',
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_ranwal` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `status_program_rkpd` int(11) DEFAULT NULL COMMENT 'status pelaksanaan unit di rkpd',
  `sumber_data_rkpd` int(11) DEFAULT NULL COMMENT 'sumber usulan pelaksana unit di rkpd',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_renja_program`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`tahun_renja`,`no_urut`,`id_rkpd_ranwal`,`id_program_rpjmd`,`id_unit`,`id_bidang`,`id_renja_ranwal`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_ibfk_2` (`id_renja_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_program_indikator
DROP TABLE IF EXISTS `trx_renja_rancangan_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_program_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja_program`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_renja_program`) USING BTREE,
  CONSTRAINT `trx_renja_rancangan_program_indikator_ibfk_1` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_rancangan_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_program_ranwal
DROP TABLE IF EXISTS `trx_renja_rancangan_program_ranwal`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_program_ranwal` (
  `tahun_renja` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_renja_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `jml_data` int(11) NOT NULL DEFAULT '0',
  `jml_baru` int(11) NOT NULL DEFAULT '0',
  `jml_lama` int(11) NOT NULL DEFAULT '0',
  `jml_tepat` int(11) NOT NULL DEFAULT '0',
  `jml_maju` int(11) NOT NULL DEFAULT '0',
  `jml_tunda` int(11) NOT NULL DEFAULT '0',
  `jml_batal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_renja_ranwal`) USING BTREE,
  UNIQUE KEY `tahun_renja_id_rkpd_ranwal_id_unit` (`tahun_renja`,`id_rkpd_ranwal`,`id_unit`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_rancangan_ref_pokir
DROP TABLE IF EXISTS `trx_renja_rancangan_ref_pokir`;
CREATE TABLE IF NOT EXISTS `trx_renja_rancangan_ref_pokir` (
  `id_aktivitas_renja` int(11) NOT NULL,
  `id_pokir_usulan` int(11) NOT NULL,
  `id_ref_pokir_renja` int(11) NOT NULL,
  PRIMARY KEY (`id_ref_pokir_renja`) USING BTREE,
  UNIQUE KEY `id_aktivitas_renja` (`id_aktivitas_renja`,`id_pokir_usulan`) USING BTREE,
  KEY `id_pokir_usulan` (`id_pokir_usulan`) USING BTREE,
  CONSTRAINT `trx_renja_rancangan_ref_pokir_ibfk_1` FOREIGN KEY (`id_aktivitas_renja`) REFERENCES `trx_renja_rancangan_aktivitas` (`id_aktivitas_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_aktivitas
DROP TABLE IF EXISTS `trx_renja_ranwal_aktivitas`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_aktivitas` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT NULL,
  `id_satuan_publik` int(11) DEFAULT NULL,
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolak_ukur_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output_aktivitas` decimal(20,2) DEFAULT '0.00',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rata2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(255) DEFAULT NULL,
  `id_satuan_2` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_aktivitas_renja`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_aktivitas_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_pelaksana` (`id_pelaksana_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_dokumen
DROP TABLE IF EXISTS `trx_renja_ranwal_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_dokumen` (
  `id_dokumen_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit_renja` int(255) NOT NULL,
  `nomor_ranwal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ranwal` date NOT NULL,
  `tahun_ranwal` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_ranwal`) USING BTREE,
  UNIQUE KEY `id_unit_renja` (`id_unit_renja`,`tahun_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_kegiatan
DROP TABLE IF EXISTS `trx_renja_ranwal_kegiatan`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_kegiatan` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL COMMENT 'juga menunjukkan prioritas',
  `id_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja_program` bigint(11) NOT NULL,
  `id_rkpd_renstra` int(11) DEFAULT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kegiatan_renstra` int(11) DEFAULT NULL,
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_kegiatan` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_selanjutnya` decimal(20,2) DEFAULT '0.00',
  `status_pelaksanaan_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 = tepat 1 = dimajukan 2 = ditunda 3 dibatalkan 4 baru',
  `pagu_musrenbang` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja skpd 1 =  tambahan baru',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 Final',
  `status_rancangan` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum selesai 1 siap kirim ke forum',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`id_rkpd_renstra`,`tahun_renja`,`no_urut`,`id_renja`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `FK_trx_renja_rancangan_trx_renja_rancangan_program` (`id_renja_program`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_kegiatan_ibfk_1` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_ranwal_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_kegiatan_indikator
DROP TABLE IF EXISTS `trx_renja_ranwal_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_kegiatan_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja` int(11) NOT NULL,
  `id_indikator_kegiatan_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `angka_tahun` decimal(20,2) DEFAULT '0.00',
  `angka_renstra` decimal(20,2) DEFAULT '0.00',
  `id_satuan_output` int(255) DEFAULT NULL,
  `status_data` int(11) DEFAULT '0' COMMENT '0 draft 1 final',
  `sumber_data` int(11) DEFAULT '0' COMMENT '0 renstra 1 tambahan',
  PRIMARY KEY (`id_indikator_kegiatan_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja`) USING BTREE,
  KEY `FK_trx_renja_rancangan_indikator_trx_renja_rancangan` (`id_renja`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_kegiatan_indikator_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_pelaksana
DROP TABLE IF EXISTS `trx_renja_ranwal_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_pelaksana` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) NOT NULL AUTO_INCREMENT,
  `id_renja` int(11) NOT NULL,
  `id_aktivitas_renja` int(11) NOT NULL DEFAULT '0',
  `id_sub_unit` int(11) NOT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) DEFAULT '0',
  `ket_usul` int(11) DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `id_lokasi` int(11) NOT NULL DEFAULT '0' COMMENT 'Lokasi Penyelenggaraan Kegiatan',
  PRIMARY KEY (`id_pelaksana_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja_pelaksana` (`id_renja`,`tahun_renja`,`no_urut`,`id_pelaksana_renja`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_pelaksana_ibfk_1` FOREIGN KEY (`id_renja`) REFERENCES `trx_renja_ranwal_kegiatan` (`id_renja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_program
DROP TABLE IF EXISTS `trx_renja_ranwal_program`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_program` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_renja_ranwal` int(11) NOT NULL DEFAULT '0',
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `id_bidang` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) DEFAULT NULL,
  `id_misi_renstra` int(11) DEFAULT NULL,
  `id_tujuan_renstra` int(11) DEFAULT NULL,
  `id_sasaran_renstra` int(11) DEFAULT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_ranwal` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `status_program_rkpd` int(11) DEFAULT NULL COMMENT 'status pelaksanaan unit di rkpd',
  `sumber_data_rkpd` int(11) DEFAULT NULL COMMENT 'sumber usulan pelaksana unit di rkpd',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  PRIMARY KEY (`id_renja_program`) USING BTREE,
  UNIQUE KEY `idx_trx_rancangan_renja` (`tahun_renja`,`no_urut`,`id_rkpd_ranwal`,`id_program_rpjmd`,`id_unit`,`id_bidang`,`id_renja_ranwal`) USING BTREE,
  KEY `idx_trx_rancangan_renja_1` (`id_rkpd_ranwal`) USING BTREE,
  KEY `id_program_renstra` (`id_program_renstra`) USING BTREE,
  KEY `id_sasaran_renstra` (`id_sasaran_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_ibfk_2` (`id_renja_ranwal`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_program_ibfk_1` FOREIGN KEY (`id_renja_ranwal`) REFERENCES `trx_renja_ranwal_program_rkpd` (`id_renja_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_program_indikator
DROP TABLE IF EXISTS `trx_renja_ranwal_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_program_indikator` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renja_program` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program_renja` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_renja` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program_renja`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_renja_program`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_ranwal_program_indikator_ibfk_1` (`id_renja_program`) USING BTREE,
  CONSTRAINT `trx_renja_ranwal_program_indikator_ibfk_1` FOREIGN KEY (`id_renja_program`) REFERENCES `trx_renja_ranwal_program` (`id_renja_program`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renja_ranwal_program_rkpd
DROP TABLE IF EXISTS `trx_renja_ranwal_program_rkpd`;
CREATE TABLE IF NOT EXISTS `trx_renja_ranwal_program_rkpd` (
  `tahun_renja` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_renja_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `jml_data` int(11) NOT NULL DEFAULT '0',
  `jml_baru` int(11) NOT NULL DEFAULT '0',
  `jml_lama` int(11) NOT NULL DEFAULT '0',
  `jml_tepat` int(11) NOT NULL DEFAULT '0',
  `jml_maju` int(11) NOT NULL DEFAULT '0',
  `jml_tunda` int(11) NOT NULL DEFAULT '0',
  `jml_batal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_renja_ranwal`) USING BTREE,
  UNIQUE KEY `tahun_renja_id_rkpd_ranwal_id_unit` (`tahun_renja`,`id_rkpd_ranwal`,`id_unit`) USING BTREE,
  KEY `id_rkpd_ranwal` (`id_rkpd_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_dokumen
DROP TABLE IF EXISTS `trx_renstra_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_renstra_dokumen` (
  `id_rpjmd` int(11) NOT NULL,
  `id_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_renstra_old` int(11) NOT NULL,
  `id_renstra_ref` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `nomor_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_renstra` date DEFAULT NULL,
  `uraian_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_pimpinan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_pimpinan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan_pimpinan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jns_dokumen` int(11) NOT NULL DEFAULT '9',
  `id_revisi` int(11) NOT NULL DEFAULT '0',
  `id_status_dokumen` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_dokumen` (`id_rpjmd`,`id_unit`) USING BTREE,
  KEY `fk_trx_renstra_dokumen_1` (`id_unit`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_dokumen` FOREIGN KEY (`id_rpjmd`) REFERENCES `trx_rpjmd_dokumen` (`id_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trx_renstra_dokumen_1` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_kebijakan
DROP TABLE IF EXISTS `trx_renstra_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_renstra_kebijakan` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `uraian_kebijakan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kebijakan_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_kebijakan` (`thn_id`,`id_sasaran_renstra`,`id_kebijakan_renstra`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_kebijakan` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_kebijakan` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renstra_sasaran` (`id_sasaran_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_kegiatan
DROP TABLE IF EXISTS `trx_renstra_kegiatan`;
CREATE TABLE IF NOT EXISTS `trx_renstra_kegiatan` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_renstra` int(11) NOT NULL,
  `id_kegiatan_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_kegiatan_ref` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `uraian_kegiatan_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_sasaran_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun1` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun2` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun3` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun4` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun5` decimal(20,2) DEFAULT '0.00',
  `total_pagu` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kegiatan_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_kegiatan` (`thn_id`,`id_program_renstra`,`id_kegiatan_renstra`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_kegiatan` (`id_program_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_kegiatan` FOREIGN KEY (`id_program_renstra`) REFERENCES `trx_renstra_program` (`id_program_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_kegiatan_indikator
DROP TABLE IF EXISTS `trx_renstra_kegiatan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renstra_kegiatan_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_renstra` int(11) NOT NULL,
  `id_indikator_kegiatan_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_kegiatan_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_kegiatan_indikator` (`thn_id`,`id_kegiatan_renstra`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_kegiatan_indikator` (`id_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_kegiatan_indikator` FOREIGN KEY (`id_kegiatan_renstra`) REFERENCES `trx_renstra_kegiatan` (`id_kegiatan_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_kegiatan_pelaksana
DROP TABLE IF EXISTS `trx_renstra_kegiatan_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_renstra_kegiatan_pelaksana` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_renstra_pelaksana` int(11) NOT NULL AUTO_INCREMENT,
  `id_kegiatan_renstra` int(255) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kegiatan_renstra_pelaksana`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_kegiatan_pelaksana` (`thn_id`,`id_kegiatan_renstra`,`id_perubahan`,`id_sub_unit`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_kegiatan_pelaksana` (`id_kegiatan_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_kegiatan_pelaksana` FOREIGN KEY (`id_kegiatan_renstra`) REFERENCES `trx_renstra_kegiatan` (`id_kegiatan_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_misi
DROP TABLE IF EXISTS `trx_renstra_misi`;
CREATE TABLE IF NOT EXISTS `trx_renstra_misi` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_visi_renstra` int(11) NOT NULL,
  `id_misi_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_perubahan` int(11) NOT NULL,
  `uraian_misi_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_misi_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_misi` (`id_visi_renstra`,`thn_id`,`no_urut`,`id_misi_renstra`,`id_perubahan`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_misi` FOREIGN KEY (`id_visi_renstra`) REFERENCES `trx_renstra_visi` (`id_visi_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_program
DROP TABLE IF EXISTS `trx_renstra_program`;
CREATE TABLE IF NOT EXISTS `trx_renstra_program` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_program_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_rpjmd` int(11) NOT NULL,
  `id_program_ref` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `jns_program` int(11) NOT NULL DEFAULT '0',
  `uraian_program_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_sasaran_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun1` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun2` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun3` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun4` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun5` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_program_renstra`) USING BTREE,
  UNIQUE KEY `idx_renstra_program` (`thn_id`,`id_sasaran_renstra`,`id_program_renstra`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_program` (`id_sasaran_renstra`) USING BTREE,
  KEY `fk_trx_renstra_program_1` (`id_program_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_program` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renstra_sasaran` (`id_sasaran_renstra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trx_renstra_program_1` FOREIGN KEY (`id_program_rpjmd`) REFERENCES `trx_rpjmd_program` (`id_program_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_program_indikator
DROP TABLE IF EXISTS `trx_renstra_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renstra_program_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_renstra` int(11) NOT NULL,
  `id_indikator_sasaran_renstra` int(11) NOT NULL DEFAULT '0',
  `id_indikator_program_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `id_aspek_pembangunan` int(11) NOT NULL DEFAULT '0',
  `uraian_indikator_program_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_program_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_program_indikator` (`thn_id`,`id_program_renstra`,`id_indikator_program_renstra`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_program_indikator` (`id_program_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_program_indikator` FOREIGN KEY (`id_program_renstra`) REFERENCES `trx_renstra_program` (`id_program_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_sasaran
DROP TABLE IF EXISTS `trx_renstra_sasaran`;
CREATE TABLE IF NOT EXISTS `trx_renstra_sasaran` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_tujuan_renstra` int(11) NOT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL DEFAULT '0',
  `id_sasaran_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_perubahan` int(11) NOT NULL,
  `uraian_sasaran_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sasaran_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_sasaran` (`thn_id`,`id_tujuan_renstra`,`id_sasaran_renstra`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_sasaran` (`id_tujuan_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_sasaran` FOREIGN KEY (`id_tujuan_renstra`) REFERENCES `trx_renstra_tujuan` (`id_tujuan_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_sasaran_indikator
DROP TABLE IF EXISTS `trx_renstra_sasaran_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renstra_sasaran_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_indikator_sasaran_rpjmd` int(11) NOT NULL DEFAULT '0',
  `id_indikator_sasaran_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_sasaran_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_sasaran_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_sasaran_indikator` (`thn_id`,`id_sasaran_renstra`,`id_indikator_sasaran_renstra`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_sasaran_indikator` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_sasaran_indikator` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renstra_sasaran` (`id_sasaran_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_strategi
DROP TABLE IF EXISTS `trx_renstra_strategi`;
CREATE TABLE IF NOT EXISTS `trx_renstra_strategi` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_strategi_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `uraian_strategi_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_strategi_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_kebijakan` (`thn_id`,`id_sasaran_renstra`,`id_perubahan`,`id_strategi_renstra`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_strategi` (`id_sasaran_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_strategi` FOREIGN KEY (`id_sasaran_renstra`) REFERENCES `trx_renstra_sasaran` (`id_sasaran_renstra`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_tujuan
DROP TABLE IF EXISTS `trx_renstra_tujuan`;
CREATE TABLE IF NOT EXISTS `trx_renstra_tujuan` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_misi_renstra` int(11) NOT NULL,
  `id_tujuan_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_perubahan` int(11) NOT NULL,
  `uraian_tujuan_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tujuan_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_renstra_tujuan` (`thn_id`,`id_misi_renstra`,`id_tujuan_renstra`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_tujuan` (`id_misi_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_renstra_tujuan` FOREIGN KEY (`id_misi_renstra`) REFERENCES `trx_renstra_misi` (`id_misi_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_tujuan_indikator
DROP TABLE IF EXISTS `trx_renstra_tujuan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_renstra_tujuan_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_tujuan_renstra` int(11) NOT NULL,
  `id_indikator_tujuan_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_sasaran_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_tujuan_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_sasaran_indikator` (`thn_id`,`id_tujuan_renstra`,`id_indikator_tujuan_renstra`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_renstra_sasaran_indikator` (`id_tujuan_renstra`) USING BTREE,
  CONSTRAINT `trx_renstra_tujuan_indikator_ibfk_1` FOREIGN KEY (`id_tujuan_renstra`) REFERENCES `trx_renstra_tujuan` (`id_tujuan_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_renstra_visi
DROP TABLE IF EXISTS `trx_renstra_visi`;
CREATE TABLE IF NOT EXISTS `trx_renstra_visi` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_renstra` int(11) NOT NULL DEFAULT '1',
  `id_visi_renstra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'berisi id khusus untuk setiap visi pada periode yang sama',
  `id_unit` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `thn_awal_renstra` int(11) NOT NULL,
  `thn_akhir_renstra` int(11) NOT NULL,
  `uraian_visi_renstra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status_dokumen` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_visi_renstra`) USING BTREE,
  UNIQUE KEY `idx_ta_visi_rpjmd` (`thn_id`,`id_visi_renstra`,`thn_awal_renstra`,`thn_akhir_renstra`,`id_perubahan`,`id_unit`,`no_urut`) USING BTREE,
  KEY `FK_trx_renstra_visi_ref_unit` (`id_unit`) USING BTREE,
  CONSTRAINT `FK_trx_renstra_visi_ref_unit` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final
DROP TABLE IF EXISTS `trx_rkpd_final`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final` (
  `id_rkpd_rancangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_ranwal` int(11) NOT NULL COMMENT '0 baru',
  `id_forum_rkpdprog` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru',
  `no_urut` int(11) NOT NULL,
  `tahun_rkpd` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rkpd_rancangan`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`thn_id_rpjmd`,`id_misi_rpjmd`,`id_sasaran_rpjmd`,`no_urut`,`tahun_rkpd`,`id_visi_rpjmd`,`id_tujuan_rpjmd`,`id_program_rpjmd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_aktivitas_pd
DROP TABLE IF EXISTS `trx_rkpd_final_aktivitas_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_aktivitas_pd` (
  `id_aktivitas_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_pd` bigint(20) NOT NULL,
  `id_aktivitas_forum` int(11) NOT NULL DEFAULT '0',
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_aktivitas_renja` int(11) DEFAULT '0',
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja 1 tambahan baru',
  `id_satuan_publik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_pelaksana_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_aktivitas_pd_ibfk_1` FOREIGN KEY (`id_pelaksana_pd`) REFERENCES `trx_rkpd_final_pelaksana_pd` (`id_pelaksana_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_belanja_pd
DROP TABLE IF EXISTS `trx_rkpd_final_belanja_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_belanja_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_belanja_forum` int(11) NOT NULL DEFAULT '0',
  `id_zona_ssh` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL,
  `id_item_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL,
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '1',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1_forum` int(11) NOT NULL,
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2_forum` int(11) NOT NULL DEFAULT '1',
  `harga_satuan_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL,
  PRIMARY KEY (`id_belanja_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_forum`,`no_urut`,`id_belanja_pd`,`id_aktivitas_pd`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_aktivitas_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_belanja_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_final_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_dokumen
DROP TABLE IF EXISTS `trx_rkpd_final_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_dokumen` (
  `id_dokumen_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_rkpd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_rkpd` date NOT NULL,
  `tahun_rkpd` int(11) NOT NULL COMMENT 'tahun perencanaan',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_perencana` int(11) DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_rkpd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_indikator
DROP TABLE IF EXISTS `trx_rkpd_final_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_indikator_program_rkpd` int(11) NOT NULL COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  PRIMARY KEY (`id_indikator_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_rkpd_rancangan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_indikator` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_indikator_ibfk_1` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_final` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_kebijakan
DROP TABLE IF EXISTS `trx_rkpd_final_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_kebijakan_rancangan` int(11) NOT NULL,
  `id_kebijakan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal_kebijakan` (`tahun_rkpd`,`id_rkpd_rancangan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_kebijakan` (`id_rkpd_rancangan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_kebijakan_pd
DROP TABLE IF EXISTS `trx_rkpd_final_kebijakan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_kebijakan_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_pd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_pd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_renja`,`id_unit`,`no_urut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_kegiatan_pd
DROP TABLE IF EXISTS `trx_rkpd_final_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_kegiatan_pd` (
  `id_kegiatan_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_program_pd` bigint(20) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_skpd` int(11) DEFAULT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_program_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_kegiatan_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_final_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_keg_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_final_keg_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_keg_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_kegiatan_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_kegiatan_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_keg_indikator_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_final_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_lokasi_pd
DROP TABLE IF EXISTS `trx_rkpd_final_lokasi_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_lokasi_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_lokasi_forum` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  `id_lokasi_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_renja` int(11) DEFAULT '0',
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `jenis_lokasi` int(11) NOT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan 2 musrenbang 3 pokir',
  PRIMARY KEY (`id_lokasi_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_aktivitas_pd`,`tahun_forum`,`no_urut`,`id_lokasi_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_lokasi_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_final_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_final_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  PRIMARY KEY (`id_pelaksana_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_unit`,`id_urusan_rkpd`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_rkpd`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_pelaksana_ibfk_1` FOREIGN KEY (`id_urusan_rkpd`) REFERENCES `trx_rkpd_final_urusan` (`id_urusan_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_final_pelaksana_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_pelaksana_pd
DROP TABLE IF EXISTS `trx_rkpd_final_pelaksana_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_pelaksana_pd` (
  `id_pelaksana_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_pelaksana_forum` int(11) DEFAULT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  PRIMARY KEY (`id_pelaksana_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_kegiatan_pd`,`tahun_forum`,`no_urut`,`id_pelaksana_pd`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_pelaksana_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_final_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_program_pd
DROP TABLE IF EXISTS `trx_rkpd_final_program_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_program_pd` (
  `id_program_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_forum_program` int(11) DEFAULT NULL,
  `id_renja_program` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `id_prognas` int(11) NOT NULL DEFAULT '0',
  `id_progprov` int(11) NOT NULL DEFAULT '0',
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_forum` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  `checksum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_program_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_program_id_program_ref` (`id_unit`,`id_rkpd_rancangan`,`id_program_ref`,`id_forum_program`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_program_pd_ibfk_1` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_final_pelaksana` (`id_pelaksana_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_prog_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_final_prog_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_prog_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_pd` bigint(11) NOT NULL,
  `id_program_forum` int(11) NOT NULL DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_program_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_prog_indikator_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_final_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_final_urusan
DROP TABLE IF EXISTS `trx_rkpd_final_urusan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_final_urusan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  PRIMARY KEY (`id_urusan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `trx_rkpd_final_urusan_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_final_urusan_ibfk_2` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_final` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_identifikasi_masalah
DROP TABLE IF EXISTS `trx_rkpd_identifikasi_masalah`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_identifikasi_masalah` (
  `id_masalah` bigint(255) NOT NULL AUTO_INCREMENT,
  `tahun_perencanaan` int(11) DEFAULT NULL,
  `id_indikator` bigint(255) NOT NULL,
  `interpretasi` int(11) NOT NULL COMMENT '0 = belum tercapai, 1= sesuai, 2= melampaui',
  `angka_target` decimal(20,2) DEFAULT NULL,
  `angka_capaian` decimal(20,2) DEFAULT NULL,
  `uraian_target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_capaian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_masalah` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_keberhasilan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_masalah`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan
DROP TABLE IF EXISTS `trx_rkpd_rancangan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan` (
  `id_rkpd_rancangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_ranwal` int(11) NOT NULL COMMENT '0 baru',
  `id_forum_rkpdprog` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru',
  `no_urut` int(11) NOT NULL,
  `tahun_rkpd` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rkpd_rancangan`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`tahun_rkpd`,`thn_id_rpjmd`,`id_visi_rpjmd`,`id_misi_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_program_rpjmd`,`no_urut`,`id_forum_rkpdprog`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_aktivitas_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_aktivitas_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_aktivitas_pd` (
  `id_aktivitas_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_pd` bigint(20) NOT NULL,
  `id_aktivitas_forum` int(11) NOT NULL DEFAULT '0',
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_aktivitas_renja` int(11) DEFAULT '0',
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja 1 tambahan baru',
  `id_satuan_publik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_pelaksana_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_aktivitas_pd_ibfk_1` FOREIGN KEY (`id_pelaksana_pd`) REFERENCES `trx_rkpd_rancangan_pelaksana_pd` (`id_pelaksana_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_belanja_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_belanja_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_belanja_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_belanja_forum` int(11) NOT NULL DEFAULT '0',
  `id_zona_ssh` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL,
  `id_item_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL,
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '1',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1_forum` int(11) NOT NULL,
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2_forum` int(11) NOT NULL DEFAULT '1',
  `harga_satuan_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL,
  PRIMARY KEY (`id_belanja_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_forum`,`no_urut`,`id_belanja_pd`,`id_aktivitas_pd`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_aktivitas_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_belanja_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_rancangan_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_dokumen
DROP TABLE IF EXISTS `trx_rkpd_rancangan_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_dokumen` (
  `id_dokumen_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_rkpd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_rkpd` date NOT NULL,
  `tahun_rkpd` int(11) NOT NULL COMMENT 'tahun perencanaan',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_perencana` int(11) DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_rkpd`) USING BTREE,
  UNIQUE KEY `tahun_ranwal` (`tahun_rkpd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_indikator
DROP TABLE IF EXISTS `trx_rkpd_rancangan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_indikator_program_rkpd` int(11) NOT NULL COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  PRIMARY KEY (`id_indikator_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_rkpd_rancangan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_indikator` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_indikator_ibfk_1` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_rancangan` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_kebijakan
DROP TABLE IF EXISTS `trx_rkpd_rancangan_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_kebijakan_rancangan` int(11) NOT NULL,
  `id_kebijakan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal_kebijakan` (`tahun_rkpd`,`id_rkpd_rancangan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_kebijakan` (`id_rkpd_rancangan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_kebijakan_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_kebijakan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_kebijakan_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_pd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_pd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_renja`,`id_unit`,`no_urut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_kegiatan_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_kegiatan_pd` (
  `id_kegiatan_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_program_pd` bigint(20) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_skpd` int(11) DEFAULT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_program_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_program_pd`) USING BTREE,
  CONSTRAINT `FK_trx_rkpd_rancangan_kegiatan_pd_trx_rkpd_rancangan_program_pd` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_rancangan_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_keg_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_keg_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_keg_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_kegiatan_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_kegiatan_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_keg_indikator_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_rancangan_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_lokasi_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_lokasi_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_lokasi_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_lokasi_forum` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  `id_lokasi_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_renja` int(11) DEFAULT '0',
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `jenis_lokasi` int(11) NOT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan 2 musrenbang 3 pokir',
  PRIMARY KEY (`id_lokasi_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_aktivitas_pd`,`tahun_forum`,`no_urut`,`id_lokasi_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_lokasi_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_rancangan_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_rancangan_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  PRIMARY KEY (`id_pelaksana_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_unit`,`id_urusan_rkpd`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_rkpd`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_pelaksana_ibfk_1` FOREIGN KEY (`id_urusan_rkpd`) REFERENCES `trx_rkpd_rancangan_urusan` (`id_urusan_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_rancangan_pelaksana_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_pelaksana_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_pelaksana_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_pelaksana_pd` (
  `id_pelaksana_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_pelaksana_forum` int(11) DEFAULT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  PRIMARY KEY (`id_pelaksana_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_kegiatan_pd`,`tahun_forum`,`no_urut`,`id_pelaksana_pd`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_pelaksana_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_rancangan_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_program_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_program_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_program_pd` (
  `id_program_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_forum_program` int(11) DEFAULT NULL,
  `id_renja_program` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_forum` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_program_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_program_id_program_ref` (`id_forum_program`,`id_rkpd_rancangan`,`tahun_forum`,`jenis_belanja`,`id_unit`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `test` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_rancangan_pelaksana` (`id_pelaksana_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_prog_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_rancangan_prog_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_prog_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_pd` bigint(11) NOT NULL,
  `id_program_forum` int(11) NOT NULL DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_program_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_prog_indikator_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_rancangan_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rancangan_urusan
DROP TABLE IF EXISTS `trx_rkpd_rancangan_urusan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rancangan_urusan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  PRIMARY KEY (`id_urusan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `trx_rkpd_rancangan_urusan_ibfk_2` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`) ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_rancangan_urusan_ibfk_3` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_rancangan` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir
DROP TABLE IF EXISTS `trx_rkpd_ranhir`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir` (
  `id_rkpd_rancangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_ranwal` int(11) NOT NULL COMMENT '0 baru',
  `id_forum_rkpdprog` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru',
  `no_urut` int(11) NOT NULL,
  `tahun_rkpd` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rkpd_rancangan`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`tahun_rkpd`,`thn_id_rpjmd`,`id_visi_rpjmd`,`id_misi_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_program_rpjmd`,`no_urut`,`id_forum_rkpdprog`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_aktivitas_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_aktivitas_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_aktivitas_pd` (
  `id_aktivitas_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_pd` bigint(20) NOT NULL,
  `id_aktivitas_forum` int(11) NOT NULL DEFAULT '0',
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `sumber_aktivitas` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari ASB 1 Bukan ASB',
  `id_aktivitas_asb` int(11) DEFAULT '0',
  `id_aktivitas_renja` int(11) DEFAULT '0',
  `uraian_aktivitas_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `volume_aktivitas_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_forum_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_program_nasional` int(11) DEFAULT NULL,
  `id_program_provinsi` int(11) DEFAULT NULL,
  `jenis_kegiatan` int(11) NOT NULL DEFAULT '0' COMMENT '0 baru 1 lanjutan',
  `sumber_dana` int(11) NOT NULL DEFAULT '0',
  `pagu_aktivitas_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_musren` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 final',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_musren` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 = musrenbang',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renja 1 tambahan baru',
  `id_satuan_publik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_aktivitas_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_aktivitas_trx_forum_skpd` (`id_pelaksana_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_aktivitas_pd_ibfk_1` FOREIGN KEY (`id_pelaksana_pd`) REFERENCES `trx_rkpd_ranhir_pelaksana_pd` (`id_pelaksana_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_belanja_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_belanja_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_belanja_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_belanja_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_belanja_forum` int(11) NOT NULL DEFAULT '0',
  `id_zona_ssh` int(11) NOT NULL,
  `id_belanja_renja` int(11) NOT NULL DEFAULT '0',
  `sumber_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 asb 1 ssh',
  `id_aktivitas_asb` int(11) NOT NULL,
  `id_item_ssh` bigint(20) NOT NULL,
  `id_rekening_ssh` int(11) NOT NULL,
  `uraian_belanja` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL,
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2` int(11) NOT NULL DEFAULT '1',
  `harga_satuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1_forum` int(11) NOT NULL,
  `volume_2_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_2_forum` int(11) NOT NULL DEFAULT '1',
  `harga_satuan_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `jml_belanja_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status_data` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL,
  PRIMARY KEY (`id_belanja_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_skpd_belanja` (`tahun_forum`,`no_urut`,`id_belanja_pd`,`id_aktivitas_pd`) USING BTREE,
  KEY `fk_trx_forum_skpd_belanja` (`id_aktivitas_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_belanja_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_ranhir_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=737 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_dokumen
DROP TABLE IF EXISTS `trx_rkpd_ranhir_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_dokumen` (
  `id_dokumen_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_rkpd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_rkpd` date NOT NULL,
  `tahun_rkpd` int(11) NOT NULL COMMENT 'tahun perencanaan',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_perencana` int(11) DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_rkpd`) USING BTREE,
  UNIQUE KEY `tahun_ranwal` (`tahun_rkpd`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_indikator
DROP TABLE IF EXISTS `trx_rkpd_ranhir_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_indikator_program_rkpd` int(11) NOT NULL COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  PRIMARY KEY (`id_indikator_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_rkpd_rancangan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_indikator` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_indikator_ibfk_1` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_ranhir` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_kebijakan
DROP TABLE IF EXISTS `trx_rkpd_ranhir_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_kebijakan_rancangan` int(11) NOT NULL,
  `id_kebijakan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal_kebijakan` (`tahun_rkpd`,`id_rkpd_rancangan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_kebijakan` (`id_rkpd_rancangan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_kebijakan_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_kebijakan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_kebijakan_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `id_kebijakan_pd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_pd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_renja`,`id_unit`,`no_urut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_kegiatan_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_kegiatan_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_kegiatan_pd` (
  `id_kegiatan_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_program_pd` bigint(20) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_forum_skpd` int(11) DEFAULT NULL,
  `id_renja` int(11) DEFAULT '0',
  `id_rkpd_renstra` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `id_kegiatan_renstra` int(11) DEFAULT '0',
  `id_kegiatan_ref` int(11) NOT NULL,
  `uraian_kegiatan_forum` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_kegiatan_renstra` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_renja` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_plus1_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_forum` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_status` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non musrenbang 1 =  musrenbang',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal dilaksanakan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 dari renja 1 baru tambahan',
  `kelompok_sasaran` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kegiatan_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_id_kegiatan_ref` (`id_unit`,`id_kegiatan_ref`,`id_program_pd`) USING BTREE,
  KEY `FK_trx_forum_skpd_trx_forum_skpd_program` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_kegiatan_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_ranhir_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_keg_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_keg_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_keg_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_kegiatan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_kegiatan` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_kegiatan`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_kegiatan_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_kegiatan_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_keg_indikator_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_ranhir_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_lokasi_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_lokasi_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_lokasi_pd` (
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_aktivitas_pd` bigint(20) NOT NULL,
  `id_lokasi_forum` int(11) NOT NULL DEFAULT '0' COMMENT '0',
  `id_lokasi_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_lokasi` int(11) NOT NULL,
  `id_lokasi_renja` int(11) DEFAULT '0',
  `id_lokasi_teknis` int(11) DEFAULT NULL,
  `jenis_lokasi` int(11) NOT NULL,
  `volume_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `volume_usulan_2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_1` int(11) NOT NULL DEFAULT '0',
  `id_satuan_2` int(11) NOT NULL DEFAULT '0',
  `id_desa` int(11) DEFAULT '0',
  `id_kecamatan` int(11) DEFAULT '0',
  `rt` int(11) DEFAULT '0',
  `rw` int(11) DEFAULT '0',
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan 2 musrenbang 3 pokir',
  PRIMARY KEY (`id_lokasi_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_lokasi` (`id_aktivitas_pd`,`tahun_forum`,`no_urut`,`id_lokasi_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_lokasi_pd_ibfk_1` FOREIGN KEY (`id_aktivitas_pd`) REFERENCES `trx_rkpd_ranhir_aktivitas_pd` (`id_aktivitas_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_ranhir_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_pelaksana_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  PRIMARY KEY (`id_pelaksana_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_unit`,`id_urusan_rkpd`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_rkpd`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_pelaksana_ibfk_1` FOREIGN KEY (`id_urusan_rkpd`) REFERENCES `trx_rkpd_ranhir_urusan` (`id_urusan_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_ranhir_pelaksana_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_pelaksana_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_pelaksana_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_pelaksana_pd` (
  `id_pelaksana_pd` bigint(20) NOT NULL AUTO_INCREMENT,
  `tahun_forum` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_kegiatan_pd` bigint(11) NOT NULL,
  `id_pelaksana_forum` int(11) DEFAULT NULL,
  `id_sub_unit` int(11) NOT NULL,
  `id_pelaksana_renja` int(11) DEFAULT '0',
  `id_lokasi` int(11) DEFAULT '0' COMMENT 'lokasi penyelenggaraan',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 renja 1 tambahan',
  `ket_pelaksana` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 batal 2 baru',
  `status_data` int(11) NOT NULL COMMENT '0 draft 1 final',
  PRIMARY KEY (`id_pelaksana_pd`) USING BTREE,
  UNIQUE KEY `id_trx_forum_pelaksana` (`id_kegiatan_pd`,`tahun_forum`,`no_urut`,`id_pelaksana_pd`,`id_sub_unit`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_pelaksana_pd_ibfk_1` FOREIGN KEY (`id_kegiatan_pd`) REFERENCES `trx_rkpd_ranhir_kegiatan_pd` (`id_kegiatan_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_program_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_program_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_program_pd` (
  `id_program_pd` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `tahun_forum` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pdt 2 BTL',
  `no_urut` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_forum_program` int(11) DEFAULT NULL,
  `id_renja_program` int(11) DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT '0',
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_ref` int(11) NOT NULL,
  `pagu_tahun_renstra` decimal(20,2) DEFAULT '0.00',
  `pagu_forum` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0',
  `ket_usulan` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `id_dokumen` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_program_pd`) USING BTREE,
  UNIQUE KEY `id_unit_id_renja_program_id_program_ref` (`id_unit`,`id_renja_program`,`id_program_ref`,`id_forum_program`) USING BTREE,
  KEY `FK_trx_forum_skpd_program_trx_forum_skpd_program_ranwal` (`id_rkpd_rancangan`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_program_pd_ibfk_1` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_ranhir_pelaksana` (`id_pelaksana_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_prog_indikator_pd
DROP TABLE IF EXISTS `trx_rkpd_ranhir_prog_indikator_pd`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_prog_indikator_pd` (
  `tahun_renja` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_pd` bigint(11) NOT NULL,
  `id_program_forum` int(11) NOT NULL DEFAULT '0',
  `id_program_renstra` int(11) DEFAULT NULL,
  `id_indikator_program` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) DEFAULT '0',
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_renstra` decimal(20,2) DEFAULT '0.00',
  `target_renja` decimal(20,2) DEFAULT '0.00',
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_ouput` int(255) DEFAULT NULL,
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 posting',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 Renstra 1 baru',
  PRIMARY KEY (`id_indikator_program`) USING BTREE,
  UNIQUE KEY `idx_trx_renja_rancangan_indikator` (`tahun_renja`,`id_program_renstra`,`kd_indikator`,`no_urut`,`id_perubahan`,`id_program_pd`) USING BTREE,
  KEY `fk_trx_renja_rancangan_indikator` (`id_program_renstra`) USING BTREE,
  KEY `trx_renja_rancangan_program_indikator_ibfk_1` (`id_program_pd`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_prog_indikator_pd_ibfk_1` FOREIGN KEY (`id_program_pd`) REFERENCES `trx_rkpd_ranhir_program_pd` (`id_program_pd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranhir_urusan
DROP TABLE IF EXISTS `trx_rkpd_ranhir_urusan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranhir_urusan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_rkpd_rancangan` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  PRIMARY KEY (`id_urusan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rancangan`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_rancangan`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranhir_urusan_ibfk_1` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_ranhir_urusan_ibfk_2` FOREIGN KEY (`id_rkpd_rancangan`) REFERENCES `trx_rkpd_ranhir` (`id_rkpd_rancangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal
DROP TABLE IF EXISTS `trx_rkpd_ranwal`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal` (
  `id_rkpd_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
  `tahun_rkpd` int(11) NOT NULL,
  `jenis_belanja` int(11) NOT NULL DEFAULT '0' COMMENT '0 BL 1 Pendapatan 2 BTL',
  `id_rkpd_rpjmd` int(11) DEFAULT NULL,
  `thn_id_rpjmd` int(11) DEFAULT NULL,
  `id_visi_rpjmd` int(11) DEFAULT NULL,
  `id_misi_rpjmd` int(11) DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) DEFAULT NULL,
  `id_program_rpjmd` int(11) DEFAULT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_ranwal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_program` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_pelaksanaan` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd\\r\\n9 = dibatalkan pelaksanaanya\\r\\n8 = ditunda dilaksanakan\\r\\n',
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = Draft 1 = Posting Renja 2 = Posting Musren',
  `ket_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = RPJMD 1 = Baru 2 = Luncuran tahun sebelumnya',
  `id_dokumen` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rkpd_ranwal`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal` (`tahun_rkpd`,`thn_id_rpjmd`,`id_visi_rpjmd`,`id_misi_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_program_rpjmd`,`no_urut`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal_dokumen
DROP TABLE IF EXISTS `trx_rkpd_ranwal_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal_dokumen` (
  `id_dokumen_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_ranwal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_ranwal` date NOT NULL,
  `tahun_ranwal` int(11) NOT NULL COMMENT 'tahun berlakuknya perkada',
  `uraian_perkada` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_unit_perencana` int(11) DEFAULT NULL,
  `jabatan_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nip_tandatangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0' COMMENT '0 draft 1 aktif 2 tidak aktif',
  PRIMARY KEY (`id_dokumen_ranwal`) USING BTREE,
  UNIQUE KEY `tahun_ranwal` (`tahun_ranwal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal_indikator
DROP TABLE IF EXISTS `trx_rkpd_ranwal_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_indikator_program_rkpd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rkpd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `target_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `target_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `indikator_input` text CHARACTER SET latin1,
  `target_input` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan_input` int(255) DEFAULT NULL,
  `indikator_output` text CHARACTER SET latin1,
  `id_satuan_output` int(255) DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 data rpjmd 1 data baru',
  PRIMARY KEY (`id_indikator_program_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_indikator` (`tahun_rkpd`,`id_rkpd_ranwal`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_indikator` (`id_rkpd_ranwal`) USING BTREE,
  CONSTRAINT `fk_trx_rkpd_ranwal_indikator` FOREIGN KEY (`id_rkpd_ranwal`) REFERENCES `trx_rkpd_ranwal` (`id_rkpd_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal_kebijakan
DROP TABLE IF EXISTS `trx_rkpd_ranwal_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_kebijakan_ranwal` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_ranwal`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_ranwal_kebijakan` (`tahun_rkpd`,`id_rkpd_ranwal`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_kebijakan` (`id_rkpd_ranwal`) USING BTREE,
  CONSTRAINT `fk_trx_rkpd_ranwal_kebijakan` FOREIGN KEY (`id_rkpd_ranwal`) REFERENCES `trx_rkpd_ranwal` (`id_rkpd_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_ranwal_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit` int(11) NOT NULL,
  `pagu_rpjmd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_rkpd` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hak_akses` int(11) NOT NULL DEFAULT '0' COMMENT '0 tidak dapat menambah data 1 dapat menambah data',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  `status_pelaksanaan` int(11) NOT NULL DEFAULT '0' COMMENT '0 dilaksanakan 1 dibatalkan',
  `ket_pelaksanaan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 belum direviu 1 sudah direviu',
  PRIMARY KEY (`id_pelaksana_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_ranwal`,`id_unit`,`id_urusan_rkpd`,`no_urut`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_ranwal`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_urusan_rkpd`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_2` (`id_unit`) USING BTREE,
  CONSTRAINT `FK_trx_rkpd_ranwal_pelaksana_trx_rkpd_ranwal_urusan` FOREIGN KEY (`id_urusan_rkpd`) REFERENCES `trx_rkpd_ranwal_urusan` (`id_urusan_rkpd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trx_rkpd_ranwal_pelaksana_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_ranwal_urusan
DROP TABLE IF EXISTS `trx_rkpd_ranwal_urusan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_ranwal_urusan` (
  `tahun_rkpd` int(11) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `id_rkpd_ranwal` int(11) NOT NULL,
  `id_urusan_rkpd` int(11) NOT NULL AUTO_INCREMENT,
  `id_bidang` int(11) NOT NULL,
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 rpjmd 1 baru',
  PRIMARY KEY (`id_urusan_rkpd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_ranwal`,`id_bidang`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana` (`id_rkpd_ranwal`) USING BTREE,
  KEY `fk_trx_rkpd_ranwal_pelaksana_1` (`id_bidang`) USING BTREE,
  CONSTRAINT `trx_rkpd_ranwal_urusan_ibfk_1` FOREIGN KEY (`id_rkpd_ranwal`) REFERENCES `trx_rkpd_ranwal` (`id_rkpd_ranwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_rkpd_ranwal_urusan_ibfk_2` FOREIGN KEY (`id_bidang`) REFERENCES `ref_bidang` (`id_bidang`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_renstra
DROP TABLE IF EXISTS `trx_rkpd_renstra`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_renstra` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_rkpd_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rpjmd` int(11) NOT NULL,
  `id_program_rpjmd` int(11) NOT NULL,
  `pagu_tahun_rpjmd` decimal(20,2) DEFAULT '0.00',
  `id_unit` int(11) NOT NULL,
  `id_visi_renstra` int(11) NOT NULL,
  `uraian_visi_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_misi_renstra` int(11) NOT NULL,
  `uraian_misi_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tujuan_renstra` int(11) NOT NULL,
  `uraian_tujuan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sasaran_renstra` int(11) NOT NULL,
  `uraian_sasaran_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_renstra` int(11) NOT NULL,
  `uraian_program_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_program` decimal(20,2) DEFAULT '0.00',
  `id_kegiatan_renstra` int(11) NOT NULL,
  `uraian_kegiatan_renstra` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun_kegiatan` decimal(20,2) DEFAULT '0.00',
  `sumber_data` int(11) NOT NULL DEFAULT '0' COMMENT '0 = renstra 1 = insidentil',
  PRIMARY KEY (`id_rkpd_renstra`) USING BTREE,
  KEY `idx_trx_rkpd_renstra` (`id_rkpd_rpjmd`,`tahun_rkpd`,`id_rkpd_renstra`,`id_program_rpjmd`,`id_unit`) USING BTREE,
  CONSTRAINT `fk_trx_rkpd_renstra` FOREIGN KEY (`id_rkpd_rpjmd`) REFERENCES `trx_rkpd_rpjmd_ranwal` (`id_rkpd_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_renstra_indikator
DROP TABLE IF EXISTS `trx_rkpd_renstra_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_renstra_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_rkpd_renstra` int(11) NOT NULL,
  `id_indikator_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `kd_indikator` int(11) DEFAULT NULL,
  `uraian_indikator_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolokukur_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_output` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_indikator_renstra`) USING BTREE,
  KEY `fk_trx_rkpd_renstra_pelaksana` (`id_rkpd_renstra`) USING BTREE,
  KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_renstra`,`kd_indikator`) USING BTREE,
  CONSTRAINT `trx_rkpd_renstra_indikator_ibfk_1` FOREIGN KEY (`id_rkpd_renstra`) REFERENCES `trx_rkpd_renstra` (`id_rkpd_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_renstra_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_renstra_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_renstra_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_rkpd_renstra` int(11) NOT NULL,
  `id_pelaksana_renstra` int(11) NOT NULL AUTO_INCREMENT,
  `id_sub_unit` int(11) NOT NULL,
  `pagu_tahun` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_pelaksana_renstra`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_renstra`,`id_sub_unit`) USING BTREE,
  KEY `fk_trx_rkpd_renstra_pelaksana` (`id_rkpd_renstra`) USING BTREE,
  CONSTRAINT `fk_trx_rkpd_renstra_pelaksana` FOREIGN KEY (`id_rkpd_renstra`) REFERENCES `trx_rkpd_renstra` (`id_rkpd_renstra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rpjmd_kebijakan
DROP TABLE IF EXISTS `trx_rkpd_rpjmd_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rpjmd_kebijakan` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_rkpd_rpjmd` int(11) NOT NULL,
  `id_kebijakan_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `uraian_kebijakan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_kebijakan_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rpjmd`) USING BTREE,
  KEY `fk_trx_rkpd_rpjmd_kebijakan` (`id_rkpd_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rkpd_rpjmd_kebijakan` FOREIGN KEY (`id_rkpd_rpjmd`) REFERENCES `trx_rkpd_rpjmd_ranwal` (`id_rkpd_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rpjmd_program_indikator
DROP TABLE IF EXISTS `trx_rkpd_rpjmd_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rpjmd_program_indikator` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_rkpd_rpjmd` int(11) NOT NULL,
  `id_indikator_program_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `uraian_indikator_program_rpjmd` text CHARACTER SET latin1,
  `tolok_ukur_indikator` text CHARACTER SET latin1,
  `angka_tahun` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_indikator_program_rpjmd`) USING BTREE,
  KEY `fk_rkpd_rpjmd_indikator` (`id_rkpd_rpjmd`) USING BTREE,
  KEY `idx_trx_rkpd_rpjmd_program_indikator` (`tahun_rkpd`,`id_rkpd_rpjmd`,`kd_indikator`) USING BTREE,
  CONSTRAINT `fk_rkpd_rpjmd_indikator` FOREIGN KEY (`id_rkpd_rpjmd`) REFERENCES `trx_rkpd_rpjmd_ranwal` (`id_rkpd_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rpjmd_program_pelaksana
DROP TABLE IF EXISTS `trx_rkpd_rpjmd_program_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rpjmd_program_pelaksana` (
  `tahun_rkpd` int(11) NOT NULL,
  `id_pelaksana_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_rkpd_rpjmd` int(11) NOT NULL,
  `id_urbid_rpjmd` int(11) NOT NULL,
  `id_bidang` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `pagu_tahun` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id_pelaksana_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rkpd_rpjmd_program_pelaksana` (`tahun_rkpd`,`id_rkpd_rpjmd`,`id_urbid_rpjmd`,`id_unit`) USING BTREE,
  KEY `fk_rkpd_rpjmd_pelaksana` (`id_rkpd_rpjmd`) USING BTREE,
  CONSTRAINT `fk_rkpd_rpjmd_pelaksana` FOREIGN KEY (`id_rkpd_rpjmd`) REFERENCES `trx_rkpd_rpjmd_ranwal` (`id_rkpd_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rkpd_rpjmd_ranwal
DROP TABLE IF EXISTS `trx_rkpd_rpjmd_ranwal`;
CREATE TABLE IF NOT EXISTS `trx_rkpd_rpjmd_ranwal` (
  `id_rkpd_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `tahun_rkpd` int(11) NOT NULL,
  `thn_id_rpjmd` int(11) NOT NULL,
  `id_visi_rpjmd` int(11) NOT NULL,
  `uraian_visi_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_misi_rpjmd` int(11) NOT NULL,
  `uraian_misi_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tujuan_rpjmd` int(11) NOT NULL,
  `uraian_tujuan_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL,
  `uraian_sasaran_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_program_rpjmd` int(11) NOT NULL,
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_program_rpjmd` decimal(20,2) DEFAULT '0.00',
  `status_data` int(11) NOT NULL COMMENT '0 = data tepat waktu sesuai renstra/rpjmd\\r\\n1 = data pergeseran waktu renstra/rpjmd\\r\\n2 = data baru yang belum ada di renstra/rpjmd',
  PRIMARY KEY (`id_rkpd_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_rkpd_rpjmd_ranwal` (`id_rkpd_rpjmd`,`tahun_rkpd`,`thn_id_rpjmd`,`id_visi_rpjmd`,`id_misi_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_program_rpjmd`) USING BTREE,
  KEY `FK_trx_rkpd_rpjmd_ranwal_trx_rpjmd_visi` (`id_visi_rpjmd`) USING BTREE,
  CONSTRAINT `FK_trx_rkpd_rpjmd_ranwal_trx_rpjmd_visi` FOREIGN KEY (`id_visi_rpjmd`) REFERENCES `trx_rpjmd_visi` (`id_visi_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_analisa_ikk
DROP TABLE IF EXISTS `trx_rpjmd_analisa_ikk`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_analisa_ikk` (
  `id_capaian_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemda` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `capaian_min1` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `capaian_min2` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `capaian_min3` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `capaian_min4` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `capaian_min5` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `capaian_standard` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `interpretasi` int(11) NOT NULL DEFAULT '0' COMMENT '0 = belum tercapai, 1= sesuai, 2= melampaui',
  `keterangan_capaian` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_capaian_rpjmd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_dokumen
DROP TABLE IF EXISTS `trx_rpjmd_dokumen`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_dokumen` (
  `id_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'berisi id khusus untuk setiap visi pada periode yang sama',
  `id_pemda` int(11) NOT NULL DEFAULT '1',
  `id_rpjmd_old` int(11) NOT NULL DEFAULT '1',
  `id_rpjmd_ref` int(11) NOT NULL DEFAULT '-1',
  `thn_dasar` int(11) NOT NULL,
  `tahun_1` int(11) NOT NULL,
  `tahun_2` int(11) NOT NULL,
  `tahun_3` int(11) NOT NULL,
  `tahun_4` int(11) NOT NULL,
  `tahun_5` int(11) NOT NULL,
  `no_perda` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_perda` date DEFAULT NULL,
  `keterangan_dokumen` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jns_dokumen` int(11) NOT NULL DEFAULT '5',
  `id_revisi` int(11) NOT NULL DEFAULT '0',
  `id_status_dokumen` int(11) NOT NULL DEFAULT '1' COMMENT '0 = draft , 1 = aktif  2 = direvisi',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_rpjmd`) USING BTREE,
  KEY `id_rpjmd_old` (`id_rpjmd_old`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_identifikasi_masalah
DROP TABLE IF EXISTS `trx_rpjmd_identifikasi_masalah`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_identifikasi_masalah` (
  `id_masalah` bigint(255) NOT NULL AUTO_INCREMENT,
  `id_pemda` int(11) DEFAULT NULL,
  `id_indikator` bigint(255) NOT NULL,
  `interpretasi` int(11) NOT NULL COMMENT '0 = belum tercapai, 1= sesuai, 2= melampaui',
  `angka_target` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `angka_capaian` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `uraian_masalah` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_keberhasilan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_masalah`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_kebijakan
DROP TABLE IF EXISTS `trx_rpjmd_kebijakan`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_kebijakan` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL,
  `id_sasaran_old` int(11) NOT NULL DEFAULT '0',
  `id_kebijakan_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_kebijakan_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `uraian_kebijakan_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_kebijakan` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_kebijakan_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_kebijakan` (`thn_id`,`id_sasaran_rpjmd`,`id_kebijakan_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_kebijakan` (`id_sasaran_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_kebijakan` FOREIGN KEY (`id_sasaran_rpjmd`) REFERENCES `trx_rpjmd_sasaran` (`id_sasaran_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_misi
DROP TABLE IF EXISTS `trx_rpjmd_misi`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_misi` (
  `thn_id_rpjmd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_visi_rpjmd` int(11) NOT NULL,
  `id_visi_old` int(11) NOT NULL DEFAULT '0',
  `id_misi_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_misi_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `uraian_misi_rpjmd` varchar(550) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_misi_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_ta_misi_rpjmd` (`thn_id_rpjmd`,`id_visi_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_misi` (`id_visi_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_misi` FOREIGN KEY (`id_visi_rpjmd`) REFERENCES `trx_rpjmd_visi` (`id_visi_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_prioritas
DROP TABLE IF EXISTS `trx_rpjmd_prioritas`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_prioritas` (
  `id_masalah` int(11) NOT NULL AUTO_INCREMENT,
  `id_pemda` int(11) NOT NULL DEFAULT '1',
  `uraian_masalah` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faktor_keberhasilan` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkatan_masalah` int(11) NOT NULL DEFAULT '4' COMMENT '1=Internasional, 2=Nasional, 3=Provinsi, 4=Kab/Kota',
  `skor_prioritas` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `urutan_prioritas` int(11) NOT NULL DEFAULT '1',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_masalah`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_program
DROP TABLE IF EXISTS `trx_rpjmd_program`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_program` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL,
  `id_sasaran_old` int(11) NOT NULL DEFAULT '0',
  `id_program_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) DEFAULT NULL,
  `jns_program` int(11) NOT NULL DEFAULT '0',
  `uraian_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pagu_tahun1` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun2` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun3` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun4` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun5` decimal(20,2) DEFAULT '0.00',
  `total_pagu` decimal(20,2) DEFAULT '0.00',
  `status_program` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_program_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_program` (`thn_id`,`id_sasaran_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_program` (`id_sasaran_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_program` FOREIGN KEY (`id_sasaran_rpjmd`) REFERENCES `trx_rpjmd_sasaran` (`id_sasaran_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_program_indikator
DROP TABLE IF EXISTS `trx_rpjmd_program_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_program_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_program_rpjmd` int(11) NOT NULL,
  `id_program_old` int(11) NOT NULL DEFAULT '0',
  `id_indikator_program_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rpjmd_old` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `id_indikator_old` int(11) NOT NULL,
  `id_indikator_sasaran_rpjmd` int(11) NOT NULL DEFAULT '0',
  `id_indikator_sasaran_old` int(11) NOT NULL DEFAULT '0',
  `uraian_indikator_program_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_indikator` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_program_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_program_indikator` (`thn_id`,`id_program_rpjmd`,`id_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_program_indikator` (`id_program_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_program_indikator` FOREIGN KEY (`id_program_rpjmd`) REFERENCES `trx_rpjmd_program` (`id_program_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_program_pelaksana
DROP TABLE IF EXISTS `trx_rpjmd_program_pelaksana`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_program_pelaksana` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_urbid_rpjmd` int(11) NOT NULL,
  `id_urbid_old` int(11) NOT NULL DEFAULT '0',
  `id_pelaksana_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelaksana_old` int(11) NOT NULL DEFAULT '0',
  `id_unit` int(11) NOT NULL,
  `id_unit_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `pagu_tahun1` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun2` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun3` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun4` decimal(20,2) DEFAULT '0.00',
  `pagu_tahun5` decimal(20,2) DEFAULT '0.00',
  `status_pelaksana` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pelaksana_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_program_pelaksana` (`thn_id`,`id_urbid_rpjmd`,`id_unit`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_program_pelaksana` (`id_urbid_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_program_pelaksana` FOREIGN KEY (`id_urbid_rpjmd`) REFERENCES `trx_rpjmd_program_urusan` (`id_urbid_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_program_urusan
DROP TABLE IF EXISTS `trx_rpjmd_program_urusan`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_program_urusan` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_urbid_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_urbid_old` int(11) NOT NULL DEFAULT '0',
  `id_program_rpjmd` int(11) NOT NULL,
  `id_program_old` int(11) NOT NULL DEFAULT '0',
  `id_bidang` int(11) NOT NULL,
  `id_bidang_old` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_urbid_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_program_pelaksana` (`thn_id`,`id_program_rpjmd`,`id_bidang`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_program_urusan` (`id_program_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_program_urusan` FOREIGN KEY (`id_program_rpjmd`) REFERENCES `trx_rpjmd_program` (`id_program_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_sasaran
DROP TABLE IF EXISTS `trx_rpjmd_sasaran`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_sasaran` (
  `thn_id_rpjmd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_tujuan_rpjmd` int(11) NOT NULL,
  `id_tujuan_old` int(11) NOT NULL DEFAULT '0',
  `id_sasaran_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_sasaran_old` int(11) NOT NULL,
  `id_perubahan` int(11) NOT NULL,
  `uraian_sasaran_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_sasaran` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sasaran_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_sasaran` (`thn_id_rpjmd`,`id_tujuan_rpjmd`,`id_sasaran_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_sasaran` (`id_tujuan_rpjmd`) USING BTREE,
  CONSTRAINT `FK_trx_rpjmd_sasaran_trx_rpjmd_tujuan` FOREIGN KEY (`id_tujuan_rpjmd`) REFERENCES `trx_rpjmd_tujuan` (`id_tujuan_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_sasaran_indikator
DROP TABLE IF EXISTS `trx_rpjmd_sasaran_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_sasaran_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL,
  `id_sasaran_old` int(11) NOT NULL DEFAULT '0',
  `id_indikator_sasaran_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rpjmd_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `kd_indikator_old` int(11) NOT NULL DEFAULT '0',
  `uraian_indikator_sasaran_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_indikator` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_sasaran_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_sasaran_indikator` (`thn_id`,`id_sasaran_rpjmd`,`id_indikator_sasaran_rpjmd`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_sasaran_indikator` (`id_sasaran_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_sasaran_indikator` FOREIGN KEY (`id_sasaran_rpjmd`) REFERENCES `trx_rpjmd_sasaran` (`id_sasaran_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_strategi
DROP TABLE IF EXISTS `trx_rpjmd_strategi`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_strategi` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_sasaran_rpjmd` int(11) NOT NULL,
  `id_sasaran_old` int(11) NOT NULL DEFAULT '0',
  `id_strategi_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_strategi_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `uraian_strategi_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_strategi` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_strategi_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_strategi` (`thn_id`,`id_sasaran_rpjmd`,`id_strategi_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_strategi` (`id_sasaran_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_strategi` FOREIGN KEY (`id_sasaran_rpjmd`) REFERENCES `trx_rpjmd_sasaran` (`id_sasaran_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_tujuan
DROP TABLE IF EXISTS `trx_rpjmd_tujuan`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_tujuan` (
  `thn_id_rpjmd` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_misi_rpjmd` int(11) NOT NULL,
  `id_misi_old` int(11) NOT NULL DEFAULT '0',
  `id_tujuan_rpjmd` int(11) NOT NULL AUTO_INCREMENT,
  `id_tujuan_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `uraian_tujuan_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_tujuan` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tujuan_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_tujuan` (`thn_id_rpjmd`,`id_misi_rpjmd`,`id_perubahan`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_tujuan` (`id_misi_rpjmd`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_tujuan` FOREIGN KEY (`id_misi_rpjmd`) REFERENCES `trx_rpjmd_misi` (`id_misi_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_tujuan_indikator
DROP TABLE IF EXISTS `trx_rpjmd_tujuan_indikator`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_tujuan_indikator` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_tujuan_rpjmd` int(11) NOT NULL,
  `id_tujuan_old` int(11) NOT NULL DEFAULT '0',
  `id_indikator_tujuan_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'nomor urut indikator sasaran',
  `id_indikator_rpjmd_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL,
  `kd_indikator` int(11) NOT NULL,
  `kd_indikator_old` int(11) NOT NULL DEFAULT '0',
  `uraian_indikator_sasaran_rpjmd` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tolok_ukur_indikator` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `angka_awal_periode` decimal(20,2) DEFAULT '0.00',
  `angka_tahun1` decimal(20,2) DEFAULT '0.00',
  `angka_tahun2` decimal(20,2) DEFAULT '0.00',
  `angka_tahun3` decimal(20,2) DEFAULT '0.00',
  `angka_tahun4` decimal(20,2) DEFAULT '0.00',
  `angka_tahun5` decimal(20,2) DEFAULT '0.00',
  `angka_akhir_periode` decimal(20,2) DEFAULT '0.00',
  `status_indikator` int(11) NOT NULL DEFAULT '0',
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_indikator_tujuan_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_tujuan_indikator` (`thn_id`,`id_tujuan_rpjmd`,`id_indikator_tujuan_rpjmd`,`id_perubahan`,`kd_indikator`,`no_urut`) USING BTREE,
  KEY `fk_trx_rpjmd_tujuan_indikator` (`id_tujuan_rpjmd`) USING BTREE,
  CONSTRAINT `trx_rpjmd_tujuan_indikator_ibfk_1` FOREIGN KEY (`id_tujuan_rpjmd`) REFERENCES `trx_rpjmd_tujuan` (`id_tujuan_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_rpjmd_visi
DROP TABLE IF EXISTS `trx_rpjmd_visi`;
CREATE TABLE IF NOT EXISTS `trx_rpjmd_visi` (
  `thn_id` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `id_rpjmd` int(11) NOT NULL,
  `id_visi_rpjmd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'berisi id khusus untuk setiap visi pada periode yang sama',
  `id_visi_old` int(11) NOT NULL DEFAULT '0',
  `id_perubahan` int(11) NOT NULL DEFAULT '0',
  `uraian_visi_rpjmd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_data` int(11) NOT NULL DEFAULT '0',
  `sumber_data` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_visi_rpjmd`) USING BTREE,
  UNIQUE KEY `idx_trx_rpjmd_visi` (`id_rpjmd`,`no_urut`,`thn_id`,`id_visi_rpjmd`,`id_perubahan`) USING BTREE,
  CONSTRAINT `fk_trx_rpjmd_visi` FOREIGN KEY (`id_rpjmd`) REFERENCES `trx_rpjmd_dokumen` (`id_rpjmd`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_usulan_kab
DROP TABLE IF EXISTS `trx_usulan_kab`;
CREATE TABLE IF NOT EXISTS `trx_usulan_kab` (
  `id_usulan_kab` int(11) NOT NULL AUTO_INCREMENT,
  `id_tahun` int(11) NOT NULL,
  `id_kab` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL DEFAULT '0',
  `sumber_usulan` int(11) NOT NULL DEFAULT '0',
  `judul_usulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_usulan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume` decimal(20,2) NOT NULL DEFAULT '0.00',
  `id_satuan` int(11) DEFAULT NULL,
  `pagu` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entry_by` int(255) NOT NULL,
  PRIMARY KEY (`id_usulan_kab`) USING BTREE,
  UNIQUE KEY `id_tahun` (`id_tahun`,`id_kab`,`id_unit`,`no_urut`) USING BTREE,
  KEY `id_kab` (`id_kab`) USING BTREE,
  KEY `id_unit` (`id_unit`) USING BTREE,
  CONSTRAINT `trx_usulan_kab_ibfk_1` FOREIGN KEY (`id_kab`) REFERENCES `ref_kabupaten` (`id_kab`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_usulan_kab_ibfk_2` FOREIGN KEY (`id_unit`) REFERENCES `ref_unit` (`id_unit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_usulan_kab_lokasi
DROP TABLE IF EXISTS `trx_usulan_kab_lokasi`;
CREATE TABLE IF NOT EXISTS `trx_usulan_kab_lokasi` (
  `id_usulan_kab` int(11) NOT NULL,
  `id_usulan_kab_lokasi` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL DEFAULT '1',
  `id_lokasi` int(11) NOT NULL,
  `volume` decimal(20,2) DEFAULT '0.00',
  `id_satuan` int(11) DEFAULT NULL,
  `uraian_lokasi` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usulan_kab_lokasi`) USING BTREE,
  UNIQUE KEY `id_usulan_kab` (`id_usulan_kab`,`no_urut`,`id_lokasi`) USING BTREE,
  KEY `id_lokasi` (`id_lokasi`) USING BTREE,
  CONSTRAINT `trx_usulan_kab_lokasi_ibfk_1` FOREIGN KEY (`id_usulan_kab`) REFERENCES `trx_usulan_kab` (`id_usulan_kab`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_usulan_kab_lokasi_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `ref_lokasi` (`id_lokasi`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.trx_usulan_rw
DROP TABLE IF EXISTS `trx_usulan_rw`;
CREATE TABLE IF NOT EXISTS `trx_usulan_rw` (
  `id_usulan_rw` bigint(20) NOT NULL AUTO_INCREMENT,
  `no_urut` int(11) NOT NULL,
  `id_desa` int(11) NOT NULL,
  `id_rw` int(11) NOT NULL,
  `id_renja` bigint(20) NOT NULL,
  `id_asb_aktivitas` bigint(20) NOT NULL,
  `uraian_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_aktivitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pagu_aktivitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_aktivitas` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_usulan` int(11) NOT NULL COMMENT '0 = draft 1 = musrendes 2 = setuju musrendes',
  PRIMARY KEY (`id_usulan_rw`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `id_unit` int(11) DEFAULT NULL COMMENT 'Diisi dengan kode unit asal operator',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_user` int(11) NOT NULL DEFAULT '1' COMMENT '0 non aktif 1 aktif',
  `status_waktu` int(11) NOT NULL DEFAULT '0' COMMENT '0 unlimited 1 limited',
  `tgl_mulai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_akhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.user_app
DROP TABLE IF EXISTS `user_app`;
CREATE TABLE IF NOT EXISTS `user_app` (
  `id_app_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `app_id` int(11) NOT NULL COMMENT '0',
  `status_app` int(11) NOT NULL COMMENT '1',
  `status_waktu` int(11) NOT NULL DEFAULT '0',
  `tgl_mulai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_akhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_app_user`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`group_id`,`app_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  CONSTRAINT `user_app_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_app_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `ref_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.user_desa
DROP TABLE IF EXISTS `user_desa`;
CREATE TABLE IF NOT EXISTS `user_desa` (
  `id_user_wil` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `kd_kecamatan` int(11) NOT NULL COMMENT 'prov',
  `kd_desa` int(11) NOT NULL COMMENT 'kab/kota',
  `rw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_wil` int(11) NOT NULL DEFAULT '0',
  `status_waktu` int(11) NOT NULL DEFAULT '0',
  `tgl_mulai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_akhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_wil`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`kd_kecamatan`,`kd_desa`) USING BTREE,
  CONSTRAINT `user_desa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.user_level_sakip
DROP TABLE IF EXISTS `user_level_sakip`;
CREATE TABLE IF NOT EXISTS `user_level_sakip` (
  `id_user_level` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `id_sotk_level_1` int(11) NOT NULL,
  `id_sotk_level_2` int(11) DEFAULT NULL,
  `id_sotk_level_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user_level`) USING BTREE,
  UNIQUE KEY `kd_unit` (`user_id`,`id_sotk_level_1`,`id_sotk_level_2`,`id_sotk_level_3`) USING BTREE,
  CONSTRAINT `user_level_sakip_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table dbsimcan_simulasi_merah.user_sub_unit
DROP TABLE IF EXISTS `user_sub_unit`;
CREATE TABLE IF NOT EXISTS `user_sub_unit` (
  `id_user_unit` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `kd_unit` int(11) NOT NULL,
  `kd_sub` int(11) DEFAULT NULL,
  `status_unit` int(11) NOT NULL DEFAULT '0',
  `status_waktu` int(11) NOT NULL DEFAULT '0',
  `tgl_mulai` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_akhir` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_unit`) USING BTREE,
  UNIQUE KEY `kd_unit` (`user_id`,`kd_unit`,`kd_sub`) USING BTREE,
  CONSTRAINT `user_sub_unit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for procedure dbsimcan_simulasi_merah.setAutoIncrement
DROP PROCEDURE IF EXISTS `setAutoIncrement`;
DELIMITER //
CREATE PROCEDURE `setAutoIncrement`()
BEGIN
DECLARE done int default false;
    DECLARE table_name CHAR(255);
DECLARE cur1 cursor for SELECT t.table_name FROM INFORMATION_SCHEMA.TABLES t 
        WHERE t.table_schema = "dbsimcan_master";

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    open cur1;

    myloop: loop
        fetch cur1 into table_name;
        if done then
            leave myloop;
        end if;
        set @sql = CONCAT('ALTER TABLE ',table_name, ' AUTO_INCREMENT = 1');
        prepare stmt from @sql;
        execute stmt;
        drop prepare stmt;
    end loop;

    close cur1;
END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.GantiEnter
DROP FUNCTION IF EXISTS `GantiEnter`;
DELIMITER //
CREATE FUNCTION `GantiEnter`(`uraian` VARCHAR (1000)) RETURNS varchar(1000) CHARSET latin1
    COMMENT 'Mengganti Character NL, NF, HT, VT, Aphostrope dan Merapikan Space -- Update 31-12-2019'
BEGIN
    DECLARE xUraian VARCHAR (1000);
	SET xUraian = TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(uraian, CHAR(9), ''), CHAR(10), ''),CHAR(11),''),CHAR(12),''),CHAR(13),''));
	WHILE INSTR(xUraian,'  ')>0 DO
		SET xUraian = REPLACE(xUraian,'  ',' '); 
	END WHILE;
	IF INSTR( xUraian , "'" )  THEN
		SET xUraian = REPLACE(xUraian,"'" , "''") ;
	END IF ;
	  RETURN (xUraian);
END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.HTML_UnEncode
DROP FUNCTION IF EXISTS `HTML_UnEncode`;
DELIMITER //
CREATE FUNCTION `HTML_UnEncode`(X VARCHAR(1000)) RETURNS varchar(1000) CHARSET latin1
    DETERMINISTIC
BEGIN 

    DECLARE TextString VARCHAR(1000) ; 
    SET TextString = X ; 

    #quotation mark 
    IF INSTR( X , '&quot;' ) 
    THEN SET TextString = REPLACE(TextString, '&quot;',') ; 
    END IF ; 

    #apostrophe  
    IF INSTR( X , &apos; ) 
    THEN SET TextString = REPLACE(TextString, &apos;,') ; 
    END IF ; 

    #ampersand 
    IF INSTR( X , '&amp;' ) 
    THEN SET TextString = REPLACE(TextString, '&amp;','&') ; 
    END IF ; 

    #less-than 
    IF INSTR( X , '&lt;' ) 
    THEN SET TextString = REPLACE(TextString, '&lt;','<') ; 
    END IF ; 

    #greater-than 
    IF INSTR( X , '&gt;' ) 
    THEN SET TextString = REPLACE(TextString, '&gt;','>') ; 
    END IF ; 

    #non-breaking space 
    IF INSTR( X , '&nbsp;' ) 
    THEN SET TextString = REPLACE(TextString, '&nbsp;',' ') ; 
    END IF ; 

    #inverted exclamation mark 
    IF INSTR( X , '&iexcl;' ) 
    THEN SET TextString = REPLACE(TextString, '&iexcl;','¡') ; 
    END IF ; 

    #cent 
    IF INSTR( X , '&cent;' ) 
    THEN SET TextString = REPLACE(TextString, '&cent;','¢') ; 
    END IF ; 

    #pound 
    IF INSTR( X , '&pound;' ) 
    THEN SET TextString = REPLACE(TextString, '&pound;','£') ; 
    END IF ; 

    #currency 
    IF INSTR( X , '&curren;' ) 
    THEN SET TextString = REPLACE(TextString, '&curren;','¤') ; 
    END IF ; 

    #yen 
    IF INSTR( X , '&yen;' ) 
    THEN SET TextString = REPLACE(TextString, '&yen;','¥') ; 
    END IF ; 

    #broken vertical bar 
    IF INSTR( X , '&brvbar;' ) 
    THEN SET TextString = REPLACE(TextString, '&brvbar;','¦') ; 
    END IF ; 

    #section 
    IF INSTR( X , '&sect;' ) 
    THEN SET TextString = REPLACE(TextString, '&sect;','§') ; 
    END IF ; 

    #spacing diaeresis 
    IF INSTR( X , '&uml;' ) 
    THEN SET TextString = REPLACE(TextString, '&uml;','¨') ; 
    END IF ; 

    #copyright 
    IF INSTR( X , '&copy;' ) 
    THEN SET TextString = REPLACE(TextString, '&copy;','©') ; 
    END IF ; 

    #feminine ordinal indicator 
    IF INSTR( X , '&ordf;' ) 
    THEN SET TextString = REPLACE(TextString, '&ordf;','ª') ; 
    END IF ; 

    #angle quotation mark (left) 
    IF INSTR( X , '&laquo;' ) 
    THEN SET TextString = REPLACE(TextString, '&laquo;','«') ; 
    END IF ; 

    #negation 
    IF INSTR( X , '&not;' ) 
    THEN SET TextString = REPLACE(TextString, '&not;','¬') ; 
    END IF ; 

    #soft hyphen 
    IF INSTR( X , '&shy;' ) 
    THEN SET TextString = REPLACE(TextString, '&shy;','­') ; 
    END IF ; 

    #registered trademark 
    IF INSTR( X , '&reg;' ) 
    THEN SET TextString = REPLACE(TextString, '&reg;','®') ; 
    END IF ; 

    #spacing macron 
    IF INSTR( X , '&macr;' ) 
    THEN SET TextString = REPLACE(TextString, '&macr;','¯') ; 
    END IF ; 

    #degree 
    IF INSTR( X , '&deg;' ) 
    THEN SET TextString = REPLACE(TextString, '&deg;','°') ; 
    END IF ; 

    #plus-or-minus  
    IF INSTR( X , '&plusmn;' ) 
    THEN SET TextString = REPLACE(TextString, '&plusmn;','±') ; 
    END IF ; 

    #superscript 2 
    IF INSTR( X , '&sup2;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup2;','²') ; 
    END IF ; 

    #superscript 3 
    IF INSTR( X , '&sup3;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup3;','³') ; 
    END IF ; 

    #spacing acute 
    IF INSTR( X , '&acute;' ) 
    THEN SET TextString = REPLACE(TextString, '&acute;','´') ; 
    END IF ; 

    #micro 
    IF INSTR( X , '&micro;' ) 
    THEN SET TextString = REPLACE(TextString, '&micro;','µ') ; 
    END IF ; 

    #paragraph 
    IF INSTR( X , '&para;' ) 
    THEN SET TextString = REPLACE(TextString, '&para;','¶') ; 
    END IF ; 

    #middle dot 
    IF INSTR( X , '&middot;' ) 
    THEN SET TextString = REPLACE(TextString, '&middot;','·') ; 
    END IF ; 

    #spacing cedilla 
    IF INSTR( X , '&cedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&cedil;','¸') ; 
    END IF ; 

    #superscript 1 
    IF INSTR( X , '&sup1;' ) 
    THEN SET TextString = REPLACE(TextString, '&sup1;','¹') ; 
    END IF ; 

    #masculine ordinal indicator 
    IF INSTR( X , '&ordm;' ) 
    THEN SET TextString = REPLACE(TextString, '&ordm;','º') ; 
    END IF ; 

    #angle quotation mark (right) 
    IF INSTR( X , '&raquo;' ) 
    THEN SET TextString = REPLACE(TextString, '&raquo;','»') ; 
    END IF ; 

    #fraction 1/4 
    IF INSTR( X , '&frac14;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac14;','¼') ; 
    END IF ; 

    #fraction 1/2 
    IF INSTR( X , '&frac12;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac12;','½') ; 
    END IF ; 

    #fraction 3/4 
    IF INSTR( X , '&frac34;' ) 
    THEN SET TextString = REPLACE(TextString, '&frac34;','¾') ; 
    END IF ; 

    #inverted question mark 
    IF INSTR( X , '&iquest;' ) 
    THEN SET TextString = REPLACE(TextString, '&iquest;','¿') ; 
    END IF ; 

    #multiplication 
    IF INSTR( X , '&times;' ) 
    THEN SET TextString = REPLACE(TextString, '&times;','×') ; 
    END IF ; 

    #division 
    IF INSTR( X , '&divide;' ) 
    THEN SET TextString = REPLACE(TextString, '&divide;','÷') ; 
    END IF ; 

    #capital a, grave accent 
    IF INSTR( X , '&Agrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Agrave;','À') ; 
    END IF ; 

    #capital a, acute accent 
    IF INSTR( X , '&Aacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Aacute;','Á') ; 
    END IF ; 

    #capital a, circumflex accent 
    IF INSTR( X , '&Acirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Acirc;','Â') ; 
    END IF ; 

    #capital a, tilde 
    IF INSTR( X , '&Atilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Atilde;','Ã') ; 
    END IF ; 

    #capital a, umlaut mark 
    IF INSTR( X , '&Auml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Auml;','Ä') ; 
    END IF ; 

    #capital a, ring 
    IF INSTR( X , '&Aring;' ) 
    THEN SET TextString = REPLACE(TextString, '&Aring;','Å') ; 
    END IF ; 

    #capital ae 
    IF INSTR( X , '&AElig;' ) 
    THEN SET TextString = REPLACE(TextString, '&AElig;','Æ') ; 
    END IF ; 

    #capital c, cedilla 
    IF INSTR( X , '&Ccedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ccedil;','Ç') ; 
    END IF ; 

    #capital e, grave accent 
    IF INSTR( X , '&Egrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Egrave;','È') ; 
    END IF ; 

    #capital e, acute accent 
    IF INSTR( X , '&Eacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Eacute;','É') ; 
    END IF ; 

    #capital e, circumflex accent 
    IF INSTR( X , '&Ecirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ecirc;','Ê') ; 
    END IF ; 

    #capital e, umlaut mark 
    IF INSTR( X , '&Euml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Euml;','Ë') ; 
    END IF ; 

    #capital i, grave accent 
    IF INSTR( X , '&Igrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Igrave;','Ì') ; 
    END IF ; 

    #capital i, acute accent 
    IF INSTR( X , '&Iacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Iacute;','Í') ; 
    END IF ; 

    #capital i, circumflex accent 
    IF INSTR( X , '&Icirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Icirc;','Î') ; 
    END IF ; 

    #capital i, umlaut mark 
    IF INSTR( X , '&Iuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Iuml;','Ï') ; 
    END IF ; 

    #capital eth, Icelandic 
    IF INSTR( X , '&ETH;' ) 
    THEN SET TextString = REPLACE(TextString, '&ETH;','Ð') ; 
    END IF ; 

    #capital n, tilde 
    IF INSTR( X , '&Ntilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ntilde;','Ñ') ; 
    END IF ; 

    #capital o, grave accent 
    IF INSTR( X , '&Ograve;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ograve;','Ò') ; 
    END IF ; 

    #capital o, acute accent 
    IF INSTR( X , '&Oacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Oacute;','Ó') ; 
    END IF ; 

    #capital o, circumflex accent 
    IF INSTR( X , '&Ocirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ocirc;','Ô') ; 
    END IF ; 

    #capital o, tilde 
    IF INSTR( X , '&Otilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&Otilde;','Õ') ; 
    END IF ; 

    #capital o, umlaut mark 
    IF INSTR( X , '&Ouml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ouml;','Ö') ; 
    END IF ; 

    #capital o, slash 
    IF INSTR( X , '&Oslash;' ) 
    THEN SET TextString = REPLACE(TextString, '&Oslash;','Ø') ; 
    END IF ; 

    #capital u, grave accent 
    IF INSTR( X , '&Ugrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ugrave;','Ù') ; 
    END IF ; 

    #capital u, acute accent 
    IF INSTR( X , '&Uacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Uacute;','Ú') ; 
    END IF ; 

    #capital u, circumflex accent 
    IF INSTR( X , '&Ucirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&Ucirc;','Û') ; 
    END IF ; 

    #capital u, umlaut mark 
    IF INSTR( X , '&Uuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&Uuml;','Ü') ; 
    END IF ; 

    #capital y, acute accent 
    IF INSTR( X , '&Yacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&Yacute;','Ý') ; 
    END IF ; 

    #capital THORN, Icelandic 
    IF INSTR( X , '&THORN;' ) 
    THEN SET TextString = REPLACE(TextString, '&THORN;','Þ') ; 
    END IF ; 

    #small sharp s, German 
    IF INSTR( X , '&szlig;' ) 
    THEN SET TextString = REPLACE(TextString, '&szlig;','ß') ; 
    END IF ; 

    #small a, grave accent 
    IF INSTR( X , '&agrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&agrave;','à') ; 
    END IF ; 

    #small a, acute accent 
    IF INSTR( X , '&aacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&aacute;','á') ; 
    END IF ; 

    #small a, circumflex accent 
    IF INSTR( X , '&acirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&acirc;','â') ; 
    END IF ; 

    #small a, tilde 
    IF INSTR( X , '&atilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&atilde;','ã') ; 
    END IF ; 

    #small a, umlaut mark 
    IF INSTR( X , '&auml;' ) 
    THEN SET TextString = REPLACE(TextString, '&auml;','ä') ; 
    END IF ; 

    #small a, ring 
    IF INSTR( X , '&aring;' ) 
    THEN SET TextString = REPLACE(TextString, '&aring;','å') ; 
    END IF ; 

    #small ae 
    IF INSTR( X , '&aelig;' ) 
    THEN SET TextString = REPLACE(TextString, '&aelig;','æ') ; 
    END IF ; 

    #small c, cedilla 
    IF INSTR( X , '&ccedil;' ) 
    THEN SET TextString = REPLACE(TextString, '&ccedil;','ç') ; 
    END IF ; 

    #small e, grave accent 
    IF INSTR( X , '&egrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&egrave;','è') ; 
    END IF ; 

    #small e, acute accent 
    IF INSTR( X , '&eacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&eacute;','é') ; 
    END IF ; 

    #small e, circumflex accent 
    IF INSTR( X , '&ecirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ecirc;','ê') ; 
    END IF ; 

    #small e, umlaut mark 
    IF INSTR( X , '&euml;' ) 
    THEN SET TextString = REPLACE(TextString, '&euml;','ë') ; 
    END IF ; 

    #small i, grave accent 
    IF INSTR( X , '&igrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&igrave;','ì') ; 
    END IF ; 

    #small i, acute accent 
    IF INSTR( X , '&iacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&iacute;','í') ; 
    END IF ; 

    #small i, circumflex accent 
    IF INSTR( X , '&icirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&icirc;','î') ; 
    END IF ; 

    #small i, umlaut mark 
    IF INSTR( X , '&iuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&iuml;','ï') ; 
    END IF ; 

    #small eth, Icelandic 
    IF INSTR( X , '&eth;' ) 
    THEN SET TextString = REPLACE(TextString, '&eth;','ð') ; 
    END IF ; 

    #small n, tilde 
    IF INSTR( X , '&ntilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&ntilde;','ñ') ; 
    END IF ; 

    #small o, grave accent 
    IF INSTR( X , '&ograve;' ) 
    THEN SET TextString = REPLACE(TextString, '&ograve;','ò') ; 
    END IF ; 

    #small o, acute accent 
    IF INSTR( X , '&oacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&oacute;','ó') ; 
    END IF ; 

    #small o, circumflex accent 
    IF INSTR( X , '&ocirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ocirc;','ô') ; 
    END IF ; 

    #small o, tilde 
    IF INSTR( X , '&otilde;' ) 
    THEN SET TextString = REPLACE(TextString, '&otilde;','õ') ; 
    END IF ; 

    #small o, umlaut mark 
    IF INSTR( X , '&ouml;' ) 
    THEN SET TextString = REPLACE(TextString, '&ouml;','ö') ; 
    END IF ; 

    #small o, slash 
    IF INSTR( X , '&oslash;' ) 
    THEN SET TextString = REPLACE(TextString, '&oslash;','ø') ; 
    END IF ; 

    #small u, grave accent 
    IF INSTR( X , '&ugrave;' ) 
    THEN SET TextString = REPLACE(TextString, '&ugrave;','ù') ; 
    END IF ; 

    #small u, acute accent 
    IF INSTR( X , '&uacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&uacute;','ú') ; 
    END IF ; 

    #small u, circumflex accent 
    IF INSTR( X , '&ucirc;' ) 
    THEN SET TextString = REPLACE(TextString, '&ucirc;','û') ; 
    END IF ; 

    #small u, umlaut mark 
    IF INSTR( X , '&uuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&uuml;','ü') ; 
    END IF ; 

    #small y, acute accent 
    IF INSTR( X , '&yacute;' ) 
    THEN SET TextString = REPLACE(TextString, '&yacute;','ý') ; 
    END IF ; 

    #small thorn, Icelandic 
    IF INSTR( X , '&thorn;' ) 
    THEN SET TextString = REPLACE(TextString, '&thorn;','þ') ; 
    END IF ; 

    #small y, umlaut mark 
    IF INSTR( X , '&yuml;' ) 
    THEN SET TextString = REPLACE(TextString, '&yuml;','ÿ') ; 
    END IF ; 

    RETURN TextString ; 

END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.PaguASB
DROP FUNCTION IF EXISTS `PaguASB`;
DELIMITER //
CREATE FUNCTION `PaguASB`(jns_biaya INT, hub_driver INT, vol1 DECIMAL(15, 4), vol2 DECIMAL(15, 4), r1 DECIMAL(15, 4), r2 DECIMAL(15, 4), m1 DECIMAL(15, 4), m2 DECIMAL(15, 4), k1 DECIMAL(15, 4), k2 DECIMAL(15, 4), k3 DECIMAL(15, 4), harga DECIMAL(15, 4)) RETURNS decimal(15,4)
    DETERMINISTIC
BEGIN
    DECLARE hargax DECIMAL(15,4);
    DECLARE kmax DECIMAL(15,4);
    DECLARE rx1 DECIMAL(15,4);
    DECLARE rx2 DECIMAL(15,4);
    DECLARE koef DECIMAL(15,4);
    
    SET koef = (k1*k2*k3);
    
    IF m1 = 1 THEN
      IF m2 = 1 THEN
        SET kmax = 1;
      ELSE
        IF m1 <= m2 THEN
              SET kmax = CEILING(vol1/m1);
            ELSE
              SET kmax = CEILING(vol2/m2);
            END IF;
      END IF;
    ELSE
      IF m1 <= m2 THEN
        SET kmax = CEILING(vol2/m2);
      ELSE
        SET kmax = CEILING(vol1/m1);
      END IF;
    END IF;

    IF r1 <= 1 THEN 
      SET rx1= CEILING(vol1/vol1); 
    ELSE 
      SET rx1= CEILING(vol1/r1); 
    END IF;
    
    IF r2 <= 1 THEN 
      SET rx2= CEILING(vol2/vol2); 
    ELSE 
      SET rx2= CEILING(vol2/r2); 
    END IF;

    IF jns_biaya =1 THEN 
      SET hargax = (koef*kmax*harga);
    ELSE      
      IF hub_driver=1 THEN 
        SET hargax = (vol1*koef*harga); 
      END IF;
      
      IF hub_driver=2 THEN 
        SET hargax = (vol2*koef*harga); 
      END IF;
      
      IF hub_driver=3 THEN 
        SET hargax = (vol1*vol2*koef*harga); 
      END IF;
      
      IF hub_driver=4 THEN 
        SET hargax = (koef*rx1*harga); 
      END IF;
      
      IF hub_driver=5 THEN 
        SET hargax = (koef*rx2*harga); 
      END IF;
      
      IF hub_driver=6 THEN 
        SET hargax = (koef*rx1*rx2*harga); 
      END IF;
      
      IF hub_driver=7 THEN 
        SET hargax = (vol2*koef*rx1*harga); 
      END IF;
      
      IF hub_driver=8 THEN 
        SET hargax = (vol1*koef*rx2*harga); 
      END IF;
      
    END IF;
 
 RETURN (hargax);
END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.PaguASBDistribusi
DROP FUNCTION IF EXISTS `PaguASBDistribusi`;
DELIMITER //
CREATE FUNCTION `PaguASBDistribusi`(jns_biaya INT,hub_driver INT,vol1 DECIMAL(15,4),vol2 DECIMAL(15,4),r1 DECIMAL(15,4),r2 DECIMAL(15,4),m1 DECIMAL(15,4) ,m2 DECIMAL(15,4), k1 DECIMAL(15,4),k2 DECIMAL(15,4),k3 DECIMAL(15,4),harga DECIMAL(15,4),persen DECIMAL(15,4)) RETURNS decimal(15,4)
    DETERMINISTIC
BEGIN
		DECLARE hargax DECIMAL(15,4);
		DECLARE kmax DECIMAL(15,4);
		DECLARE rx1 DECIMAL(15,4);
		DECLARE rx2 DECIMAL(15,4);
		DECLARE koef DECIMAL(15,4);
		DECLARE koef_dis DECIMAL(15,4);
		
		SET koef = (k1*k2*k3);
		
		IF persen <= 0 OR persen > 100 THEN 
			SET koef_dis = 1;
		ELSE
			SET koef_dis = persen/100;
		END IF;
		
		IF m1 = 1 THEN
			IF m2 = 1 THEN
				SET kmax = 1;
			ELSE
				IF m1 <= m2 THEN
							SET kmax = CEILING(vol1/m1);
						ELSE
							SET kmax = CEILING(vol2/m2);
						END IF;
			END IF;
		ELSE
			IF m1 <= m2 THEN
				SET kmax = CEILING(vol1/m1);
			ELSE
				SET kmax = CEILING(vol2/m2);
			END IF;
		END IF;

    IF r1 <= 1 THEN 
			SET rx1= CEILING(vol1/vol1); 
		ELSE 
			SET rx1= CEILING(vol1/r1); 
		END IF;
		
		IF r2 <= 1 THEN 
			SET rx2= CEILING(vol2/vol2); 
		ELSE 
			SET rx2= CEILING(vol2/r2); 
		END IF;

		IF jns_biaya =1 THEN 
			SET hargax = (koef*kmax*harga*koef_dis); 
		END IF;
		
		IF jns_biaya =2 AND hub_driver=1 THEN 
			SET hargax = (vol1*koef*rx1*harga); 
		END IF;
		
		IF jns_biaya =2 AND hub_driver=2 THEN 
			SET hargax = (vol2*koef*rx2*harga); 
		END IF;
		
		IF jns_biaya =3 AND hub_driver=1 THEN 
			SET hargax = (vol1*koef*harga); 
		END IF;
		
		IF jns_biaya =3 AND hub_driver=2 THEN 
			SET hargax = (vol2*koef*harga); 
		END IF;
		
		IF jns_biaya =3 AND hub_driver=3 THEN 
			SET hargax = (vol1*vol2*koef*harga); 
		END IF;
 
 RETURN (hargax);
END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.TglIndonesia
DROP FUNCTION IF EXISTS `TglIndonesia`;
DELIMITER //
CREATE FUNCTION `TglIndonesia`(tanggal DATE) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci
    DETERMINISTIC
BEGIN
  DECLARE varTanggal varchar(255);

  SELECT CONCAT(
    DAY(tanggal),' ',
    CASE MONTH(tanggal) 
      WHEN 1 THEN 'Januari' 
      WHEN 2 THEN 'Februari' 
      WHEN 3 THEN 'Maret' 
      WHEN 4 THEN 'April' 
      WHEN 5 THEN 'Mei' 
      WHEN 6 THEN 'Juni' 
      WHEN 7 THEN 'Juli' 
      WHEN 8 THEN 'Agustus' 
      WHEN 9 THEN 'September'
      WHEN 10 THEN 'Oktober' 
      WHEN 11 THEN 'November' 
      WHEN 12 THEN 'Desember' 
    END,' ',
    YEAR(tanggal)
  ) INTO varTanggal;

  RETURN varTanggal;
END//
DELIMITER ;

-- Dumping structure for function dbsimcan_simulasi_merah.XML_Encode
DROP FUNCTION IF EXISTS `XML_Encode`;
DELIMITER //
CREATE FUNCTION `XML_Encode`(
	`X` VARCHAR(1000)
) RETURNS varchar(1000) CHARSET latin1
    DETERMINISTIC
BEGIN 

    DECLARE TextString VARCHAR(1000) ; 
    SET TextString = X ; 

    #quotation mark 
    IF INSTR( X , '"' ) 
    THEN SET TextString = REPLACE(TextString,'"' , '&quot;') ; 
    END IF ; 

    #apostrophe  
    IF INSTR( X , "'" ) 
    THEN SET TextString = REPLACE(TextString,"'" , '&apos;') ; 
    END IF ; 

    #ampersand 
    IF INSTR( X , '&' ) 
    THEN SET TextString = REPLACE(TextString, '&', '&amp;') ; 
    END IF ; 

    #less-than 
    IF INSTR( X , '<' ) 
    THEN SET TextString = REPLACE(TextString, '<', '&lt;') ; 
    END IF ; 

    #greater-than 
    IF INSTR( X , '>' ) 
    THEN SET TextString = REPLACE(TextString, '>', '&gt;') ; 
    END IF ; 
		
		#remove-horizontal-tab
    IF INSTR( X , CHAR(9)) 
    THEN SET TextString = REPLACE(TextString, CHAR(9), '') ;
    END IF ; 
		
		#remove-new-line
    IF INSTR( X , CHAR(10) ) 
    THEN SET TextString = REPLACE(TextString,CHAR(10) , '') ; 
    END IF ; 
		
		#remove-vertical-tab
		IF INSTR( X , CHAR(11)) 
    THEN SET TextString = REPLACE(TextString, CHAR(11), '') ; 
    END IF ; 
		
		#remove-new-page
    IF INSTR( X , CHAR(12)) 
    THEN SET TextString = REPLACE(TextString, CHAR(12), '') ;
    END IF ;  
		
		#remove-carriage-return
		IF INSTR( X , CHAR(13) ) 
    THEN SET TextString = REPLACE(TextString,CHAR(13) , '') ; 
    END IF ;
		
		RETURN TextString ; 

END//
DELIMITER ;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_agroup_menu
DROP TRIGGER IF EXISTS `trg_agroup_menu`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_agroup_menu` BEFORE INSERT ON `trx_group_menu` FOR EACH ROW IF new.group_id = 1 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'You are not allowed to insert it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_egroup_menu
DROP TRIGGER IF EXISTS `trg_egroup_menu`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_egroup_menu` BEFORE UPDATE ON `trx_group_menu` FOR EACH ROW IF old.group_id = 1 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to update it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_group_menu
DROP TRIGGER IF EXISTS `trg_group_menu`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_group_menu` BEFORE DELETE ON `trx_group_menu` FOR EACH ROW IF old.group_id = 1 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_ref_menu_c
DROP TRIGGER IF EXISTS `trg_ref_menu_c`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_ref_menu_c` BEFORE INSERT ON `ref_menu` FOR EACH ROW IF new.group_id = 0 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'You are not allowed to insert it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_ref_menu_d
DROP TRIGGER IF EXISTS `trg_ref_menu_d`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_ref_menu_d` BEFORE DELETE ON `ref_menu` FOR EACH ROW IF old.group_id = 1 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_ref_menu_u
DROP TRIGGER IF EXISTS `trg_ref_menu_u`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_ref_menu_u` BEFORE UPDATE ON `ref_menu` FOR EACH ROW IF old.group_id = 0 THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to update it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger dbsimcan_simulasi_merah.trg_user
DROP TRIGGER IF EXISTS `trg_user`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trg_user` BEFORE DELETE ON `users` FOR EACH ROW IF old.email = 'super@simcan.dev' THEN 
    SIGNAL SQLSTATE '45000' 
     SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END IF//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
