#===============================================================================================================================================
# STRING PATTERN

# LIKE digunakan untuk menyaring/memfilter baris yang berisi kolom dengan tipe data teks
# LIKE digunakan setelah WHERE

# % --> untuk menunjukkan diawali/diikuti dengan berapapun jumlah karakter (0 atau lebih)
# contoh: 'bl%' akan menyaring 'blue', 'black', 'blob', etc

# _ --> untuk menunjukkan diawali atau diikuti dengan satu karakter
# contoh: 'h_t' akan menyaring 'hat', 'hit', 'hut', 'hot', etc

USE world;

# menampilkan kota yang districtnya adalah England dari tabel city
SELECT * FROM city
WHERE District = 'England';

# memfilter text
SELECT * FROM city
WHERE District LIKE 'England';

# memfilter angka
SELECT * FROM city
WHERE Population LIKE 461000;

SELECT * FROM city
WHERE Population LIKE '4%6';

# Ingin mencari kota yang namanya diawali oleh huruf Z dan diikuti berapapun jumlah karakter
SELECT * FROM city
WHERE Name LIKE 'Z%';

# Ingin mencari kota yang namanya diakhiri oleh huruf X dan diawali berapapun jumlah karakter
SELECT * FROM city
WHERE Name LIKE '%X';

# Ingin mencari kota yang namanya diawali oleh huruf Z dan terdiri dari 4 huruf
SELECT * FROM city
WHERE Name LIKE 'Z___';

# Ingin mencari kota yang terdiri dari 3 huruf
SELECT * FROM city
WHERE Name LIKE '___';

# Ingin mencari kota yang terdiri dari 6 huruf dan diakhiri huruf o 
SELECT * FROM city
WHERE Name LIKE '_____o';

# Ingin mencari kota yang mengandung huruf x 
SELECT * FROM city
WHERE Name LIKE '%x%';

# Ingin mencari kota yang x-nya di tengah nama tapi bukan di awal ataupun di akhir
SELECT * FROM city
WHERE Name LIKE '%x%'
AND Name NOT LIKE 'x%'
AND Name NOT LIKE '%x';

# NOT berfungsi sebagai negasi

#----------------------------------------------------------------------------------------
# RANGE (mencari rentang nilai)
# BETWEEN
# digunakan untuk membatasi rentang nilai tertentu

# SOAL: Tampilkan 5 negara yang populasinya
# lebih besar atau sama dengan 400000 dan kurang dari atau sama dengan 1000000

SELECT Name, Population FROM country
WHERE Population >= 400000 AND Population <= 1e6
LIMIT 5;

SELECT Name, Population FROM country
WHERE Population BETWEEN 400000 AND 1000000
LIMIT 5;

# SOAL: Tampilkan 5 negara yang populasinya
# kurang dari 100.000 atau lebih besar dari 100.000.000
SELECT Name, Population FROM country
WHERE Population NOT BETWEEN 1e5 AND 1e8
LIMIT 5;

#---------------------------------------------------------------------------------------
# SORTING

# ORDER BY -> digunakan untuk mengurutkan data baik secara ASCENDING maupun DESCENDING
# ASCENDING: angka diurutkan dari terkecil ke terbesar, huruf dari A - Z
# DESCENDING: angka diurutkan dari terbesar ke terkecil, huruf dari Z - A 

# Mengurutkan negara berdasarkan jumlah penduduk dari terkecil hingga terbesar
SELECT Name, Population FROM country
ORDER BY Population;		# by default ascending

# Mengurutkan negara berdasarkan jumlah penduduk dari terbesar hingga terkecil
SELECT 
	Name, 
    FORMAT(Population,0) 
FROM country
ORDER BY Population DESC;

# Tampilkan 10 kota dengan jumlah penduduk antara 3.000.000 - 4.000.000
# diurutkan dari jumlah penduduk tertinggi ke terendah
SELECT Name, FORMAT(Population,0) FROM city
WHERE Population BETWEEN 3e6 AND 4e6
ORDER BY Population DESC
LIMIT 10;

