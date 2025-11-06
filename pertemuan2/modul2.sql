--Mambuat Database--
CREATE DATABASE TokoReatailDB;

--Gunakan DB TokoRetailDB--
USE TokoReatailDB;

--Membuat tabel Kategori Produk--
CREATE TABLE KategoriProduk (
	KategoriID INT IDENTITY(1,1) PRIMARY KEY,
	NamaKategori VARCHAR(100) NOT NULL UNIQUE
);

--Membuat tabel produk--
CREATE TABLE Produk(
	ProdukID INT IDENTITY(1001,1) PRIMARY KEY,
	SKU VARCHAR(20) NOT NULL UNIQUE,
	NamaProduk VARCHAR(150) NOT NULL,
	Harga DECIMAL(10, 2),
	STOK INT NOT NULL,
	KategoriID INT NULL,

	--Harganya ga boleh Negatif--
	CONSTRAINT CHK_HargaPositif CHECK(Harga >= 0),
	--Stok ga boleh Negatif--
	CONSTRAINT CHK_StokPositif CHECK(Stok >= 0),
	--Relasikan dengan Tabel Kategori melalui KategoriID--
	CONSTRAINT FK_Produk_Kategori
		FOREIGN KEY (KategoriID)
		REFERENCES KategoriProduk(KategoriID)
);

--Masukkan data ke tabel KategoriProduk--
INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Elektronik')

INSERT INTO KategoriProduk (NamaKategori)
VALUES
('Pakaian'),
('Buku');

--Menampilkan tabel KategoriProduk--
SELECT *
FROM KategoriProduk;

--Menampilkan tabel NamaKategori--
SELECT NamaKategori
FROM KategoriProduk;

--Menambahkan data ke tabel Produk--
INSERT INTO Produk (SKU, NamaProduk, Harga, STOK, KategoriID)
VALUES
('ELEC-001', 'Laptop Gaming', 15000000.00, 50, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, STOK, KategoriID)
VALUES
('ELEC-002', 'HP Gaming', 50000000.00, 50, 1);

--Menampilkan tabel Produk--
SELECT * 
FROM Produk;

--Mengubah data stok Laptop Gaming--
UPDATE Produk
SET STOK = 30
WHERE ProdukID = 1001;

--Menghapus Data HP Gaming--
BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1002;

COMMIT TRANSACTION;

INSERT INTO Produk (SKU, NamaProduk, Harga, STOK, KategoriID)
VALUES
('BAJU-001', 'Kaos Putih', 50000.00, 50, 2);

INSERT INTO Produk (SKU, NamaProduk, Harga, STOK, KategoriID)
VALUES
('BAJU-002', 'Kaos Hitam', 50000.00, 50, 2)

--Menghapus kaos putih--
BEGIN TRANSACTION;

DELETE FROM Produk
WHERE ProdukID = 1007;

--Mengembalikan produk--
ROLLBACK TRANSACTION;

COMMIT TRANSACTION;