import random

# Глобальная переменная: количество элементов в массивах
ARRAY_SIZE = 10

def create_array(size):
    """Функция для создания массива случайных чисел.
    Формальный параметр: size. Фактический параметр: ARRAY_SIZE.
    Возвращаемое значение — локальная переменная.
    """
    return [random.randint(0, 20) for _ in range(size)]

def replace_max_with_zero(arr):
    """Заменяет максимальный элемент массива на 0.
    Формальный параметр: arr. Параметр передается по ссылке.
    """
    max_value = max(arr)  # Локальная переменная
    max_index = arr.index(max_value)  # Локальная переменная
    arr[max_index] = 0  # Изменение массива по ссылке
    return arr

def multiply_after_min(arr):
    """Умножает элементы массива после минимального на 2.
    Формальный параметр: arr. Параметр передается по ссылке.
    """
    min_value = min(arr)  # Локальная переменная
    min_index = arr.index(min_value)  # Локальная переменная
    for i in range(min_index + 1, len(arr)):
        arr[i] *= 2  # Изменение массива по ссылке
    return arr

# Основная программа
array1 = create_array(ARRAY_SIZE)  # Фактический параметр передается в функцию
array2 = create_array(ARRAY_SIZE)

print("Исходный массив 1:", array1)
print("Исходный массив 2:", array2)

# Проверка на наличие кратных пяти элементов и замена максимального на 0
if any(x % 5 == 0 for x in array1):
    array1 = replace_max_with_zero(array1)

# Умножение элементов после минимального во втором массиве
array2 = multiply_after_min(array2)

print("Измененный массив 1:", array1)
print("Измененный массив 2:", array2)