USE world;
SELECT * FROM country;

# SOAL : Tampilkan nama negara beserta populasinya untuk negara-negara yang memiliki populasi
# lebih besar dari rata-rata populasi di dunia.
SELECT Name, Population
FROM country
WHERE Population > AVG(Population); # error --> klausa WHERE tidak bisa digabung langsung dengan agregat function

# 1. Mencari rata-rata populasi di dunia
SELECT AVG(Population) AS Rerata_Populasi FROM Country;			# ini berupa nilai

# 2. Mencari nama negara beserta populasinya untuk negara dengan jumlah populasi > rata-rata dunia
SELECT Name, Population
FROM country
WHERE Population >  25434098.1172
ORDER BY Population;

# Subquery
SELECT Name, Population
FROM country
WHERE Population > (SELECT AVG(Population) FROM Country)
ORDER BY Population;

#==============================================================================================================
# SUBQUERY
# Sub Query adalah query yang berada di dalam query yang lebih besar

# Contoh sederhana
# SELECT nama_kolom1, nama_kolom2, ...
# FROM nama_tabel
# WHERE nama_kolom2 > (SELECT AGG_FUNCTION(nama_kolom2) FROM nama_tabel)

USE employees;
SHOW TABLES;
SELECT * FROM employees;

# SOAL: Tampilkan semua karyawan yang usianya termuda.

# 1. Mencari birth_date yang paling maksimal
SELECT MAX(birth_date) FROM employees;

# 2. Tampilkan yang birth_date-nya sesuai dengan birth_date maksimal
SELECT first_name, birth_date
FROM employees
WHERE birth_date = (SELECT MAX(birth_date) FROM employees);

# SOAL : Tampilkan semua karyawan yang memiliki gaji
# di atas rata-rata gaji seluruh karyawan

# 1. Cari rerata gaji karyawan
SELECT AVG(salary) FROM salaries;		# nilai: 63810.7448

# 2. Tampilkan karywan dengan gaji di atas rata-rata
SELECT emp_no, salary 
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries);

#--------------------------------------------------
# Sub Query bisa berupa list

# SOAL : Tampilkan salary untuk karyawan yang nama depannya diawali oleh huruf 'N'

# Cara Mas Iki (IMPLICIT JOIN)
SELECT e.emp_no, s.salary FROM employees e, salaries s
where e.emp_no = s.emp_no
AND e.first_name LIKE 'N%';

# Subquery

# 1. Mencari daftar emp_no untuk karyawan yang namanya di awali huruf N
SELECT emp_no FROM employees
WHERE first_name LIKE 'N%';   # berupa list
 
# 2. Tampilkan salary untuk karyawan yang nama depannya diawali oleh huruf 'N'

SELECT emp_no, salary FROM salaries
WHERE emp_no IN 
	(SELECT emp_no FROM employees
	WHERE first_name LIKE 'N%');			# Sub Query bisa berasal dari tabel lain

#----------------------------------------------------------------------------
# SUB QUERY bisa diletakkan setelah SELECT

# SOAL : Buat sebuah tabel yang menampilkan 
# emp_no, salary, avg_salary, min_salary, dan max_salary dari tabel salaries

SELECT 
	emp_no, 
	salary, 
	(SELECT AVG(salary) FROM salaries) AS avg_salary, 
	(SELECT MIN(salary) FROM salaries) AS min_salary, 
	(SELECT MAX(salary) FROM salaries) AS max_salary
FROM salaries;

#-----------------------------------------------------------------------------
# SUB QUERY bisa diletakkan setelah FORM

# Tampilkan tabel yang berisi biodata pegawai wanita
# berisi first_name, last_name, birth_date, gender

SELECT first_name, last_name, birth_date, gender FROM employees
WHERE gender = 'F';

# Dari tabel biodata pegawai wanita, tampilkan first_name dan last_name untuk pegawai 
# kelahiran tahun 1964.

# Cara 1 
SELECT first_name, last_name FROM employees
WHERE gender = 'F' AND YEAR(birth_date) = 1964;

# Cara 2
SELECT first_name, last_name
FROM 
	(SELECT first_name, last_name, birth_date, gender FROM employees
	WHERE gender = 'F') AS tabel_pegawai_wanita
WHERE YEAR(birth_date) = 1964;

#===================================================================================================
# WORKING WITH MULTIPLE TABLES
# Dapat menggunakan Subquery, JOIN operator, dan IMPLICIT JOIN

#-------------------------------------------------------------
# SUBQUERY

SELECT * FROM employees;
SELECT * FROM titles;

# SOAL: Tampilkan nama karyawan yang memiliki title Senior Engineer

# 1. Membuat list emp_no karyawan dengan title senior engineer
SELECT emp_no FROM titles
WHERE title='Senior Engineer';

