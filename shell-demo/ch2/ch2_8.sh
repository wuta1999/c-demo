#!/bin/bash
string="asdbcd"
echo ${#string}
echo ${#string[0]}
string="runoob is a great site"
echo ${string:1:4}

echo `expr index "$string" io`
