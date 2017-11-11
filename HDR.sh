#!/bin/sh

# converting
for x in $(ls | grep .CR2)
do
    darktable-cli $x HDR.xmp ${x%.CR2}.tif
done

# aligning
align_image_stack -a AIS_ IMG_????.tif
rm IMG_*.tif

# fusing
enfuse -o HDR.CR2.tif AIS_????.tif
rm AIS_*.tif

# cleaning
rm HDR.xmp
rm HDR.sh
