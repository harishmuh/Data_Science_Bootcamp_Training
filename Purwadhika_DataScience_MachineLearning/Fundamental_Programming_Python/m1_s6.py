# #=========================================
# # FUNCTION
# #=========================================

# # Blok kode terorganisir yang memiliki nama,
# # dapat menerima input dan dapat menghasilkan output,
# # serta dapat digunakan berulang kali

# Without function
# print('hello world')
# print('hello there!')
# print('I am Harish')
# print('hello world')
# print('hello there!')
# print('I am Harish')
# print('hello world')
# print('hello there!')
# print('I am Harish')

# with functions
# def greetings():
#     print('hello world')
#     print('hello there!')
#     print('I am Harish')

# greetings()
# greetings()
# greetings()

# Exercise
# Please display menu for top up voucher
# Main menu
# 1.  Check internet package (balance)
# 2.  Top balance
# 3.  exit

# Cara mas Mangojak
# def mainmenu():
#     print(' Main Menu')
#     print(' 1. Check Internet Package')
#     print(' 2. Top up Balance')
#     print(' 3. Exit')

# print (mainmenu())
# mainmenu()

# ===========================
# Fungsi tanpa input (parameter) dan tanpa output (return)
# def sapaan():
#     print('Selamat malam')
#     print('Hari ini kita akan belajar fungsi')

# sapaan()

# ==============================
# Fungsi dengan input (parameter) tetapi tanpa output (return)
# def introduction(name, location, age):
#     print('Hello, my name is', name)
#     print('I live in', location)
#     print(f'I am {age} years old ')

# introduction('Clara', 'PIK', 22) # Must be in order

# # If order is not desired 
# introduction(age=22, name='Clara', location='PIK')

# Exercise
# Task: Buatlah fungsi dengan nama 'oscar'
# actor name, movie title, dan tahun
# Output: "Aktor terbaik di 2016 adalah Leonardo dicaprio untuk film dengan judul 'The revenant'

# Output: "Aktor terbaik di 2023 adalah Cillian Murpy untuk film dengan judul 'The oppenheimer'

# Cara mas Lutfi
# def Oscar(name, movie_title, year):
#     print(f'Aktor terbaik di {year} adalah {name} untuk film dengan judul {movie_title}')

# Oscar(movie_title='The Revenant', name='Leonardo De Caprio', year=2016)

# Cara mba Fatimah dan mba Juliana
# def oscar(actor_name, title, year):
#     print(f'Aktor terbaik di {year} adalah {actor_name} untuk film dengan judul {title}')

# oscar('Leonardo Dicaprio', 'The Revenant', 2016)
# oscar('Cillian Murphy', 'The Oppenheimer', 2023)

# Fungsi dengan Default parameter
# - Ketika tidak ada argumen yang diberikan
# - Ketika sudah menetapkan nilai default

# def greetings(name='unknown', age=0, location='Indonesia'):
#     print(f'Hello, my name is {name}, I am {age} years old, and I live in {location}')

# greetings('Angeline', 26, 'Jakarta')
# greetings('Kirei', 24)
# greetings('Felicia')
# greetings(age=25)

# =========================================================
# Fungsi dengan input(parameter) dan dengan output (return)

# def add_1(num1, num2):
#     result = num1 + num2
#     return result

# print(add_1(10,20))

# def add_2(num1, num2):
#     result = num1 + num2
#     print(result)

# print(add_2(10,20))

# Kapan menggunakan 'return' --> ketika ingin menyimpan, reuse, atau manipulate result nanti
# Return sebaiknya digunakan untuk mengembalikan suatu nilai

# Kapan menggunakan 'print' ---> Ketika ingin menunjukkan suatu hasil ke user atau hasil debug dari output atau instruction

# Exercise:
# Buatlah fungsi dengan parameter angka1 dan angka2 dimana fungsi tersebut akan mengembalikan 4 buah nilai:
#  1. Hasil penjumlahannya
#  2. Hasil pengurangannya
#  3. Hasil perkaliannya
#  4. Hasil pembagiannya
#  Nama fungsi: 'arimatika' atau 'math_operations'

# Cara mas Diandara
# def aritmatika(angka1,angka2):
#     penjumlahan = angka1 + angka2
#     pengurangan = angka1 - angka2
#     perkalian = angka1 * angka2
#     pembagian = angka1/angka2
#     print(f'Hasil penjumlahan {angka1} dan {angka2} adalah {penjumlahan}')
#     print(f'Hasil pengurangan {angka1} dan {angka2} adalah {pengurangan}')
#     print(f'Hasil perkalian {angka1} dan {angka2} adalah {perkalian}')
#     print(f'Hasil pembagian {angka1} dan {angka2} adalah {pembagian}')
# aritmatika(4,2)

# Cara mba Juliana
# def operasi(a, b):
#     return a + b, a - b, a * b, a / b if b != 0 else "Tidak bisa dibagi nol"

# tambah, kurang, kali, bagi = operasi(10, 2)
# print("Tambah:", tambah)
# print("Kurang:", kurang)
# print("Kali:", kali)
# print("Bagi:", bagi)

