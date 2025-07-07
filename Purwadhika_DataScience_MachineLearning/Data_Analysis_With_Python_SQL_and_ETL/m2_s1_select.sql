# MySQL
# Relational Database Management System (RDBMS) yang digunakan untuk mengolah data terstruktur

# - Tidak Case Sensitive
# - Indentasi tidak berpengaruh
# - Equal comparison mengunakan satu sama dengan (=)

#==============================================================================================
# Menampilkan seluruh database yang ada di dalam server
SHOW DATABASES;

# Menggunakan database sebagai default
USE world;

# Menampilkan tabel apa saja yang terdapat di dalam suatu database
SHOW TABLES;

# Menampilkan deskripsi dari sebuah tabel
DESC city;

#===============================================================================================
# Membuat Database Baru
# Syntax: CREATE DATABASE database_name

# Membuat database Seller
CREATE DATABASE seller;

# Kita tidak membuat database dengan nama yang sama
CREATE DATABASE IF NOT EXISTS seller; # akan membuat database jika databasenya belum ada

USE seller;
SHOW TABLES;

# Menghapus database Seller
DROP DATABASE seller;

# Kita tidak bisa menghapus database yang tidak ada
DROP DATABASE IF EXISTS seller; # akan menghapus database jika databasenya ada

SHOW DATABASES;

# Gunakan SQL DROP (dan DELETE) dengan hati-hati dan penuh pertimbangan, karena entitas yang telah
# dihapus tidak akan bisa dikembalikan. Tidak ada UNDO.

#=====================================================================================
# Membuat tabel dan memasukkan data

CREATE DATABASE IF NOT EXISTS purwadhika;
USE purwadhika;
SHOW TABLES;

# Membuat tabel bernama products
# Syntax: CREATE TABLE table_name (
#				column1 datatype,
#				column2 datatype,...)

CREATE TABLE IF NOT EXISTS products (
	productID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    productCode CHAR(3),
    name VARCHAR(30) NOT NULL DEFAULT '',
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    price DECIMAL(7,2) NOT NULL DEFAULT 99999.99,
    PRIMARY KEY (productID));
    
DESC products;

# Memasukkan data ke dalam tabel
# INSERT INTO --> untuk memasukkan data baru pada tabel yang sudah ada

# Memasukkan data baru tanpa menyebutkan kolomnya secara spesifik
# By default harus berurutan dan diisi semua
INSERT INTO products VALUES (1001, 'PEN', 'Pen Red', 5000, 1.23);

# Memasukkan lebih dari satu data sekaligus
# Memasukkan NULL pada kolom AUTO_INCREMENT akan secara otomatis menambahkan +1 dari nilai maks
INSERT INTO products VALUES 
(NULL, 'PEN', 'Pen Blue', 8000, 1.25),
(NULL, 'PEN', 'PEN Black', 2000, 1.25);

# Memasukkan data baru dengan menyebutkan nama kolom dan nilainya secara spesifik
INSERT INTO products(productCode, name, quantity, price) VALUES
	('PEC', 'Pencil 2B', 10000, 0.48),
	('PEC', 'Pencil 2H', 8000, 0.49);
    
# Memasukkan data baru dengan menyebutkan nama kolom secara acak
INSERT INTO products(name, productID) VALUES('Pencil HB', 1006);

# Error
# Karena jumlah karakter melebihi yang sudah didefinisikan
INSERT INTO products(productCode) VALUES('PENC');

# Error
# Karena primary key tidak boleh duplikat
INSERT INTO products(productID) VALUES(1001);

# Error
# Tidak bisa memasukkan NULL ke kolom yang NOT NULL
INSERT INTO products VALUES(NULL, NULL, NULL, NULL, NULL);

# Menampilkan isi tabel
SELECT * FROM products; # * asterik untuk mengambil semua kolom

#=====================================================================================
# ALTER TABLE
# mengubah tabel

# menambahkan kolom baru
ALTER TABLE products
ADD descriptions VARCHAR(50);

SELECT * FROM products;

# mengganti nama kolom
ALTER TABLE products
RENAME COLUMN descriptions TO keterangan;

