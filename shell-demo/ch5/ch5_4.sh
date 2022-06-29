#!/bin/bash
a=10
b=20

if [ $a != $b ]
then 
	echo "$a != $b : a!=b"
else
	echo "$a == $b : a==b"
fi
if [ $a -lt 100 -a $b -gt 15 ]
then
	echo "$a < 100 && $b > 15 : return true"
else
	echo "$a < 100 && $b > 15 : return false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
	echo "$a < 100 || $b > 100 : return true"
else
	echo "$a < 100 || $b > 100 : return false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
	echo "$a < 5 || $b > 100 : return true"
else
	echo "$a < 5 || $b > 100 : return false"
fi
