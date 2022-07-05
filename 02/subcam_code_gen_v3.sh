#!/bin/bash

#dPaths[0]=./kernel-4.19/drivers/misc/mediatek/imgsensor/src/common/v1/
#dPaths[1]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor/
#dPaths[2]=./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor_metadata/

#使用find 能查到以下路径
#./vendor/mediatek/proprietary/custom/mt6739/hal/imgsensor/imx338_mipi_raw
#./vendor/mediatek/proprietary/custom/mt6765/hal/imgsensor/ver1/imx338_mipi_raw
#./kernel-4.19/drivers/misc/mediatek/imgsensor/src/common/v1/imx338_mipi_raw

if [ $1 ]
then
	model_name=$1
	for oriDirPath in $(find -type d -name *${model_name}*)
	do
		homePath=$(pwd)
		destDirPath=${oriDirPath/${model_name}/${model_name}s}	
		cp -r $oriDirPath $destDirPath
		cd ${destDirPath}

		for f in $(find . -type f)
		do
			uppercase_name=$(echo ${model_name} | tr a-z A-Z )
			sed -i $f -e "s/${model_name}/${model_name}s/g" -e "s/${uppercase_name}/${uppercase_name}S/g"
			rename "s/${model_name}/${model_name}s/" "${f}"
		done

		cd ${homePath}
	done
fi
