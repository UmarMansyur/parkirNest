-- CreateTable
CREATE TABLE `pengguna` (
    `id_pengguna` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(60) NOT NULL,
    `nama` VARCHAR(100) NULL,
    `nik` VARCHAR(16) NULL,
    `alamat` VARCHAR(120) NULL,
    `hp` VARCHAR(20) NULL,
    `foto` VARCHAR(60) NULL,

    PRIMARY KEY (`id_pengguna`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kendaraan` (
    `id_kendaraan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengguna` INTEGER NOT NULL,
    `jenis` VARCHAR(1) NULL,
    `nama` VARCHAR(1) NULL,

    PRIMARY KEY (`id_kendaraan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `kendaraan` ADD CONSTRAINT `kendaraan_id_pengguna_fkey` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna`(`id_pengguna`) ON DELETE RESTRICT ON UPDATE CASCADE;
