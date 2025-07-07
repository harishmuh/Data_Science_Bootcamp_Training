# SOAL : Tampilkan film yang durasinya lebih panjang dari rata-rata durasi keselurahan film

# Subquery
USE sakila;
SELECT title, length FROM film
WHERE length > (SELECT AVG(length) FROM film);

#-----------------------------------------------------------------------------
# COMMON TABLE EXPRESSION (CTE)

# CTE adalah sebuah query berupa subquery yang ditulis terpisah
# dan akan dipergunakan kembali
# CTE ini ditulis sebelum SELECT .... FROM ....
# serta diberi nama/alias

# Syntax
# WITH nama_cte AS (... isi subquery-nya...)
# SELECT .... FROM ....

# SOAL : Tampilkan film yang durasinya lebih panjang dari rata-rata durasi keselurahan film
# 1. Mencari rata-rata durasi terlebih dahulu
SELECT AVG(length) FROM film;

# 2. Menampilkan jawaban dari soal dengan menggunakan CTE
WITH avg_length AS 
	(SELECT AVG(length) FROM film)
SELECT title, length FROM film
WHERE length > (SELECT * FROM avg_length);

# Cara penulisan lain
WITH avg_length AS 
	(SELECT AVG(length) AS rerata_durasi FROM film)
SELECT title, length, rerata_durasi 
FROM film f, avg_length al
WHERE f.length > al.rerata_durasi;

# Kelebihan CTE
# - Cara penulisannya lebih rapi
# - Dapat dipergunakan kembali pada syntax yang sama

# Kekurangan CTE
# - Runningnya lebih lambat dibandingkan metode lain

# SOAL: Tampilkan benua dengan jumlah negara yang lebih besar
# dibandingkan jumlah negara di benua North America menggunakan CTE
USE world;
# 1. Menampilkan jumlah negara di tiap benua
SELECT continent, COUNT(Name) AS Jumlah
FROM country
GROUP BY continent;

# 2. Menampilkan jumlah negara di benua North America
SELECT COUNT(Name) AS Jumlah
FROM country
WHERE continent = 'North America';

# 3. Menjawab soal
WITH jumlah_negara_NA AS 
	(SELECT COUNT(Name) AS Jumlah
	FROM country
	WHERE continent = 'North America')
SELECT continent, COUNT(Name) AS Jumlah
FROM country
GROUP BY continent
HAVING jumlah > (SELECT * FROM jumlah_negara_NA);

# Cara CTE + IMPLICIT JOIN
WITH jumlah_negara_NA AS 
	(SELECT COUNT(Name) AS Jumlah
	FROM country
	WHERE continent = 'North America')
SELECT continent, COUNT(name), Jumlah FROM country, jumlah_negara_NA
GROUP BY 1, 3;

#======================================================================================================
# WINDOW FUNCTION

# Sebuah clausa dalam SQL yang berfungsi untuk melakukan agregasi tangpa menggunakan GROUP BY
# Apabila kita menggunakan GROUP BY, maka terdapat key column yang valuenya merupakan distinct values
# GROUP BY menyebabkan berkurangnya jumlah baris sesuai dengan banyaknya nilai unik
# Namun dengan WINDOW FUNCTION kita dapat melakukan agregasi data dengan 
# tetap mempertahankan jumlah baris
# Semua ROWS akan tetap pada barisnya tanpa mengalami pengurangan atau penambahan

#---------------------------------------------
# 1. OVER PARTITION
# OVER clause merupakan pengganti group by yang dipasangkan pada row
# tanpa mengurangi jumlah baris

USE sakila;
# SOAL: menampilkan rata-rata durasi dari keseluruhan film
SELECT AVG(length) FROM film;

# SOAL: menampilkan rata-rata durasi film berdasarkan rating
SELECT rating, AVG(length) FROM film
GROUP BY rating;

# SOAL: menampilkan kolom rating dan rata-rata durasi dari keseluruhan film pada tiap baris
SELECT 
	rating,
    (SELECT AVG(length) FROM film) AS rerata_durasi
FROM film;

# SOAL: menampilkan kolom rating dan rata-rata durasi untuk tiap rating
# Cara 1
WITH avg_length_by_rating AS 
	(SELECT rating, AVG(length) AS rerata_by_rating FROM film
	GROUP BY rating)
SELECT f.rating, al.rerata_by_rating 
FROM film f, avg_length_by_rating al
WHERE f.rating= al.rating;

# Cara 2 - OVER
SELECT 
	rating, 
	length,
	(SELECT AVG(length) FROM film) AS avg_all_sub,
    AVG(length) OVER() AS avg_all_over,
    AVG(length) OVER(PARTITION BY rating) AS avg_by_rating
FROM film;

# SOAL: tampilkan title, release_year, rating, rental duration,
# rata-rata rental_rate keseluruhan,
# rata-rata rental_rate berdasarkan rental_duration
# tanpa mengurangi jumlah baris

SELECT
	title,
    release_year,
    rating,
    rental_duration,
    AVG(rental_rate) OVER() avg_all_rental_rate,
	AVG(rental_rate) OVER(PARTITION BY rental_duration) avg_all_rental_rate_by_rd
FROM 
	film;

#-------------------------------------------------------------
# 2. ROW_NUMBER()
# Fungsi ROW_NUMBER() untuk membuat kolom baru yang berisikan nomor baris dari 
# 1 hingga ke-n sesuai dengan jumlah baris
# Fungsinya seperti indexing tetapi index-nya disimpan dalam suatu kolom baru
# Fungsinya sekilas tidak begitu terlihat, namun pada penggunaan yang lebih advanced 
# Kita akan membutuhkan untuk filter di beberapa kelompok data

SELECT COUNT(*) FROM film;