# ==================================
# Global Variable
# - Variable yang didefinisikan di luar fungsi
# - Nilainya berlaku sepanjang program masih dijalankan
# - Dapat diakses dimanapun, baik di dalam maupun di luar fungsi

# Local Variable
# - Variabel yang didefinisikan didalam fungsi
# - nilanya hanya berlaku di dalam fungsi tersebut
# - Ketika fungsinya selesai dijalankan, maka nilainya akan dimusnahkan
# 
# Key rules:
# 1. Code in global scope cannot use local variables 
# 2. Code in local scope can access global variables
# 3. Code in local scope cannot use variables from another local scope
# 4. You can reuse variable names in different scopes (but shouldn't --> its confusing)

# Case study
# x = 100             # Ini adalah variable global

# def get_result():
#     x = 25          # Variable local
#     print(x)        # x-nya menggunakan variable local

# get_result() # 25

# print(x) # 100

# Case study
# x = 100                 # Global variable

# def get_result():
#     print(x)            # x disini adalah global variable
#     a = 200             # Local variable
#     return a + 5

# # get_result()
# print(get_result())

# # Case study
# x = 100

# def calculate():
#     x = 50
#     return x + 10

# print(calculate())
# print(x)

# Case study
# x = 100

# def get_result():
#     y = x + 20 # Using global x, but y is local
#     return y

# print(get_result())

# Case study
# x = 100

# def get_result():
#     x = 10              # Local variable
#     y = x + 20          # use local x, instead of global variable 
#     return y

# print(get_result())

# Case study
# x = 100

# def get_result():
#     y = x + 20          # x sudah digunakan, sebelum didefinisikan secara lokal --> causes an error
#     x = 10              # Local x di definisikan disini
#     return y

# print(get_result()) # UnboundLocalError

# Case study 
# x = 100

# def get_result():
#     x = 20
#     x = x + 20
#     return x

# print(get_result())
# print(x)

# case study
# x = 100

# def get_result():
#     global x            # Use global x
#     x = x + 20          # Modify global x
#     return x

# print(get_result())     # result is 120
# print(x)                # Now x = 120


# ============================
# Callback function
# suatu fungsi yang menerima argumen berupa fungsi lain

# def operate(fn, a, b):
#     return fn(a,b)

# def multiply(x,y):
#     return x * y

# print(operate(multiply, 3, 4))

# def kalkulator(operator, a1, a2):
#     hasil = operator(a1, a2)
#     return hasil

# def tambah(a1, a2):
#     return a1 + a2

# def kurang(a1, a2):
#     return a1 + a2

# def kali(a1,a2):
#     return a1 * a2

# def bagi(a1, a2):
#     return a1 / a2

# print(kalkulator(tambah, 2, 5))
# print(kalkulator(kali, 4, 6))

# =====================
# Calling other function
# Fungsi bisa menggunakan hasil dari fungsi yang lain

# def area(panjang, lebar):
#     return panjang * lebar

# def volume(panjang, lebar, tinggi):
#     return area(panjang, lebar) * tinggi

# print(area(2, 5))
# print(volume(2,5,4))

# ================
# Recursive function
# Fungsi yang memanggil dirinya sendiri untuk penyelesaian suatu permasalah yang lebih kecil

# def countdown(num):
#     print(num)
#     num = num - 1

#     if num > 0:
#         countdown(num)

# print(countdown(10))

# def factorial(n):
#     if n == 0 or n == 1:
#         return 1
#     else:
#         return n * factorial(n-1) # Recursive case
    
# print(factorial(5)) # 5 * 4 * 3 * 2 * 1 = 120 

# ================
# Lambda function
# ===============
# Fungsi anonim atau tidak punya nama
# Bisa memiliki parameter, tapi hanya memiliki 1 ekspresi
# syntax ---> lambda[parameter]: expression

# regular function
# def kali(angka1, angka2):
#     return angka1 * angka2
# print('regular function:', kali(3,4))

# # Lambda function
# kali_lambda = lambda angka1, angka2: angka1*angka2

# print('Lambda function:', kali_lambda(3,4))

# kuadrat_lambda  = lambda angka1: angka1**2
# print('Lambda function:', kuadrat_lambda(3))

# get_intial = lambda word: word[0]
# print('Lambda function get initial:', get_intial('Mantap'))

# ganjil_genap = lambda num: 'genap' if num%2 == 0 else 'ganjil'
# print('Apakah angka ganjil atau genap:', ganjil_genap(24))

# ============
# Map function
# - Digunakan untuk mentransformasi nilai dari suatu collection data type
# - syntax --> map(function, iterable)

# How to use map()
# l1 = [1, 2, 3, 4, 5]

# f1 = lambda x: x**2
# l2 = list(map(f1, l1))

# print(f'before: {l1} and after: {l2}')

# ===============
# Filter function
# - Untuk menyaring nilai/data dari data-data di collection data types
# - Penggunaan filter akan mengurangi item dalam iterable, tapi nilai/bentuk datanya tidak berubah
# syntax --> filter(function, list)

l1 = [1, 2, 3, 4, 5] # Hasilkan [1,3,5]
print('Hasil filter l1:', list(filter(lambda x: x%2 !=0, l1)))
