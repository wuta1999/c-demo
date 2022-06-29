#!/bin/bash
my_array=(A B "C" D)

echo "first value: ${my_array[0]}"
echo "second value: ${my_array[1]}"
echo "third value: ${my_array[2]}"
echo "four value: ${my_array[3]}"

echo "all value: ${my_array[*]}"
echo "all value: ${my_array[@]}"


echo "all num: ${#my_array[@]}"