# Tampilkan negara-negara di wilayah Asia Tenggara dan Asia Timur,
# diurutkan berdasarkan region (abjad) 
# dan pada tiap-tiap region diurutkan dari populasi yang tertinggi ke terendah

SELECT Name, Region, FORMAT(Population,0) 
FROM country
WHERE Region = 'SouthEast Asia' OR Region = 'Eastern Asia'
ORDER BY Region ASC, Population DESC;

#--------------------------------------------------------------------------------------
# 1. Tampilkan jumlah populasi di benua Asia
SELECT FORMAT(SUM(Population),0) FROM country
WHERE Continent='Asia';

# 2. Tampilkan jumlah populasi di benua Eropa
SELECT FORMAT(SUM(Population),0) FROM country
WHERE Continent='Europe';

# GROUP BY

# Digunakan untuk mengelompokkan data berdasarkan baris tertentu
# Misal menghitung total populasi di tiap benua
# GROUP BY berpasangan dengan aggreagat function
# AGG Function : SUM, AVG, MIN, MAX, COUNT, dll
# Untuk filtering setelah GROUP BY, tidak bisa menggunakan klausa WHERE
# tetapi menggunakan HAVING

# Urutan QUERY

# SELECT ..columns.. FROM ..table1
# JOIN table2 ON tabel1.column = tabel2.column
# WHERE condition
# GROUP BY ..(column)..
# HAVING ..(condition).. [untuk kolom pada tabel agregat]
# ORDER BY ..(column)..
# LIMIT ..(number of rows)..

# Tampilkan banyaknya negara dari tabel country
SELECT COUNT(Name) FROM country;

# Tampilkan banyaknya negara di masing masing benua
SELECT Continent, COUNT(Name) FROM country
GROUP BY Continent;

# Tampilkan banyaknya negara di masing masing benua
# dan diurutkan dari jumlah negara terbanyak ke tersedikit
SELECT Continent, COUNT(Name) FROM country
GROUP BY Continent
ORDER BY COUNT(Name) DESC;

# Tampilkan banyaknya negara di masing masing benua
# selain benua antarctica dan oceania
# dan diurutkan dari jumlah negara terbanyak ke tersedikit
SELECT Continent, COUNT(Name) FROM country
GROUP BY Continent
HAVING Continent NOT LIKE 'Antarctica' AND Continent NOT LIKE 'Oceania'
ORDER BY COUNT(Name) DESC;

SELECT Continent, COUNT(Name) FROM country
GROUP BY Continent
HAVING Continent NOT IN ('Antarctica', 'Oceania', 'Europe')
ORDER BY COUNT(Name) DESC;

# Menampilkan jumlah negara di benua selain Antartica dan Oceania 
# serta hanya menampilkan benua yang memiliki jumlah negara lebih dari 50
SELECT Continent, Count(Name) FROM country
WHERE Continent NOT IN ('Antarctica', 'Oceania')
GROUP BY Continent
HAVING COUNT(Name) > 50
ORDER BY COUNT(Name) DESC;

# Tampilkan kode negara, rata-rata populasi dan banyaknya kota di tiap negara pada tabel city
# yang jumlah kotanya lebih dari 75 dan diurutkan berdasarkan rata-rata populasi secara DESC
# serta hanya menampilkan baris ke 4, 5, dan 6.

SELECT CountryCode, FORMAT(AVG(Population),0), COUNT(Name) FROM city
GROUP BY CountryCode
HAVING COUNT(Name) > 75
ORDER BY AVG(Population) DESC
LIMIT 3 OFFSET 3;

SELECT 
	CountryCode, 
    FORMAT(AVG(Population),0) AS Rerata_Populasi, 
    COUNT(Name) AS Jumlah_Kota
FROM city
GROUP BY CountryCode
HAVING Jumlah_Kota > 75
ORDER BY Rerata_Populasi DESC;

# Cara penulisan lain
SELECT 
	CountryCode, 
    FORMAT(AVG(Population),0) AS Rerata_Populasi, 
    COUNT(Name) AS Jumlah_Kota
