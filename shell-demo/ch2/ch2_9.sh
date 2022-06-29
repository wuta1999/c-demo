#!/bin/bash
array_name=(value0 value1 value2 value3)
length1=${#array_name[@]}
echo $length1
echo ${#array_name[*]}
echo ${#array_name[0]}