DESC products;

# memodifikasi tipe data
ALTER TABLE products
MODIFY COLUMN keterangan VARCHAR(150);

# menghapus kolom dari tabel
ALTER TABLE products
DROP COLUMN keterangan;

#=======================================================================================
# SELECT
# Kita gunakan untuk mengakses data dari suatu database
# Kemudian hasilnya akan dimunculkan berupa tabel tertentu sesuai dengan data yang diinginkan

# mengakses seluruh kolom pada tabel yang dibuka
SELECT * FROM products;

# mengakses kolom tertentu
SELECT productCode, price FROM products;

# mengakses kolom dengan urutan acak
SELECT price, name, quantity FROM products;

# menggunakan select tanpa tabel
SELECT 1+1; 

SELECT NOW();

#================================================================================================
# DISTINCT, COUNT, AVG, SUM, LIMIT

USE world; # menggunakan database world
SHOW TABLES; # menampilkan tabel yang ada di database world
DESC city; # mengecek isi dari kolom city
DESC country;

# menampilkan seluruh data pada tabel country
SELECT * FROM country;

# menampilkan hanya kolom benua yang ada pada tabel country
SELECT continent FROM country;

# DISTINCT --> untuk mengeluarkan data yang unik pada kolom tertentu

# menampilkan nama-nama benua yang unik/berbeda (tidak ada duplikat)
SELECT DISTINCT Continent FROM country;

# COUNT --> untuk menghitung jumlah data pada suatu kolom tertentu
# menampilkan banyaknya negara di dunia (ada 239)
SELECT COUNT(Name) FROM country;

# menampilkan banyak data pada kolom benua termasuk data duplikat
SELECT COUNT(Continent) FROM country;

# COUNT(DISTINCT) --> untuk menghitung jumlah data yang unik
# menampilkan banyaknya benua yang unik 
SELECT COUNT(DISTINCT continent) FROM country;

# AVG --> untuk menampilkan rata-rata dari kolom numerik
# Menghitung rata-rata angka harapan hidup
SELECT AVG(LifeExpectancy) FROM country;

# SUM --> untuk menampilkan total/jumlah dari kolom numerik
# Menghitung jumlah populasi di dunia
SELECT SUM(Population) FROM country;

# ROUND --> untuk membulatkan suatu angka
SELECT ROUND(AVG(LifeExpectancy), 2) FROM country;

# ALIAS --> untuk mengganti nama kolom
SELECT ROUND(AVG(LifeExpectancy), 2) AS Rerata_Harapan_Hidup
FROM country;

SELECT ROUND(AVG(LifeExpectancy), 2) Rerata_Harapan_Hidup
FROM country;

# LIMIT --> membatasi jumlah baris yang akan dimunculkan pada MySQL
SELECT * FROM country
LIMIT 3;	# hanya menampilkan 3 baris yang pertama

SELECT * FROM country
LIMIT 5 OFFSET 3;	# hanya menampilkan 5 baris setelah 3 baris yang pertama

#=================================================================================================
# WHERE 
# WHERE dipakai untuk memfilter atau membatasi data yang ingin kita cari
# WHERE akan menampilkan data sesuai kondisi yang diminta oleh pengguna

SELECT * FROM city;

# Menampilkan seluruh kolom dari tabel city
# dengan syarat pada kolom name harus 'Jakarta'. 
SELECT * FROM city 
WHERE Name = 'Jakarta';

# Menampilkan seluruh kolom dari tabel city
# dengan syarat populasinya lebih besar atau sama dengan 10000000. 
SELECT * FROM city
WHERE Population >= 10000000;

# Menampilkan seluruh kolom dari tabel city
# dengan syarat CountryCode-nya adalah IDN
# dan dibatasi hanya menampilkan lima data teratas saja.
SELECT * FROM city
WHERE CountryCode = 'IDN'
LIMIT 5;

# Menampilkan nama negara yang diawali oleh huruf V
SELECT Name FROM country
WHERE Name LIKE 'v%';

