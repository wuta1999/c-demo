#!/bin/bash

dPaths[0]=./kernel-4.19/drivers/misc/mediatek/imgsensor/src/common/v1/
dPaths[1]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor/
dPaths[2]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor_metadata/

if [ $1 ]
then
	modelName=$1
	for d in ${dPaths[@]} 
	do
		oriDirPath=$(find ${d} -type d -name "${modelName}*")
		if [ $oriDirPath ] 
		then 
			destDirPath=${d}${modelName}s${oriDirPath##*${modelName}}	
			cp -r $oriDirPath $destDirPath

			homePath=$(pwd)
			cd ${destDirPath}

			for f in $(ls .)
			do
				upStr=$(echo ${modelName} | tr a-z A-Z )
				sed -i $f -e "s/${modelName}/${modelName}s/g" -e "s/${upStr}/${upStr}S/g"
				rename "s/${modelName}/${modelName}s/" "${f}"
			done
			cd ${homePath}
		fi
	done
fi
