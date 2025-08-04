# =====================
# Collection data types
# =====================

# ===========
# [list] 
# ===========
# Kurung siku
# List seperti box, dapat menerima item/element dari berbagai tipe data (int, string, float, boolean, list)
# Dapat menampung nilai yang duplikat
# Mutable --> item dalam list dapat diubah/ditambah/dikurangi

# 1. Dapat menerima item berbagai tipe data
# list_contoh = ['helo', 3, 2, 1, True]
# print(list_contoh)

# 2. Dapat menampung nilai yang sama atau duplikat
# list_contoh1 = ['helo', 3, 2, 1, True, 7, 7, 7]
# # print(list_contoh1)

# # 3. Berurutan -> bisa dilakukan idenxing dan slicing
# list_dalam_list = ['hello',1,2,3, False, [4,5,6], list_contoh1]
# print(list_dalam_list)

# # Indexing
# print('index ke 2:', list_dalam_list[2])

# # Slicing
# print(list_dalam_list[::2])

# 4. Mutable --> list dapat diganti/diubah
# spam = ['halo', 3.145, True, None, 42]

# spam[1] = 'world'
# spam[2] = spam[3]
# spam[-1] = 12345
# print(spam)

# Membership operator
#example_list = ['helo', 3, 2, True, False, [10,20,30], 6,6,6]
#print('helo' in example_list) # True
#print(20 in example_list)
#print(20 in example_list[5])
#print([10,20,30] in example_list)
#print(1 in example_list)
#print(0 in example_list)

# Indirect assignment
# a = 100
# b = 200

# a = b

# a = 500

# print(a)
# print(b)

# Indirect assignment in list
# list_a = [10,20,30,40]
# list_b = list_a

# print('list a awal:', list_a)
# print('list b awal:', list_b)

# list_b[-1] = 100
# print('list b akhir:', list_b)
# print('list a akhir:', list_a)

# Gunakan .copy()
# list_a = [10,20,30,40]
# list_b = list_a.copy()

# print('list a awal:', list_a)
# print('list b awal:', list_b)

# list_b[-1] = 100
# print('list b akhir:', list_b)
# print('list a akhir:', list_a)

# ====================
# List concatenation
# ===================
# Menambahkan item/element kedalam list

# -Append
# -Extend
# -Insert

# Append
cars = ['toyota', 'vw', 'honda']
# new_car = 'Lamborghini'

# cars.append(new_car)
# print(cars)

# Insert
# cars.insert(1, ['Nissan', 'Daihatsu'])
# print(cars)
# print(len(cars))

# Extend
# aespa = ['Karina', 'Winter']
# cars.extend(aespa)

# print(cars)

# Membuat list
# output [1, 3,  5, 7, 9] # Menggunakan append
'''
Exercise

Use 'append' to create output as below
[1, 3, 5, 7, 9]

'''

# Cara mas michael
# list1to9 = []
# for num in range(10):
#     if num % 2 != 0:
#         list1to9.append(num)
# print(list1to9)

# Cara mba Juliana
# angka = []  
# for i in range(1, 10, 2):  
#     angka.append(i)        
# print(angka)

'''
Use append to create this list number
[1, 10, 100, 1000, 10000]

'''
# # Cara mas Diandara
# list=[]
# for i in range(5):
#     i = 10**i
#     list.append(i)
# print(list)

# removing value from list
# -del
# -remove()
# -pop()
# -clear()

# del
# spam = ['Luthfi', 3.14, True, None, 42]
# print('Before del', spam)

# del spam[2]
# print('after del in index (2)', spam)

# del spam[0:2]
# print('after del in index 0:2', spam)

# remove() function
# spam = ['Luthfi', 3.14, True, None, 42]
# print('Before remove()', spam)

# spam.remove(42)
# print('after remove()', spam)

# Pop() function
# spam = ['Luthfi', 3.14, True, None, 42]
# print('Before pop()', spam)

# spam2 = spam.pop()
# print('after pop()', spam)
# print('yang dihapus pop()', spam2)

# Clear()
# spam = ['Luthfi', 3.14, True, None, 42]
# print('spam before', spam)

