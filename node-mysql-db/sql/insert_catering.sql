INSERT INTO `pembeli` (`IDpembeli`, `email`, `password`, `nama`, `telepon`) VALUES
(3, 'zul@gmail.com', '$2y$10$8TEHmzE2K/ARacbYgYOTie4DgncNiC4CA9htsW3IT2ztRLLI0/oXu', 'Zul', '0898123786');

INSERT INTO `penjual` (`IDpenjual`, `email`, `password`, `nama`, `telepon`, `alamat`, `deskripsi`, `foto`) VALUES
(1, 'henakatering@gmail.com', '$2y$10$sh1Vkfij.rk/jZKcwwTiBOsLxcSD.x9pG6CzqivB/EBWRq42zlY1G', 'Hena Katering', '0815423678', 'Margonda, Depok', 'Hena Katering adalah tempat yang menyediakan berbagai menu pilihan mulai dari nasi box hingga jajanan tradisional', 'Monas.png');

INSERT INTO `menu` (`menuID`, `deskripsi`, `nama`, `gambar`, `harga`, `IDpenjual`) VALUES
(3, 'Roti Bakar Keju Mantap', 'Grilled Cheese Sandwich', 'asnim-ansari-SqYmTDQYMjo-unsplash.jpg', 15000, 1),
(4, 'Cake with pistachio and raspberries', 'Berry Cake', 'anna-tukhfatullina-food-photographer-stylist-Mzy-OjtCI70-unsplash.jpg', 45000, 1),
(6, 'Es Teh Manis Anget dengan manis gula jawa tengah, Indonesia', 'Es Teh Manis Anget', 'food-photographer-jennifer-pallian-sSnCZlEWN5E-unsplash.jpg', 5000, 1),
(7, 'Espresso + Susu', 'Cappucino', 'william-moreland-eSzClaMXNkk-unsplash.jpg', 25000, 1),
(9, 'Jus lemon, air, dan madu', 'Lemonade', 'sigmund-7_sh64mY-v8-unsplash.jpg', 30000, 1);

INSERT INTO `alamat_pembeli` (`IDpembeli`, `alamat`) VALUES
(3, 'Margonda, Depok');

INSERT INTO `transaksi` (`kodetransaksi`, `IDpembeli`, `IDpenjual`, `tanggal_transaksi`, `total_harga`, `status`) VALUES
(4, 3, 1, '2021-01-04 23:07:01', 120000, 'inChart');

INSERT INTO `detail_transaksi` (`menuID`, `kodetransaksi`, `jmlmenu`) VALUES
(3, 4, 2),
(4, 4, 2);

INSERT INTO `kategori` (`IDKategori`, `namakategori`, `menuID`) VALUES
(1, 'Makanan', 3),
(1, 'Makanan', 4),
(2, 'Minuman', 6),
(2, 'Minuman', 7),
(2, 'Minuman', 9);