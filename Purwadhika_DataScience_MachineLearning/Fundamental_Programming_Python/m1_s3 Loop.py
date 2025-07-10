# # =================
# # Looping statement
# # =================
# # Tujuannya adalah mengeksekusi suatu bagian kode secara berulang

# # Menampilkan 3 baris secara berulang
# # print('Saya sedang belajar data science')
# # print('Saya sedang belajar data science')
# # print('Saya sedang belajar data science')

# # Cara looping
# # for i in range(3):
# #     print('Saya sedang belajar data science')

# # =====================
# # While loop statement
# # =====================
# # Selama kondisi terpenuhi, maka looping akan terus dijalankan
# # Looping akan berhenti, ketika kondisinya sudah bernilai False

# # Infinite Loop
# # What: Program jalan terus ---> why: Diberikan kondisi yg selalu bernilai true --> HARUS DIHINDARI

# # While loop 
# # Tampilkan "Saya sedang belajar data science"
# # x = 2
# # while x <= 5:
# #     print('Saya sedang belajar data science')
# #     x = x + 1

# # INFINTE LOOP
# # x = 1
# # while x <= 5: # Akan terus berjalan karena kondisinya selalu True x = 1 # Harus dihindari
# #     print('Saya sedang belajar data science') # Cara berhenti : ctrl + c

# # Contoh while 1
# angka = 1 
# while angka <= 3:
#     print(f'Angka: {angka}')
#     angka = angka + 1 

# # Contoh while 2
# angka = 1 
# while angka <= 3:
#     angka = angka + 1  
#     print(f'Angka: {angka}')

# ============
# While Else statement
# ============

# angka = 0
# while angka <= 3:
#     print(f'Saya sedang belajar datascience sesi ke - {angka + 1}')
#     angka = angka + 1
# else:
#     print('Saya mau istirahat')

'''
# Soal
# Menggunakan loop, tampilkan angka genap sampai 14
# Output
# 0 2 4 6 8 12 14
'''
# Cara mba Widi
# i = 0
# while i <= 14:
#     print(i)
#     i +=2

# Cara lain
# i = 0
# while i < 15:
#     if i%2 == 0:
#         print(i, end= '-')
#     i = i + 1

# =========
# For Loop
# =========
# Loop akan dijalankan selama item atau elemen didalam collection data type atau iterables masih ada
# Berdasarkan jumlah anggota tersedia dalam daftar
# ===============
# Loop dalam list
# ===============

# Contoh 1
# for i in [2, 4, 6, 8, 10, 12, 14]:
#     print(f'Angka dalam list: {i}')

# Contoh 2
# list_angka = [1,2,3,4,5]
# for value in list_angka[1:4]: # Mulai dari index 1 sebelum 4
#     print(f'Nilai: {value}')

# Contoh 3
# list_peralatan = ['Buku', 'tas', 'pensil']
# for item in list_peralatan:
#     print(f'Saya sudah membawa peralatan {item}')

'''
Soal
Dengan menggunakan for loop, tampilkan output sebagai berikut
Output: 1 4 9 16 25
'''
# cara mas Diandra
# angka = 1
# for i in range(0,5,1):
#     kuadrat = angka**2
#     print(kuadrat)
#     angka += 1

# Cara mas Andi
# for i in [1,4,9,16,25]:
#      print(i, end =' ')

# Cara mba Juli
# for i in range(1,6):
#   print(i ** 2)

'''
# Soal 2: Dengan menggunakan for loop, tampilkan output sebagai berikut
# # Output:
# # Angka 1 bukan kelipatan 3
# # Angka 2 bukan kelipatan 3
# # Angka 3 kelipatan 3
# # Angka 4 bukan kelipatan 3
# # Angka 5 bukan kelipatan 3
# # Angka 6 kelipatan 3
'''
# Cara mas Michael, mas Diandra, mba Fatimah
# for i in range(1,7):
#     if(i % 3==0):
#         print(f'Angka {i} kelipatan 3')
#     else:
#         print(f'Angka {i} bukan kelipatan 3')

# Cara mba widy
# for i in range(1, 7, 1):
#     if i % 3 == 0:
#         print("Angka ", i, "kelipatan 3")
#     else:
#         print("Angka ", i, "bukan kelipatan 3")

'''
Soal
Buatlah for loop dengan menggunakan range jika diketahui list berikut
list_buah = ['Apel', 'Jeruk', 'Mangga']
Output
Buah ke 1 adalah Apel
Buah ke 2 adalah jeruk
Buah ke 3 adalah mangga
'''
# Cara mas Michael, mas diandra, mas Widy
# list_buah = ['Apel', 'Jeruk', 'Mangga']
# for i in range (len(list_buah)):
#     print(f'Buah ke {i + 1} adalah {list_buah[i]}')

# # Cara mba Juliana
# buah = ["apel", "jeruk", "mangga"]

# i = 1
# for nama in buah:
#     print(f"buah ke-{i} adalah {nama}")
#     i += 1

