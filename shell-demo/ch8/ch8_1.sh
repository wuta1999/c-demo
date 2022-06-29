#!/bin/bash
num1=100
num2=100
if test $[num1] -eq $[num2]
then 
	echo "num1 == num2"
else 
	echo "num2 != num2"
fi
