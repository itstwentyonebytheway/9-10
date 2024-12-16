program two;

uses crt;

const
    n = 8;

type
    t2darray = array[1..n, 1..n] of integer;
    t1darray = array[1..n] of integer;

procedure fill(var arr: t2darray);
var
    i, j: integer;
begin
    randomize;
    for i := 1 to n do
        for j := 1 to n do
            arr[i, j] := random(10);
end;

procedure print(arr: t2darray);
var
    i, j: integer;
begin
    for i := 1 to n do
    begin
        for j := 1 to n do
            write(arr[i, j]:4);
        writeln;
    end;
end;

function unique_max(arr: t2darray; row: integer): integer;
var
    maxVal, count, j: integer;
begin
    maxVal := arr[row, 1];
    count := 1;

    for j := 2 to n do
    begin
        if arr[row, j] > maxVal then
        begin
            maxVal := arr[row, j];
            count := 1;
        end
        else if arr[row, j] = maxVal then
            inc(count);
    end;

    if count = 1 then
        unique_max := 1
    else
        unique_max := -1;
end;

procedure create_1d(arr2d: t2darray; var arr1d: t1darray);
var
    i: integer;
begin
    for i := 1 to n do
        arr1d[i] := unique_max(arr2d, i);
end;

var
    a2: t2darray;
    a1: t1darray;
    i: integer;

begin
    fill(a2);
    writeln('двумерный массив:');
    print(a2);
    create_1d(a2, a1);
    writeln('одномерный массив:');
    for i := 1 to n do
        write(a1[i]:4);
    readln;
end.
