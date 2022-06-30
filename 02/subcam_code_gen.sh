#!/bin/bash

dPaths[0]=./kernel-4.19/drivers/misc/mediatek/imgsensor/src/common/v1/
dPaths[1]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor/
dPaths[2]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor_metadata/

if [ $1 ]
then
	for d in ${dPaths[@]} 
	do
		oriDirPath=$(find ${d} -type d -name "${1}*")
		if [ $oriDirPath ] 
		then 
			destDirPath=${d}${1}s${oriDirPath##*$1}	
			cp -r $oriDirPath $destDirPath

			homePath=$(pwd)
			cd ${destDirPath}

			for f in $(ls .)
			do
				upStr=$(echo ${1} | tr a-z A-Z )
				sed -i $f -e "/${1}/{s/${1}/${1}s/g}" -e "/${upSet}/{s/${upStr}/${upStr}S/g}"
				rename "s/${1}/${1}s/" "${f}"
			done
			cd ${homePath}
		fi
	done
fi
