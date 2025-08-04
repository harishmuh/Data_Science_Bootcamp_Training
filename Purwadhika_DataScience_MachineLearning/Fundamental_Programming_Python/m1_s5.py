# ==========
# Dictionary
# ==========
# Dictionary memberikan cara flexible untuk mengakses dan memanage data
# Dictionary terdiri dari key and value
# Index di dictionary itu bisa disebut sebagai 'key'
# mutable --> bisa diubah nilainya. Bisa menambahkan key

# Cara membuat dictionary # cara 1

dict_example = {
    'name': ['Asa', 'Ahyeon'],
    'Age': [17, 18],
    'Program': 'Data science',
    'status': 'secret'
}
# print(dict_example)

# Cara 2 # dict() function
# dict_example_too = dict(name= ['Asa', 'Ahyeon'], Age= [17, 18], Program= 'Data science', status= 'secret')
# print(dict_example_too)

# Access data
# print(dict_example['name'])
# print(dict_example['Age'])
# print(dict_example['name'][0])
# print(dict_example.get('status'))

# Adding item
# one by one
dict_example['Hobby'] = ['Reading', 'Swimming']
# print(dict_example)

# Adding multiple items # Update
dict_example.update({'Location': 'Seoul', 'Dream': ['Data scientist', 'Business Analyst']})
# print(dict_example)

# Menghapus item # Delete item in a dictionary
# del statement
# pop()
# popitem()
# clear

# del statement
# del dict_example['status']
# print(dict_example)

# pop()
# dict_example.pop('Age')
# print(dict_example)

# popitem()
# dict_example.popitem() # Drop the last item
# print(dict_example)

# Clear() # Deleting a whole dictionary
# dict_example.clear()
# print(dict_example)

# keys(), values(), and items() methods
# -  items() untuk mengakses key dan value
# -  keys() untuk mengakses key
# -  Values() untuk mengakses values

# dict_example = {
#     'name': ['Asa', 'Ahyeon'],
#     'Age': [17, 18],
#     'Program': 'Data science',
#     'status': 'secret'
# }

# # Items
# # Without loop
# print(dict_example.items())

# # using loop
# for k, v in dict_example.items():
#     print(f'key: {k}, value: {v}')

# # keys
# # Without loop
# print(dict_example.keys())

# # using loop
# for k in dict_example.keys():
#     print(f'key: {k}')

# values()
# Without loop
# print(dict_example.values())

# # using loop
# for v in dict_example.values():
#     print(f'values: {v}')

# Cek apakah key atau value ada dalam dictionary
dict_example = {
    'name': ['Asa', 'Ahyeon'],
    'Age': [17, 18],
    'Program': 'Data science',
    'status': 'secret'
}

# if 'secret' in dict_example:
#     print('key ada dalam dictionary')
# else:
#     print('Key tidak ada dalam dictionary')

# Mengukur panjang dari dictionary
# print('Panjang dictionary "dict_example adalah"',len(dict_example))

# ===============
# The get methods
# ===============

# get method
# spam = {'color': 'red', 'age': 45, 'size': 53}

# # print(spam.get('color', 'tidak ditemukan'))
# # print(spam.get('name', 'tidak ditemukan'))
# print(spam['name'])

# ================
# Dictionary comperhension
# ================
# syntax: dictionary = {key: value for vars in iterable} 

# without Dictionary comperhension

# times_2_dict = dict()
# for num in range(1,6):
#     times_2_dict[num] = num * 2
# print(times_2_dict) # {1: 2, 2: 4, 3: 6, 4: 8, 5: 10}

# With Dictionary comperhension
# times_2_dict = {num: num*2 for num in range(1,6)}
# print(times_2_dict)

# Dictionary comperhension application
harga_lama = {'susu': 15000, 'teh': 10000, 'roti': 20000}
kenaikan_harga = 1.1

# harga naik 10%
# harga_baru = {item: value*kenaikan_harga for (item, value) in harga_lama.items()}
# print(harga_baru)


# Exercise
umur_dict = {'Diandra': 35, 'Lutfi': 25, 'Dewi': 22, 'Fatimah': 26, 'Daddy': 50 }

# Tampilkan dictionary baru dengan list comperhension yang menampilkan umur ganjil saja
# umur_ganjil_dictionary # {'Diandra': 35, 'Lutfi': 25} 

# Cara mas Lutfi
# umur_ganjil = [nama for nama, usia in umur_dict.items() if usia % 2 != 0]
# print(umur_ganjil)
# umur_ganjil_dictionary = {key: val for (key, val) in umur_dict.items() if val % 2 !=0}
# print(umur_ganjil_dictionary)

# Buatlah dictonary tua_muda_dict # tua ()> 50 tahun), muda (< 50 tahun) dengan dictionary comperhension
# tua_muda_dict = {'Diandra': 'Muda', 'Lutfi': 'Muda', 'Dewi': 'Muda', 'Fatimah': 'Muda', 'Daddy': 'Tua'}