# 2. Tampilkan nama karyawan yang memiliki title Senior Engineer

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE emp_no IN
	(SELECT emp_no FROM titles
	WHERE title='Senior Engineer');
    
#===============================================================================
# RELATIONSHIP MODEL CONSTRAINS
# Referencing --> menghubungkan antara beberapa tabel pada RDBMS
# PRIMARY KEY --> identitas unik yang dimiliki oleh sebuah tabel
# - tidak memiliki duplikat
# - tidak boleh NULL
# contoh: emp_no pada tabel employees
# FOREIGN KEY --> Primary Key yang ditampilkan pada tabel lain
# contoh: emp_no pada tabel titles

# PARENT TABLE --> Tabel yang memiliki PRIMARY KEY (contoh employees)
# DEPENDENT TABLE --> Tabel yang memiliki FOREIGN KEY (contoh titles)

# ONE-TO-ONE RELATIONSHIP
# Hubungan ketika hanya satu data pada dua tabel yang saling berkaitan satu sama lain
# Setiap baris pada tabel 1 hanya memiliki 1 baris pada tabel 2
# contoh: USER - PASSWORD, COUNTRY - HEAD OF STATE
# Di dalam tabel USER dan PASSWORD biasanya satu id/key yang sama misal Business Key

# ONE-TO-MANY RELATIONSHIP
# Hubungan ketika satu data memiliki kaitan pada satu atau lebih data pada tabel yang lain
# Contoh: ALBUM - LAGU, COUNTRY - DISTRICT
# Setiap album memiliki lebih dari satu lagu, tetapi satu lagu hanya memiliki satu album
# Setiap negara memiliki lebih dari satu provinsi, tetapi satu provinsi hanya memiliki satu negara

# MANY-TO-MANY RELATIONSHIP
# Hubungan ketika beberapa data pada suatu tabel
# memiliki kaitan dengan beberapa data pada tabel lainya
# Biasanya ditandai dengan tabel penghubung antara tabel yang satu dengan tabel yang lain
# contoh: FILM - FILM ACTOR - ACTOR
# Didalam tabel FILM_ACTOR terdapat film_id sebagai penghubung ke tabel FILM
# Didalam tabel FILM_ACTOR terdapat actor_id sebagai penghubung ke tabel ACTOR

#-----------------------------------------------------------------------------------------------
# JOIN TABLE
# JOIN digunakan untuk mengkombinasikan data dari dua tabel atau lebih
# digabungkan berdasarakan kolom tertentu yang dimiliki oleh kedua tabel (ON)

# Langkahnya
# 1. Tentukan bentuk tabel (RESULT) yang diinginkan
# 2. Identifikasi asal tabel dari setiap kolom yang ada pada tabel result
# 3. Tentukan PRIMARY KEY dan FOREIGN KEY --> kolom yang menjadi penghubung tabel-tabel tersebut
# 4. Jika ada nama kolom yang sama pada kedua tabel, untuk memanggil kolomnya harus menggunakan asal tabelnya
# nama_tabel.nama_kolom

#------------------------------
# INNER JOIN/JOIN
# Digunakan untuk menggabungkan 2 tabel atau lebih
# dan menampilkan data yang dimiliki oleh kedua tabel

# Syntax:
# SELECT tabel_kiri.nama_kolom1, tabel_kanan.nama_kolom2
# FROM tabel_kiri
# JOIN tabel_kanan
# ON tabel_kiri.key = tabel_kanan.key

SELECT * FROM employees;
SELECT * FROM salaries;

# Menggabungkan tabel employees dan table salaries dengan inner join
# dan menampilkan semua kolom
SELECT *
FROM employees
JOIN salaries								# BY DEFAULT: INNER JOIN
ON employees.emp_no = salaries.emp_no;

# Menggabungkan tabel employees dan table salaries dengan inner join
# dan menampilkan beberapa kolom
SELECT employees.emp_no, employees.first_name, employees.last_name, salaries.salary
FROM employees
JOIN salaries								
ON employees.emp_no = salaries.emp_no;

# Bisa menggunakan alias untuk nama tabel
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
JOIN salaries s								
ON e.emp_no = s.emp_no;

# Untuk kolom yang berbeda bisa tanpa menyebutkan aliasnya

# SOAL: Tampilkan emp_no, first_name, last_name, salary, from_date
# Untuk karyawan dengan gaji di atas 150000

SELECT e.emp_no, first_name, last_name, salary, from_date
FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no
WHERE salary > 150000;

# SOAL: Tampilkan nama karyawan yang memiliki title Senior Engineer
# Menggunakan JOIN operator

SELECT e.emp_no, e.first_name, e.last_name, t.title FROM employees e 
JOIN titles t ON e.emp_no = t.emp_no
WHERE title='Senior Engineer';

