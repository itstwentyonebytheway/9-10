program arraymanipulation;

uses crt;

const
  array_size = 10; // глобальная константа для размера массивов

var
  array1, array2: array[1..array_size] of integer; // глобальные переменные для массивов

// процедура для заполнения массива случайными числами
procedure fillarray(var arr: array of integer; size: integer); // формальные параметры: arr, size
var
  i: integer;
begin
  randomize; // инициализация генератора случайных чисел
  for i := 0 to size - 1 do
    arr[i] := random(100); // заполнение массива случайными числами от 0 до 99
end;

// процедура для замены максимального элемента на ноль
procedure replacemaxwithzero(var arr: array of integer; size: integer); 
var
  i, maxindex: integer;
  hasmultipleoffive: boolean;
begin
  hasmultipleoffive := false;
  maxindex := 0;

  // проверяем наличие кратного пяти элемента
  for i := 0 to size - 1 do
  begin
    if (arr[i] mod 5 = 0) then
    begin
      hasmultipleoffive := true;
      break; 
    end;
  end;

  // если кратный пяти элемент найден, ищем максимальный элемент
  if hasmultipleoffive then
  begin
    for i := 0 to size - 1 do
    begin
      if (arr[i] > arr[maxindex]) then
        maxindex := i;
    end;
    arr[maxindex] := 0; // заменяем максимальный элемент на ноль
  end;
end;

// процедура для умножения элементов после минимального на 2
procedure multiplyaftermin(var arr: array of integer; size: integer); 
var
  i, minindex: integer;
begin
  minindex := 0;

  // находим индекс минимального элемента
  for i := 1 to size - 1 do
  begin
    if (arr[i] < arr[minindex]) then
      minindex := i;
  end;

  // умножаем все элементы после минимального на 2
  for i := minindex + 1 to size - 1 do
    arr[i] := arr[i] * 2;
end;

// процедура для вывода массива на экран
procedure printarray(arr: array of integer; size: integer); // формальные параметры: arr, size
var
  i: integer;
begin
  for i := 0 to size - 1 do
    write(arr[i], ' '); // выводим элементы массива
  writeln; // переход на новую строку
end;

begin
  // заполняем массивы случайными числами
  fillarray(array1, array_size); // фактические параметры: array1, array_size
  fillarray(array2, array_size); // фактические параметры: array2, array_size

  writeln('исходный массив 1:');
  printarray(array1, array_size);
  
  writeln('исходный массив 2:');
  printarray(array2, array_size);

  // выполняем операции с массивами
  replacemaxwithzero(array1, array_size); // передача параметров по ссылке
  multiplyaftermin(array2, array_size);    // передача параметров по ссылке

  writeln('массив 1 после замены максимального элемента:');
  printarray(array1, array_size);

  writeln('массив 2 после умножения элементов:');
  printarray(array2, array_size);
end.