# =============
# Tuple
# =============
# tuple_buah = ("apel", "jeruk", "mangga")
# for buah in tuple_buah:
#     print(buah)

'''
Soal
my_tuple = (['mangga', 10000], ['apel', 15000], ['pisang', 20000])
output:
Buah mangga harganya adalah 10000
Buah apel harganya adalah 15000
Buah pisang harganya adalah 20000

'''
# Cara mba Raiza
# my_tuple = (["Mangga", 10000], ["Apel", 15000], ["Pisang", 20000])
# for harga in my_tuple:
#     print ("Buah", harga [0], "harganya adalah", harga [1])

# Cara mba Fatimah # Unpacking
# my_tuple = (['mangga', 10000], ['apel', 15000], ['pisang', 20000])
# for buah, harga in my_tuple:
#     print(f'Buah {buah} harganya adalah {harga}')

# buah, harga = 'Mangga', 10000 # unpacking

# ============
# Enumerate
# ============
# Mengeluarkan index dan value

# tuple_buah = ("apel", "jeruk", "mangga")
# for id, buah in enumerate(tuple_buah):
#     print(f'buah ke - {id+1} adalah {buah}')

# ========================
# Looping pada dictionary
# ========================
myDict = {
    'toyota': 'inova',
    'honda': 'civic',
    'daihatsu' : 'sigra'
}

# Output hanya berupa key
# for mobil in myDict:
#     print(mobil)

# Output berupa value
# for value in myDict.values():
#     print(value)

# Output berupa key and value
# for x,y in myDict.items():
#     print(x,y)

'''

Tampilkan output
# Brand Toyota mengeluarkan tipe innova
# Brand Honda mengeluarkan tipe civic
# Brand Daihatsu mengeluarkan tipe sigra

'''

#mengeluarkan loopin pada dictionary
# myDict={
#     'toyota':'inova',
#     'honda':'civic',
#     'daihatsu':'sigra'
# }
# # output berupa key and value
# for brand,type in myDict.items():
#     print(f'brand {brand} mengeluarkan tipe {type}')

# =============================================
# Break, continue, pass (loop control statement)
# ==============================================

# Break --> keluar dari sistem looping # stop
# Continue --> lanjut

# Break
# Kamu sedang mencari teman bernama "Juliana". Saat ketemu, berhenti cari meskipun ada nama lain

# teman = ["Dewi", "Diandra", "Lutfi", "Michael", "Juliana", "Fatimah", "Andi"]
# for nama in teman:
#     if nama == "Juliana":
#         print("Ketemu Juliana!")
#         break
#     print("Bukan Juliana:", nama)


# Break
# kalimat = 'Saya senang berlari di lapangan gasibu'
# for char in kalimat:
#     if char == 'l':
#         break
#     print(char, end='')
# # print()

# Contoh lain # Break
# Berhenti ketika bertemu batu merah
# list_batu = ['Kuning', 'hijau', 'ungu', 'merah', 'biru']
# for batu in list_batu:
#     if batu == 'merah':
#         print('Stop ada batu merah, berhenti')
#         break # Stop looping
#     print(f'melangkah di atas batu {batu}')

# Sapa semua teman kecuali "Lufti"
# teman = ["Dewi", "Diandra", "Lutfi", "Michael", "Juliana", "Fatimah", "Andi"]
# for nama in teman:
#     if nama == "Lutfi":
#         continue # Lewati
#     print("Halo", nama)

# Continue
# for batu in list_batu:
#     if batu == 'hijau':
#         print('batu hijau, lewati saja')
#         continue # Skip
#     print(f'melangkah di atas batu {batu}')

# Pass
# for batu in list_batu:
#     if batu == 'ungu':
#         pass # Do nothing
#     print(f'melangkah diatas batu {batu}')


'''
Soal:
Buatlah program Python yang meminta pengguna untuk memasukkan password (misal password = '123'). 


Program harus:
-Meminta pengguna memasukkan password berulang kali hingga benar.
-Jika password yang dimasukkan salah, tampilkan pesan: "Password salah, ulangi inputan".
-Jika password yang dimasukkan benar, tampilkan pesan: "Password benar" dan hentikan program.
Gunakan perulangan while True dan pernyataan break.
'''

# password = 123

# while True:
#     pwd = int(input('masukkan password: '))
#     if pwd == password:
#         print('password benar')
#         break
#     print('password salah, ulangi inputan')
                    


# =================
# Nested loop
# =================
# Nested loop adalah loop dalam loop
# inner looping akan diselesaikan terlebih dahulu
# Baru kemudian outer looping


# Contoh nested loop
# for suap in range(1,4):
#     print(f'ini adalah suapan ke - {suap}')
#     for lauk in ['nasi', 'rendang', 'daun nangka', 'sambal']:
#         print(f'lauknya adalah {lauk}')

# Outer loop: range(1,4)
# inner loop: ['nasi', 'rendang', 'daun nangka', 'sambal']
