#!/bin/bash

dPaths[0]=./kernel-4.19/drivers/misc/mediatek/imgsensor/src/common/v1/
dPaths[1]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor/
dPaths[2]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor_metadata/

if [ $1 ]
then
	model_name=$1
	for d in ${dPaths[@]} 
	do
		homePath=$(pwd)
		cd ${d}
		oriDirPath=$(find . -type d -name "${model_name}*")
		if [ $oriDirPath ] 
		then 
			destDirPath=${oriDirPath/${model_name}/${model_name}s}	
			cp -r $oriDirPath $destDirPath

			cd ${destDirPath}

			for f in $(ls .)
			do
				uppercase_name=$(echo ${model_name} | tr a-z A-Z )
				sed -i $f -e "s/${model_name}/${model_name}s/g" -e "s/${uppercase_name}/${uppercase_name}S/g"
				rename "s/${model_name}/${model_name}s/" "${f}"
			done
		fi
		cd ${homePath}
	done
fi
