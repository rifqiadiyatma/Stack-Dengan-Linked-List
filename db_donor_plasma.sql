SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_alat
-- ----------------------------
DROP TABLE IF EXISTS `tb_alat`;
CREATE TABLE `tb_alat`  (
  `id_alat` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nama_alat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stok` int NULL DEFAULT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id_alat`) USING BTREE,
  INDEX `id_faskes`(`id_faskes` ASC) USING BTREE,
  CONSTRAINT `tb_alat_ibfk_1` FOREIGN KEY (`id_faskes`) REFERENCES `tb_faskes` (`id_faskes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_alat
-- ----------------------------
INSERT INTO `tb_alat` VALUES (00001, 'tabung gas', 100, 007);

-- ----------------------------
-- Table structure for tb_donor
-- ----------------------------
DROP TABLE IF EXISTS `tb_donor`;
CREATE TABLE `tb_donor`  (
  `id_donor` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `id_pendonor` int(4) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jumlah_kantong` int NOT NULL,
  `tgl_donor` date NOT NULL,
  `terpakai` int NOT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id_donor`) USING BTREE,
  INDEX `id_pendonor`(`id_pendonor` ASC) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE,
  CONSTRAINT `tb_donor_ibfk_3` FOREIGN KEY (`id_pendonor`) REFERENCES `tb_pendonor` (`id_pendonor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_donor
-- ----------------------------
INSERT INTO `tb_donor` VALUES (00004, 0001, 'admin', 2, '2021-08-10', 0, 000);
INSERT INTO `tb_donor` VALUES (00005, 0001, 'admin', 5, '2021-08-13', 0, 000);
INSERT INTO `tb_donor` VALUES (00006, 0003, 'admin', 2, '2021-08-04', 0, 000);
INSERT INTO `tb_donor` VALUES (00007, 0003, 'admin', 1, '2021-08-06', 0, 000);
INSERT INTO `tb_donor` VALUES (00008, 0004, 'admin', 2, '2021-08-01', 0, 000);
INSERT INTO `tb_donor` VALUES (00009, 0001, 'admin', 1, '2021-08-15', 0, 001);
INSERT INTO `tb_donor` VALUES (00011, 0001, 'admin', 2, '2021-09-03', 0, 002);

-- ----------------------------
-- Table structure for tb_faskes
-- ----------------------------
DROP TABLE IF EXISTS `tb_faskes`;
CREATE TABLE `tb_faskes`  (
  `id_faskes` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nama_faskes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_telp_faskes` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_kab` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `alamat_faskes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `jenis_faskes` enum('PMI','RS') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_faskes` enum('Swasta','Pemerintah') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `long` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kelas` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_faskes`) USING BTREE,
  INDEX `id_kab`(`id_kab` ASC) USING BTREE,
  CONSTRAINT `tb_faskes_ibfk_1` FOREIGN KEY (`id_kab`) REFERENCES `tb_kabupaten` (`id_kab`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_faskes
-- ----------------------------
INSERT INTO `tb_faskes` VALUES (001, 'UTD PMI Provinsi Lampung', '(0721) 703020', 01, 'Jl. Sam Ratulangi No. 105 Penengahan, Bandar Lampung', 'PMI', 'Pemerintah', NULL, NULL, NULL);
INSERT INTO `tb_faskes` VALUES (002, 'UTD PMI Kabupaten Lampung Utara', '(0724) 22095', 08, 'Jl. Sudirman No.2 Kotabumi, Lampung Utara', 'PMI', 'Pemerintah', NULL, NULL, NULL);
INSERT INTO `tb_faskes` VALUES (003, 'UTD PMI Kota Metro', '(0725) 47943', 02, 'Jl. A. Yani No. 13, Metro', 'PMI', 'Pemerintah', NULL, NULL, NULL);
INSERT INTO `tb_faskes` VALUES (004, 'UTD PMI Kabupaten Lampung Selatan	', '(0727) 322257', 05, 'Jl. Lettu Rohani No. 14 B, Kalianda', 'PMI', 'Pemerintah', NULL, NULL, NULL);
INSERT INTO `tb_faskes` VALUES (005, 'UTD PMI Kabupaten Lampung Tengah', '(0725) 529828', 07, 'Jl. Lintas Sumatera Panggungan Gunung Sugih, Komp. RSUD Demang Sepulau Raya Lampung Tengah', 'PMI', 'Pemerintah', NULL, NULL, NULL);
INSERT INTO `tb_faskes` VALUES (007, 'RS Umum Daerah Dr H Abdul Moeloek', '0721 - 703312', 01, 'Jl. Dr. Rivai 6,Penengahan B.Lampung', 'RS', 'Pemerintah', '105.25862583184', '-5.4030767832856', 'A');
INSERT INTO `tb_faskes` VALUES (008, 'RS Tk. IV 02.07.04', '82177052096', 01, 'Jl. Dr. A.Rivai No.7, Bandar Lampung', 'RS', 'Pemerintah', '105.259', '-5.4025', 'C');
INSERT INTO `tb_faskes` VALUES (009, 'RS Umum Daerah Dr. A. Dadi Tjokrodipo', '0721-471723', 01, 'Jl. Basuki Rachmad No.73 Teluk Betung Utara, Bandar Lampung', 'RS', 'Pemerintah', '105.25300216586', '-5.4202970589159', 'C');
INSERT INTO `tb_faskes` VALUES (010, 'RS Jiwa Bandar Lampung', '0721-271170', 01, 'Jl. Raya Gd.Tataan KM 13 Bandar Lampung', 'RS', 'Pemerintah', '105.1938078804', '-5.3752971057178', 'B');
INSERT INTO `tb_faskes` VALUES (011, 'RS Umum Imanuel Way Halim', '0721-704900', 01, 'Jl. Sukarno Hatta Way Halim,Bandar Lampung', 'RS', 'Swasta', '105.237', '-5.3633', 'B');
INSERT INTO `tb_faskes` VALUES (012, 'RS Umum Bumi Waras', '0721 2545', 01, 'Jl. W. Monginsidi No.235,Bandar Lampung', 'RS', 'Swasta', '105.255', '-5.4359', 'C');
INSERT INTO `tb_faskes` VALUES (013, 'RS Umum Advent Bandar Lampung', '721703459', 01, 'Jl. Teuku Umar 48,Bandar Lampung', 'RS', 'Swasta', '105.26214527959', '-5.3920409982612', 'C');
INSERT INTO `tb_faskes` VALUES (014, 'RS Umum Urip Sumoharjo', '771321', 01, 'Jl. Urip Sumoharjo No.200,Bandar Lampung', 'RS', 'Swasta', '105.277', '-5.3912', 'B');
INSERT INTO `tb_faskes` VALUES (015, 'RS Umum Graha Husada', '0721-240000', 01, 'Jl. Gajah Mada No.88,Bandar Lampung', 'RS', 'Swasta', '105.267', '-5.4146', 'C');
INSERT INTO `tb_faskes` VALUES (016, 'RS Umum Pertamina-Bintang Amin Lampung', '(0721) 273601', 01, 'Jl. Pramuka No.27,Bandar Lampung', 'RS', 'Swasta', '105.2196350595', '-5.3789092951653', 'C');
INSERT INTO `tb_faskes` VALUES (017, 'RS Bhayangkara Polda Lampung', '706402', 01, 'Jl. Pramuka No.88 Rajabasa Bandar Lampung', 'RS', 'Pemerintah', '105.224', '-5.374', 'C');
INSERT INTO `tb_faskes` VALUES (018, 'RS Hermina Lampung', '(0721)-242525', 01, 'Jl. Tulang Bawang No. 21 Kel. Enggal Kec. Enggal', 'RS', 'Swasta', '105.2608852', '-5.4176583', 'C');
INSERT INTO `tb_faskes` VALUES (019, 'RS Budi Medika', '(0721)6016888', 01, 'Jl. Yos Sudarso No. 85', 'RS', 'Swasta', '105.281654', '-5.442589', 'C');
INSERT INTO `tb_faskes` VALUES (020, 'RS Umum Mardi Waluyo', '0725-42512', 02, 'Jl. Jenderal Sudirman 156,Kota Metro, Lampung', 'RS', 'Swasta', '105.29648781211', '-5.1181220709225', 'C');
INSERT INTO `tb_faskes` VALUES (021, 'RS Umum Daerah Ahmad Yani Metro', '0725-48423', 02, 'Jl.Jend. A.Yani No.13 Kota Metro', 'RS', 'Swasta', '105.306', '-5.1139', 'B');
INSERT INTO `tb_faskes` VALUES (022, 'RS Umum Islam Metro', '0725-41883', 02, 'Jl. Jend.AH Nasution No.250,Metro', 'RS', 'Swasta', '105.323', '-5.1114', 'D');
INSERT INTO `tb_faskes` VALUES (023, 'RS Umum Muhammadiyah Metro', '0725 49490', 02, 'Jl. Soekarno Hatta No.42 Mulyojati 16B, Metro Barat', 'RS', 'Swasta', '105.297', '-5.1157', 'C');
INSERT INTO `tb_faskes` VALUES (024, 'RS Ibu dan Anak Anugerah Medical Center Metro', '0725-43209', 02, 'Jl. Kunang 15 Kauman, Metro', 'RS', 'Swasta', '105.31081466675', '-5.1185670262335', 'C');
INSERT INTO `tb_faskes` VALUES (025, 'RS Umum Daerah Alimuddin Umar', '08117959666', 03, 'Jl. Teuku Umar No. 3, Lampung Barat', 'RS', 'Pemerintah', '104035', '-5.3566', 'C');
INSERT INTO `tb_faskes` VALUES (026, 'RS Umum Daerah Dr. H. Bob Bazar, SKM', '0727-322160', 05, 'Jl. Lettu Rohani 14 B,Kalianda', 'RS', 'Pemerintah', '105.5964602', '-5.7275578', 'C');
INSERT INTO `tb_faskes` VALUES (027, 'RS Natar Medika', '0721 - 92521', 05, 'Jl. Raya Natar No.4 Muara Putih, Lampung Selatan', 'RS', 'Swasta', '105.196', '-5.3121', 'C');
INSERT INTO `tb_faskes` VALUES (028, 'RS Umum Daerah Bandar Negara Husada', '7215617667', 05, 'Kompleks Pemprov Lampung Kota Baru Jati Agung Kabupaten Lampung Selatan 35365', 'RS', 'Pemerintah', '105.40499250437', '-5.2979495641448', 'C');
INSERT INTO `tb_faskes` VALUES (029, 'RS Airan Raya', '7215617799', 05, 'Airan Raya No. 99 Way Huwi Jati Agung', 'RS', 'Swasta', '105.29789118966', '-5.3509896444965', 'C');
INSERT INTO `tb_faskes` VALUES (030, 'RS Umum Mitra Mulia Husada', '0725-528803', 07, 'Jl. Proklamator Raya No.162-164,Lampung Tengah', 'RS', 'Swasta', '105.216', '-4.9489', 'D');
INSERT INTO `tb_faskes` VALUES (031, 'RS Umum Yukum Medical Centre', '(0725) 25333', 07, 'Jl. Negara No.99 Km.67 Yukum Jaya Lampung Tengah', 'RS', 'Swasta', '105.21081856537', '-4.9057366495941', 'C');
INSERT INTO `tb_faskes` VALUES (032, 'RS Umum Islam Asy-Syifaa Bandar Jaya', '0725-25264', 07, 'Jl. Lintas Sumatera KM 65 Yukum Jaya Terbanggi Besar Bandar Jaya', 'RS', 'Swasta', '105.213', '-4.9243', 'C');
INSERT INTO `tb_faskes` VALUES (033, 'RS Umum Daerah Demang Sepulau Raya', '725529828', 07, 'Jl. Raya Lintas Sumatera Kampung Terbanggi Agung Kec.Gunung Sugih Kab.Lampung Tengah', 'RS', 'Pemerintah', '105.2089752', '-5.0128227', 'C');
INSERT INTO `tb_faskes` VALUES (034, 'RS Umum Harapan Bunda', '072526766', 07, 'Jl. Raya Lintas Sumatera, Seputih Jaya No.31, Kec. Gunung Sugih, Kab. Lampung Tengah', 'RS', 'Swasta', '105.21612672978', '-4.9583737397586', 'C');
INSERT INTO `tb_faskes` VALUES (035, 'RS Umum Kartini', '0729 370028', 07, 'Jl. KARTINI NO. 104 KALIREJO', 'RS', 'Swasta', '104.96501433897', '-5.2242850517686', 'D');
INSERT INTO `tb_faskes` VALUES (036, 'RS Ibu Anak Puri Adhya Paramita', '(0725) 529399', 07, 'Jl. SULTAN AGUNG NO. 5 BANDAR JAYA - TERBANGGI BESAR', 'RS', 'Swasta', '105.21195', '-4.937975', 'C');
INSERT INTO `tb_faskes` VALUES (037, 'RS Umum Az - Zahra', '0729 - 370089', 07, 'Jl. Kartini No. 109 Kalirejo , Kec. Kalirejo,', 'RS', 'Swasta', '104.963929', '-5.224942', 'C');
INSERT INTO `tb_faskes` VALUES (038, 'RS Ibu Anak Puti Bungsu', '0725-25065', 07, 'Jalan S. Parman No 02 Bandar Jaya Timur', 'RS', 'Swasta', '108.4919086', '-2.4185588', 'C');
INSERT INTO `tb_faskes` VALUES (039, 'RS Umum Daerah Sukadana', '(0725) 625022/6', 06, 'Jl. Letnan Adnan Sanjaya,Lintas Timur,Sukadana,Lamp.Timur', 'RS', 'Pemerintah', '105.5498187', '-5.0635733', 'C');
INSERT INTO `tb_faskes` VALUES (040, 'RS Umum Aka Medika Sribhawono', '0725 - 6620077', 06, 'Jl. Ir. Sutami Km.1 Sribhawono, Lampung Timur', 'RS', 'Swasta', '105.571', '-5.298', 'C');
INSERT INTO `tb_faskes` VALUES (041, 'RS Umum Daerah May Jen HM Ryacudu', '0724 22095', 08, 'Jl. Jend.Sudirman No.2 Kotabumi', 'RS', 'Pemerintah', '104.892', '-4.8355', 'C');
INSERT INTO `tb_faskes` VALUES (042, 'RS Umum Handayani', '0724-328399', 08, 'Jl. Soekarno - Hatta No.94,Kotabumi lampung Utara', 'RS', 'Swasta', '104.875', '-4.8402', 'C');
INSERT INTO `tb_faskes` VALUES (043, 'RS Medika Insani', '+6285279410025', 08, 'Jl. Sumber Jaya No. 667 Desa Tanjung Baru Kecamatan Bukit Kemuning Kabupaten Lampung Utara', 'RS', 'Swasta', '104.54650788513', '-4.8959395210959', 'D');
INSERT INTO `tb_faskes` VALUES (044, 'RS Umum Daerah Ragab Begawe Caram', '85267606261', 13, 'Jl. ZA. Pagar Alam Brabasan Kec. Tanjung Raya', 'RS', 'Pemerintah', '105.37728457656', '-4.0607328918842', 'C');
INSERT INTO `tb_faskes` VALUES (045, 'RS Umum Daerah Pesawaran', '07215621977', 11, 'Jln. Raya Kedondong, Sukamarga, Desa Gedong Tataan Kec. Gedong Tataan, kab. Pesawaran', 'RS', 'Pemerintah', '105.08065371719', '-5.3937378344791', 'C');
INSERT INTO `tb_faskes` VALUES (046, 'RS Umum Gladish Medical Center', '0721-5620168', 11, 'Jln.Ahmad Yani No.36 Taman Sari Kec.Gedong Tataan', 'RS', 'Swasta', '105.15142111984', '-5.3660725566388', 'D');
INSERT INTO `tb_faskes` VALUES (047, 'RS Umum Daerah KH. Muhammad Thohir KRUI', '082372298787', 15, 'Atar Sedangkek Pekon Way Suluh Kec. Krui Selatan Kab. Pesisir Barat', 'RS', 'Pemerintah', '103.97268681732', '-5.2151360070391', 'D');
INSERT INTO `tb_faskes` VALUES (048, 'RS Umum Mitra Husada', '0729-23792', 12, 'Jl. Jend.A.Yani No.14 Pringsewu,Kab.Pringsewu', 'RS', 'Swasta', '108.4919086', '-2.4185588', 'C');
INSERT INTO `tb_faskes` VALUES (049, 'RS Umum Daerah Pringsewu', '0729 - 23582', 12, 'Jl. Lintas Barat Pekon Fajar Agung Barat Kec. Pringsewu', 'RS', 'Pemerintah', '104.965', '-5.3542', 'C');
INSERT INTO `tb_faskes` VALUES (050, 'RS Umum Surya Asih', '0729 - 21162', 12, 'Jl. A. Yani No.51, Pringsewu', 'RS', 'Swasta', '105.31879867372', '-4.5250577300758', 'D');
INSERT INTO `tb_faskes` VALUES (051, 'RS Ibu dan Anak Harapan Bunda', '0729 23186', 12, 'Jl. KH. Dewantara No. 1269 Primgsewu - Lampung', 'RS', 'Swasta', '108.4919086', '-2.4185588', 'C');
INSERT INTO `tb_faskes` VALUES (052, 'RS Umum Wisma Rini Pringsewu', '0729-21096', 12, 'Jl. Wisma Rini No.1 Pringsewu', 'RS', 'Swasta', '104.97178939718', '-5.3551636975057', 'D');
INSERT INTO `tb_faskes` VALUES (053, 'RS Panti Secanti', '0729-347553', 04, 'Jl. Raya Gisting,Tanggamus', 'RS', 'Swasta', '104.703', '-5.4596', 'D');
INSERT INTO `tb_faskes` VALUES (054, 'RS Umum Daerah Batin Mangunang', '(0722)7220083', 04, 'Jl. Soekarno Hatta Komplek Islamic Centre Kotaagung,Kab.Tanggamus', 'RS', 'Pemerintah', '104.643', '-5.4886', 'C');
INSERT INTO `tb_faskes` VALUES (055, 'RS Umum Daerah Menggala Tulang Bawang', '(0726)21131', 10, 'Menggala,Kab.Tulang Bawang', 'RS', 'Pemerintah', '105.221', '-4.6102', 'B');
INSERT INTO `tb_faskes` VALUES (056, 'RS Umum Mutiara Bunda', '(0726) 750248', 10, 'Jl. Lintas Timur No. 1147 Unit II Kec. Bandar Agung', 'RS', 'Swasta', '108.4919086', '-2.4185588', 'D');
INSERT INTO `tb_faskes` VALUES (057, 'RS Umum Daerah Tulang Bawang Barat', '7257575438', 14, 'JL. DIPONEGORO PANARAGAN JAYA KEC. TULANG BAWANG TENGAH', 'RS', 'Pemerintah', '105.22896914687', '-4.7450056219186', 'D');
INSERT INTO `tb_faskes` VALUES (058, 'RS Umum Daerah Zainal Abidin Pagar Alam', '085218540697', 09, 'Jl. Raya Lintas Sumatera, Blambangan Umpu', 'RS', 'Pemerintah', '105.253', '-5.3794', 'C');
INSERT INTO `tb_faskes` VALUES (059, 'RS Umum Haji Kamino', '081272095786', 09, 'Jl. Sriwijaya No. 56 Kp. Setia Negara Kec. Baradatu Kab. Way Kanan', 'RS', 'Swasta', '104.54792941623', '-4.7295898447424', 'C');

-- ----------------------------
-- Table structure for tb_kabupaten
-- ----------------------------
DROP TABLE IF EXISTS `tb_kabupaten`;
CREATE TABLE `tb_kabupaten`  (
  `id_kab` int(2) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nama_kab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kab`) USING BTREE,
  INDEX `id_kab`(`id_kab` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_kabupaten
-- ----------------------------
INSERT INTO `tb_kabupaten` VALUES (01, 'Kota Bandar Lampung');
INSERT INTO `tb_kabupaten` VALUES (02, 'Kota Metro');
INSERT INTO `tb_kabupaten` VALUES (03, 'Kabupaten Lampung Barat');
INSERT INTO `tb_kabupaten` VALUES (04, 'Kabupaten Tanggamus');
INSERT INTO `tb_kabupaten` VALUES (05, 'Kabupaten Lampung Selatan');
INSERT INTO `tb_kabupaten` VALUES (06, 'Kabupaten Lampung Timur');
INSERT INTO `tb_kabupaten` VALUES (07, 'Kabupaten Lampung Tengah');
INSERT INTO `tb_kabupaten` VALUES (08, 'Kabupaten Lampung Utara');
INSERT INTO `tb_kabupaten` VALUES (09, 'Kabupaten Way Kanan');
INSERT INTO `tb_kabupaten` VALUES (10, 'Kabupaten Tulang Bawang');
INSERT INTO `tb_kabupaten` VALUES (11, 'Kabupaten Pesawaran');
INSERT INTO `tb_kabupaten` VALUES (12, 'Kabupaten Pringsewu');
INSERT INTO `tb_kabupaten` VALUES (13, 'Kabupaten Mesuji');
INSERT INTO `tb_kabupaten` VALUES (14, 'Kabupaten Tulang Bawang Barat');
INSERT INTO `tb_kabupaten` VALUES (15, 'Kabupaten Pesisir Barat');

-- ----------------------------
-- Table structure for tb_obat
-- ----------------------------
DROP TABLE IF EXISTS `tb_obat`;
CREATE TABLE `tb_obat`  (
  `id_obat` int(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nama_obat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stok` int NULL DEFAULT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id_obat`) USING BTREE,
  INDEX `id_faskes`(`id_faskes` ASC) USING BTREE,
  CONSTRAINT `tb_obat_ibfk_1` FOREIGN KEY (`id_faskes`) REFERENCES `tb_faskes` (`id_faskes`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_obat
-- ----------------------------
INSERT INTO `tb_obat` VALUES (00002, 'paracetamol', 100, 007);

-- ----------------------------
-- Table structure for tb_pasien
-- ----------------------------
DROP TABLE IF EXISTS `tb_pasien`;
CREATE TABLE `tb_pasien`  (
  `id_pasien` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nik_pasien` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_pasien` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `no_hp_pasien` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usia_pasien` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gol_darah_pasien` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `tgl_dapat_donor` date NULL DEFAULT NULL,
  `id_pendonor` int(4) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `jumlah_dapat_kantong` int NULL DEFAULT NULL,
  `alamat_pasien` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_kab` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id_pasien`) USING BTREE,
  INDEX `id_pendonor`(`id_pendonor` ASC) USING BTREE,
  CONSTRAINT `tb_pasien_ibfk_1` FOREIGN KEY (`id_pendonor`) REFERENCES `tb_pendonor` (`id_pendonor`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pasien
-- ----------------------------
INSERT INTO `tb_pasien` VALUES (002, '211212', 'xxxx', '3232323', '12', 'A+', 001, '2021-08-13', 0001, 3, 'sasas', 01);

-- ----------------------------
-- Table structure for tb_pendonor
-- ----------------------------
DROP TABLE IF EXISTS `tb_pendonor`;
CREATE TABLE `tb_pendonor`  (
  `id_pendonor` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nik` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `no_hp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_kab` int(2) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `alamat` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gol_darah` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tgl_terpapar` date NOT NULL,
  `tgl_sembuh` date NOT NULL,
  `status` enum('Verifikasi','Belum') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Belum',
  `eligible` enum('Ya','Tidak') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Ya',
  `usia` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `waktu_periksa_pmi` datetime NULL DEFAULT NULL,
  `skema_daftar` enum('Mandiri','PMI','RS') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NOT NULL,
  `verifikator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pendonor`) USING BTREE,
  INDEX `id_kab`(`id_kab` ASC) USING BTREE,
  CONSTRAINT `tb_pendonor_ibfk_1` FOREIGN KEY (`id_kab`) REFERENCES `tb_kabupaten` (`id_kab`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pendonor
-- ----------------------------
INSERT INTO `tb_pendonor` VALUES (0001, '1212', 'M. Ridho', 'ridhomagribi@gmail.com', '21212', 05, 'natar\r\n', 'A+', '2021-07-23', '2021-07-08', 'Verifikasi', 'Ya', '27', '2021-08-15 07:00:00', 'Mandiri', 001, 'pmilampung');
INSERT INTO `tb_pendonor` VALUES (0003, '12121', 'sastro', 'ridhomagribi@gmail.com', '21212', 01, 'ccccc', 'B+', '2021-07-23', '2021-07-08', 'Verifikasi', 'Ya', '23', '0000-00-00 00:00:00', 'Mandiri', 003, 'admin');
INSERT INTO `tb_pendonor` VALUES (0004, '121213', 'sas', 'ridhomagribi@gmail.com', '21212', 01, 'ccccc', 'B+', '2021-08-02', '2021-07-08', 'Verifikasi', 'Ya', '33', NULL, 'Mandiri', 001, NULL);
INSERT INTO `tb_pendonor` VALUES (0009, '1801040312930000', 'bejo man2', 'riddkdkd@mai.com', '21212', 01, 'saas', 'B+', '2021-08-17', '2021-09-10', 'Belum', 'Ya', '27', '2021-08-15 05:50:00', 'Mandiri', 001, NULL);
INSERT INTO `tb_pendonor` VALUES (0010, '123123123', 'syahrul', 'apa@ja.com', '090909', 01, 'zxxzxzx', 'B+', '2021-08-01', '2021-08-28', 'Verifikasi', 'Ya', '21', '2021-08-15 12:00:00', 'PMI', 001, 'admin');
INSERT INTO `tb_pendonor` VALUES (0011, '1871102907970333', 'Gandi Laksana Putra', 'gandi.putra@staff.itera.ac.id', '081367146826', 01, 'Rajabasa', 'B+', '2021-02-01', '2021-02-25', 'Belum', 'Ya', '24', '2021-08-04 12:00:00', 'Mandiri', 001, NULL);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id_user` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` enum('admin','PMI','RS') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nama_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_faskes` int(3) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (002, 'admin', '$2y$10$jKDfbnT3JVDVXHLdi6oZ0uHPE6L99lBwc4szB0267gE7OK3YcZClS', 'admin', 'aaa@itera.ac.id', 'Itera', 000);
INSERT INTO `tb_user` VALUES (004, 'pmilampung', '$2y$10$i8gnrdvWmpKRNhZFlIeinOHKQ98CBKZalodLDy0cYJgnMthDInTQS', 'PMI', 'xxx@gmail.com', 'PMI Lampung', 001);
INSERT INTO `tb_user` VALUES (005, 'abdulmuluk', '$2y$10$Ks1yrMOi9I2aqV0Q.eptLOgS2/JU0lBT9BJWxkWFC2lM2aa4q3JZW', 'RS', 'apa@ja.com', 'RS bdul muluk', 007);

SET FOREIGN_KEY_CHECKS = 1;