FROM city
GROUP BY CountryCode
HAVING Jumlah_Kota > 75
ORDER BY 2 DESC;		# diurutkan berdasarkan kolom ke 2 (Rerata_Populasi)

#-----------------------------------------------------------------------------------
# BUILT IN FUNCTION
# AGGREGATE FUNCTION: berlaku untuk kumpulan/kelompok atau seluruh data dalam sebuah kolom
# Contoh : SUM, AVG, COUNT, MIN, MAX

# SCALAR FUNCTION: berlaku pada tiap baris dari suatu kolom
# LENGTH, UCASE, LCASE

# Mengetahui panjang karakter (LENGTH)
SELECT Name, LENGTH(Name) AS Panjang_Karakter FROM country;

# Mengubah menjadi uppercase
SELECT Name, UCASE(Name) AS Uppercase FROM country;

# Mengubah menjadi lowercase
SELECT Name, LCASE(Name) AS Lowercase FROM country;

#----------------------------------------------------------------------------------------
# DATE & TIME
# DATE: YYYYMMDD --> Year, Month, Day
# TIME: hhmmss --> Hour, Minute, Second

# NOW(): menampilkan waktu sekarang
SELECT NOW();

# CURDATE(): menampilkan tanggal sekarang
SELECT CURDATE();

# CURTIME(): menampilkan jam sekarang
SELECT CURTIME();

USE sakila;
SHOW TABLES;
SELECT * FROM payment;

# YEAR(): menampilkan tahun dari suatu kolom
SELECT payment_date, YEAR(payment_date) FROM payment;

# MONTH(): menampilkan bulan (1-12) dari suatu kolom
SELECT payment_date, MONTH(payment_date) FROM payment;

# MONTHNAME(): menampilkan nama bulan dari suatu kolom
SELECT payment_date, MONTHNAME(payment_date) FROM payment;

# DAY(): menampilkan tanggal dari suatu kolom
SELECT payment_date, DAY(payment_date) FROM payment;

# DAYNAME(): menampilkan nama hari dari suatu kolom
SELECT payment_date, DAYNAME(payment_date) FROM payment;

# HOUR(): menampilkan jam dari suatu kolom
SELECT payment_date, HOUR(payment_date) FROM payment;

# MINUTE(): menampilkan menit dari suatu kolom
SELECT payment_date, MINUTE(payment_date) FROM payment;

# SECOND(): menampilkan detik dari suatu kolom
SELECT payment_date, SECOND(payment_date) FROM payment;

# WEEK(): menampilkan minggu ke berapa dalam setahun
SELECT payment_date, WEEK(payment_date) FROM payment;

# DAYOFYEAR(): menampilkan hari ke berapa dalam setahun
SELECT payment_date, DAYOFYEAR(payment_date) FROM payment;

# DAYOFWEEK(): menampilkan hari ke berapa dalam seminggu (1-7)
SELECT payment_date, DAYNAME(payment_date), DAYOFWEEK(payment_date) FROM payment;

# EXTRACT
# menampilkan tahun
SELECT payment_date, EXTRACT(YEAR FROM payment_date) FROM payment;

# menampilkan bulan
SELECT payment_date, EXTRACT(MONTH FROM payment_date) FROM payment;

# menampilkan hari
SELECT payment_date, EXTRACT(DAY FROM payment_date) FROM payment;

# menampilkan jam
SELECT payment_date, EXTRACT(HOUR FROM payment_date) FROM payment;

# Menghitung tanggal berdasarkan interval tertentu
# penambahan
SELECT DATE_ADD('2024-02-21', INTERVAL 5 DAY); 
SELECT payment_date, DATE_ADD(payment_date, INTERVAL 10 DAY) FROM payment;

# pengurangan
SELECT DATE_SUB('2024-02-21', INTERVAL 5 DAY); 
SELECT payment_date, DATE_SUB(payment_date, INTERVAL 10 DAY) FROM payment;

# Menghitung selisih waktu
# DATEDIFF(end_date, start_date)
SELECT DATEDIFF('2024-02-28', '2024-02-21');