# JOIN lebih dari 1 tabel

# SOAL: Tampilkan nama karyawan beserta departemennya saat ini
SELECT * FROM employees;
SELECT * FROM current_dept_emp;
SELECT * FROM departments;

# Cara Mas Asyraf
SELECT e.emp_no, e.first_name, d.dept_no, d.dept_name 
FROM employees e
JOIN current_dept_emp cde 
JOIN departments d 
ON e.emp_no = cde.emp_no AND cde.dept_no = d.dept_no;

# Cara yang lumrah
SELECT e.emp_no, e.first_name, d.dept_no, d.dept_name 
FROM employees e
JOIN current_dept_emp cde ON e.emp_no = cde.emp_no
JOIN departments d ON cde.dept_no = d.dept_no;

SELECT * FROM dept_emp;

#----------------------------------------------------------
# IMPLICIT JOIN
# Menggabungkan 2 tabel atau lebih tanpa perlu menuliskan klausa JOIN
# IMPLICIT JOIN-nya dilakukan pada klausa WHERE
# FROM-nya mengandung 2 tabel atau lebih
# Tetapi perhitungan lebih lambat

SELECT *
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;	# tidak akan menghasilkan null values

# SOAL: Tampilkan emp_no, first_name, last_name, salary, from_date
# Untuk karyawan dengan gaji di atas 150000 menggunakan IMPLICIT JOIN

SELECT e.emp_no, first_name, last_name, salary, from_date
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no AND salary > 150000;

# SOAL: Tampilkan nama karyawan beserta departemennya saat ini menggunakan IMPLICIT JOIN
USE employees;

SELECT e.emp_no, e.first_name, d.dept_no, d.dept_name 
FROM employees e, current_dept_emp c, departments d
WHERE e.emp_no = c.emp_no AND c.dept_no = d.dept_no;

#-----------------------------------------------------------
USE purwadhika;
CREATE TABLE nama(
		ID INT,
        Nama VARCHAR(10)
);

INSERT INTO nama VALUES
	(1, 'Rossi'),
    (2, 'Schumacher'),
    (3, 'Halland'),
    (4, 'Jordan'),
    (5, 'Leonardo');
    
SELECT * FROM nama;

CREATE TABLE profesi(
		ID INT,
        Profesi VARCHAR(20)
);

INSERT INTO profesi VALUES
	(1, 'Pembalap'),
    (1, 'Pengusaha'),
    (3, 'Pemain Bola'),
    (4, 'Pemain Basket'),
    (6, 'Penyanyi');
    
SELECT * FROM profesi;

#------------------------------------------------------------------------------------------------
# LEFT JOIN
# Saat melakukan join, ada tabel yang disebut pertama setelah FROM
# dan tabel kedua yang disebut setelah LEFT JOIN
# Dengan melakukan LEFT JOIN, maka data yang ditampilkan mengikuti tabel LEFT
# Jadi jika ada data yang dimiliki oleh tabel LEFT tetapi tidak dimiliki tabel RIGHT
# maka datanta akan tetap ditampilkan

# menampilkan nama dan profesi

SELECT * FROM nama;
SELECT * FROM profesi;

SELECT *
FROM nama n
LEFT JOIN profesi p
ON n.ID = p.ID;

# profesi akan NULL jika seseorang tidak memiliki profesi

#------------------------------------------------------------------------------------------------
# RIGHT JOIN
# Kebalikannya dari left join
# Nama akan NULL jika suatu profesi tidak ada pelakunya

SELECT *
FROM nama n
RIGHT JOIN profesi p
ON n.ID = p.ID;

#------------------------------------------------------------------------------------------------
# FULL OUTER JOIN
# Menampilkan seluruh data pada kedua tabel
# Profesi akan NULL jika seseorang tidak memiliki profesi
# Nama akan NULL jika suatu profesi tidak ada pelakunya

SELECT *
FROM nama n
LEFT JOIN profesi p
ON n.ID = p.ID
UNION
SELECT *
FROM nama n
RIGHT JOIN profesi p
ON n.ID = p.ID;

#------------------------------------------------------------
# SELF JOIN
# Sama dengan IMPLICIT JOIN, kita tidak menulis secara eksplisit klausa joinnya
# Ciri utamnya, tabel digabungkan dengan tabel dirinya sendiri
# Pada format query ini, biasanya diberikan alias yang berbeda untuk tabel yang sama

# Contoh: Kita ingin menampilkan first_name, last_name, dan birth_date
# untuk setiap karyawan yang memiliki tanggal lahir yang sama
USE employees;

SELECT e1.first_name, e1.last_name, e1.birth_date, e2.first_name, e2.last_name, e2.birth_date
FROM employees e1, employees e2
WHERE e1.birth_date = e2.birth_date AND e1.emp_no != e2.emp_no;








