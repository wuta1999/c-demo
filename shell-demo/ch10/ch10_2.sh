#!/bin/bash
funWithReturn(){
	echo "please input first num : "
	read aNum
	echo "please input second num : "
	read anotherNum
	echo "aNum : $aNum and anotherNum : $anotherNum "
	return $(($aNum+$anotherNum))
}
funWithReturn
echo "input two nums sum is $?"
