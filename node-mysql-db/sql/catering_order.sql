CREATE TABLE `alamat_pembeli` (
  `IDpembeli` int(10) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `detail_transaksi` (
  `menuID` int(11) DEFAULT NULL,
  `kodetransaksi` int(11) NOT NULL,
  `jmlmenu` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `kategori` (
  `IDKategori` int(11) NOT NULL,
  `namakategori` varchar(100) DEFAULT NULL,
  `menuID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `menu` (
  `menuID` int(10) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `harga` int(7) DEFAULT NULL,
  `IDpenjual` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `pembeli` (
  `IDpembeli` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `telepon` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `penjual` (
  `IDpenjual` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `telepon` varchar(14) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `transaksi` (
  `kodetransaksi` int(10) NOT NULL,
  `IDpembeli` int(10) NOT NULL,
  `IDpenjual` int(10) NOT NULL,
  `tanggal_transaksi` datetime DEFAULT current_timestamp(),
  `total_harga` int(7) DEFAULT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for table `alamat_pembeli`
--
ALTER TABLE `alamat_pembeli`
  ADD PRIMARY KEY (`alamat`),
  ADD KEY `IDpembeli` (`IDpembeli`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `menuID` (`menuID`),
  ADD KEY `kodetransaksi` (`kodetransaksi`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`menuID`),
  ADD KEY `menuID` (`menuID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuID`),
  ADD KEY `IDpenjual` (`IDpenjual`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`IDpembeli`);

--
-- Indexes for table `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`IDpenjual`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kodetransaksi`),
  ADD KEY `IDpembeli` (`IDpembeli`),
  ADD KEY `IDpenjual` (`IDpenjual`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `IDpembeli` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penjual`
--
ALTER TABLE `penjual`
  MODIFY `IDpenjual` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `kodetransaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alamat_pembeli`
--
ALTER TABLE `alamat_pembeli`
  ADD CONSTRAINT `alamat_pembeli_ibfk_1` FOREIGN KEY (`IDpembeli`) REFERENCES `pembeli` (`IDpembeli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kodetransaksi` FOREIGN KEY (`kodetransaksi`) REFERENCES `transaksi` (`kodetransaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`IDpenjual`) REFERENCES `penjual` (`IDpenjual`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`IDpembeli`) REFERENCES `pembeli` (`IDpembeli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`IDpenjual`) REFERENCES `penjual` (`IDpenjual`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;