-- CreateTable
CREATE TABLE `Pengguna` (
    `id_pengguna` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(60) NOT NULL,
    `nama` VARCHAR(40) NULL,
    `nik` VARCHAR(16) NULL,
    `alamat` VARCHAR(120) NULL,
    `hp` VARCHAR(20) NULL,
    `foto` VARCHAR(60) NULL,

    PRIMARY KEY (`id_pengguna`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kendaraan` (
    `id_kendaraan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengguna` INTEGER NOT NULL,
    `jenis` VARCHAR(1) NOT NULL,
    `nama` VARCHAR(40) NOT NULL,
    `merk` VARCHAR(60) NOT NULL,
    `warna` VARCHAR(20) NOT NULL,
    `no_registrasi` VARCHAR(15) NOT NULL,
    `no_rangka` VARCHAR(60) NOT NULL,
    `no_stnk` VARCHAR(60) NOT NULL,
    `foto_kendaraan` VARCHAR(60) NOT NULL,
    `foto_stnk` VARCHAR(60) NOT NULL,

    PRIMARY KEY (`id_kendaraan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Parkiran` (
    `id_parkiran` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengguna` INTEGER NOT NULL,
    `nama` VARCHAR(60) NOT NULL,
    `alamat` VARCHAR(60) NOT NULL,
    `koordinat` VARCHAR(80) NOT NULL,
    `jam_buka` TIME NOT NULL,
    `jam_tutup` TIME NOT NULL,
    `foto` VARCHAR(60) NOT NULL,

    PRIMARY KEY (`id_parkiran`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Parkir` (
    `id_parkir` BIGINT NOT NULL AUTO_INCREMENT,
    `id_kendaraan` INTEGER NOT NULL,
    `id_parkiran` INTEGER NOT NULL,
    `jam_masuk` TIME NOT NULL,
    `jam_keluar` TIME NULL,
    `status` BOOLEAN NOT NULL,

    PRIMARY KEY (`id_parkir`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tarif` (
    `id_tarif` INTEGER NOT NULL AUTO_INCREMENT,
    `id_parkiran` INTEGER NOT NULL,
    `sepeda_motor` DOUBLE NOT NULL,
    `mobil` DOUBLE NOT NULL,

    PRIMARY KEY (`id_tarif`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Partner` (
    `id_partner` INTEGER NOT NULL AUTO_INCREMENT,
    `id_parkiran` INTEGER NOT NULL,
    `id_user` INTEGER NOT NULL,

    PRIMARY KEY (`id_partner`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pengaturan` (
    `id_pengaturan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_parkiran` INTEGER NOT NULL,
    `validasi_masuk` BOOLEAN NOT NULL,
    `validasi_keluar` BOOLEAN NOT NULL,
    `validasi_jam_operasional` BOOLEAN NOT NULL,

    PRIMARY KEY (`id_pengaturan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pinjam` (
    `id_pinjam` INTEGER NOT NULL AUTO_INCREMENT,
    `id_kendaraan` INTEGER NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `tanggal_pinjam` DATETIME(3) NOT NULL,
    `tanggal_kembali` DATETIME(3) NOT NULL,
    `status` BOOLEAN NOT NULL,

    PRIMARY KEY (`id_pinjam`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Kendaraan` ADD CONSTRAINT `Kendaraan_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Parkiran` ADD CONSTRAINT `Parkiran_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Parkir` ADD CONSTRAINT `Parkir_id_kendaraan_fkey` FOREIGN KEY (`id_kendaraan`) REFERENCES `Kendaraan`(`id_kendaraan`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Parkir` ADD CONSTRAINT `Parkir_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `Parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tarif` ADD CONSTRAINT `Tarif_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `Parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Partner` ADD CONSTRAINT `Partner_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `Parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pengaturan` ADD CONSTRAINT `Pengaturan_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `Parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pinjam` ADD CONSTRAINT `Pinjam_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pinjam` ADD CONSTRAINT `Pinjam_id_kendaraan_fkey` FOREIGN KEY (`id_kendaraan`) REFERENCES `Kendaraan`(`id_kendaraan`) ON DELETE RESTRICT ON UPDATE CASCADE;
