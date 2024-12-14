import random

def c2a(rows, cols):
    #Создает двумерный массив заданного размера, заполненный случайными числами
    array = [[random.randint(0, 10) for _ in range(cols)] for _ in range(rows)]
    return array

def p2a(array):
    #Выводит двумерный массив
    for row in array:
        print(row)

def f(array):
    #Создает одномерный массив, где элемент равен 1, если строка содержит единственный максимум, иначе - -1
    r_array = []
    for row in array:
        max_value = max(row)
        count_max = row.count(max_value)

        if count_max == 1:
            r_array.append(1)  # Единственный максимум
        else:
            r_array.append(-1)  # Не единственный максимум

    return r_array


# Установка размеров массива
rows = 8
cols = 8

# Создание и вывод двумерного массива
array_2d = c2a(rows, cols)
print("Двумерный массив (8x8):")
p2a(array_2d)

result_array = f(array_2d)
print("\nОдномерный массив:")
print(result_array)