# Cara mas michael
umur_dict = {'Diandra': 35, 'Lutfi': 25, 'Dewi': 22, 'Fatimah': 26, 'Daddy': 50 }
# umur_dict_muda = {key: 'Muda' for (key, value) in umur_dict.items() if value < 50}
# umur_dict_tua = {key: 'Tua' for (key, value) in umur_dict.items() if value >= 50}
# print(umur_dict_muda)
# print(umur_dict_tua)

# tua_muda_dict = {key: ('tua' if val >= 50 else 'muda') for (key, val) in umur_dict.items()}
# print(tua_muda_dict)

# ===========================
# Set
# ==========================
# Ditandai dengan kurung kurawal {}
# Bisa menyimpan berbagai tipe data
# Tidak bisa menyimpan item yang duplikat
# Tidak ada sistem indexing
# Mutable --> data bisa diubah
# Kegunaan: untuk menghilangkan duplikat

# Membuat set 
# Method 1
set_example = {'Hello', 3, 2, 1, True, 6, 6, 6, 10, False, 'Hi'}
# print(set_example) # Tidak bisa menampung duplikat

# Accessing data
# For loop
# for val in set_example:
#     print('Value', {val})

# Menghitung item dalam set
# print('Banyaknya item di dalam set_example', len(set_example))

# Create a set from other data types (method 2)
# Membuat set dari list, tuple, dan dictionary
# list1 = ['Julianna', 3, 3, 'Widy']
# tuple1 = (False, 1, 'Andi', False)
# dictionary1 = {
#     'name': 'Coder',
#     'age': 25,
#     'Country': 'Indonesia',
#     'Job': 'Coder',
#     'Marriage': False
# }

# list_to_set = set(list1)
# tuple_to_set = set(tuple1)
# dictionary_to_set = set(dictionary1)
# set_dictionary_values = set(dictionary1.values())

# print(list_to_set)
# print(tuple_to_set)
# print(dictionary_to_set)
# print(set_dictionary_values)

# Check apakah value ada di dalam set

set_example = {'Hello', 3, 2, 1, True, 6, 6, 6, 10, False, 'Hi'}

# if 10 in set_example:
#     print('10 ada di set example')
# else:
#     print('10 tidak di set_example')


# ================
# Adding an item # add()
# set_example = {'Hello', 3, 2, 1, True, 6, 6, 6, 10, False, 'Hi'}
# print('set_example before', set_example)

# set_example.add('New')
# print('set_example after', set_example )

# Adding multiple items # Update()
# set_example = {'Hello', 3, 2, 1, True, 6, 6, 6, 10, False, 'Hi'}
# print('set_example before', set_example)

# set_example.update([100, 200, 500])
# print('set_example after', set_example)

# Menghapus item dari sebuah set
# - remove()
# - pop()
# - discard()
# - Clear()

# discard
# set_example.discard(2)
# print('set_example after discard():', set_example)

# # Remove()
# set_example.remove('Hello')
# print('set_example after remove():', set_example)

# # Pop()
# set_example.pop()
# print('set_example after pop():', set_example)

# # Clear() # all item removal
# set_example.clear()
# print('set_example after clear():', set_example)

# ===========================
# Join set
# ==========================

# Union() method
# union = semua elemen unik dari kedua set
# set_movie_1 = {'The Avengers', 'Avengers: Endgame', 'Avengers: Infinity War', 'Avengers: Age of Ultron'}
# set_movie_2 = {'Avengers: Endgame', 'Avengers: Infinity War', 'The Avengers', 'Titanic'}

# set_combined = set_movie_1.union(set_movie_2)
# print(set_combined)

# difference() method
# set_movie_1 = {'The Avengers', 'Avengers: Endgame', 'Avengers: Infinity War', 'Avengers: Age of Ultron'}
# set_movie_2 = {'Avengers: Endgame', 'Avengers: Infinity War', 'The Avengers', 'Titanic'}

# set_difference = set_movie_1.difference(set_movie_2) # Elemen di set move 1 tapi tidak ada di movie 2
# print(set_difference)
# #print(set_movie_1)

# Symetric_difference() method
# symetric_diiference() # ada di salah satu set, tapi tidak ada dikeduanya
# set_movie_1 = {'The Avengers', 'Avengers: Endgame', 'Avengers: Infinity War', 'Avengers: Age of Ultron'}
# set_movie_2 = {'Avengers: Endgame', 'Avengers: Infinity War', 'The Avengers', 'Titanic'}

# set_movie_3 = set_movie_1.symmetric_difference(set_movie_2)
# print(set_movie_3)

# Intersection method 
# elemen yang ada dikedua set
# set_movie_1 = {'The Avengers', 'Avengers: Endgame', 'Avengers: Infinity War', 'Avengers: Age of Ultron'}
# set_movie_2 = {'Avengers: Endgame', 'Avengers: Infinity War', 'The Avengers', 'Titanic'}

# set_movie_intersection = set_movie_1.intersection(set_movie_2)
# print(set_movie_intersection)