# Menampilkan nama negara yang dikhiri oleh huruf G
SELECT Name FROM country
WHERE Name LIKE '%g';

# Menampilkan nama negara yang memiliki huruf X
SELECT Name FROM country
WHERE Name LIKE '%X%';

# Menampilkan nama negara yang huruf keduanya adalah huruf G 
SELECT Name FROM country
WHERE NAME LIKE '_G%';

# Menampilkan nama kota di Indonesia yang huruf keduanya adalah U   
SELECT Name FROM city
WHERE CountryCode = 'IDN' AND Name LIKE '_U%';

# Menampilkan nama kota dengan populasi lebih besar atau sama dengan 5000000
# atau berada di negara Jepang
SELECT Name, Population FROM city
WHERE Population >= 5000000 OR CountryCode='JPN';

#==================================================================================================
# UPDATE

# Kita pakai untuk memodifikasi atau mengedit data yang sudah ada pada tabel tertentu
# UPDATE dapat digabungkan dengan klausa WHERE agar data yang terupdate 
# hanya data yang memenuhi kondisi

USE purwadhika;
SELECT * FROM products;

SET SQL_SAFE_UPDATES = 0;

# Data yang namenya adalah Pencil 2B
# Stoknya akan kita ubah dari 10000 menjadi 3000
UPDATE products
SET quantity = 3000
WHERE name = 'Pencil 2B';

SELECT * FROM products;

# Data yang productCode-nya adalah PEN
# Stoknya akan kita kurangi 1000
UPDATE products
SET quantity = quantity - 1000
WHERE productCode = 'PEN';	#kita bisa mengubah lebih dari satu baris yang memenuhi kondisi

# DATA yang productCode-nya NULL akan kita ganti 
# productCode-nya menjadi PEC, quantity menjadi 2000, price menjadi 0.5

UPDATE products
SET productCode='PEC', quantity=2000, price=0.5	# mengganti lebih dari 1 kolom sekaligus
WHERE productCode IS NULL;						# mengganti yang productCodenya NULL

# Data yang product ID-nya 1001,
# name-nya menjadi NULL
UPDATE products
SET productCode=NULL
WHERE productID = 1001;

# Data yang name-nya NULL,
# name-nya menjadi PEN

UPDATE products
SET productCode='PEN'
WHERE productCode IS NULL;

SELECT * FROM products;

#==================================================================================================
# DELETE
# Untuk menghapus baris tertentu dari suatu tabel

# Menghapus baris yang quantitynya kurang dari atau sama dengan 3000
DELETE FROM products
WHERE quantity <= 3000;

SELECT * FROM products;

# Menghapus baris yang productCodenya 'PEC'
DELETE FROM products
WHERE productCode='pec';

SELECT * FROM products;

# Menghapus semua baris
DELETE FROM products;

SELECT * FROM products;

#=================================================================================================
# TRANSACTION
# Transaction adalah sekumpulan SQL statement yang sepenuhnya berhasil atau sepenuhnya gagal dieksekusi
# Transaction penting digunakan untuk memastikan bahwa tidak ada update secara parsial ke dalam database
# Transaction berlangsung via COMMIT dan ROLLBACK

# Contoh

# membuat tabel accounts
CREATE TABLE accounts(
	name VARCHAR(10),
    balance DECIMAL(10,2)
);

# menambahkan data
INSERT INTO accounts VALUES
	('Paul', 1000),
    ('Peter', 2000);
    
SELECT * FROM accounts;

# Transfer uang dari satu akun ke akun yang lain
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 100 WHERE name = 'Peter';
SELECT * FROM accounts;
COMMIT;	# commit transaction sekaligus mengakhiri transaksi

SELECT * FROM accounts;

# Transfer uang dari satu akun ke akun yang lain
START TRANSACTION;
UPDATE accounts SET balance = balance - 200 WHERE name = 'Paul';
UPDATE accounts SET balance = balance + 200 WHERE name = 'Peter';
SELECT * FROM accounts;
ROLLBACK;	# membatalkan seluruh perubahan dalam suatu transaction sekaligus mengakhiri transaksi

SELECT * FROM accounts;