# TIMESTAMPDIFF(unit, start_date, end_date)
SELECT TIMESTAMPDIFF(DAY, '1997-05-28', CURDATE());
SELECT TIMESTAMPDIFF(MONTH, '1997-05-28', CURDATE());
SELECT TIMESTAMPDIFF(YEAR, '1997-05-28', CURDATE());

SELECT DAY('2024-02-21'), MONTHNAME('2024-02-21'), YEAR('2024-02-21');

SELECT CONCAT(DAY('2024-02-21'),' ',MONTHNAME('2024-02-21'),' ',YEAR('2024-02-21'));

# Format Waktu: DATE_FORMAT(date, format)
# %W: nama hari
# %D: tanggal dengan akhiran
# %M: nama bulan
# %m: urutan bulan
# %Y: tahun dalam 4 digit
# %y: tahun dalam 2 digit

SELECT DATE_FORMAT('2024-02-21', '%W, %D %M %Y');

#========================================================================================
# CASE STATEMENT

# Merupakan conditional expression yang memungkinkan kita untuk melakukan evaluasi
# terhadap suatu kondisi dan mengembalikan nilai saat kondisinya bernilai True

# Syntax:
# CASE [Expression]
# WHEN (kondisi_1) THEN (hasil_1)
# WHEN (kondisi_2) THEN (hasil_2)
# WHEN (kondisi_3) THEN (hasil_3) 
# .....
# ELSE hasil_n
# END

# Expression: nilai/kolom yang ingin dibandingkan dengan daftar kondisi
# Expression ini bisa ada, bisa tidak
# Jika tidak ada kondisi yang bernilai benar/TRUE
# Maka fungsi CASE akan mengembalikan nilai pada klausa ELSE
# Jika klausa ELSE dihilangkan dan tidak ada kondisi yang TRUE maka hasilnya adalah NULL

# Contoh CASE dengan Expression

SHOW tables;
SELECT rating FROM film;

SELECT
	title,
    rating,
    CASE rating
		WHEN 'PG' THEN 'Parental Guidance Suggested'
        WHEN 'PG-13' THEN 'Parental Guidance Cautioned'
        WHEN 'G' THEN 'General Audience'
        WHEN 'R' THEN 'Restricted'
        WHEN 'NC-17' THEN 'Adults Only'
	END AS rating_description
FROM film;

# Contoh CASE tanpa Expression

SELECT 
	title, 
	length,
    CASE
		WHEN length>0 AND length<=60 THEN 'Short'
        WHEN length>60 AND length<=120 THEN 'Medium'
        ELSE 'Long'
	END AS duration_category
FROM film;


SELECT DISTINCT(length) FROM film;

# SOAL: Tampilkan title, rental_rate, dan rental_rate_description dimana
# rental_rate_description
# 'Economy' jika rental rate 0.99
# 'Mass' jika rental_rate 2.99
# 'Premium' jika rental_rate 4.99

SELECT DISTINCT(rental_rate) FROM film;

SELECT
	title,
    rental_rate,
    CASE rental_rate
		WHEN 0.99 THEN 'Economy'
        WHEN 2.99 THEN 'Mass'
        ELSE 'Premium'
	END AS rental_rate_description
FROM film
ORDER BY rental_rate_description;

# SOAL: Tampilkan banyaknya film pada masing-masing rental_rate_description
# dalam bentuk tabel

# | Economy | Mass 	| Premium 	|
# | 341		| 323	| 336		|

SELECT
	SUM(CASE rental_rate WHEN 0.99 THEN 1 ELSE 0 END) AS Total_Economy,
    SUM(CASE rental_rate WHEN 2.99 THEN 1 ELSE 0 END) AS Total_Mass,
	SUM(CASE rental_rate WHEN 4.99 THEN 1 ELSE 0 END) AS Total_Premium
FROM
	film;

SELECT
    SUM(CASE WHEN rental_rate=0.99 THEN 1 ELSE 0 END) AS Total_Economy,
    SUM(CASE WHEN rental_rate=2.99 THEN 1 ELSE 0 END) AS Total_Mass,
    SUM(CASE WHEN rental_rate=4.99 THEN 1 ELSE 0 END) AS Total_Premium
FROm film;






