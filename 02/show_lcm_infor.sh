#!/bin/bash

if [ $1 ]
then
	kernel_version=$(find ./device/*/*${1}*/ -type f -name "ProjectConfig.mk" | xargs grep "LINUX_KERNEL_VERSION" | cut -d ' ' -f 3)
	for f in $(find ./${kernel_version}/arch/arm/configs/ -type f -name "*${1}*_defconfig")
	do
		if [[ $f == *debug* ]]
		then
			continue
		fi
		for a in `grep "CONFIG_CUSTOM_KERNEL_LCM" $f | cut -d '=' -f 2  | xargs echo`
		do
			ic=`echo $a | cut -d '_' -f 1`
			module=`echo $a | cut -d '_' -f 2`
			lane=`echo $a | cut -d '_' -f 3`
			resolution=`echo $a | cut -d '_' -f 4`
			echo LCM_NAME is : $a
			echo IC is : $ic
			echo Module is : $module
			echo Lane is : $lane
			echo Resolution is : $resolution
		done
	done
fi