# Menampilkan ROW NUMBER
SELECT 
	title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER() AS nomor_baris
FROM film;

# Menampilkan ROW NUMBER berdasarkan rating
SELECT 
	title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER(PARTITION BY rating) AS nomor_baris
FROM film;

# Menampilkan ROW NUMBER berdasarkan rating dan rental duration
SELECT 
	title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER(PARTITION BY rating, rental_duration) AS nomor_baris
FROM film;

# SOAL: Tampilkan title, rating, rental_duration, dan nomor baris berdasarkan rating
# namun cukup tampilkan hanya 5 baris (nomor 1 - 5) dari tiap-tiap rating

WITH cte AS 
	(SELECT 
		title,
		rating,
		rental_duration,
		ROW_NUMBER() OVER(PARTITION BY rating) AS nomor_baris
	FROM film)
SELECT * FROM cte
WHERE nomor_baris < 6;

# Pada penggunaan yang lebih advanced, kita dapat mengelaborasikan antara
# penggunaan ROW_NUMBER() dalam sebuah CTE. 
# Kita menggunakan CTE untuk menyimpan tabel olahan dari ROW_NUMBER()
# kemudian kita gunakan WHERE clause untuk melakukan filter.

#--------------------------------------------------------------------------------------
# 3. RANK() dan DENSE RANK()
# ROW_NUMBER() hanya menghitung baris dalam angka dari 1 hingga ke-n (jumlah baris)
# dari urutan terkecil hingga terbesar
# RANK() menghitung urutan berdasarkan value yang kita ukur
# dan bisa dari terkecil ke terbesar atau sebaliknya dari terbesar ke terkecil

# Memberikan peringkat berdasarkan durasi film dari yang terendah ke tertinggi
SELECT 
	title, 
	length,
	ROW_NUMBER() OVER() AS nomor_baris,
    RANK() OVER(ORDER BY length ASC) AS ranking_RANK,
    DENSE_RANK() OVER(ORDER BY length ASC) AS ranking_DENSE_RANK
FROM film;

# RANK() --> untuk value yang sama akan mendapatkan peringkat yang sama
# kemudian value berikutnya akan mendapat peringkat = peringkat_sebelumnya + banyaknya_data_pada_peringkat_sebelumnya

# DENSE_RANK() --> untuk value yang sama akan mendapatkan peringkat yang sama
# kemudian value berikutnya akan mendapat peringkat = peringkat_sebelumnya + 1

# SOAL: Tampilkan film dengan durasi terpanjang pada tiap-tiap rating.

WITH cte AS 
	(SELECT 
		title, 
		rating, 
		length,
		DENSE_RANK() OVER(PARTITION BY rating ORDER BY length DESC) AS ranking
	FROM film)
SELECT * FROM cte
WHERE ranking=1;

#-------------------------------------------------------------------------------------
# NTILE()

# Mengelompokkan data dari terkecil hingga terbesar
# Jumlah kelompok akan disesuaikan dengan persentase pembagian yang kita masukkan
# NTILE(4) --> artinya data akan dibagi ke dalam 4 kelompok
# dengan tiap kelompok memiliki jumlah yang sama
# NTILE(100) --> artinya data akan dibagi ke dalam 100 kelompok
# dengan tiap kelompok memiliki jumlah yang sama
# NTILE(n) --> artinya data akan dibagi ke dalam n kelompok
# dimana n adalah bilangan bulat POSITIF

SELECT COUNT(*) FROM film;

SELECT 
	title, 
	rating, 
	length,
    ROW_NUMBER() OVER() AS nomor_baris,
    NTILE(4) OVER() AS quartile,
    NTILE(100) OVER() AS percentile,
	NTILE(3) OVER() AS kelompok_3
FROM film;

# NTILE bisa dilakukan partition juga
SELECT 
	title, 
	rating, 
	length,
    NTILE(4) OVER(PARTITION BY rating) AS quartile
FROM film;

# NTILE bisa dilakukan order juga
# dibagi ke dalam 100 kelompok setelah diurutkan berdasarkan durasi
SELECT 
	title, 
	rating, 
	length,
    NTILE(100) OVER(ORDER BY length DESC) AS percentile
FROM film;

#-------------------------------------------------------------------------------
# 5. SLIDING WINDOW

# Untuk menghitung angka agregat yang bersifat bergerak atau kumulatif
# Bisa digunakan untuk menghitung Moving Average, Cumulative Sum, dll
# Syntax
# OVER(ROWS BETWEEN <a> AND <b>)
# Posisi titik <a> dan <b> bisa diisi:
# 1. CURRENT ROW: baris/row yang aktif
# 2. n PRECEDING: row sebelum sebanyak n baris
# 3. n FOLLOWING: row sesudah sebanyak n baris
# 4. UNBOUNDED PRECEDING: baris pertama
# 5. UNBOUNDED FOLLOWING: baris terakhir

# Menghitung cumulative sum dari baris awal hingga baris tertentu

SELECT 
	amount,
    SUM(amount) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM payment;

# Menghitung moving average dari 2 baris terakhir
SELECT
	amount,
    AVG(amount) OVER(ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS moving_average_2
FROM payment;

# SOAL: Hitung cumulative sum dari jumlah film berdasarkan rating
# Kelompokkan jumlah film pada tiap-tiap rating
# Kemudian tambahkan satu kolom berupa cumulative sum dari jumlah film

# Cara Mba Maya

SELECT 
	rating, 
	COUNT(title) AS jumlah_film,
    SUM(COUNT(title)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM film
GROUP BY rating;

# Cara CTE
WITH cte AS
	(SELECT 
		rating, 
		COUNT(title) AS jumlah_film
	FROM film
	GROUP BY rating)
SELECT *,
SUM(jumlah_film) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sum
FROM cte;


