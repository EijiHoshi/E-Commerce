-- Tambah produk Elektronik
INSERT INTO products (name, description, price, stock, minimum_stock, track_stock, image, category_id, created_at, updated_at, is_recommended) VALUES
('Headphone Wireless', 'Headphone bluetooth dengan noise cancelling', 750000.00, 30, 5, 1, 'images/products/headphone-wireless.jpg', 1, NOW(), NOW(), 0),
('Smartwatch Fit', 'Smartwatch dengan fitur kesehatan lengkap', 1200000.00, 25, 5, 1, 'images/products/smartwatch-fit.jpg', 1, NOW(), NOW(), 0),
('Kamera Mirrorless', 'Kamera mirrorless 24MP, cocok untuk traveling', 5500000.00, 10, 2, 1, 'images/products/kamera-mirrorless.jpg', 1, NOW(), NOW(), 0);

-- Tambah produk Fashion
INSERT INTO products (name, description, price, stock, minimum_stock, track_stock, image, category_id, created_at, updated_at, is_recommended) VALUES
('Sepatu Sneakers', 'Sneakers trendy untuk sehari-hari', 400000.00, 40, 5, 1, 'images/products/sepatu-sneakers.jpg', 2, NOW(), NOW(), 0),
('Jaket Hoodie', 'Hoodie nyaman dan stylish', 350000.00, 35, 5, 1, 'images/products/jaket-hoodie.jpg', 2, NOW(), NOW(), 0),
('Celana Jeans', 'Celana jeans slim fit', 300000.00, 50, 5, 1, 'images/products/celana-jeans.jpg', 2, NOW(), NOW(), 0);

-- Tambah produk Kesehatan
INSERT INTO products (name, description, price, stock, minimum_stock, track_stock, image, category_id, created_at, updated_at, is_recommended) VALUES
('Masker Medis', 'Masker 3 ply untuk perlindungan harian', 50000.00, 100, 10, 1, 'images/products/masker-medis.jpg', 3, NOW(), NOW(), 0),
('Vitamin C', 'Suplemen vitamin C 1000mg', 80000.00, 80, 10, 1, 'images/products/vitamin-c.jpg', 3, NOW(), NOW(), 0),
('Alat Pijat Elektrik', 'Alat pijat portable untuk relaksasi', 250000.00, 20, 2, 1, 'images/products/alat-pijat-elektrik.jpg', 3, NOW(), NOW(), 0);

-- Tambah produk Rumah Tangga
INSERT INTO products (name, description, price, stock, minimum_stock, track_stock, image, category_id, created_at, updated_at, is_recommended) VALUES
('Blender', 'Blender serbaguna untuk dapur', 450000.00, 15, 3, 1, 'images/products/blender.jpg', 4, NOW(), NOW(), 0),
('Setrika Uap', 'Setrika uap anti lengket', 300000.00, 18, 3, 1, 'images/products/setrika-uap.jpg', 4, NOW(), NOW(), 0),
('Dispenser Air', 'Dispenser air panas & dingin', 700000.00, 12, 2, 1, 'images/products/dispenser-air.jpg', 4, NOW(), NOW(), 0); 