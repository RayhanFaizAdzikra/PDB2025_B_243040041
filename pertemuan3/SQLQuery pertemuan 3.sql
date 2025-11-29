--Menampilkan semua produk data pada tabel produk--
SELECT *
FROM Production.Product;

--Menampilkan Name, ProductNumber, dan ListPrice
SELECT Name, ProductNumber, ListPrice
FROM Production.Product; 

--Menampilkan data menggunakan alias kolom--
SELECT Name AS [Nama Barang], ListPrice AS 'Harga Jual'
FROM Production.Product; 

--Menampilkan HargaBaru=ListPrice * 1.1--
SELECT Name, ListPrice, (ListPrice * 1.1) AS HargaBaru
FROM Production.Product; 

--Menampilkan Data Dengan Menggabungkan String--
SELECT Name + '(' + ProductNumber + ')' AS ProdukLengkap
FROM Production.Product; 

--Filterisasi Data--
--Menampilkan produk yang berwarna 'red'--
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'red';

--Menampilkan produk yang ListPricenya lebih dari 1000--
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

--Menampilkan produk yang berwarna Black dan ListPricenya lebih dari 500--
SELECT Name, Color, ListPrice
FROM Production.Product
WHERE Color = 'black' AND ListPrice > 500;

--Menampilkan produk yang berwarna red, blue, and black--
SELECT Name, Color
FROM Production.Product
WHERE Color IN ('red', 'blue', 'black');

-- Menampilkan produk yang mengandung kata 'Road'--
SELECT Name, ProductNumber
FROM Production.Product
WHERE Name LIKE '%Bike%';

--Agregasi dan Pengelompokan--
--Mengihitung total baris--
SELECT COUNT(*) AS TotalProduk
FROM Production.Product;

--Menanmpilkan Warna produk dan jumlahnya--
SELECT Color, COUNT(*) AS JumlahProduk
FROM Production.Product
GROUP BY Color;

--Menampilkan ProductID, Jumlah OrderQty, dan rata" UnitPrice--
SELECT ProductID, SUM(OrderQty) AS TotalTerjual, AVG(UnitPrice) AS RataRataHarga
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT *
FROM Sales.SalesOrderDetail

--Menampilkan data dengan grouping lebih dari satu kolom--
SELECT Color, Size, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color, Size;

SELECT *
FROM Production.Product

--Filter Hasil Agregasi--
--Menampilkan warna product yang jumlahnya lebih dari 2--
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
GROUP BY Color
HAVING COUNT(*) > 2;

--Menampilkan warna produk yang ListPricenya > 500 dan jumlahnya > 1--
SELECT Color, COUNT(*) AS Jumlah
FROM Production.Product
WHERE ListPrice > 500
GROUP BY Color
HAVING COUNT(*) < 10;

--Menampilkan ProductID yang jumlah OrderQty nya lebih dari 10--
SELECT ProductID, SUM(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 10;

--Menampilkan SpecialOfferID yang rata" OrderQtynya kurang dari 2--
SELECT SpecialOfferID, AVG(OrderQty) AS RataRataBeli
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
HAVING AVG(OrderQty) > 2;

--Menampilkan warna yang ListPricenya lebih dari 3000 dengan menggunakan MAX--
SELECT Color
FROM Production.Product
GROUP BY Color
HAVING MAX(ListPrice) > 3000;

--Advance Select dan Order By
--Menampilkan JobTitle tanpa duplikat--
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT JobTitle
FROM HumanResources.Employee;

--Menampilkan 5 nama Product termahal--
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

--Menampilkan 5 nama Product termurah--
SELECT TOP 5 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice ASC;

--OFFSET FETCH--
SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 3 ROWS
FETCH NEXT 4 ROWS ONLY;

SELECT Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

SELECT TOP 3 Color, SUM(ListPrice) AS TotalNilaiStok
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Color
ORDER BY TotalNilaiStok DESC;


--Tugas Mandiri--

--1--
SELECT ProductID, SUM(LineTotal) AS TotalUang --Menampilkan ProdukID--
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--2--
SELECT ProductID, SUM(OrderQty) AS JumlahBeli
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID;

--3--
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

--4--
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000;

--5--
SELECT ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalUang DESC;

--6--
SELECT TOP 10 ProductID, SUM(LineTotal) AS TotalUang
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalUang DESC;
