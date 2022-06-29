#!/bin/bash
echo 'input 1-4 num: '
echo 'please input your num:'
read aNum
case $aNum in
	1) echo "your num: 1"
	;;
	2) echo 'your num: 2'
	;;
	3) echo 'your num: 3'
	;;
	4) echo 'your num: 4'
	;;
	*) echo 'error num'
	;;
	
esac
