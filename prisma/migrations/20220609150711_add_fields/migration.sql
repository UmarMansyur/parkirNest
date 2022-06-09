/*
  Warnings:

  - Added the required column `foto_kendaraan` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `foto_stnk` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `merk` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `no_rangka` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `no_registrasi` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `no_stnk` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `warna` to the `kendaraan` table without a default value. This is not possible if the table is not empty.
  - Made the column `jenis` on table `kendaraan` required. This step will fail if there are existing NULL values in that column.
  - Made the column `nama` on table `kendaraan` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `kendaraan` ADD COLUMN `foto_kendaraan` VARCHAR(60) NOT NULL,
    ADD COLUMN `foto_stnk` VARCHAR(60) NOT NULL,
    ADD COLUMN `merk` VARCHAR(60) NOT NULL,
    ADD COLUMN `no_rangka` VARCHAR(60) NOT NULL,
    ADD COLUMN `no_registrasi` VARCHAR(15) NOT NULL,
    ADD COLUMN `no_stnk` VARCHAR(60) NOT NULL,
    ADD COLUMN `warna` VARCHAR(20) NOT NULL,
    MODIFY `jenis` VARCHAR(1) NOT NULL,
    MODIFY `nama` VARCHAR(40) NOT NULL;

-- CreateTable
CREATE TABLE `parkiran` (
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
    `id_parkir` INTEGER NOT NULL AUTO_INCREMENT,
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
CREATE TABLE `partner` (
    `id_partner` INTEGER NOT NULL AUTO_INCREMENT,
    `id_parkiran` INTEGER NOT NULL,
    `id_user` INTEGER NOT NULL,

    PRIMARY KEY (`id_partner`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pengaturan` (
    `id_pengaturan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_parkiran` INTEGER NOT NULL,
    `validasi_masuk` BOOLEAN NOT NULL,
    `validasi_keluar` BOOLEAN NOT NULL,
    `validasi_jam_operasional` BOOLEAN NOT NULL,

    PRIMARY KEY (`id_pengaturan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pinjam` (
    `id_pinjam` INTEGER NOT NULL AUTO_INCREMENT,
    `id_kendaraan` INTEGER NOT NULL,
    `id_pengguna` INTEGER NOT NULL,
    `tanggal_pinjam` DATETIME(3) NOT NULL,
    `tanggal_kembali` DATETIME(3) NOT NULL,
    `status` BOOLEAN NOT NULL,

    PRIMARY KEY (`id_pinjam`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `parkiran` ADD CONSTRAINT `parkiran_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Parkir` ADD CONSTRAINT `Parkir_id_kendaraan_fkey` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan`(`id_kendaraan`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Parkir` ADD CONSTRAINT `Parkir_id_parkir_fkey` FOREIGN KEY (`id_parkir`) REFERENCES `parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tarif` ADD CONSTRAINT `Tarif_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `partner` ADD CONSTRAINT `partner_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pengaturan` ADD CONSTRAINT `pengaturan_id_parkiran_fkey` FOREIGN KEY (`id_parkiran`) REFERENCES `parkiran`(`id_parkiran`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pinjam` ADD CONSTRAINT `pinjam_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `Pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pinjam` ADD CONSTRAINT `pinjam_id_kendaraan_fkey` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan`(`id_kendaraan`) ON DELETE RESTRICT ON UPDATE CASCADE;