# spam.clear()
# print('spam after', spam)

#=================
# Loop dengan list
spam = ['Luthfi', 3.14, True, None, 42]

# for i in range(len(spam)):
#     print(f'Index {i} in spam is :{spam[i]}')

# Enumerate
# spam = ['Luthfi', 3.14, True, None, 42]
# for i,item in enumerate(spam):
#     print(f'Index {i} in spam is: {item}')


# =======
# Sorting
# =======

# Rule 1
# spam = ['Diandra', 'Dewi', 'Andi', 'Michael', 'Juliana']

# spam.sort()
# print(f'first rule:{spam}')


# Rule 2
# spam = ['a', 'A', 'B', 'y', 'X']
# spam.sort()
# print(f'second rule:{spam}') # ASCII

# Trial 3
# spam = [2, 5, -7, 3.14, 'juliana', 'mangojak']
# spam.sort()
# print(spam)

# =============
# Reverse()
# ============
# spam = ['a', 'A', 'B', 'y', 'X']
# print('before reversing', spam)

# spam.reverse()
# print('after reversing', spam)


# ==================
# List comperhension

# Without list comperhension
# names = ['Karina', 'Ningning', 'Winter', 'Giselle', 'Naevis']
# namesNewList = []
# for name in names:
#     if 'n' in name:
#         namesNewList.append(name)
# print(namesNewList)

# Using list comperhension
# names = ['Karina', 'Ningning', 'Winter', 'Giselle', 'Naevis']
# namesNewList = [name for name in names if 'n' in name]
# print(namesNewList)

# Syntax list comperhension
# newlist = [expression for item in iterable if condition == True]
# Hasilnya adalah list baru, list lama tidak terpengaruh

# names = ['Karina', 'Ningning', 'Winter', 'Giselle', 'Naevis']
# newlist = [name for name in names if name != 'Naevis']
# print(newlist)

# Iterable list comperhension
# iterable object: list, tuple, set

# Output [0, 1, 2, 3, 4]
# newlist_number = [num for num in range(5)]
# print(newlist_number)

# Only, ganjil or odd numbers
# newlist_number = [num for num in range(5) if num %2 != 0]
# print(newlist_number)

# Expression: upper()
# names = ['Karina', 'Ningning', 'Winter', 'Giselle', 'Naevis']
# newlist = [name.upper() for name in names]
# print(newlist)

# newlist = ['Karina' for name in names]
# print(newlist)

# ===================
# Tuple
# ===================

# ditandai dengan ()
# Mirip dengan list, dapat menyimpan item dengan berbagai macam tipe data
# Bisa memiliki item yang duplika
# Memiliki urutan sehingga bisa dilakukan indexing dan slicing
# immutable, item dalam tuple tidak bisa diganti

tuple_example = ('Hello', 3, 2, 1, True, [10, 20, 30], 6, 6, 6)
# print(tuple_example)

# indexing 
# print(tuple_example[1])

# Slicing
# print(tuple_example[1:5])

# Mencoba mengubah tuple
# tuple_example[1] = 'Hai'
# print(tuple_example)

# How to modify tuple?

# Convert into list
list_example = list(tuple_example)

# Change the value
list_example[1] = 'Hai'

# Converting back into tuple
tuple_example = tuple(list_example)
print(tuple_example)

# ===============
# Zip
# ==============
fruit_list = ['apple', 'orange', 'manggo']
price_list = [20000, 15000, 10000]

# Manual indexing
# x = 0
# for i in fruit_list:
#     print(f'price of {i} is {price_list[x]}')
#     x = x + 1

# Enumerate()
# fruit_list = ['apple', 'orange', 'manggo']
# price_list = [20000, 15000, 10000]
# for index, fruit in enumerate(fruit_list):
#     print(f'price of {fruit} is {price_list[index]}')

# Zip()
# Syntax: zip(iterator 1, iterator 2, iterator 3....)

# fruit_list = ['apple', 'orange', 'manggo']
# price_list = [20000, 15000, 10000]

# for fruit, price in zip(fruit_list, price_list):
#     print(f'Price of {fruit} is {price}')