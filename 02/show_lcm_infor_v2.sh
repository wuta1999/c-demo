#!/bin/bash

if [ $1 ]
then
	modelName=$(echo $1 | tr a-z A-Z)
	kernel_version=$(find ./device/*/*${modelName}*/ -type f -name "ProjectConfig.mk" | xargs grep "LINUX_KERNEL_VERSION" | cut -d ' ' -f 3)
	for f in $(find ./${kernel_version}/*/ -type f -name "*${modelName}*_defconfig")
	do
		if [[ $f == *debug* ]]
		then
			continue
		fi
		for a in `grep "CONFIG_CUSTOM_KERNEL_LCM" $f | cut -d '=' -f 2  | xargs echo`
		do
			echo $a | awk -F '_' \
'{printf "LCM_NAME is : %s \nIC is : %s \nModule is : %s \nLane is %s \nResolution is : %s \n",$a,$1,$2,$3,$4}'
		done
	done
fi
